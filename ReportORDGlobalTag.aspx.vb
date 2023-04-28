Imports VA.TRM.Domain
Imports System.String
Imports VA.TRM.BusinessService
Imports System.IO
Imports VA.TRM.Domain.CustomEntities
Imports VA.TRM.PresentationO.TRMPresentation.inc.TRMConfig.TRMConfig
Imports VA.TRM.BusinessService.Excel
Imports System.Drawing
Imports VA.TRM.PresentationO.TRMPresentation.inc.TRMRequestCode.TRMRequestCode
'TODO: We need to import this file for one global variable... 
Imports VA.TRM.PresentationO.TRMPresentation.inc.TRMRequestCode
Imports Newtonsoft.Json
'Imports Microsoft.Office.Interop.Excel

Imports VA.TRM.PresentationO.TRMPresentation.inc.TRMGlobals
Imports System.Web.Services
Imports System.Web.Script.Services

Public Class ReportORDGlobalTag : Inherits BasePage

    Private reportGlobalTagService_ As Abstract.IGlobalTagReportService
    Const wgId = 62
    Protected ReadOnly Property ReportGlobalTagService() As Abstract.IGlobalTagReportService
        Get
            If reportGlobalTagService_ Is Nothing Then
                reportGlobalTagService_ = New Concrete.GlobalTagReportService(ConnectionString)
            End If
            Return reportGlobalTagService_
        End Get
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsPostBack) Then
            ddlDecisionType.SelectedValue = Request.Params("decisionType")
            LoadReportData()
            gvDecisionType.DataBind()
            exportDiv.Visible = True
        End If
    End Sub
    Protected Sub gvDecisionType_DataBound(sender As Object, e As EventArgs)


    End Sub
    Protected Sub LoadReportData()
        Try
            Dim globalTagReport As List(Of GlobalTagReport) = ReportGlobalTagService.GetGlobalTagReport(ddlDecisionType.SelectedValue, wgId, SortColumn, SortOrder)
            For Each rdt As GlobalTagReport In globalTagReport
                If (rdt.tagDefinition = "") Then
                    _showDefinition = False
                Else
                    _showDefinition = True
                End If
            Next
            gvDecisionType.DataSource = globalTagReport
            exportDiv.Visible = True

        Catch ex As Exception
            System.Diagnostics.Debug.WriteLine(ex.Message)
        End Try
    End Sub

    Protected Sub btnDecisionType_Click(sender As Object, e As EventArgs)
        ' System.Threading.Thread.Sleep(1000)
        SortColumn = ""
        SortOrder = GlobalEnums.SortOrder.Ascending
        LoadReportData()
        gvDecisionType.DataBind()
        exportDiv.Visible = True
    End Sub

#Region "Properties"
    Private _showDefinition As Boolean

    Public Property ShowDefinition() As Boolean
        Get
            Return _showDefinition
        End Get
        Set(ByVal value As Boolean)
            _showDefinition = value
        End Set
    End Property
    Protected Property SortColumn As String
        Get
            If IsNothing(Session("RepSortColumn")) Then
                Return ""
            End If
            Return Session("RepSortColumn")
        End Get
        Set(value As String)
            If IsNothing(value) Then
                value = "tagName"
            End If
            Session("RepSortColumn") = value
        End Set
    End Property

    Public Property SortOrder As GlobalEnums.SortOrder
        Get
            If IsNothing(Session("RepSortOrder")) Then
                Session("RepSortOrder") = GlobalEnums.SortOrder.Ascending
                Return Session("RepSortOrder")
            End If
            Return Session("RepSortOrder")
        End Get
        Set(value As GlobalEnums.SortOrder)
            Session("RepSortOrder") = value
        End Set
    End Property

#End Region

    Protected Sub imgExcel_Click(sender As Object, e As ImageClickEventArgs)
        Try
            Dim title As String = "TRM_" & ddlDecisionType.SelectedValue.ToString() & "_ORD_Global_Tag_Report"
            Dim fileName As String = Utilities.FileAppendDate(title) & ".xlsx"
            Response.Clear()
            Response.Buffer = True
            Response.AddHeader("content-disposition", "attachment;filename=" & fileName)
            Response.Charset = ""
            Response.ContentType = "application/vnd.ms-excel"

            Dim resultList As List(Of GlobalTagReport) = ReportGlobalTagService.GetGlobalTagReport(ddlDecisionType.SelectedValue, wgId, SortColumn, SortOrder)
            For Each rdt As GlobalTagReport In resultList
                If (rdt.tagDefinition = "") Then
                    _showDefinition = False
                Else
                    _showDefinition = True
                End If
            Next
            Dim colView As Excel.ExcelColumnView = New Excel.ExcelColumnView
            colView.worksheetTitle = title

            colView.headerText = String.Format("The following table displays ORD global tags tagged to non-archived entries within the VA TRM. The ORD global tags are mananged by the Office of Research and Development.")
            'colView.footerText = String.Format("{0} Entries reporting {1} {2} Versions", ToolCount.ToString(), EntryCount.ToString(), ddlDecisionType.SelectedValue.ToString())

            colView.dataStartRow = 4
            colView.columns.Add(New ExcelColumn("Tag Name", "tagName", True, "", False, True))

            If _showDefinition Then
                colView.columns.Add(New ExcelColumn("Tag Definition", "tagDefinition", True, "", False, True))
            End If
            colView.columns.Add(New ExcelColumn("Software", "toolName", True, "", False, True))
            colView.columns.Add(New ExcelColumn("Version", "toolVersionNo", True, "", False, True))
            colView.columns.Add(New ExcelColumn("Decision", "toolDecision", True, "", False, True))
            colView.columns.Add(New ExcelColumn("Decision Date", "tagDate", True, "", False, True))

            Dim excelDocument As Excel.ExcelDocument = New Excel.ExcelDocument(colView)
            Response.BinaryWrite(excelDocument.generateExcelDoc(resultList).GetAsByteArray())
            Response.Flush()
            Response.End()
        Catch abortEx As System.Threading.ThreadAbortException
            'Do nothing
        Catch ex As Exception
            Response.Write("Encountered following Error Error in imgExcel_Click:")
            Response.Write(System.Environment.NewLine)
            Response.Write(ex)
        Finally
            HttpContext.Current.Response.SuppressContent = True
            HttpContext.Current.ApplicationInstance.CompleteRequest()
        End Try
    End Sub
    Protected Function GenerateHeaders() As String
        Dim sb As StringBuilder = New StringBuilder()
        sb.Append("<html>")
        sb.Append("<head>")
        sb.Append("</head>")
        sb.Append("<body>")
        sb.Append("<table>")
        sb.Append("<tr>")
        sb.Append("<td colspan=""6"">")
        sb.Append(String.Format("The following table lists published standards and technologies that have a decision of: {0} as of {1}", ddlDecisionType.SelectedValue, Today.ToShortDateString()))
        sb.Append("</td>")
        sb.Append("<td>")
        sb.Append("</tr>")
        sb.Append("<tr>")
        sb.Append("<td colspan=""6"">&nbsp;</td>")
        sb.Append("</tr>")
        sb.Append("</table>")

        sb.Append("<table>")
        sb.Append("<tr>")
        sb.Append("<th style=""width:5%""  scope=""col"">")
        sb.Append("Tag Name")
        sb.Append("</th>")
        If _showDefinition Then
            sb.Append("<th style=""width:15%""  scope=""col"">")
            sb.Append("Tag Definition")
            sb.Append("</th>")
        End If
        sb.Append("<th style=""width:5%""  scope=""col"">")
        sb.Append("Software")
        sb.Append("</th>")

        sb.Append("<th style=""width:5%"" scope=""col"">")
        sb.Append("Version")
        sb.Append("</th>")

        sb.Append("<th style=""width:10%"" scope=""col"">")
        sb.Append("Decision")
        sb.Append("</th>")

        sb.Append("<th style=""width:20%"" scope=""col"">")
        sb.Append("Date Tagged")
        sb.Append("</th>")
        sb.Append("</tr>")

        Return sb.ToString()
    End Function

    Protected Function GenerateFooter() As String
        Dim sb As StringBuilder = New StringBuilder()
        sb.Append("<table>")
        sb.Append("<tr>")
        sb.Append("<td colspan=""6"">&nbsp;</td>")
        sb.Append("</tr>")
        sb.Append("<tr>")
        sb.Append("</tr>")
        sb.Append("</table>")
        sb.Append("</body>")
        sb.Append("</html>")
        Return sb.ToString()
    End Function
    Protected Sub imgWord_Click(sender As Object, e As ImageClickEventArgs)
        Try
            Dim fileName As String = "TRM_" & ddlDecisionType.SelectedValue.ToString() & "_ORD_Global_Tag_Report"
            fileName = Utilities.FileAppendDate(fileName) & ".doc"
            Response.Clear()
            Response.Buffer = True
            Response.AddHeader("content-disposition", "attachment;filename=" & fileName)
            Response.Charset = ""
            Response.ContentType = "application/vnd.msword"

            Dim resultList As List(Of GlobalTagReport) = ReportGlobalTagService.GetGlobalTagReport(ddlDecisionType.SelectedValue, wgId, SortColumn, SortOrder)
            For Each rdt As GlobalTagReport In resultList
                If (rdt.tagDefinition = "") Then
                    _showDefinition = False
                Else
                    _showDefinition = True
                End If
            Next
            Dim results As String = resultList.ConvertListToStringInTableFormat(getColumnDictionary())
            Dim pos As Integer = results.IndexOf("<table>")

            If pos = 0 Then
                results = results.Substring(pos + "<table>".Length, results.Length - pos - "<table>".Length)
            End If

            Response.Output.Write(GenerateHeaders())
            Response.Output.Write(results)
            Response.Output.Write(GenerateFooter())
            Response.Flush()
            Response.End()
        Catch abortEx As System.Threading.ThreadAbortException
            'Do nothing
        Catch ex As Exception
            Response.Write("Encountered following Error Error in imgWord_Click:")
            Response.Write(System.Environment.NewLine)
            Response.Write(ex)
        Finally
            HttpContext.Current.Response.SuppressContent = True
            HttpContext.Current.ApplicationInstance.CompleteRequest()
        End Try
    End Sub


    Private Sub excelFormatToolLink(evtData As CellChangeData)
        Dim cellData As GlobalTagReport = DirectCast(evtData.cellData, GlobalTagReport)
    End Sub

    Protected Function getColumnDictionary() As Dictionary(Of Integer, String)
        Dim dic As Dictionary(Of Int32, String) = New Dictionary(Of Integer, String)()
        dic.Add(0, "tagName")
        dic.Add(1, "tagDefinition")
        dic.Add(2, "toolName")
        dic.Add(3, "toolVersionNo")
        dic.Add(4, "toolDecision")
        dic.Add(5, "tagDate")
        Return dic
    End Function

    Protected Sub gvDecisionType_Sorted(sender As Object, e As EventArgs)
        gvDecisionType.DataBind()
    End Sub

    Protected Sub gvDecisionType_Sorting(sender As Object, e As GridViewSortEventArgs)

        If (SortColumn = e.SortExpression Or String.IsNullOrEmpty(SortColumn)) Then
            If (SortOrder = GlobalEnums.SortOrder.Ascending) Then
                SortOrder = GlobalEnums.SortOrder.Descending
            Else
                SortOrder = GlobalEnums.SortOrder.Ascending
            End If
            'SortColumn = e.SortExpression
        Else
            SortOrder = GlobalEnums.SortOrder.Ascending
        End If

        SortColumn = e.SortExpression
        LoadReportData()

    End Sub

    Protected Sub gvDecisionType_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If _showDefinition Then
            e.Row.Cells(1).Visible = True
        Else
            e.Row.Cells(1).Visible = False
        End If

        If (e.Row.RowType = DataControlRowType.DataRow) Then

            Dim tlc As ucToolLinkComponent = DirectCast(e.Row.FindControl("ucToolLinkComponent"), ucToolLinkComponent)
            tlc.Tool = DirectCast(e.Row.DataItem, GlobalTagReport).PresentationTool
            tlc.loadControls()

        End If

    End Sub


    Protected Sub gvDecisionType_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        LoadReportData()
        gvDecisionType.PageIndex = e.NewPageIndex
        gvDecisionType.DataBind()
    End Sub

End Class
Imports VA.TRM.Domain
Imports System.String
Imports VA.TRM.BusinessService
Imports System.IO
Imports VA.TRM.PresentationO.TRMPresentation.inc.TRMRequestCode.TRMRequestCode
'TODO: We need to import this file for one global variable... 
Imports VA.TRM.PresentationO.TRMPresentation.inc.TRMRequestCode
Imports VA.TRM.Domain.CustomEntities
Imports Newtonsoft.Json
Imports Microsoft.Office.Interop.Excel
Imports OfficeOpenXml
Imports OfficeOpenXml.Style
Imports System.Drawing
Imports VA.TRM.PresentationO.TRMPresentation.inc.TRMGlobals
Imports VA.TRM.PresentationO.TRMPresentation.inc.TRMConfig.TRMConfig
Imports System.Web.Services
Imports System.Web.Script.Services
Public Class NewTag
    Inherits System.Web.UI.Page

    Private wgService_ As Abstract.IWGService

    Protected ReadOnly Property WgService() As Abstract.IWGService
        Get
            If wgService_ Is Nothing Then
                wgService_ = New Concrete.WGService(ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString())

            End If
            Return wgService_
        End Get
    End Property

    Private tagService_ As Abstract.ITagService

    Protected ReadOnly Property TagService() As Abstract.ITagService
        Get
            If tagService_ Is Nothing Then
                tagService_ = New Concrete.TagService(ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString())

            End If
            Return tagService_
        End Get
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim toolId As String

        If Not Page.IsPostBack Then
            toolId = Request.QueryString("toolId").ToString()
            hdnToolName.Value = Request.QueryString("toolName").ToString()

            hdnToolId.Value = toolId
            Dim _userId As String
            _userId = HttpContext.Current.Request.ServerVariables("AUTH_USER")
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
            '_userId = "DVA\vacoGajulT"
            wgService_ = New Concrete.WGService(ConnectionString)
            Dim lstWgs As List(Of WGCustom)
            lstWgs = wgService_.getAllToolWorkGroups(toolId, _userId)
            Dim json = JsonConvert.SerializeObject(lstWgs)
            hdnlstWgs.Value = json
            Dim wgId As Int16
            If lstWgs.Count > 0 Then
                wgId = lstWgs.FirstOrDefault().WG_ID
                hdnGroupName.Value = lstWgs.FirstOrDefault().WG_LABEL
            Else
                wgId = 0
                hdnGroupName.Value = ""
            End If
            hdnUserId.Value = _userId
            hdnWgId.Value = wgId
            'hdnGroupName.Value = lstWgs.FirstOrDefault().WG_LABEL
            Dim lstTags As List(Of TagCustom)
            lstTags = wgService_.getTagsByWgId(toolId, _userId, wgId)
            json = JsonConvert.SerializeObject(lstTags)
            hdnlstTags.Value = json

            Dim lstInApprWords As List(Of InAppropriateWords)
            lstInApprWords = TagService.getAllInAppropriateWords().ToList()
            Dim jsonallInApprWords = JsonConvert.SerializeObject(lstInApprWords)
            hdnInApprWords.Value = jsonallInApprWords.ToString()

            Dim lstAllWgMembers As List(Of WGMember)
            lstAllWgMembers = WgService.getWGAllMembers(_userId).ToList()
            json = JsonConvert.SerializeObject(lstAllWgMembers)
            hdnlstAllWgMembers.Value = json

            Dim wgm As WGMember
            If lstAllWgMembers.Count > 0 And wgId <> 0 Then
                wgm = lstAllWgMembers.Where(Function(x) x.WG_ID.ToString() = wgId.ToString()).FirstOrDefault()
                If Not wgm Is Nothing Then
                    hdnRoleId.Value = wgm.Role
                End If
            Else
                wgm = New WGMember()
            End If

            'hdnRoleId.Value = wgm.Role

        End If
    End Sub

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function getTagsByWgId(WgId As Integer, toolId As Integer) As List(Of TagCustom)
        Dim lstTags As List(Of TagCustom)
        Dim trmGlobals As PageGlobals = New PageGlobals()
        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
        '"Data Source=VAC20SQLTRM820; Initial Catalog=OneVATRMDev;User ID=TRMAdmin;Password=t8mP@2vF^XqW7;MultipleActiveResultSets=true;"
        Dim wgService_ As Abstract.IWGService
        Dim _userId As String
        wgService_ = New Concrete.WGService(ConnectionString)
        _userId = HttpContext.Current.Request.ServerVariables("AUTH_USER")
        '_userId = "DVA\vacoGajulT"
        ' lstAllWgMembers = wgService_.getWGAllMembers(_userId).ToList()
        lstTags = wgService_.getWgTags(WgId, toolId, _userId).ToList()

        Return lstTags
    End Function

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function saveToolTags(selectedTags As List(Of ToolTag), toolId As Integer, wgId As Integer) As VAResponse
        'Dim lstTags As List(Of TagCustom)
        Dim trmGlobals As PageGlobals = New PageGlobals()
        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
        Dim response As VAResponse = New VAResponse()

        Dim wgService_ As Abstract.IWGService
        Dim retVal As Boolean
        Dim _userId As String
        wgService_ = New Concrete.WGService(ConnectionString)
        _userId = HttpContext.Current.Request.ServerVariables("AUTH_USER")
        '_userId = "DVA\vacoGajulT"
        ' lstAllWgMembers = wgService_.getWGAllMembers(_userId).ToList()
        retVal = wgService_.saveToolTags(selectedTags, toolId, _userId, wgId)

        If retVal = True Then
            response.IsValid = True
            response.Message = "Entry tags applied successfully."
        Else
            response.IsValid = False
            response.Message = "Failed"
        End If

        Return response
    End Function

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function createToolTag(tagName As String, WgId As Integer, toolId As Integer, IsInAppropriateFlagged As String) As VAResponse

        Dim strRole As String = ""
        Dim adService_ As Abstract.IDirectoryService
        adService_ = New Concrete.DirectoryService()
        Dim response As VAResponse = New VAResponse()

        Dim trmCodeLib As VA.TRM.PresentationO.TRMPresentation.inc.TRMCodeLib.TRMCodeLib = New TRMPresentation.inc.TRMCodeLib.TRMCodeLib()
        Dim trmGlobals As PageGlobals = New PageGlobals()
        trmCodeLib.trmGlobals = trmGlobals
        trmCodeLib.initDBConnection()
        trmCodeLib.initVersion()
        Dim VAUserService As Abstract.IVAUserService
        Dim _userId As String
        _userId = HttpContext.Current.Request.ServerVariables("AUTH_USER")
        '_userId = "DVA\vacoGajulT"


        Dim tagService_ As Abstract.ITagService
        Dim retVal As Int32
        If (tagName <> "") Then
            Dim fromEmail As String = ConfigurationManager.AppSettings("tagInappropriateEmailGroupFrom").ToString()
            Dim toEmail As String = ConfigurationManager.AppSettings("tagInappropriateEmailGroupTo").ToString

            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
            '"Data Source=VAC20SQLTRM820; Initial Catalog=OneVATRMDev;User ID=TRMAdmin;Password=t8mP@2vF^XqW7;MultipleActiveResultSets=true;"
            Dim wgService_ As Abstract.IWGService

            wgService_ = New Concrete.WGService(ConnectionString)
            VAUserService = New Concrete.VAUserService(ConnectionString)
            tagService_ = New Concrete.TagService(ConnectionString)
            Dim vauser As VAUser = New VAUser()

            vauser = adService_.GetUserInfoByNetworkID(_userId)
            'retVal = wgService_.CreateTagWGTag(tagName, _userId, vauser.FullName, IsInAppropriateFlagged, vauser.Email, wgId)
            retVal = wgService_.CreateToolTagWG(WgId, toolId, tagName, _userId, IsInAppropriateFlagged, vauser.FullName, vauser.Email, fromEmail, toEmail)
            If retVal = 1 Then
                response.IsValid = True
                response.Message = "Tag Created Successfully"
            ElseIf retVal = 2 Then
                response.IsValid = False
                response.Message = "Duplicate Tag Name"
            ElseIf retVal = 3 Then
                response.IsValid = False
                response.Message = "Failed"
            ElseIf retVal = 4 Then
                response.IsAppropriate = True
                response.Message = "Failed"

            End If


        End If
        Return response
    End Function

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function getToolWorkGroupTags(toolId As Integer, groupId As Integer) As List(Of TagCustom)

        Dim trmGlobals As PageGlobals = New PageGlobals()
        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
        Dim wgService_ As Abstract.IWGService
        Dim _userId As String
        Dim response As VAResponse = New VAResponse()

        wgService_ = New Concrete.WGService(ConnectionString)
        _userId = HttpContext.Current.Request.ServerVariables("AUTH_USER")
        '_userId = "DVA\vacoGajulT"



        Dim lstTags As List(Of TagCustom)
        lstTags = wgService_.getWgTags(groupId, toolId, _userId)
        Return lstTags



    End Function

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function getviewTRMEntries(tgId As Integer) As VAResponse

        Dim strRole As String = ""
        Dim adService_ As Abstract.IDirectoryService
        adService_ = New Concrete.DirectoryService()
        Dim response As VAResponse = New VAResponse()

        Dim trmCodeLib As VA.TRM.PresentationO.TRMPresentation.inc.TRMCodeLib.TRMCodeLib = New TRMPresentation.inc.TRMCodeLib.TRMCodeLib()
        Dim trmGlobals As PageGlobals = New PageGlobals()
        trmCodeLib.trmGlobals = trmGlobals
        trmCodeLib.initDBConnection()
        trmCodeLib.initVersion()
        Dim VAUserService As Abstract.IVAUserService
        Dim _userId As String
        _userId = HttpContext.Current.Request.ServerVariables("AUTH_USER")

        '_userId = "DVA\vacoGajulT"

        If (tgId <> 0) Then


            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
            '"Data Source=VAC20SQLTRM820; Initial Catalog=OneVATRMDev;User ID=TRMAdmin;Password=t8mP@2vF^XqW7;MultipleActiveResultSets=true;"
            Dim wgService_ As Abstract.IWGService

            wgService_ = New Concrete.WGService(ConnectionString)
            VAUserService = New Concrete.VAUserService(ConnectionString)

            Dim tagService_ As Abstract.ITagService
            tagService_ = New Concrete.TagService(ConnectionString)

            Dim lstToolEntries As List(Of ToolCustom)
            lstToolEntries = tagService_.getviewTRMEntries(tgId, _userId).ToList()


            response.IsValid = True

            response.lstTools = lstToolEntries


        End If
        Return response
    End Function

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function getToolEntires(toolText As String) As VAResponse

        Dim strRole As String = ""
        Dim adService_ As Abstract.IDirectoryService
        adService_ = New Concrete.DirectoryService()
        Dim response As VAResponse = New VAResponse()

        Dim trmCodeLib As VA.TRM.PresentationO.TRMPresentation.inc.TRMCodeLib.TRMCodeLib = New TRMPresentation.inc.TRMCodeLib.TRMCodeLib()
        Dim trmGlobals As PageGlobals = New PageGlobals()
        trmCodeLib.trmGlobals = trmGlobals
        trmCodeLib.initDBConnection()
        trmCodeLib.initVersion()
        Dim VAUserService As Abstract.IVAUserService
        Dim _userId As String
        _userId = HttpContext.Current.Request.ServerVariables("AUTH_USER")

        '_userId = "DVA\vacoGajulT"

        If (toolText <> "") Then


            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
            '"Data Source=VAC20SQLTRM820; Initial Catalog=OneVATRMDev;User ID=TRMAdmin;Password=t8mP@2vF^XqW7;MultipleActiveResultSets=true;"
            Dim wgService_ As Abstract.IWGService

            wgService_ = New Concrete.WGService(ConnectionString)
            VAUserService = New Concrete.VAUserService(ConnectionString)

            Dim tagService_ As Abstract.ITagService
            tagService_ = New Concrete.TagService(ConnectionString)

            Dim lstToolEntries As List(Of ToolCustom)
            lstToolEntries = tagService_.getToolEntires(toolText, _userId).ToList()
            response.IsValid = True

            response.lstTools = lstToolEntries



        End If
        Return response
    End Function

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function applyTag(tagId As Integer, toolId As Integer) As VAResponse

        Dim strRole As String = ""
        Dim adService_ As Abstract.IDirectoryService
        adService_ = New Concrete.DirectoryService()
        Dim response As VAResponse = New VAResponse()

        Dim trmCodeLib As VA.TRM.PresentationO.TRMPresentation.inc.TRMCodeLib.TRMCodeLib = New TRMPresentation.inc.TRMCodeLib.TRMCodeLib()
        Dim trmGlobals As PageGlobals = New PageGlobals()
        trmCodeLib.trmGlobals = trmGlobals
        trmCodeLib.initDBConnection()
        trmCodeLib.initVersion()
        Dim VAUserService As Abstract.IVAUserService
        Dim _userId As String
        _userId = HttpContext.Current.Request.ServerVariables("AUTH_USER")

        '_userId = "DVA\vacoGajulT"


        Dim retVal As Integer
        If (tagId <> 0) Then


            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
            Dim wgService_ As Abstract.IWGService

            wgService_ = New Concrete.WGService(ConnectionString)
            VAUserService = New Concrete.VAUserService(ConnectionString)

            Dim tagService_ As Abstract.ITagService
            tagService_ = New Concrete.TagService(ConnectionString)

            retVal = tagService_.createToolTagEntry(tagId, toolId, _userId)

            If retVal = 1 Then
                response.IsValid = True
            ElseIf (retVal = 2) Then
                response.IsValid = False
                response.Message = "This tag has already been applied to the TRM entry"
            ElseIf (retVal = 3) Then
                response.IsValid = False
                response.Message = "Failed"
            End If






        End If
        Return response
    End Function

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function removeTag(tgId As Integer, toolId As Integer) As VAResponse

        Dim strRole As String = ""
        Dim adService_ As Abstract.IDirectoryService
        adService_ = New Concrete.DirectoryService()
        Dim response As VAResponse = New VAResponse()

        Dim trmCodeLib As VA.TRM.PresentationO.TRMPresentation.inc.TRMCodeLib.TRMCodeLib = New TRMPresentation.inc.TRMCodeLib.TRMCodeLib()
        Dim trmGlobals As PageGlobals = New PageGlobals()
        trmCodeLib.trmGlobals = trmGlobals
        trmCodeLib.initDBConnection()
        trmCodeLib.initVersion()
        Dim VAUserService As Abstract.IVAUserService
        Dim _userId As String
        _userId = HttpContext.Current.Request.ServerVariables("AUTH_USER")

        '_userId = "DVA\vacoGajulT"


        Dim retVal As Boolean
        If (tgId <> 0) Then


            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
            '"Data Source=VAC20SQLTRM820; Initial Catalog=OneVATRMDev;User ID=TRMAdmin;Password=t8mP@2vF^XqW7;MultipleActiveResultSets=true;"
            Dim wgService_ As Abstract.IWGService

            wgService_ = New Concrete.WGService(ConnectionString)
            VAUserService = New Concrete.VAUserService(ConnectionString)

            Dim tagService_ As Abstract.ITagService
            tagService_ = New Concrete.TagService(ConnectionString)

            retVal = tagService_.RemoveTag(tgId, toolId, _userId)

            If retVal = True Then
                response.IsValid = True
                response.Message = "Tag Deleted Successfully"
            Else
                response.IsValid = False
                response.Message = "Tag Already Exists"
            End If


        End If
        Return response
    End Function

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function getToolPersonalTags(toolId As Integer) As VAResponse

        Dim trmGlobals As PageGlobals = New PageGlobals()
        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
        '"Data Source=VAC20SQLTRM820; Initial Catalog=OneVATRMDev;User ID=TRMAdmin;Password=t8mP@2vF^XqW7;MultipleActiveResultSets=true;"
        Dim _userId As String
        Dim response As VAResponse = New VAResponse()

        Dim tagService_ As Abstract.ITagService
        tagService_ = New Concrete.TagService(ConnectionString)
        _userId = HttpContext.Current.Request.ServerVariables("AUTH_USER")
        '_userId = "DVA\vacoGajulT"

        'response.lstAllWgTags = wgService_.getWGAllTags(_userId).ToList()
        Dim lstTags As List(Of TagCustom)
        lstTags = tagService_.getToolpersonalTags(toolId, _userId)
        'Dim json = JsonConvert.SerializeObject(lstTags)
        response.IsValid = True
        response.lstAllTags = lstTags
        Return response
    End Function



    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function getComparableTechnologies(toolId As Integer, tagId As Integer) As VAResponse

        Dim trmGlobals As PageGlobals = New PageGlobals()
        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
        '"Data Source=VAC20SQLTRM820; Initial Catalog=OneVATRMDev;User ID=TRMAdmin;Password=t8mP@2vF^XqW7;MultipleActiveResultSets=true;"
        Dim _userId As String
        Dim response As VAResponse = New VAResponse()

        Dim tagService_ As Abstract.ITagService
        tagService_ = New Concrete.TagService(ConnectionString)
        _userId = HttpContext.Current.Request.ServerVariables("AUTH_USER")
        '_userId = "DVA\vacoGajulT"

        'response.lstAllWgTags = wgService_.getWGAllTags(_userId).ToList()
        Dim lstTools As List(Of ToolCustom)
        lstTools = tagService_.getComparableTechnologies(toolId, _userId, tagId)
        'Dim json = JsonConvert.SerializeObject(lstTags)
        response.IsValid = True
        response.lstTools = lstTools
        Return response
    End Function

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function saveTechCompTools(selectedToolIds As String, unselectedToolIds As String, tagId As Integer) As VAResponse
        'Dim lstTags As List(Of TagCustom)
        Dim trmGlobals As PageGlobals = New PageGlobals()
        Dim response As VAResponse = New VAResponse()


        Dim _userId As String

        _userId = HttpContext.Current.Request.ServerVariables("AUTH_USER")
        '_userId = "DVA\vacoGajulT"
        ' lstAllWgMembers = wgService_.getWGAllMembers(_userId).ToList()
        ' retVal = wgService_.saveToolTags(selectedTags, toolId, _userId, wgId)

        Dim retVal As Integer
        If (tagId <> 0) Then


            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
            Dim wgService_ As Abstract.IWGService
            Dim VAUserService As Abstract.IVAUserService

            wgService_ = New Concrete.WGService(ConnectionString)
            VAUserService = New Concrete.VAUserService(ConnectionString)

            Dim tagService_ As Abstract.ITagService
            tagService_ = New Concrete.TagService(ConnectionString)

            If (selectedToolIds <> "") Then

                Dim toolIdsarray As String() = selectedToolIds.Split(New String() {","}, StringSplitOptions.None)
                If Not toolIdsarray Is Nothing Then
                    If (toolIdsarray.Length > 0) Then
                        For Each strtoolid As String In toolIdsarray
                            If (Not String.IsNullOrEmpty(strtoolid) And strtoolid <> "undefined") Then
                                retVal = tagService_.createToolTagEntry(tagId, Convert.ToInt32(strtoolid), _userId)
                            End If
                        Next
                    End If
                End If
            End If

            If (unselectedToolIds <> "") Then

                Dim removedtoolIdsarray As String() = unselectedToolIds.Split(New String() {","}, StringSplitOptions.None)
                If Not removedtoolIdsarray Is Nothing Then
                    If (removedtoolIdsarray.Length > 0) Then
                        For Each strtoolid As String In removedtoolIdsarray
                            If (strtoolid <> "" And strtoolid <> "undefined") Then
                                retVal = tagService_.RemoveTag(tagId, Convert.ToInt32(strtoolid), _userId)
                            End If
                        Next
                    End If
                End If
            End If
            response.IsValid = True
        End If

        Return response
    End Function

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function removeToolFromTag(tgId As Integer, toolId As Integer) As VAResponse

        Dim strRole As String = ""
        Dim adService_ As Abstract.IDirectoryService
        adService_ = New Concrete.DirectoryService()
        Dim response As VAResponse = New VAResponse()

        Dim trmCodeLib As VA.TRM.PresentationO.TRMPresentation.inc.TRMCodeLib.TRMCodeLib = New TRMPresentation.inc.TRMCodeLib.TRMCodeLib()
        Dim trmGlobals As PageGlobals = New PageGlobals()
        trmCodeLib.trmGlobals = trmGlobals
        trmCodeLib.initDBConnection()
        trmCodeLib.initVersion()
        Dim VAUserService As Abstract.IVAUserService
        Dim _userId As String
        _userId = HttpContext.Current.Request.ServerVariables("AUTH_USER")

        Dim retVal As Boolean
        If (tgId <> 0) Then

            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
            Dim wgService_ As Abstract.IWGService

            wgService_ = New Concrete.WGService(ConnectionString)
            VAUserService = New Concrete.VAUserService(ConnectionString)

            Dim tagService_ As Abstract.ITagService
            tagService_ = New Concrete.TagService(ConnectionString)

            retVal = tagService_.RemoveTag(tgId, toolId, _userId)

            If retVal = True Then
                response.IsValid = True
                response.Message = CStr(toolId) + " removed successfully from tag" + CStr(tgId)
            Else
                response.IsValid = False
                response.Message = "Could not remove " + CStr(toolId) + " from tag" + CStr(tgId)
            End If


        End If
        Return response
    End Function

End Class


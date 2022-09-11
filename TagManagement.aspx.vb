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

'09112022   TT  TRM-620 -- Event history

Public Class TagManagement
    Inherits BasePage

    Private tagService_ As Abstract.ITagService
    Private wgService_ As Abstract.IWGService
    Public trmReqCode As TRMRequestCode

    Protected ReadOnly Property TagService() As Abstract.ITagService
        Get
            If tagService_ Is Nothing Then
                tagService_ = New Concrete.TagService(ConnectionString)

            End If
            Return tagService_
        End Get
    End Property

    Protected ReadOnly Property WgService() As Abstract.IWGService
        Get
            If wgService_ Is Nothing Then
                wgService_ = New Concrete.WGService(ConnectionString)

            End If
            Return wgService_
        End Get
    End Property



    Public Function GetUserTags() As String
        Dim strHtml As String = ""
        Try


            Dim _userId As String
            'If (String.IsNullOrEmpty(trmGlobals.userID)) Then
            _userId = trmGlobals.userNetworkID
            'Else
            '_userId = trmGlobals.userID
            'End If
            Dim lstTags As List(Of TagCustom)
            lstTags = TagService.getTags(_userId).ToList()
            Dim json = JsonConvert.SerializeObject(lstTags)

            lbltags.InnerText = json.ToString()

            Dim lstallTags As List(Of TagCustom)
            lstallTags = TagService.getAllTags().ToList()
            Dim jsonallTags = JsonConvert.SerializeObject(lstallTags)
            hdnUserTags.Value = jsonallTags.ToString()


            Dim lstInApprWords As List(Of InAppropriateWords)
            lstInApprWords = TagService.getAllInAppropriateWords().ToList()
            Dim jsonallInApprWords = JsonConvert.SerializeObject(lstInApprWords)
            hdnInApprWords.Value = jsonallInApprWords.ToString()


            For Each item As TagCustom In lstTags
                strHtml += "<button id = 'BtnSave' btnId='btn" + item.TAG_ID.ToString() + "' class='custombutton' runat='server'>" + item.TAG_LABEL + "</button>"
                '<button id = "BtnSave" runat="server"><img src="Images/save.png" />Save</button>
            Next
        Catch ex As Exception
            Dim str As String = ex.InnerException.Message.ToString()
        End Try
        Return strHtml
    End Function

    Protected Overrides Sub OnPreInit(e As EventArgs)
        MyBase.OnPreInit(e)
        trmReqCode = New TRMRequestCode()
        trmReqCode.trmGlobals = trmGlobals
        trmReqCode.trmCodeLib = trmCodeLib
    End Sub

    Public Function renderData() As Boolean

        'Table will be static and remove will be by index  
        'btnUpload.Visible = TempRequestFiles.Where(Function(x) String.IsNullOrEmpty(x.ErrorMessage)).Count() < maxFileCount And fileUpload.HasFile()
        Dim _userId As String
        'If (String.IsNullOrEmpty(trmGlobals.userID)) Then
        _userId = trmGlobals.userNetworkID
        'Else
        '_userId = trmGlobals.userID
        'End If
        Dim lstToolEntries As List(Of ToolEntryCustom)
        lstToolEntries = TagService.getToolEntries(_userId).ToList()
        Dim json = JsonConvert.SerializeObject(lstToolEntries)
        hdnToolEntries.Value = json

        Dim lstWgs As List(Of WGCustom)
        lstWgs = WgService.getAllWGs(_userId).ToList()
        json = JsonConvert.SerializeObject(lstWgs)
        hdnlstWgs.Value = json

        Dim lstAllWgTags As List(Of TagCustom)
        lstAllWgTags = WgService.getWGAllTags(_userId).ToList()
        json = JsonConvert.SerializeObject(lstAllWgTags)
        hdnlstAllWgTags.Value = json

        Dim lstAllWgMembers As List(Of WGMember)
        lstAllWgMembers = WgService.getWGAllMembers(_userId).ToList()
        json = JsonConvert.SerializeObject(lstAllWgMembers)
        hdnlstAllWgMembers.Value = json

        Return True
    End Function

    Private Sub TagManagement_Load(sender As Object, e As EventArgs) Handles Me.Load

        If (Not IsPostBack) Then
            renderData()

            hdnLoggedInUserId.Value = trmGlobals.userNetworkID
        End If
        GetUserTags()

    End Sub

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function getMemberList(WgId As Integer) As List(Of WGMember)
        Dim lstAllWgMembers As List(Of WGMember)
        Dim trmGlobals As PageGlobals = New PageGlobals()
        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
        '"Data Source=VAC20SQLTRM820; Initial Catalog=OneVATRMDev;User ID=TRMAdmin;Password=t8mP@2vF^XqW7;MultipleActiveResultSets=true;"
        Dim wgService_ As Abstract.IWGService
        Dim _userId As String
        wgService_ = New Concrete.WGService(ConnectionString)
        _userId = HttpContext.Current.Request.ServerVariables("AUTH_USER")
        '_userId = "DVA\vacoGajulT"
        ' lstAllWgMembers = wgService_.getWGAllMembers(_userId).ToList()
        lstAllWgMembers = wgService_.getWGMembers(WgId, _userId).ToList()

        Return lstAllWgMembers
    End Function

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function deleteMember(WgId As Integer, WgMemberId As Integer, member As String) As VAResponse

        Dim trmGlobals As PageGlobals = New PageGlobals()
        Dim response As VAResponse = New VAResponse()
        Dim retVal As Int16

        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
        '"Data Source=VAC20SQLTRM820; Initial Catalog=OneVATRMDev;User ID=TRMAdmin;Password=t8mP@2vF^XqW7;MultipleActiveResultSets=true;"
        Dim wgService_ As Abstract.IWGService
        Dim _userId As String
        wgService_ = New Concrete.WGService(ConnectionString)
        _userId = HttpContext.Current.Request.ServerVariables("AUTH_USER")
        '_userId = "DVA\vacoGajulT"
        Dim tagService_ As Abstract.ITagService
        tagService_ = New Concrete.TagService(ConnectionString)

        retVal = wgService_.DeleteWGMember(WgId, WgMemberId, _userId)

        If retVal = 1 Then
            response.IsValid = True
            response.Message = "Opted Out from group successfully"
            Dim vauser As VAUser = New VAUser()
            Dim adService_ As Abstract.IDirectoryService
            adService_ = New Concrete.DirectoryService()
            vauser = adService_.GetUserInfoByNetworkID(member)
            tagService_.createTagHistory(0, _userId, "", vauser.FullName, 0, "Delete Member", "", WgId, "", "", "")
        ElseIf retVal = 2 Then
            response.IsValid = False
            response.Message = "There must be at least one Owner in the group"
        ElseIf retVal = 3 Then
            response.IsValid = False
            response.Message = "Failed"
        ElseIf retVal = 4 Then
            response.IsValid = True
            response.IsPageRefresh = True
            response.Message = "Failed"
        ElseIf retVal = 5 Then
            response.IsValid = False
            response.Message = "You are not authorized to perform this action"
        End If

        Return response

    End Function

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function addNewMember(wgId As Integer, email As String) As VAResponse

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
        'If newOwner.Checked = True Then
        '    strRole = "1"
        'ElseIf newContrinutor.Checked = True Then
        '    strRole = "2"
        'ElseIf newMember.Checked = True Then
        '    strRole = "3"
        'End If

        'Protected ReadOnly Property VAUserService As Abstract.IVAUserService
        '    Get
        '        Return New Concrete.VAUserService(ConnectionString)
        '    End Get
        'End Property

        Dim retVal As Int32
        If (email <> "") Then

            'Dim lstgroupusers As List(Of VAUser)
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
            '"Data Source=VAC20SQLTRM820; Initial Catalog=OneVATRMDev;User ID=TRMAdmin;Password=t8mP@2vF^XqW7;MultipleActiveResultSets=true;"
            Dim wgService_ As Abstract.IWGService
            Dim _userId As String
            wgService_ = New Concrete.WGService(ConnectionString)
            VAUserService = New Concrete.VAUserService(ConnectionString)

            _userId = HttpContext.Current.Request.ServerVariables("AUTH_USER")
            '_userId = "DVA\vacoGajulT"
            Dim vauserforEmaiNot As VAUser = New VAUser()

            vauserforEmaiNot = adService_.GetUserInfoByNetworkID(_userId)
            Dim ownerfullname = vauserforEmaiNot.FullName
            Dim fromEmail = vauserforEmaiNot.Email
            Dim toEmail = email
            adService_ = New Concrete.DirectoryService()
            'lstgroupusers = adService_.GetAllGroups(email)

            'If (lstgroupusers.Count > 0) Then

            '    For Each grpuser As VAUser In lstgroupusers
            '        retVal = wgService_.CreateWGMember(wgId, grpuser.NetworkID, strRole, grpuser.FullName, _userId, email, fromEmail, toEmail, ownerfullname)
            '        If (retVal = 2) Then
            '            ' userErrorMessage.InnerHtml += (grpuser.FullName + " - User already exists <br />")
            '        End If
            '    Next
            'Else


            'Validate email address format
            If (trmCodeLib.validateVaEmailAddr(email, True)) Then
                Dim tagService_ As Abstract.ITagService
                tagService_ = New Concrete.TagService(ConnectionString)
                'Dim vauser As VAUser = VAUserService.GetVAUserByEmail(email)
                Dim userNetWorkId As String
                userNetWorkId = adService_.getNetworkId(email)
                Dim vauser As VAUser
                vauser = adService_.GetUserInfoByNetworkID(userNetWorkId)
                retVal = wgService_.CreateWGMember(wgId, vauser.NetworkID, "3", vauser.FullName, _userId, vauser.Email, fromEmail, toEmail, ownerfullname)
                If (retVal = 2) Then
                    response.IsValid = False
                    response.Message = "User already exists"
                ElseIf (retVal = 3) Then
                    response.IsValid = False
                    response.Message = "You are not authorized to perform this action"
                Else
                    response.IsValid = True
                    response.Message = "User added successfully"
                    tagService_.createTagHistory(0, _userId, "", vauser.FullName + "-Viewer", 0, "Add Group Member", "", wgId, "", "", "")
                End If
            Else
                response.IsValid = False
                response.Message = email + " is not a valid VA email address"
                'userErrorMessage.InnerText = "Invalid email address"
            End If

        End If





        'Dim lstToolEntries As List(Of TagCustom)
        'lstToolEntries = WgService.getWGTags(WgId, _userId).ToList()
        'Dim json = JsonConvert.SerializeObject(lstToolEntries)
        'hdnUserTags.Value = json

        'Dim lstmember As List(Of WGMember)
        'lstmember = WgService.getWGMembers(WgId, _userId).ToList()
        'Dim jsonmember = JsonConvert.SerializeObject(lstmember)
        'hdnUsers.Value = jsonmember
        'End If
        Return response
    End Function

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function validateUser(email As String) As VAResponse

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

        If (email <> "") Then

            'Dim lstgroupusers As List(Of VAUser)
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
            '"Data Source=VAC20SQLTRM820; Initial Catalog=OneVATRMDev;User ID=TRMAdmin;Password=t8mP@2vF^XqW7;MultipleActiveResultSets=true;"
            Dim wgService_ As Abstract.IWGService
            Dim _userId As String
            wgService_ = New Concrete.WGService(ConnectionString)
            VAUserService = New Concrete.VAUserService(ConnectionString)

            _userId = HttpContext.Current.Request.ServerVariables("AUTH_USER")
            '_userId = "DVA\vacoGajulT"

            adService_ = New Concrete.DirectoryService()
            'lstgroupusers = adService_.GetAllGroups(email)

            'If (lstgroupusers.Count > 0) Then

            '    For Each grpuser As VAUser In lstgroupusers
            '        response.IsValid = True
            '        response.Message = "Valid User"

            '    Next
            'Else
            'Validate email address format
            If (trmCodeLib.validateVaEmailAddr(email, True)) Then
                'Dim vauser As VAUser = VAUserService.GetVAUserByEmail(email)
                'retVal = wgService_.CreateWGMember(wgId, vauser.NetworkID, strRole, vauser.FullName, _userId, email)
                'If (retVal = 2) Then
                Dim userNetWorkId As String
                userNetWorkId = adService_.getNetworkId(email)

                Dim vauser As VAUser
                vauser = adService_.GetUserInfoByNetworkID(userNetWorkId)

                'vauser.
                response.IsValid = True
                response.Message = "Valid User"


                Dim strSeparator As String
                strSeparator = ""
                response.DisplayEmailText = vauser.FullName + "<br/>"
                If Not String.IsNullOrEmpty(vauser.Email) And Not String.IsNullOrEmpty(vauser.PhoneNumber) Then
                    strSeparator = " | "
                End If
                response.DisplayEmailText = response.DisplayEmailText + vauser.Email + strSeparator + vauser.PhoneNumber + "<br/>"

                strSeparator = ""
                If Not String.IsNullOrEmpty(vauser.Title) And Not String.IsNullOrEmpty(vauser.Department) Then
                    strSeparator = " | "
                End If
                response.DisplayEmailText = response.DisplayEmailText + vauser.Title + strSeparator + vauser.Department

                'Else
                '    response.IsValid = True
                '    response.Message = "User added successfully"
                'End If
            Else
                response.IsValid = False
                response.Message = email + " is not a valid VA email address"
                'userErrorMessage.InnerText = "Invalid email address"
            End If

        End If

        'End If
        Return response
    End Function

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function UpdateRoleChange(wgMemberId As Integer, wgId As Integer, roleId As Integer, origRole As Integer, member As String) As VAResponse

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

        Dim retVal As Int32
        If (roleId <> 0) Then


            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
            '"Data Source=VAC20SQLTRM820; Initial Catalog=OneVATRMDev;User ID=TRMAdmin;Password=t8mP@2vF^XqW7;MultipleActiveResultSets=true;"
            Dim wgService_ As Abstract.IWGService
            wgService_ = New Concrete.WGService(ConnectionString)
            Dim tagService_ As Abstract.ITagService
            tagService_ = New Concrete.TagService(ConnectionString)
            VAUserService = New Concrete.VAUserService(ConnectionString)
            retVal = wgService_.UpdateWGMember(wgMemberId, wgId, _userId, roleId)

            If retVal = 1 Then
                response.IsValid = True
                response.Message = "Role updated successfully"
                Dim vauser As VAUser = New VAUser()
                vauser = adService_.GetUserInfoByNetworkID(member)
                tagService_.createTagHistory(0, _userId, vauser.FullName + "-" + origRole.ToString(), vauser.FullName + "-" + roleId.ToString(), 0, "Change Role", "", wgId, "", "", "")
            ElseIf retVal = 2 Then
                response.IsValid = False
                response.Message = "Cannot update the role as there is only one Owner in this group"
            ElseIf retVal = 3 Then
                response.IsValid = False
                response.Message = "Failed"
            ElseIf retVal = 4 Then
                response.IsValid = False
                response.IsOwnerChanged = True
                response.Message = "Failed"
            ElseIf retVal = 5 Then
                response.IsValid = False
                response.Message = "You are not authorized to perform this action"
            End If
        End If
        Return response
    End Function

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function createGroup(groupName As String, IsInAppropriateFlagged As String) As VAResponse

        Dim strRole As String = ""
        Dim adService_ As Abstract.IDirectoryService
        adService_ = New Concrete.DirectoryService()
        'Dim tagService_ As Abstract.ITagService

        Dim response As VAResponse = New VAResponse()
        groupName = groupName.Trim()
        Dim trmCodeLib As VA.TRM.PresentationO.TRMPresentation.inc.TRMCodeLib.TRMCodeLib = New TRMPresentation.inc.TRMCodeLib.TRMCodeLib()
        Dim trmGlobals As PageGlobals = New PageGlobals()
        trmCodeLib.trmGlobals = trmGlobals
        trmCodeLib.initDBConnection()
        trmCodeLib.initVersion()
        Dim VAUserService As Abstract.IVAUserService
        Dim wgId As Integer

        If (groupName <> "") Then

            Dim index As Integer
            Dim ch As String
            Dim containsSpecialChars As Boolean
            Const maxLength = 30
            Dim retVal As Int32
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
            '"Data Source=VAC20SQLTRM820; Initial Catalog=OneVATRMDev;User ID=TRMAdmin;Password=t8mP@2vF^XqW7;MultipleActiveResultSets=true;"
            Dim tagService_ As Abstract.ITagService
            tagService_ = New Concrete.TagService(ConnectionString)
            Dim _userId As String
            _userId = HttpContext.Current.Request.ServerVariables("AUTH_USER")
            '_userId = "DVA\vacoGajulT"
            If Len(groupName) > maxLength Then 'check for excessive length
                response.IsValid = False
                response.Message = "Group Name is too long"
            Else 'check for special characters
                containsSpecialChars = False
                For index = 1 To Len(groupName)
                    ch = Mid(groupName, index, 1)
                    If Asc(ch) = 32 Or Asc(ch) = 40 Or Asc(ch) = 41 Or Asc(ch) = 45 Or Asc(ch) = 95 Or (Asc(ch) > 47 And Asc(ch) < 58) _
                            Or (Asc(ch) > 64 And Asc(ch) < 91) Or (Asc(ch) > 96 And Asc(ch) < 123) Then
                    Else
                        containsSpecialChars = True
                        Exit For
                    End If
                Next
                If containsSpecialChars Then
                    response.IsValid = False
                    response.Message = "Valid characters are alphanumeric and _-()"
                Else 'group name is good, update the database

                    Dim fromEmail As String = ConfigurationManager.AppSettings("tagInappropriateEmailGroupFrom").ToString()
                    Dim toEmail As String = ConfigurationManager.AppSettings("tagInappropriateEmailGroupTo").ToString
                    Dim wgService_ As Abstract.IWGService

                    wgService_ = New Concrete.WGService(ConnectionString)
                    VAUserService = New Concrete.VAUserService(ConnectionString)
                    Dim vauser As VAUser = New VAUser()

                    vauser = adService_.GetUserInfoByNetworkID(_userId)
                    retVal = wgService_.CreateWG(groupName, _userId, vauser.FullName, IsInAppropriateFlagged, vauser.Email, wgId, fromEmail, toEmail)
                    If retVal = 1 Then
                        'needed to get the group id after creation to log
                        Dim lstWgs As List(Of WGCustom) = wgService_.getAllWGs(_userId).ToList()
                        response.IsValid = True
                        response.Message = "Group Created Successfully"
                        Dim eventName = "Create Group"
                        If IsInAppropriateFlagged.Equals("True") Then
                            eventName = "Inappropriate Group Created"
                        End If
                        Dim groupId = 0
                        For Each item As WGCustom In lstWgs
                            If item.WG_LABEL.ToString().Equals(groupName) Then
                                groupId = item.WG_ID
                            End If
                        Next
                        tagService_.createTagHistory(0, _userId, "", groupName, 0, eventName, "", groupId, groupName, "", "")
                        tagService_.createTagHistory(0, _userId, "", vauser.FullName + "-Owner", 0, "Add Group Member", "", groupId, groupName, "", "")
                    ElseIf retVal = 2 Then
                        response.IsValid = False
                        response.Message = "Duplicate Group Name"
                    ElseIf retVal = 3 Then
                        response.IsValid = False
                        response.Message = "Failed"
                    ElseIf retVal = 4 Then
                        response.IsAppropriate = True
                        response.Message = "Inappropriate word detected"
                        tagService_.createTagHistory(0, _userId, "", groupName, 0, "Inappropriate Group Attempted", "", 0, groupName, "", "")
                    End If
                End If
            End If
        End If

        Return response
    End Function

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function createWgTag(tagName As String, WgId As Integer, IsInAppropriateFlagged As String) As VAResponse

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

        tagName = tagName.Trim()
        If (tagName <> "") Then
            Dim index As Integer
            Dim ch As String
            Dim containsSpecialChars As Boolean
            Const maxLength = 30
            Dim retVal As Int32
            Dim _userId As String
            _userId = HttpContext.Current.Request.ServerVariables("AUTH_USER")
            '_userId = "DVA\vacoGajulT"
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
            '"Data Source=VAC20SQLTRM820; Initial Catalog=OneVATRMDev;User ID=TRMAdmin;Password=t8mP@2vF^XqW7;MultipleActiveResultSets=true;"
            Dim tagService_ As Abstract.ITagService
            tagService_ = New Concrete.TagService(ConnectionString)
            If Len(tagName) > maxLength Then
                response.IsValid = False
                response.Message = "Tag Name is too long"
            Else ' check for special characters
                containsSpecialChars = False
                For index = 1 To Len(tagName)
                    ch = Mid(tagName, index, 1)
                    If Asc(ch) = 32 Or Asc(ch) = 40 Or Asc(ch) = 41 Or Asc(ch) = 45 Or Asc(ch) = 95 Or (Asc(ch) > 47 And Asc(ch) < 58) _
                        Or (Asc(ch) > 64 And Asc(ch) < 91) Or (Asc(ch) > 96 And Asc(ch) < 123) Then
                    Else
                        containsSpecialChars = True
                        Exit For
                    End If
                Next
                If containsSpecialChars Then
                    response.IsValid = False
                    response.Message = "Valid characters are alphanumeric and _-()"
                Else 'tag name is good, update the database

                    Dim fromEmail As String = ConfigurationManager.AppSettings("tagInappropriateEmailGroupFrom").ToString()
                    Dim toEmail As String = ConfigurationManager.AppSettings("tagInappropriateEmailGroupTo").ToString

                    Dim wgService_ As Abstract.IWGService

                    wgService_ = New Concrete.WGService(ConnectionString)
                    VAUserService = New Concrete.VAUserService(ConnectionString)
                    tagService_ = New Concrete.TagService(ConnectionString)
                    Dim vauser As VAUser = New VAUser()

                    vauser = adService_.GetUserInfoByNetworkID(_userId)
                    'retVal = wgService_.CreateTagWGTag(tagName, _userId, vauser.FullName, IsInAppropriateFlagged, vauser.Email, wgId)
                    retVal = wgService_.CreateTagWGTag(WgId, tagName.Trim(), _userId, IsInAppropriateFlagged, vauser.FullName, vauser.Email, fromEmail, toEmail)
                    If retVal = 1 Then
                        response.IsValid = True
                        response.Message = "Tag Created Successfully"
                        Dim tagType = "Group"
                        Dim eventType = "Create Group Tag"
                        Dim lstWgs As List(Of TagCustom) = wgService_.getWGAllTags(_userId).ToList()
                        Dim groupId = WgId
                        If WgId = -1 Then
                            tagType = "Personal"
                            eventType = "Create Tag"
                            lstWgs = tagService_.getpersonalTags(_userId).ToList()
                            groupId = 0
                        End If
                        Dim tagId = 0
                        For Each item As TagCustom In lstWgs
                            If item.TAG_LABEL.ToString().Equals(tagName) Then
                                tagId = item.TAG_ID
                            End If
                        Next
                        If IsInAppropriateFlagged.Equals("True") Then
                            eventType = "Inappropriate Tag Created"
                        End If
                        tagService_.createTagHistory(tagId, _userId, "", tagName.Trim(), 0, eventType, "", groupId, "", tagType, tagName)
                    ElseIf retVal = 2 Then
                        response.IsValid = False
                        response.Message = "Duplicate Tag Name"
                    ElseIf retVal = 3 Then
                        response.IsValid = False
                        response.Message = "Failed"
                    ElseIf retVal = 4 Then
                        response.IsAppropriate = True
                        response.Message = "Inappropriate word detected"
                        Dim tagType = "Group"
                        Dim groupId = WgId
                        If WgId = -1 Then
                            tagType = "Personal"
                            groupId = 0
                        End If
                        tagService_.createTagHistory(0, _userId, "", tagName.Trim(), 0, "Inappropriate Tag Attempted", "", groupId, "", tagType, "")
                    ElseIf retVal = 5 Then
                        response.IsValid = False
                        response.Message = "You are not authorized to perform this action"
                    End If
                End If
            End If
        End If
        Return response
    End Function

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function renameGroup(groupName As String, IsInAppropriateFlagged As String, wgId As Integer, oldValue As String) As VAResponse

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
        groupName = groupName.Trim()
        If (groupName <> "") Then

            'groupName = "@#$😊❤" 'spcial character test data
            'groupName = "1234567890123456789023456789012" 'too long test data
            'groupName = "a s s" 'inappropriate word test data

            Dim index As Integer
            Dim ch As String
            Dim containsSpecialChars As Boolean
            Const maxLength = 30
            Dim retVal As Int32
            Dim _userId As String
            _userId = HttpContext.Current.Request.ServerVariables("AUTH_USER")
            '_userId = "DVA\vacoGajulT"
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
            '"Data Source=VAC20SQLTRM820; Initial Catalog=OneVATRMDev;User ID=TRMAdmin;Password=t8mP@2vF^XqW7;MultipleActiveResultSets=true;"
            Dim tagService_ As Abstract.ITagService
            tagService_ = New Concrete.TagService(ConnectionString)
            If Len(groupName) > maxLength Then
                response.IsValid = False
                response.Message = "Group Name is too long"
            Else 'check for special characters
                containsSpecialChars = False
                For index = 1 To Len(groupName)
                    ch = Mid(groupName, index, 1)
                    If Asc(ch) = 32 Or Asc(ch) = 40 Or Asc(ch) = 41 Or Asc(ch) = 45 Or Asc(ch) = 95 Or (Asc(ch) > 47 And Asc(ch) < 58) _
                        Or (Asc(ch) > 64 And Asc(ch) < 91) Or (Asc(ch) > 96 And Asc(ch) < 123) Then
                    Else
                        containsSpecialChars = True
                        Exit For
                    End If
                Next
                If containsSpecialChars Then
                    response.IsValid = False
                    response.Message = "Valid characters are alphanumeric and _-()"
                Else 'group name is good, update the database
                    Dim wgService_ As Abstract.IWGService

                    wgService_ = New Concrete.WGService(ConnectionString)
                    VAUserService = New Concrete.VAUserService(ConnectionString)

                    retVal = wgService_.UpdateWorkGroup(wgId, _userId, groupName, IsInAppropriateFlagged)
                    If retVal = 1 Then
                        response.IsValid = True
                        response.Message = "Group Updated Successfully"
                        tagService_.createTagHistory(0, _userId, oldValue, groupName, 0, "Rename Group", "", wgId, groupName, "", "")
                    ElseIf retVal = 2 Then
                        response.IsValid = False
                        response.Message = "Duplicate Group Name"
                    ElseIf retVal = 3 Then
                        response.IsValid = False
                        response.Message = "Failed"
                    ElseIf retVal = 4 Then
                        response.IsAppropriate = True
                        response.Message = "Inappropriate word detected"
                        tagService_.createTagHistory(0, _userId, oldValue, groupName, 0, "Inappropriate Group Rename Attempted", "", wgId, groupName, "", "")
                    ElseIf retVal = 5 Then
                        response.IsValid = False
                        response.Message = "You are not authorized to perform this action"
                    End If
                End If
            End If
        End If

        Return response
    End Function

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function deleteGroup(wgId As Integer, groupName As String) As VAResponse

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
        If (wgId <> 0) Then


            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
            '"Data Source=VAC20SQLTRM820; Initial Catalog=OneVATRMDev;User ID=TRMAdmin;Password=t8mP@2vF^XqW7;MultipleActiveResultSets=true;"
            Dim wgService_ As Abstract.IWGService
            Dim tagService_ As Abstract.ITagService
            tagService_ = New Concrete.TagService(ConnectionString)

            wgService_ = New Concrete.WGService(ConnectionString)
            VAUserService = New Concrete.VAUserService(ConnectionString)

            'needed for loggin
            Dim lstTagEntries As List(Of TagCustom)
            lstTagEntries = wgService_.getWGTags(wgId, _userId).ToList()

            retVal = wgService_.DeleteWorkGroup(wgId, _userId)

            If retVal = True Then
                response.IsValid = True
                response.Message = "Group Deleted Successfully"
                tagService_.createTagHistory(0, _userId, "", groupName, 0, "Delete Group", "", wgId, groupName, "", "")
                For Each item As TagCustom In lstTagEntries
                    tagService_.createTagHistory(item.TAG_ID, _userId, "", item.TAG_LABEL.ToString(), 0, "Delete Group Tag", "", wgId, groupName, "Group", "")
                Next
            Else
                response.IsValid = False
                response.Message = "You are not authorized to perform this action"
            End If


        End If
        Return response
    End Function

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function optoutGroup(wgId As Integer) As VAResponse

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

        Dim retVal As Int16
        If (wgId <> 0) Then


            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
            '"Data Source=VAC20SQLTRM820; Initial Catalog=OneVATRMDev;User ID=TRMAdmin;Password=t8mP@2vF^XqW7;MultipleActiveResultSets=true;"
            Dim wgService_ As Abstract.IWGService

            wgService_ = New Concrete.WGService(ConnectionString)
            Dim tagService_ As Abstract.ITagService
            tagService_ = New Concrete.TagService(ConnectionString)

            VAUserService = New Concrete.VAUserService(ConnectionString)
            Dim vauser As VAUser = New VAUser()

            vauser = adService_.GetUserInfoByNetworkID(_userId)
            Dim fromEmail = vauser.Email
            Dim toEmail = ""
            retVal = wgService_.OptOutGroup(wgId, _userId, fromEmail, toEmail, vauser.FullName)

            If retVal = 1 Then
                response.IsValid = True
                response.Message = "Opted Out from group successfully"
                tagService_.createTagHistory(0, _userId, "", vauser.FullName, 0, "Opt Out", "", wgId, "", "", "")
            ElseIf retVal = 2 Then
                response.IsValid = False
                response.Message = "Cannot Opt Out as you are the only Owner in this group"
            ElseIf retVal = 3 Then
                response.IsValid = False
                response.Message = "Failed"
            End If


        End If
        Return response
    End Function

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function getPersonalTags() As VAResponse

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
        lstTags = tagService_.getpersonalTags(_userId).ToList()
        'Dim json = JsonConvert.SerializeObject(lstTags)
        response.IsValid = True
        response.lstAllTags = lstTags
        Return response
    End Function

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function getAllUserWorkGroups() As VAResponse

        Dim trmGlobals As PageGlobals = New PageGlobals()
        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
        '"Data Source=VAC20SQLTRM820; Initial Catalog=OneVATRMDev;User ID=TRMAdmin;Password=t8mP@2vF^XqW7;MultipleActiveResultSets=true;"
        Dim wgService_ As Abstract.IWGService
        Dim _userId As String
        Dim response As VAResponse = New VAResponse()

        wgService_ = New Concrete.WGService(ConnectionString)
        _userId = HttpContext.Current.Request.ServerVariables("AUTH_USER")
        '_userId = "DVA\vacoGajulT"

        response.lstWgs = wgService_.getAllWGs(_userId).ToList()
        response.IsValid = True

        response.lstAllWgTags = wgService_.getWGAllTags(_userId).ToList()

        response.lstAllWgMembers = wgService_.getWGAllMembers(_userId).ToList()

        Return response
    End Function
    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function renameTag(tagName As String, IsInAppropriateFlagged As String, tagId As Integer, wgId As Integer, oldValue As String) As VAResponse

        Dim strRole As String = ""
        Dim adService_ As Abstract.IDirectoryService
        adService_ = New Concrete.DirectoryService()
        Dim response As VAResponse = New VAResponse()
        ' Dim wgId As Integer = 12


        Dim trmCodeLib As VA.TRM.PresentationO.TRMPresentation.inc.TRMCodeLib.TRMCodeLib = New TRMPresentation.inc.TRMCodeLib.TRMCodeLib()
        Dim trmGlobals As PageGlobals = New PageGlobals()
        trmCodeLib.trmGlobals = trmGlobals
        trmCodeLib.initDBConnection()
        trmCodeLib.initVersion()
        Dim VAUserService As Abstract.IVAUserService
        Dim _userId As String
        tagName = tagName.Trim()
        If (tagName <> "") Then

            'tagName = "@#$😊❤" 'spcial character test data
            'tagName = "1234567890123456789023456789012" 'too long test data

            Dim index As Integer
            Dim ch As String
            Dim containsSpecialChars As Boolean
            Const maxLength = 30
            Dim retVal As Int32

            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMToolDBContext").ToString()
            '"Data Source=VAC20SQLTRM820; Initial Catalog=OneVATRMDev;User ID=TRMAdmin;Password=t8mP@2vF^XqW7;MultipleActiveResultSets=true;"
            _userId = HttpContext.Current.Request.ServerVariables("AUTH_USER")
            '_userId = "DVA\vacoGajulT"
            Dim tagService_ As Abstract.ITagService
            tagService_ = New Concrete.TagService(ConnectionString)

            If Len(tagName) > maxLength Then
                response.IsValid = False
                response.Message = "Tag Name is too long"
            Else 'check for special characters
                containsSpecialChars = False
                For index = 1 To Len(tagName)
                    ch = Mid(tagName, index, 1)
                    If Asc(ch) = 32 Or Asc(ch) = 40 Or Asc(ch) = 41 Or Asc(ch) = 45 Or Asc(ch) = 95 Or (Asc(ch) > 47 And Asc(ch) < 58) _
                        Or (Asc(ch) > 64 And Asc(ch) < 91) Or (Asc(ch) > 96 And Asc(ch) < 123) Then
                    Else
                        containsSpecialChars = True
                        Exit For
                    End If
                Next
                If containsSpecialChars Then
                    response.IsValid = False
                    response.Message = "Valid characters are alphanumeric and _-()"
                Else 'tag name is good, update the database

                    VAUserService = New Concrete.VAUserService(ConnectionString)

                    retVal = tagService_.UpdateTag(tagName, tagId, _userId, IsInAppropriateFlagged, wgId)

                    If retVal = 1 Then
                        response.IsValid = True
                        response.Message = "Tag Updated Successfully"
                        Dim tagtype = "Group"
                        Dim groupId = wgId
                        If wgId = -1 Then
                            tagtype = "Personal"
                            groupId = 0
                        End If
                        tagService_.createTagHistory(tagId, _userId, oldValue, tagName, 0, "Rename Tag", "", groupId, "", tagtype, tagName)
                    ElseIf retVal = 2 Then
                        response.IsValid = False
                        response.Message = "Duplicate Tag Name"
                    ElseIf retVal = 3 Then
                        response.IsValid = False
                        response.Message = "Failed"
                    ElseIf retVal = 4 Then
                        response.IsAppropriate = True
                        response.Message = "Inappropriate word detected"
                    End If
                End If
            End If
        End If

        Return response
    End Function

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function deleteTag(tgId As Integer, wgId As Integer, tagName As String) As VAResponse

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

            'needed for loggin
            Dim lstToolEntries As List(Of ToolCustom)
            lstToolEntries = tagService_.getviewTRMEntries(tgId, _userId).ToList()

            retVal = tagService_.DeleteTag(tgId, _userId)

            If retVal = True Then
                response.IsValid = True
                response.Message = "Tag Deleted Successfully"
                Dim tagType = "Group"
                Dim groupId = wgId
                Dim eventType = "Delete Group Tag"
                If wgId = -1 Then
                    tagType = "Personal"
                    eventType = "Delete Tag"
                    groupId = 0
                End If
                tagService_.createTagHistory(tgId, _userId, "", "", 0, eventType, "", groupId, "", tagType, tagName)
                For Each item As ToolCustom In lstToolEntries
                    tagService_.createTagHistory(tgId, _userId, "", tagName, item.Tool_Id, "UnTag Entry", item.Tool_Name.ToString(), groupId, "", tagType, tagName)
                Next
            Else
                response.IsValid = False
                response.Message = "Tag Already Exists"
            End If


        End If
        Return response
    End Function

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function removeToolFromTag(tgId As Integer, toolId As Integer, wgId As Integer, tagName As String) As VAResponse

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
            Dim wgService_ As Abstract.IWGService

            wgService_ = New Concrete.WGService(ConnectionString)
            VAUserService = New Concrete.VAUserService(ConnectionString)

            Dim tagService_ As Abstract.ITagService
            tagService_ = New Concrete.TagService(ConnectionString)

            retVal = tagService_.RemoveTag(tgId, toolId, _userId)

            If retVal = True Then
                response.IsValid = True
                response.Message = CStr(toolId) + " removed successfully from" + CStr(tgId)

                Dim tagType = "Group"
                Dim groupId = wgId
                If wgId = -1 Then
                    tagType = "Personal"
                    groupId = 0
                End If
                tagService_.createTagHistory(tgId, _userId, "", tagName, toolId, "UnTag Entry", "", groupId, "", tagType, tagName)
            Else
                response.IsValid = False
                response.Message = "Could not remove " + CStr(toolId) + " from" + CStr(tgId)
            End If


        End If
        Return response
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



End Class



Public Class VAResponse

    Private _message As String

    Public Property Message() As String
        Get
            Return _message
        End Get
        Set(ByVal value As String)
            _message = value
        End Set
    End Property

    Private _isValid As Boolean

    Public Property IsValid() As Boolean
        Get
            Return _isValid
        End Get
        Set(ByVal value As Boolean)
            _isValid = value
        End Set
    End Property

    Private _isAppropriate As Boolean

    Public Property IsAppropriate() As Boolean
        Get
            Return _isAppropriate
        End Get
        Set(ByVal value As Boolean)
            _isAppropriate = value
        End Set
    End Property

    Private _ispagerefresh As Boolean

    Public Property IsPageRefresh() As Boolean
        Get
            Return _ispagerefresh
        End Get
        Set(ByVal value As Boolean)
            _ispagerefresh = value
        End Set
    End Property


    Private _lstWgs As List(Of WGCustom)
    Public Property lstWgs() As List(Of WGCustom)
        Get
            Return _lstWgs
        End Get
        Set(ByVal value As List(Of WGCustom))
            _lstWgs = value
        End Set
    End Property

    Private _lstAllWgTags As List(Of TagCustom)
    Public Property lstAllWgTags() As List(Of TagCustom)
        Get
            Return _lstAllWgTags
        End Get
        Set(ByVal value As List(Of TagCustom))
            _lstAllWgTags = value
        End Set
    End Property

    Private _lstAllWgMembers As List(Of WGMember)
    Public Property lstAllWgMembers() As List(Of WGMember)
        Get
            Return _lstAllWgMembers
        End Get
        Set(ByVal value As List(Of WGMember))
            _lstAllWgMembers = value
        End Set
    End Property

    Private _lstTools As List(Of ToolCustom)
    Public Property lstTools() As List(Of ToolCustom)
        Get
            Return _lstTools
        End Get
        Set(ByVal value As List(Of ToolCustom))
            _lstTools = value
        End Set
    End Property

    Private _displayEmailText As String
    Public Property DisplayEmailText() As String
        Get
            Return _displayEmailText
        End Get
        Set(ByVal value As String)
            _displayEmailText = value
        End Set
    End Property

    Private _isOwnerChanged As Boolean

    Public Property IsOwnerChanged() As Boolean
        Get
            Return _isOwnerChanged
        End Get
        Set(ByVal value As Boolean)
            _isOwnerChanged = value
        End Set
    End Property

    Private _lstAllTags As List(Of TagCustom)
    Public Property lstAllTags() As List(Of TagCustom)
        Get
            Return _lstAllTags
        End Get
        Set(ByVal value As List(Of TagCustom))
            _lstAllTags = value
        End Set
    End Property

End Class
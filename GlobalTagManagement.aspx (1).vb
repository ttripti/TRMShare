Imports VA.TRM.BusinessService.Abstract
Imports System.IO
Imports VA.TRM.BusinessService.Concrete
Imports VA.TRM.Domain.Authoring
Imports VA.TRM.Domain.CustomEntities
Imports VA.TRM.BusinessService
Imports System.String
Imports System.Web.Services
Imports System.Web.Script.Services
Imports VA.TRM.Authoring.TRMConfig
Imports VA.TRM.Authoring.TRMGlobals
Imports Newtonsoft.Json
Imports VA.TRM.Domain

Public Class GlobalTagManagement
    Inherits BasePage

    Private ggService_ As Abstract.IGlobalGroupService
    Private tagService_ As Abstract.ITagService

    Protected ReadOnly Property GgService() As Abstract.IGlobalGroupService
        Get
            If ggService_ Is Nothing Then
                ggService_ = New Concrete.GlobalGroupService(AuthoringConnectionString)
            End If
            Return ggService_
        End Get
    End Property

    Protected ReadOnly Property TagService() As Abstract.ITagService
        Get
            If tagService_ Is Nothing Then
                tagService_ = New Concrete.TagService(AuthoringConnectionString)
            End If
            Return tagService_
        End Get
    End Property


    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function createGroup(groupName As String, IsInAppropriateFlagged As String, doDup As Integer) As VAResponse

        Dim strRole As String = ""

        Dim response As VAResponse = New VAResponse()
        groupName = groupName.Trim()
        Dim trmCodeLib As VA.TRM.Authoring.incNet.TRMCodeLib.TRMCodeLib = New VA.TRM.Authoring.incNet.TRMCodeLib.TRMCodeLib()
        Dim trmGlobals As PageGlobals = New PageGlobals()
        'TRMCodeLib.trmGlobals = trmGlobals
        'TRMCodeLib.initDBConnection()
        Dim AuthoringUserService As Abstract.IAuthoringUserService
        Dim ggId As Integer
        If (groupName <> "") Then
            Dim index As Integer
            Dim ch As String
            Dim containsSpecialChars As Boolean
            Const maxLength = 30
            Dim retVal As Int32
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMAuthoringContext").ToString()
            'Dim tagService_ As Abstract.ITagService
            'tagService_ = New Concrete.TagService(ConnectionString)
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
                    Dim toEmail As String = ConfigurationManager.AppSettings("tagInappropriateEmailGroupTo").ToString()
                    Dim ggService_ As Abstract.IGlobalGroupService

                    ggService_ = New Concrete.GlobalGroupService(ConnectionString)
                    AuthoringUserService = New Concrete.AuthoringUserService(ConnectionString)
                    Dim authUserSvc As Abstract.IAuthoringUserService = New Concrete.AuthoringUserService(ConnectionString)

                    Dim authUser As TRMAuthoringUserCustom = authUserSvc.GetUserByNetworkId(_userId)
                    Dim UserName = authUser.LastName + ", " + authUser.FirstName
                    Dim jsonuser = JsonConvert.SerializeObject(_userId)
                    retVal = ggService_.CreateWG(groupName, _userId, UserName, IsInAppropriateFlagged, authUser.EmailAddress, ggId, fromEmail, toEmail, doDup)
                    If retVal = 1 Then
                        'needed to get the group id after creation to log
                        Dim lstWgs As List(Of GlobalGroupCustom) = ggService_.getAllWGs(_userId).ToList()
                        response.IsValid = True
                        response.Message = "Group Created Successfully"
                        Dim eventName = "Create Group"
                        If IsInAppropriateFlagged.Equals("True") Then
                            eventName = "Inappropriate Group Created"
                        End If
                        Dim groupId = 0
                        For Each item As GlobalGroupCustom In lstWgs
                            If item.GlblGrp_LABEL.ToString().Equals(groupName) Then
                                groupId = item.GlblGrp_ID
                            End If
                        Next
                        'tagService_.createTagHistory(0, _userId, "", groupName, 0, eventName, "", groupId, groupName, "", "")
                        'tagService_.createTagHistory(0, _userId, "", vauser.FullName + "-Owner", 0, "Add Group Member", "", groupId, groupName, "", "")
                    ElseIf retVal = 2 Then
                        'user Is Not a member
                        response.IsValid = False
                        response.Message = "You are already a member of this group"
                    ElseIf retVal = 3 Then
                        response.IsValid = False
                        response.Message = "Failed"
                    ElseIf retVal = 4 Then
                        response.IsAppropriate = True
                        response.Message = "Inappropriate word detected"
                        'tagService_.createTagHistory(0, _userId, "", groupName, 0, "Inappropriate Group Attempted", "", 0, groupName, "", "")
                    ElseIf retVal = 6 Then
                        'user Is member
                        response.IsValid = False
                        response.Message = "Duplicate Group Name"
                    End If
                End If
            End If
        End If
        Return response
    End Function
    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function getAllUserWorkGroups() As VAResponse

        Dim trmGlobals As PageGlobals = New PageGlobals()
        Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMAuthoringContext").ToString()
        '"Data Source=VAC20SQLTRM820; Initial Catalog=OneVATRMDev;User ID=TRMAdmin;Password=t8mP@2vF^XqW7;MultipleActiveResultSets=true;"
        Dim _userId As String
        Dim response As VAResponse = New VAResponse()
        Dim ggService_ As Abstract.IGlobalGroupService
        Dim tagService_ As Abstract.ITagService
        'wgService_ = New Concrete.WGService(ConnectionString)
        ggService_ = New Concrete.GlobalGroupService(ConnectionString)
        'tagService_ = New Concrete.TagService(ConnectionString)
        _userId = HttpContext.Current.Request.ServerVariables("AUTH_USER")
        '_userId = "DVA\vacoGajulT"

        response.lstWgs = ggService_.getAllWGs(_userId).ToList()
        response.IsValid = True
        response.lstAllTags = ggService_.getGGAllTags().ToList()
        response.lstAllWgMembers = ggService_.getWGAllMembers(_userId).ToList()

        Return response
    End Function


    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function createWgTag(tagName As String, WgId As Integer, IsInAppropriateFlagged As String) As VAResponse

        Dim strRole As String = ""
        Dim adService_ As Abstract.IDirectoryService
        adService_ = New Concrete.DirectoryService()
        Dim response As VAResponse = New VAResponse()

        'Dim trmCodeLib As VA.TRM.PresentationO.TRMPresentation.inc.TRMCodeLib.TRMCodeLib = New TRMPresentation.inc.TRMCodeLib.TRMCodeLib()
        Dim trmGlobals As PageGlobals = New PageGlobals()
        'trmCodeLib.trmGlobals = trmGlobals
        'TRMCodeLib.initDBConnection()
        'TRMCodeLib.initVersion()
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
            _userId = _userId.Replace("[//]", "\")
            'VHAMASTER\VHAISAKOHRG
            '_userId = "DVA\vacoGajulT"
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMAuthoringContext").ToString()
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

                    Dim ggService_ As Abstract.IGlobalGroupService
                    ggService_ = New Concrete.GlobalGroupService(ConnectionString)
                    'AuthoringUserService = New Concrete.AuthoringUserService(ConnectionString)

                    vauser = adService_.GetUserInfoByNetworkID(_userId)
                    'retVal = wgService_.CreateTagWGTag(tagName, _userId, vauser.FullName, IsInAppropriateFlagged, vauser.Email, wgId)
                    retVal = ggService_.CreateTagWGTag(WgId, tagName.Trim(), _userId, IsInAppropriateFlagged, vauser.FullName, vauser.Email, fromEmail, toEmail)
                    Dim groupId = WgId
                    If retVal = 1 Then
                        response.IsValid = True
                        response.Message = "Tag Created Successfully"
                        Dim tagType = "Group"
                        Dim eventType = "Create Group Tag"
                        Dim lstTags As List(Of TagCustom) = tagService_.getAllTags().ToList()

                        'If WgId = -1 Then
                        'tagType = "Personal"
                        'eventType = "Create Tag"
                        'lstWgs = tagService_.getpersonalTags(_userId).ToList()
                        'groupId = 0
                        'End If
                        Dim tagId = 0
                        For Each item As TagCustom In lstTags
                            If item.TAG_LABEL.ToString().Equals(tagName) Then
                                tagId = item.TAG_ID
                            End If
                        Next
                        If IsInAppropriateFlagged.Equals("True") Then
                            eventType = "Inappropriate Tag Created"
                        End If
                        tagService_.createGlobalTagHistory(tagId, _userId, "", tagName.Trim(), 0, eventType, "", groupId, "", tagType, tagName)
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
                        '   Dim groupId = WgId
                        '  If WgId = -1 Then
                        ' tagType = "Personal"
                        'groupId = 0
                        'End If
                        tagService_.createGlobalTagHistory(0, _userId, "", tagName.Trim(), 0, "Inappropriate Tag Attempted", "", groupId, "", tagType, "")
                    ElseIf retVal = 5 Then
                        response.IsValid = False
                        response.Message = "You are not authorized to perform this action"
                    End If
                End If
            End If
        End If
        Return response
    End Function

    <WebMethod(EnableSession:=True)> <ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)> Public Shared Function applyTag(tagId As Integer, toolId As Integer, wgId As Integer, tagName As String) As VAResponse

        Dim response As VAResponse = New VAResponse()
        Dim trmGlobals As PageGlobals = New PageGlobals()
        Dim VAUserService As Abstract.IVAUserService
        Dim _userId As String
        _userId = HttpContext.Current.Request.ServerVariables("AUTH_USER")
        Dim retVal As Integer
        If (tagId <> 0) Then
            ' connection string from web.config
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("TRMAuthoringContext").ToString()

            Dim tagService_ As Abstract.ITagService
            tagService_ = New Concrete.TagService(ConnectionString)
            ' tagId = -1 indicates global group 
            If (tagId = -1) Then
                Dim lstTags As List(Of TagCustom) = tagService_.getAllTags().ToList()

                For Each item As TagCustom In lstTags
                    If item.TAG_LABEL.ToString().Equals(tagName) Then
                        tagId = item.TAG_ID
                    End If
                Next
            End If

            VAUserService = New Concrete.VAUserService(ConnectionString)

            retVal = tagService_.createToolTagEntry(tagId, toolId, _userId, wgId)

            If retVal = 1 Then
                response.IsValid = True
                Dim tagType = "Group"
                Dim groupId = wgId

                tagService_.createTagHistory(tagId, _userId, "", tagName, toolId, "Tag Entry", "", groupId, "", tagType, tagName)
            ElseIf (retVal = 2) Then
                response.IsValid = False
                response.Message = "This tag has already been applied to the TRM entry"
            ElseIf (retVal = 3) Then
                response.IsValid = False
                response.Message = "Failed"
            ElseIf (retVal = 5) Then
                response.IsValid = False
                response.Message = "You are not authorized to perform this action"
            End If
        End If
        Return response
    End Function


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim _userId As String = TRMGlobals.userNetworkID
        '_userId = "DVA\vacoGajulT"
        hdnLoggedInUserId.Value = _userId
        ''If (String.IsNullOrEmpty(trmGlobals.userID)) Then
        '_userId = TRMGlobals.userNetworkID
        'Dim lstWgs As List(Of GlobalGroupCustom)
        'lstWgs = ggService_.getAllWGs(_userId).ToList()
        'Dim json = JsonConvert.SerializeObject(lstWgs)
        'hdnlstWgs.Value = json
        'Dim IsUserHasBusinessAdminRole As Boolean = False
        'IsUserHasBusinessAdminRole = TRMCodeLib.userHasRole(PageGlobals.BusinessAdministrator)
        'hdnIsUserHasBusinessAdminRole.Value = IsUserHasBusinessAdminRole

        Dim lstInApprWords As List(Of InAppropriateWords)
        lstInApprWords = TagService.getAllInAppropriateWords().ToList()
        Dim jsonallInApprWords = JsonConvert.SerializeObject(lstInApprWords)
        hdnInApprWords.Value = jsonallInApprWords.ToString()
    End Sub

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


    Private _lstWgs As List(Of GlobalGroupCustom)
    Public Property lstWgs() As List(Of GlobalGroupCustom)
        Get
            Return _lstWgs
        End Get
        Set(ByVal value As List(Of GlobalGroupCustom))
            _lstWgs = value
        End Set
    End Property

    Private _lstAllWgMembers As List(Of GlobalGroupMember)
    Public Property lstAllWgMembers() As List(Of GlobalGroupMember)
        Get
            Return _lstAllWgMembers
        End Get
        Set(ByVal value As List(Of GlobalGroupMember))
            _lstAllWgMembers = value
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
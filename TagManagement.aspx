<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Master/Private.Master" CodeBehind="TagManagement.aspx.vb" Inherits="VA.TRM.PresentationO.TagManagement" %>

<%@ Import Namespace="VA.TRM.PresentationO.TRMPresentation.inc.TRMGlobals" %>
<%@ Import Namespace="VA.TRM.PresentationO.TRMPresentation.inc.TRMConfig.TRMConfig" %>
<%@ Import Namespace="VA.TRM.PresentationO.TRMPresentation.inc.TRMCodeLib.TRMCodeLib" %>
<%@ Import Namespace="VA.TRM.PresentationO.TRMPresentation.inc.TRMRequestCode" %>
<%@ Import Namespace="VA.TRM.Domain" %>

<asp:Content ContentPlaceHolderID="head_bottom" runat="server">
    <script src="js/lib/jquery-3.1.0.min.js" type="text/javascript"></script>
    <script src="js/lib/jquery-ui-1.12.0.custom/jquery-ui.min.js" type="text/javascript"></script>
    <script src="js/lib/quilljs/quill.min.js" type="text/javascript"></script>
    <script src="js/One-VA-TRM.js" type="text/javascript"></script>
    <script src="js/App.js" type="text/javascript"></script>
    <script src="js/WidgetFactory/RichEditorFactory.js" type="text/javascript"></script>
    <link rel="stylesheet" href="js/lib/jquery-ui-1.12.0.custom/jquery-ui.css" />
    <link rel="stylesheet" type="text/css" href="js/lib/quilljs/trm.quill.snow.css" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet">

    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>



    <%-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">--%>
    <!-- Optional theme -->
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">--%>
    <!-- Latest compiled and minified JavaScript -->
    <%--  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>--%>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



    <%-- <script src="//code.jquery.com/jquery-latest.js"></script>--%>
    <%-- <link href="//cdn.jsdelivr.net/npm/featherlight@1.7.14/release/featherlight.min.css" type="text/css" rel="stylesheet" />
    <script src="//cdn.jsdelivr.net/npm/featherlight@1.7.14/release/featherlight.min.js" type="text/javascript" charset="utf-8"></script>--%>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%=""%>


    <% 
        'This is in the global file for the global file, needs to be here


        'Dim fileLoc
        'fileLoc = Replace(uploadsRequestDirVar, "\", "\\")

        trmReqCode.returnUrl = Request.ServerVariables("HTTP_REFERER")
        trmReqCode.reqFieldNote = "* - Indicates Required Fields"

        trmReqCode.processRequestParams()
        trmReqCode.processRequestFormRendering()

        trmReqCode.initUserInfo(VACurrentUser)

    %>
    <style>
        #dvTagGroups{
            margin-left : 10px;
            margin-right : 50px;
            margin-bottom : 20px;

        }
        #dvPernonalTag{
            margin-left : 10px;
            margin-right : 50px;
            margin-bottom : 20px;
        }
        #tagManagementTable{
            border : solid 0.5px;
            border-color : lightgrey;            
            width : 100%;
            margin-top : 50px;
            overflow-x : auto;           
        }
      
        a.collapseClass {
            color: black;            
        }
        .newpersonaltagbutton{
            font-family: Roboto, sans-serif;
            font-size: 13px;
            font-weight: normal;
            background-color: white;
            padding: 10px 18px 10px 18px;            
            color: black;
            border-width: 1px;
            overflow: hidden;
            transition: .3s;
            position: relative;
            display: inline-block;
        }
        .newpersonaltagbutton:hover {
                box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 10%);
            }
        .newgroupbutton {
            font-family: Roboto, sans-serif;
            font-size: 13px;
            font-weight: normal;
            background-color: white;
            padding: 10px 18px 10px 18px;
            color : black;
            border-width: 1px;
            overflow: hidden;
            transition: .3s;
            position: relative;
            display: inline-block;
        }

            .newgroupbutton:hover {
                box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 10%);
            }

            a[aria-expanded=true] .fa-chevron-down {
               display: none;
            }
            a[aria-expanded=false] .fa-chevron-up {
               display: none;
            }
            html{
                overflow-y : scroll;
            }
    </style>
    <table id="tagManagementTable">
        <tr style="border-bottom:0.5pt solid lightgrey;"><td>
            <div id="dvPernonalTag">
                <div>
                    <br />
                </div>
                <div class="row">
                    <table><tr>
                         <td><div class="col-sm-4" style="font-weight: bold; font-family: 'Roboto', sans-serif; font-size: 17px">
                                Personal Tag<%--</div>--%>
                <%--<div class="col-sm-11">--%>
                           <button id="btnnewpersonaltag" class="newtagbutton" onclick="javascript:openWgTagModel(0);return false;">
                    <i class="fas fa-plus"></i>&nbsp;&nbsp;&nbsp;NEW TAG
                </button>
                 
            </div></td>
                <td style="text-align:right"><a aria-expanded="true" class="collapseClass" data-toggle="collapse"  href="#dvWGPersonalTagsContainer">
                   <i class="fa fa-chevron-up"></i>
                     <i class="fa fa-chevron-down"></i>
                    
                </a></td>
                </tr></table>
                 
            <div class="col-sm-8">
                <div id="dvPersonalTagErrorMessage"></div>
                <span id="lblPersonalTagSuccessMessage" style="font-family: 'Roboto', sans-serif; color: green;"></span>
            </div>
        </div>

        <div class="row" style="padding-top: 20px;">
            <div class="col-sm-12">
                <div class="collapse show row row-cols-1 row-cols-md-3 g-4" id="dvWGPersonalTagsContainer">
                </div>

            </div>
        </div>
             </div>
        </td></tr>
        <tr style="border-bottom:0.5pt solid lightgrey;"><td>
            <div id="dvTagGroups">
            <div>
                <br />
            </div>
        <div class="row">
            <table><tr>
            <td><div class="col-sm-4" style="font-weight: bold; font-family: 'Roboto', sans-serif; font-size: 17px">
                My Groups<%--</div>--%>
                <%--<div class="col-sm-11">--%>
                <button id="btnnewgroup" class="newtagbutton" onclick="javascript:OpenNewGroupDialog();return false;">
                    <i class="fas fa-plus"></i>&nbsp;&nbsp;&nbsp;NEW GROUP
                </button>
                 
            </div></td>
                <td style="text-align:right"><a aria-expanded="true" class="collapseClass" data-toggle="collapse"  href="#dvWGTagsContainer">
                     <i class="fa fa-chevron-up"></i>
                    <i class="fa fa-chevron-down"></i>
                   
                </a></td>
                </tr></table>
                 
            <div class="col-sm-8">
                <div id="dvErrorMessage"></div>
                <span id="`" style="font-family: 'Roboto', sans-serif; color: green;"></span>
            </div>
        </div>

        <div class="row" style="padding-top: 20px;">
            <div class="col-sm-12">
                <div class=" collapse show row row-cols-1 row-cols-md-3 g-4" id="dvWGTagsContainer">
                </div>

            </div>
        </div>
    </div>
       </td></tr>
    </table>
    <div id="dvGroupPopup" class="messagepop grouppop" style="display: none; width: 170px; border: 1px solid #dee2e6;">

        <%--<div class="row">
            <div class="col-sm-2" style="text-align: center;">
            </div>
            <div class="col-sm-10" style="padding-top: 10px;">
                <a href="#" style="text-decoration: none; color: black; font-size: 14px; font-family: Roboto, sans-serif;" onclick="javascript:manageGroupMember();return false;">Manage Members</a>
            </div>
        </div>--%>
        <div style="padding-top: 5px; padding-bottom: 5px; background-color: white; cursor: pointer;" class="grpellipsemenu" id="dvRenameGroup" onclick="javascript:renameGroup();return false;">
            <div style="padding-left: 18px; display: inline-block;">
                <i class="fas fa-pen"></i>
            </div>
            <div style="display: inline-block;">
                <a href="#" style="text-decoration: none; color: grey; font-size: 12px; font-family: Roboto, sans-serif;">&nbsp;&nbsp;Rename Group</a>
            </div>
        </div>
        <div style="padding-top: 5px; padding-bottom: 5px; background-color: white; cursor: pointer" class="grpellipsemenu" id="dvOptOut" onclick="javascript:optoutGroupModal();return false;">
            <div style="padding-left: 18px; display: inline-block;">
                <i class="fas fa-times-circle"></i>
            </div>
            <div style="display: inline-block;">
                <a href="#" style="text-decoration: none; color: grey; font-size: 12px; font-family: Roboto, sans-serif;">&nbsp;&nbsp;Opt Out</a>
            </div>
        </div>
        <div class="horizontalline"></div>
        <div style="padding-top: 5px; padding-bottom: 5px; background-color: white; cursor: pointer" class="grpellipsemenu" id="dvDeleteGroup" onclick="javascript:deleteGroup();return false;">            
            <div style="padding-left: 18px; display: inline-block">
                <i class="fas fa-trash"></i>
            </div>
            <div style="display: inline-block;">
                <a href="#" style="text-decoration: none; color: grey; font-size: 12px; font-family: Roboto, sans-serif;">&nbsp;&nbsp;Delete Group</a>
            </div>
        </div>
        <%--  <table style="width: 100%">
            <tr class="">
                <td style="padding-bottom: 2px"><a href="#" style="color: black; font-weight: bold" id="lnkTagEntry"></a>
                    <br />
                    <hr class="solid">
                    <a href="#" style="color: black; font-weight: bold" id="lnkModifyTag">Manage Group</a>
                    <br />
                    <hr class="solid">
                    <a href="#" style="color: black; font-weight: bold" id="lnkDeleteTag">Opt Out</a>
                </td>
            </tr>
        </table>--%>
    </div>

    <div id="dvTagPopup" class="messagepop tagpop" style="display: none; width: 170px; border: 1px solid #dee2e6;">

        <div style="padding-top: 5px; padding-bottom: 5px; background-color: white; cursor: pointer" class="grpellipsemenu" id="dvtagTRMEntry" onclick="javascript:createTagEntryModel();return false;">
            <div style="padding-left: 18px; display: inline-block">
                <i class="fas fa-tag"></i>
            </div>
            <div style="display: inline-block;">
                <a href="#" style="text-decoration: none; color: grey; font-size: 12px; font-family: Roboto, sans-serif;">&nbsp;&nbsp;Tag TRM Entry</a>
            </div>
        </div>
        <div style="padding-top: 5px; padding-bottom: 5px; background-color: white; cursor: pointer" class="grpellipsemenu" id="dvViewTRMEntriesmenu" onclick="javascript:viewTRMEntriesModel();return false;">
            <div style="padding-left: 18px; display: inline-block">
                <i class="fas fa-eye"></i>
            </div>
            <div style="display: inline-block;">
                <a href="#" style="text-decoration: none; color: grey; font-size: 12px; font-family: Roboto, sans-serif;">&nbsp;&nbsp;View TRM Entries</a>
            </div>
        </div>
        <div style="padding-top: 5px; padding-bottom: 5px; background-color: white; cursor: pointer" class="grpellipsemenu" id="dvRenameTag" onclick="javascript:renameTagModel();return false;">
            <div style="padding-left: 18px; display: inline-block">
                <i class="fas fa-pen"></i>
            </div>
            <div style="display: inline-block;">
                <a href="#" style="text-decoration: none; color: grey; font-size: 12px; font-family: Roboto, sans-serif;">&nbsp;&nbsp;Rename Tag</a>
            </div>
        </div>
        <div class="horizontalline"></div>
        <div style="padding-top: 5px; padding-bottom: 5px; background-color: white; cursor: pointer" class="grpellipsemenu" id="dvDeleteTag" onclick="javascript:deleteTagModel();return false;">
            <div style="padding-left: 18px; display: inline-block">
                <i class="fas fa-trash"></i>
            </div>
            <div style="display: inline-block;">
                <a href="#" style="text-decoration: none; color: grey; font-size: 12px; font-family: Roboto, sans-serif;">&nbsp;&nbsp;&nbsp;Delete Tag</a>
            </div>
        </div>
        <%--  <table style="width: 100%">
            <tr class="">
                <td style="padding-bottom: 2px"><a href="#" style="color: black; font-weight: bold" id="lnkTagEntry"></a>
                    <br />
                    <hr class="solid">
                    <a href="#" style="color: black; font-weight: bold" id="lnkModifyTag">Manage Group</a>
                    <br />
                    <hr class="solid">
                    <a href="#" style="color: black; font-weight: bold" id="lnkDeleteTag">Opt Out</a>
                </td>
            </tr>
        </table>--%>
    </div>

    <!-- Modal -->

    <div class="modal fade" id="groupMemberModelPopup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                </div>
                <div class="modal-body">
                </div>
                <%--  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>--%>
            </div>
        </div>
    </div>

    <div class="modal fade" id="MembersModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document" style="width: 1250px;">
            <div class="modal-content" style="width: 800px;">
                <div class="modal-header">

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row" style="width: 100%;">
                        <div class="col-sm-5">
                            <div id="dvemailaddressModel">
                                <div class="">
                                    <div class="group">

                                        <input type="text" id="txtMemberName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 15px; background-color: #F6F6F6;" required />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label style="font-family: Roboto, sans-serif; font-size: 11px; color: grey; text-align: center; padding-top: 4px;">VA Email Address</label>
                                    </div>

                                </div>
                            </div>
                            <%--<input type="text" id="txtMemberName" style="border-radius: 35px; font-family: Roboto; font-size: 14px;" />--%>
                        </div>
                        <div class="col-sm-3" style="text-align: left">
                            <div style="display: inline-block; height: 100px; overflow-y: auto;">
                                <label id="DisplayEmailText" style="color: black; font-family: Roboto; font-size: 10px; font-weight: normal"></label>
                                <label id="lblErrorMessage" style="color: red; font-family: Roboto; font-size: 10px; font-weight: normal"></label>
                                <label id="lblSuccessMessage" style="color: green; font-family: Roboto; font-size: 10px; font-weight: normal"></label>
                            </div>
                        </div>
                        <%--padding-top: 10px;--%>
                        <div class="col-sm-4" style="padding-right: 0px; padding-left: 0px">
                            <div style="width: 20px; display: inline-block;">
                                <span class="d-none spinner-border spinner-border-sm" id="spinnerValidateUser" role="status" aria-hidden="true"></span>
                            </div>
                            <div style="display: inline-block;">

                                <button type="button" class="cancelButton" onclick="validateUser(this);return false;" id="btnValidate">

                                    <%--<div style="width: 20px; display: inline-block;">--%>
                                        VALIDATE
                                    <%--</div>--%>
                                </button>
                            </div>
                            <%--&nbsp; &nbsp; &nbsp; &nbsp;--%>
                            <div style="display: inline-block;">
                                <button type="button" class="addmemberbutton" onclick="addMember();return false;" id="btnAddMember">
                                    <div style="display: inline-block;">
                                        <i class="fas fa-plus"></i>&nbsp;&nbsp;ADD MEMBER
                                    </div>
                                </button>
                            </div>

                            <%--<div style="display: inline-block;">
                                <i class="fas fa-times" style="color: black; cursor: pointer;" onclick="javascript:closeMemberModel();"></i>
                            </div>--%>
                        </div>

                    </div>

                    <div class="row" style="font-family: Roboto; font-size: 14px; font-weight: bold;">
                        <div class="col-sm-12">
                            Members - <span id="spanselectedGroupName" style="font-family: Roboto; font-size: 14px; font-weight: bold;white-space: pre-wrap;"></span>
                        </div>
                    </div>
                    <br />
                    <div id="dvMembersList">
                    </div>
                </div>
                <div class="modal-footer">

                    <button type="button" id="btnDone" class="donebutton" onclick="javascript:btnDoneChange();return false;">
                        Done
                    </button>

                    <%--<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="newGroupModel" tabindex="-1" role="dialog" aria-labelledby="newGroupModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="width: 400px">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <%-- <div class="row">
                        <div class="col-sm-12" style="text-align: center;">--%>
                    <%--                            <div class="form__group" style="width: 300px;">
                                <input type="text" id="txtNewGroupName" class="form__field" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 15px; border-radius: 5px; width: 300px;" />
                                <label for="email" class="form__label">Group Name</label>
                            </div>--%>
                    <%-- <input type="text" id="txtNewGroupName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 15px; border-radius: 5px; width: 100%;" />--%>
                    <div class="row" style="width: 100%">
                        <div class="col-sm-8">
                            <i class="fas fa-exclamation-triangle" id="InApprWarning" style="color: darkorange; display: none;"></i><span class="textcss" style="color: black; font-weight: bold; font-size: 14px;">&nbsp;CREATE NEW GROUP</span>
                        </div>
                        <%--<div class="col-sm-4" style="text-align: right">
                            <i class="fas fa-times" style="color: black; cursor: pointer;" onclick="javascript:closeNewGroupModel();"></i>
                        </div>--%>
                    </div>
                    <div class="row">
                        <br />
                        <br />
                    </div>
                    <div id="dvnewgrpModel">
                        <div class="container">
                            <div class="group">

                                <input type="text" id="txtNewGroupName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 15px; width: 100%; background-color: #F6F6F6;" required />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label style="font-family: Roboto, sans-serif; font-size: 11px; color: grey; text-align: center; padding-top: 4px;">Group Name</label>
                            </div>

                        </div>
                    </div>

                    <%--  </div>
                    </div>--%>

                    <div class="row">
                        <div class="col-sm-9">
                            <%--<label id="lblCreateGroupSuccessMessage" style="color: green; font-family: Roboto, sans-serif; font-weight: normal"></label>--%>
                            <label id="lblCreateGroupErrorMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal; padding-left: 10px;"></label>
                            <label id="lblCreateGroupWarningMessage" style="color: deepskyblue; font-family: Roboto, sans-serif; font-weight: normal"></label>

                        </div>
                        <div class="col-sm-2" style="text-align: right; padding-right: 0px;">
                            <span id="charcounter" class="textcss">0/30</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <span id="lblInApporipateWarningMessage" style="font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal"></span>
                        </div>
                    </div>
                    <div class="row" style="padding-top: 15px;">
                        <div class="col-sm-12">
                            <span id="lblInApporipateWarningMessage1" style="font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal"></span>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-sm-12" style="text-align: center;">
                            <button type="button" id="btncancelcreategroup" class="cancelButton" data-dismiss="modal">CANCEL</button>
                            <button type="button" id="btnCreateWorkGroup" class="disabledbutton" onclick="javascript:createNewGroup();return false;">
                                <%--<span class="spinner-border spinner-border-sm d-none" id="spinnerCreateWorkGroup" role="status" aria-hidden="true"></span>--%>
                                    CREATE
                            </button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="newWGTagModel" tabindex="-1" role="dialog" aria-labelledby="newWGTagModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="width: 400px">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row" style="width: 100%">
                        <div class="col-sm-8">
                            <i class="fas fa-exclamation-triangle" id="InApprWgTagWarning" style="color: darkorange; display: none;"></i><span class="textcss" style="color: black; font-weight: bold; font-size: 14px;">&nbsp;CREATE TAG</span>
                        </div>
                        <%--<div class="col-sm-4" style="text-align: right">
                            <i class="fas fa-times" style="color: black; cursor: pointer;" onclick="javascript:closeNewWGTagModel();"></i>
                        </div>--%>
                    </div>
                    <div class="row">
                        <br />

                    </div>
                    <div id="dvnewWgTagModel">
                        <div class="container">
                            <div class="group">

                                <input type="text" id="txtNewWgTagName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 15px; width: 100%; background-color: #F6F6F6;" required />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label style="font-family: Roboto, sans-serif; font-size: 11px; color: grey; text-align: center; padding-top: 4px;">Tag Name</label>
                            </div>

                        </div>
                    </div>

                    <%--  </div>
                    </div>--%>

                    <div class="row">
                        <div class="col-sm-9">
                            <%--<label id="lblCreateWgTagSuccessMessage" style="color: green; font-family: Roboto, sans-serif; font-weight: normal"></label>--%>
                            <label id="lblCreateWgTagErrorMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal; padding-left: 10px;"></label>
                            <label id="lblCreateWgTagWarningMessage" style="color: deepskyblue; font-family: Roboto, sans-serif; font-weight: normal"></label>

                        </div>
                        <div class="col-sm-2" style="text-align: right; padding-right: 0px;">
                            <span id="charWgTagcounter" class="textcss">0/30</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <span id="lblInApporipateWgTagWarningMessage" style="font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal"></span>
                        </div>
                    </div>
                    <div class="row" style="padding-top: 15px;">
                        <div class="col-sm-12">
                            <span id="lblInApporipateWgTagWarningMessage1" style="font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal"></span>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-sm-12" style="text-align: center;">
                            <button type="button" id="btncancelcreatetag" class="cancelButton" data-dismiss="modal">CANCEL</button>
                            <button type="button" id="btnCreateWgTag" class="disabledbutton" onclick="javascript:createWgTag();return false;">
                                <%--<span class="spinner-border spinner-border-sm d-none" id="spinnerCreateTag" role="status" aria-hidden="true"></span>--%>
                                CREATE
                            </button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="renameModel" tabindex="-1" role="dialog" aria-labelledby="renameModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="width: 400px">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row" style="width: 100%">
                        <div class="col-sm-6">
                            <i class="fas fa-exclamation-triangle" id="InRenameApprWarning" style="color: darkorange; display: none;"></i><span class="textcss" style="color: black; font-weight: bold; font-size: 16px;">&nbsp;Rename Group</span>
                        </div>
                        <%--<div class="col-sm-6" style="text-align: right">
                            <i class="fas fa-times" style="color: black; cursor: pointer;" onclick="javascript:closeRenameGroupModel();"></i>
                        </div>--%>
                    </div>
                    <div class="row">
                        <br />
                        <br />
                    </div>
                    <%--<div class="row">
                        <div class="col-sm-12" style="text-align: center;">--%>
                    <div id="dvrenamegrpModel">
                        <div class="container">
                            <div class="group">
                                <input type="text" id="txtRenameGroupName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 15px; width: 100%; background-color: #F6F6F6;" required />
                                <%--<input type="text" id="txtNewGroupName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 15px; width: 100%; background-color: #F6F6F6;" required />--%>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label style="font-family: Roboto, sans-serif; font-size: 11px; color: grey; text-align: center; padding-top: 4px;">Group Name</label>
                            </div>

                        </div>
                    </div>

                    <%-- </div>
                    </div>--%>

                    <div class="row">
                        <div class="col-sm-8">
                            <%--<label id="lblRenameGroupSuccessMessage" style="color: green; font-family: Roboto, sans-serif; font-weight: normal;"></label>--%>
                            <label id="lblRenameGroupErrorMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal; padding-left: 6px"></label>
                            <label id="lblRenameGroupWarningMessage" style="color: deepskyblue; font-family: Roboto, sans-serif; font-weight: normal;"></label>

                        </div>
                        <div class="col-sm-3" style="text-align: right; padding-right: 0px;">
                            <span id="renamecharcounter" class="textcss">0/30</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <span id="lblRenameInApporipateWarningMessage" style="font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal;"></span>
                        </div>
                    </div>
                    <div class="row" style="padding-top: 15px;">
                        <div class="col-sm-12">
                            <span id="lblRenameInApporipateWarningMessage1" style="font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal;"></span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-sm-12" style="text-align: center;">
                            <button type="button" id="btncancelrenamegroup" class="cancelButton" data-dismiss="modal">CANCEL</button>
                            <button type="button" id="btnRenameWorkGroup" class="enabledbutton" onclick="javascript:renameWorkGroup();return false;">
                                <%--<span class="spinner-border spinner-border-sm d-none" id="spinnerRenameWorkGroup" role="status" aria-hidden="true"></span>--%>
                                    RENAME
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="deleteModel" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document" style="width: 1250px;">
            <div class="modal-content" style="width: 600px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row" style="width: 100%;">
                        <div class="col-sm-6">
                            <i class="fas fa-exclamation-triangle" id="DeleteWarning" style="color: orangered;"></i><span class="textcss" style="color: black; font-weight: bold; font-size: 16px;">&nbsp; DELETE GROUP</span>
                        </div>
                        <%--<div class="col-sm-6" style="text-align: right">
                            <i class="fas fa-times" style="color: black; cursor: pointer;" onclick="javascript:closeDeleteGroupModel();"></i>
                        </div>--%>
                    </div>
                    <div class="row">
                        <br />
                    </div>
                    <div class="row" style="padding-bottom:10px;">
                        <div class="col-sm-12">
                            <span class="textcss" id="spandeletetext" style="color: black; font-weight: bold; font-size: 14px;white-space: pre-wrap;"></span>
                            </div>
                        </div>
                    <div class="row" style="padding-bottom:10px;">
                        <div class="col-sm-12">
                            <span id="deletegrouppopuptext" style="white-space: pre-wrap;font-family: Roboto, sans-serif; font-size: 12px;">Deleteing the group named <b>group name here</b> will remove the group from your view
                                as well as all group member's view. All <b>group name here</b> tags will be removed from any TRM entry tagged with a <b>group name here</b> tag.
                                Type the name "<b>group name here</b>" belwo to confirm you want to delete the <b>group name here</b> group and any associated group tags.
                            </span>

                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-sm-12">
                            <div id="dvdeletegrpModel">
                                <div class="container">
                                    <div class="group">
                                        <input type="text" id="txtDeleteGroupName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 15px; width: 100%; background-color: #F6F6F6;" required />
                                        <%--<input type="text" id="txtNewGroupName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 15px; width: 100%; background-color: #F6F6F6;" required />--%>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label style="font-family: Roboto, sans-serif; font-size: 11px; color: grey; text-align: center; padding-top: 4px;">Group Name</label>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-8">
                            <label id="lblDeleteGroupErrorMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal;"></label>
                            <label id="lblDeleteGroupSuccessMessage" style="color: green; font-family: Roboto, sans-serif; font-weight: normal;"></label>
                            <label id="lblDeleteGroupWarningMessage" style="color: deepskyblue; font-family: Roboto, sans-serif; font-weight: normal;"></label>

                        </div>
                        <div class="col-sm-4" style="text-align: right;">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-sm-12" style="text-align: center;">
                            <button type="button" id="btncanceldeletegroup" class="cancelButton" data-dismiss="modal">CANCEL</button>
                            <button type="button" id="btnDeleteWorkGroup" class="disabledbutton" disabled="disabled" onclick="javascript:deleteWorkGroup();return false;">
                                <%--<span class="spinner-border spinner-border-sm d-none" id="spinnerDeleteGroup" role="status" aria-hidden="true"></span>--%>
                                    DELETE
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="optoutGroupModal" tabindex="-1" role="dialog" aria-labelledby="optoutModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="width: 400px">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row" style="width: 100%">
                        <div class="col-sm-6">
                            <span class="textcss" style="color: black; font-weight: bold; font-size: 16px;">&nbsp;Opt Out</span>
                        </div>
                        <%--<div class="col-sm-6" style="text-align: right">
                            <i class="fas fa-times" style="color: black; cursor: pointer;" onclick="javascript:closeoptoutModel();"></i>
                        </div>--%>
                    </div>
                    <div class="row">
                        <br />
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <span id="optoutpopuptext" style="font-family: Roboto, sans-serif; font-size: 13px;white-space: pre-wrap;">Are you sure you want to delete this record?</span>

                        </div>
                    </div>
                    <br />
                    <%--<div class="row">
                        <div class="col-sm-12">

                            <input type="text" id="txtDeleteTagName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 15px; border-radius: 5px; width: 100%;" />
                        </div>
                    </div>--%>

                    <div class="row">
                        <div class="col-sm-12">
                            <label id="lbloptoutErrorMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal;"></label>
                            <label id="lbloptoutSuccessMessage" style="color: green; font-family: Roboto, sans-serif; font-weight: normal;"></label>
                            <label id="lbloptoutWarningMessage" style="color: deepskyblue; font-family: Roboto, sans-serif; font-weight: normal;"></label>

                        </div>
                        <%--<div class="col-sm-4" style="text-align: right;">
                        </div>--%>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-sm-12" style="text-align: center;">
                            <button type="button" id="btncanceloptout" class="cancelButton" data-dismiss="modal">CANCEL</button>
                            <button type="button" id="btnoptout" class="enabledbutton" onclick="javascript:optoutGroup();return false;">
                                <%--<span class="spinner-border spinner-border-sm d-none" id="spinnerOptOut" role="status" aria-hidden="true"></span>--%>
                                OPT OUT
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="renameTagModel" tabindex="-1" role="dialog" aria-labelledby="renameTagModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="width: 400px">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="javascript:closeRenameTagModel();">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row" style="width: 100%">
                        <div class="col-sm-6">
                            <i class="fas fa-exclamation-triangle" id="InRenameTagApprWarning" style="color: darkorange; display: none;"></i><span class="textcss" style="color: black; font-weight: bold; font-size: 16px;">&nbsp;Rename Tag</span>
                        </div>
                        <%--<div class="col-sm-6" style="text-align: right">
                            <i class="fas fa-times" style="color: black; cursor: pointer;" onclick="javascript:closeRenameTagModel();"></i>
                        </div>--%>
                    </div>
                    <div class="row">
                        <br />
                        <br />
                    </div>
                    <%--<div class="row">
                        <div class="col-sm-12" style="text-align: center;">--%>
                    <div id="dvrenameTagModel">
                        <div class="container">
                            <div class="group">
                                <input type="text" id="txtRenameTagName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 15px; width: 100%; background-color: #F6F6F6;" required />
                                <%--<input type="text" id="txtNewGroupName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 15px; width: 100%; background-color: #F6F6F6;" required />--%>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label style="font-family: Roboto, sans-serif; font-size: 11px; color: grey; text-align: center; padding-top: 4px;">Tag Name</label>
                            </div>

                        </div>
                    </div>
                    <%--<input type="text" id="txtRenameTagName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 15px; border-radius: 5px; width: 100%;" />--%>
                    <%-- </div>
                    </div>--%>

                    <div class="row">
                        <div class="col-sm-8">
                            <%--<label id="lblRenameTagSuccessMessage" style="color: green; font-family: Roboto, sans-serif; font-weight: normal;"></label>--%>
                            <label id="lblRenameTagErrorMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal; padding-left: 6px;"></label>
                            <label id="lblRenameTagWarningMessage" style="color: deepskyblue; font-family: Roboto, sans-serif; font-weight: normal;"></label>

                        </div>
                        <div class="col-sm-3" style="text-align: right; padding-right: 0px;">
                            <span id="renameTagcharcounter" class="textcss">0/30</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <span id="lblRenameTagInApporipateWarningMessage" style="font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal;"></span>
                        </div>
                    </div>
                    <div class="row" style="padding-top: 15px;">
                        <div class="col-sm-12">
                            <span id="lblRenameTagInApporipateWarningMessage1" style="font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal;"></span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-sm-12" style="text-align: center;">
                            <button type="button" id="btncancelrenametag" class="cancelButton" data-dismiss="modal" onclick="javascript:cancelRenameTagModal();">CANCEL</button>
                            <button type="button" id="btnRenameTag" class="enabledbutton" onclick="javascript:renameTag();return false;">
                                <%--<span class="spinner-border spinner-border-sm d-none" id="spinnerRenameTag" role="status" aria-hidden="true"></span>--%>
                                    RENAME
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="deleteTagModel" tabindex="-1" role="dialog" aria-labelledby="deleteTagModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="width: 400px">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="javascript:closeDeleteTagModel();">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row" style="width: 100%">
                        <div class="col-sm-6">
                            <span class="textcss" style="color: black; font-weight: bold; font-size: 16px;">&nbsp;Delete Tag</span>
                        </div>
                        <%--<div class="col-sm-6" style="text-align: right">
                            <i class="fas fa-times" style="color: black; cursor: pointer;" onclick="javascript:closeDeleteTagModel();"></i>
                        </div>--%>
                    </div>
                    <div class="row">
                        <br />
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <span id="deleteTagpopuptext" style="font-family: Roboto, sans-serif; font-size: 13px;">Are you sure you want to delete this record?</span>

                        </div>
                    </div>
                    <br />
                    <%--<div class="row">
                        <div class="col-sm-12">

                            <input type="text" id="txtDeleteTagName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 15px; border-radius: 5px; width: 100%;" />
                        </div>
                    </div>--%>

                    <div class="row">
                        <div class="col-sm-8">
                            <label id="lblDeleteTagErrorMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal;"></label>
                            <label id="lblDeleteTagSuccessMessage" style="color: green; font-family: Roboto, sans-serif; font-weight: normal;"></label>
                            <label id="lblDeleteTagWarningMessage" style="color: deepskyblue; font-family: Roboto, sans-serif; font-weight: normal;"></label>

                        </div>
                        <div class="col-sm-4" style="text-align: right;">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-sm-12" style="text-align: center;">
                            <button type="button" id="btncanceldeletetag" class="cancelButton" data-dismiss="modal" onclick="javascript:cancelDeleteTagModal();">CANCEL</button>
                            <button type="button" id="btnDeleteTag" class="enabledbutton" onclick="javascript:deleteTag();return false;">
                                <%--<span class="spinner-border spinner-border-sm d-none" id="spinnerDeleteTag" role="status" aria-hidden="true"></span>--%>
                                DELETE
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="viewTRMModel" tabindex="-1" role="dialog" aria-labelledby="ViewTRMModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="javascript:closeviewTRMModel();">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row" style="width: 100%; padding-bottom: 5px;">
                        <div class="col-sm-12">
                            <span style="color: black; font-family: Roboto, sans-serif; font-size: 16px; font-weight: bold;">TAGGED ENTRIES</span>
                        </div>
                    </div>
                    <div class="row" style="width: 100%; padding-top: 5px;">
                        <div class="col-sm-12">
                            <span style="color: black; font-family: Roboto, sans-serif; font-size: 12px; font-weight: bold;white-space: pre-wrap;" id="spanTaggedGroupName"></span>
                        </div>
                    </div>
                    <div class="row" style="width: 100%; padding-top: 5px; padding-bottom: 5px;">
                        <div class="col-sm-12">
                            <span style="color: black; font-family: Roboto, sans-serif; font-size: 12px; font-weight: bold;" id="spanTaggedTagName"></span>
                        </div>
                    </div>
                    <div id="dvViewTRMEntries" style="height: 250px; overflow-y: auto; overflow-x: hidden;">
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-sm-12" style="text-align: center;">

                            <button type="button" id="btnOkTaggedEntires" style="padding: 10px 30px 10px 30px;" class="enabledbutton" onclick="javascript:cancelviewTRMModal();return false;">
                                OK
                            </button>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="tagTRMModel" tabindex="-1" role="dialog" aria-labelledby="tagTRMModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="javascript:closetagTRMModel();">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="font-family: Roboto, sans-serif;">
                    <div class="row" style="width: 100%;">
                        <div class="col-sm-12">
                            <span style="color: deepskyblue; font-family: Roboto, sans-serif; font-size: 11px;" id="lbltagEntryErrorMessage"></span>
                        </div>
                    </div>
                    <div class="row" style="width: 100%;">
                        <div class="col-sm-12">
                            <span style="color: black; font-family: Roboto, sans-serif; font-size: 12px;white-space: pre-wrap;" id="tagentryGroupName"></span>
                        </div>
                    </div>
                    <div class="row" style="width: 100%; padding-bottom: 20px;">
                        <div class="col-sm-12">
                            <span style="color: black; font-family: Roboto, sans-serif; font-size: 12px;" id="tagentryTagName"></span>
                        </div>
                    </div>
                    <div class="row" style="width: 100%; padding-top: 10px;">

                        <div id="dvToolEntry" style="display: inline-block; width: 250px;">

                            <div class="group">
                                <input type="text" id="txtToolEntry" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 15px; width: 250px; background-color: #F6F6F6;" required />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label style="font-family: Roboto, sans-serif; font-size: 11px; color: grey; text-align: center; padding-top: 4px;">Entry Name</label>
                            </div>

                        </div>

                        <div style="display: inline-block; width: 80px; text-align: center; vertical-align: middle;">
                            <span class="spinner-border spinner-border-sm d-none" id="spinnersearch" role="status" aria-hidden="true"></span>
                            <button id="btnSearch" style="background-color: white; border-width: 0px; font-family: Roboto, sans-serif; font-size: 18px; color: gray" onclick="javascript:getToolEntries();return false;">

                                <i class="fa fa-search" style="padding-top: 10px;" aria-hidden="true"></i>

                            </button>

                        </div>
                    </div>

                    <div class="row">
                        <div id="dvViewTRMToolEntries" style="height: 200px; overflow-y: auto; overflow-x: hidden;"></div>
                        <%-- <div class="list-group">
                          <a href="#" class="list-group-item list-group-item-action active">
                            Cras justo odio
                          </a>
                          <a href="#" class="list-group-item list-group-item-action">Dapibus ac facilisis in</a>
                          <a href="#" class="list-group-item list-group-item-action">Morbi leo risus</a>
                          <a href="#" class="list-group-item list-group-item-action">Porta ac consectetur ac</a>
                          <a href="#" class="list-group-item list-group-item-action disabled">Vestibulum at eros</a>
                        </div>--%>
                    </div>

                    <div class="row" style="width: 100%; padding-top: 10px; padding-bottom: 10px;">
                        <span id="selectedToolTagtoApply" style="color: black; font-weight: bold; font-family: Roboto, sans-serif; font-size: 12px;"></span>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-sm-12" style="text-align: center;">
                            <button type="button" id="btncancelapplytag" class="cancelButton" data-dismiss="modal" onclick="javascript:canceltagTRMModel();">CANCEL</button>

                            <button type="button" id="btnApplyTag" class="enabledbutton" onclick="javascript:applyTag();return false;">
                                <%--<span class="spinner-border spinner-border-sm d-none" id="spinnerapplytag" role="status" aria-hidden="true"></span>--%>
                                APPLY TAG
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <label id="lbltags" style="display: none;" runat="server"></label>

    <input type="hidden" runat="server" id="selectedTagId" />
    <input type="hidden" runat="server" id="selectedTagName" />

    <input type="hidden" runat="server" id="hdnToolEntries" />
    <input type="hidden" runat="server" id="hdnSelectedToolId" />
    <input type="hidden" runat="server" id="hdnUserTags" />
    <input type="hidden" runat="server" id="hdnModifiedTaglabel" />
    <input type="hidden" runat="server" id="hdnlstWgs" />
    <input type="hidden" runat="server" id="hdnlstAllWgTags" />
    <input type="hidden" runat="server" id="hdnlstAllWgMembers" />

    <input type="hidden" runat="server" id="hdnSelectedWGId" />
    <input type="hidden" runat="server" id="hdnSelectedWGName" />

    <input type="hidden" runat="server" id="hdntxtUpdateWG" />
    <input type="hidden" runat="server" id="hdnInApprWords" />

    <input type="hidden" runat="server" id="hdnIsInAppropriateFlagged" />

    <input type="hidden" runat="server" id="hdnLoggedInUserId" />

    <div id="loader">

        <div class="d-flex justify-content-center" style="padding-top: 250px; opacity: 0.5">
            <div class="spinner-border" role="status" style="color: black;">
            </div>
        </div>
    </div>


    <div class="modal fade" id="spinnerModel" tabindex="-1" role="dialog" aria-labelledby="ViewTRMModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document" style="padding-top: 200px; width: 100px; opacity: 0.5">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="d-flex justify-content-center" style="padding-top: 250px; opacity: 0.5">
                        <div class="spinner-border" role="status">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade bd-example-modal-lg" id="spinnerModel1" data-backdrop="static" data-keyboard="false" tabindex="-1">
        <div class="modal-dialog modal-sm">
            <div class="modal-content" style="width: 48px">
                <%--<span class="fa fa-spinner fa-spin fa-3x"></span>
                <i class="fa fa-circle-o-notch fa-spin fa-3x fa-fw"></i>--%>

                <div class="d-flex justify-content-center">
                    <div class="spinner-border" role="status">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style>
        .bd-example-modal-lg .modal-dialog {
            display: table;
            position: relative;
            margin: 0 auto;
            top: calc(50% - 24px);
            opacity: 0.5;
        }

            .bd-example-modal-lg .modal-dialog .modal-content {
                background-color: transparent;
                border: none;
            }
    </style>
    <script>
        function openToolPage(tid) {
            //var spinner = $('#loader');
            //spinner.show();
            $('#spinnerModel1').modal('show');
            $('#viewTRMModel .modal-content').css('background-color', 'lightgrey');
            $('#dvViewTRMEntries').find('a').css('background-color', 'lightgrey');
            $('#btnOkTaggedEntires').css('background-color', 'gray');
            var pageUrl = '\ToolPage.aspx?tid=' + tid;
            window.open(pageUrl, "_self");
        }
        function closetagTRMModel() {
            $("#tagTRMModel").modal('hide');
            $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', '#c4dcef');

        }
        function canceltagTRMModel() {
            $("#tagTRMModel").modal('hide');
            $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', '#c4dcef');
        }

        function closeviewTRMModel() {
            $("#viewTRMModel").modal('hide');
            $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', '#c4dcef');
        }
        function cancelviewTRMModal() {
            $("#viewTRMModel").modal('hide');
            $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', '#c4dcef');
        }
        function cancelRenameTagModal() {
            $("#renameTagModel").modal('hide');
            $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', '#c4dcef');
        }
        function closeDeleteTagModel() {
            $("#deleteTagModel").modal('hide');
            $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', '#c4dcef');
        }
        function cancelDeleteTagModal() {
            $("#deleteTagModel").modal('hide');
            $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', '#c4dcef');
        }
        function closeoptoutModel() {
            $("#optoutGroupModal").modal('hide');
        }
        function createTagEntryModel() {
            $("#tagTRMModel").modal('show');
            $('#lbltagEntryErrorMessage').text('');

            $('#dvViewTRMToolEntries').empty();
            var wgId = $('#ContentPlaceHolder1_hdnSelectedWGId').val()
            $('#tagentryGroupName').text('Group: ' + $('#Group' + wgId).attr('groupName'));
            $('#tagentryTagName').text('Tag Name: ' + $('#ContentPlaceHolder1_selectedTagName').val());
            $('#txtToolEntry').val('');
            $('#dvTagPopup').hide();
            $('#selectedToolTagtoApply').text('');
            $('#btnApplyTag').removeClass('enabledbutton').addClass('disabledbutton');
            $('#btnApplyTag').attr('disabled', 'disabled');
        }
        function applyTag() {
            //
            /*$('#spinnerapplytag').removeClass('d-none');*/

            $.ajax({
                url: 'TagManagement.aspx/applyTag?tagId=' + $('#ContentPlaceHolder1_selectedTagId').val() + '&toolId=' + $('#ContentPlaceHolder1_hdnSelectedToolId').val(),
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    /*$('#spinnerapplytag').addClass('d-none');*/
                    if (data.d.IsValid) {
                        $('#lblGroupSuccessMessage').text('Tag applied successfully.');
                        $("#lblGroupSuccessMessage").show().delay(5000).fadeOut();
                        $("#tagTRMModel").modal('hide');
                        $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', '#c4dcef');
                    }
                    else {
                        $('#lbltagEntryErrorMessage').text(data.d.Message);
                    }
                },
                error: function (jqXHR, status, error) {
                    /*$('#spinnerapplytag').addClass('d-none');*/
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });
        }
        function selectedTool(toolId) {
            $('#ContentPlaceHolder1_hdnSelectedToolId').val(toolId);
            $('#lbltagEntryErrorMessage').text('');
            $('#selectedToolTagtoApply').text('Add tag "' + $('#ContentPlaceHolder1_selectedTagName').val() + '" to TRM entry "' + $('#a' + toolId).text() + '"');
            $('#btnApplyTag').removeClass('disabledbutton').addClass('enabledbutton');
            $('#btnApplyTag').removeAttr('disabled');
        }
        function getToolEntries() {
            //tagentryGroupName
            //tagentryTagName
            $('#spinnersearch').removeClass('d-none');

            $.ajax({
                url: 'TagManagement.aspx/getToolEntires?toolText=' + JSON.stringify($('#txtToolEntry').val()),
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    $('#spinnersearch').addClass('d-none');
                    if (data != null) {
                        $('#dvViewTRMToolEntries').empty();
                        var parentDiv = '';
                        if (data.d.lstTools != null) {

                            parentDiv += '<div class="row" style="font-family: Roboto;padding-top:10px;padding-bottom:10px;font-size:11px;"><div class="col-sm-12"> Found ' + data.d.lstTools.length + ' entries in TRM </div></div>';
                            parentDiv += '<div class="list-group">';

                            $.each(data.d.lstTools, function (key, val) {
                                var aid = 'a' + val.Tool_Id;
                                parentDiv += '<a href="#" style="text-decoration: none;font-family: Roboto;font-size:11px;" class="list-group-item list-group-item-action" id="' + aid + '" onclick="javascript:selectedTool(' + val.Tool_Id + ');return false;">' + val.Tool_Name + '</a>'

                            });
                            //parentDiv += '</table>';
                            parentDiv += '</div>';
                            $('#dvViewTRMToolEntries').append(parentDiv);
                        }
                    }

                },
                error: function (jqXHR, status, error) {
                    $('#spinnersearch').addClass('d-none');
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });
        }

        function viewTRMEntriesModel() {
            $("#viewTRMModel").modal('show');
            $('#dvTagPopup').hide();
            $.ajax({
                url: 'TagManagement.aspx/getviewTRMEntries?tgId=' + $('#ContentPlaceHolder1_selectedTagId').val(),
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {

                    if (data != null) {
                        $('#dvViewTRMEntries').empty();
                        var parentDiv = '';
                        if (data.d.lstTools != null) {
                            var wgId = $('#ContentPlaceHolder1_hdnSelectedWGId').val()
                            //parentDiv += '<div class="row"><div class="col-sm-12"><span id="spanVwGroupName">' + $('#Group' + wgId).attr('groupName') +'<span></div></div>';
                            $('#spanTaggedGroupName').text('Group - ' + $('#Group' + wgId).attr('groupName'));
                            $('#spanTaggedTagName').text(' Tag - ' + $('#ContentPlaceHolder1_selectedTagName').val());

                            parentDiv += '<div class="row" style="font-family: Roboto;padding-top:10px;padding-bottom:10px;font-size:11px;font-weight:bold;"><div class="col-sm-12"> Entries (' + data.d.lstTools.length + ')</div></div>';

                            //parentDiv += '<table style="width: 100%;border-collapse: collapse;font-family: Roboto; border: 1px solid;padding:15px 15px 15px 15px">';
                            parentDiv += '<div class="list-group">';
                            $.each(data.d.lstTools, function (key, val) {

                                parentDiv += '<a href="#" OnClick="javascript:openToolPage(' + val.Tool_Id + ');return false;" class="list-group-item list-group-item-action" style="color:#4169e1;font-family: Roboto;font-size:12px;">' + val.Tool_Name + '</a>'
                                //parentDiv += '<tr><td style="border: 1px solid;padding:15px 15px 15px 15px;"> <a href="ToolPage.aspx?tid=' + val.Tool_Id + '" class="textcss">' + val.Tool_Name + '</a> </td>  </tr>';

                            });
                            parentDiv += '</div>';
                            $('#dvViewTRMEntries').append(parentDiv);
                        }
                    }

                },
                error: function (jqXHR, status, error) {
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });
        }
        function renameTagModel() {
            $('#txtRenameTagName').val($('#ContentPlaceHolder1_selectedTagName').val());
            $('#renameTagcharcounter').text($('#txtRenameTagName').val().length + '/30');
            $("#renameTagModel").modal('show');
            $('#dvTagPopup').hide();
            $('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val('False');
            $('#lblRenameTagErrorMessage').text('');
            //$('#renamecharcounter').text('0/30');
        }
        function renameTag() {
            //ajax method rename
            $('#InRenameTagApprWarning').hide();
            $('#lblRenameTagInApporipateWarningMessage').html('');
            $('#lblRenameTagInApporipateWarningMessage1').html('');
            $('#lblRenameTagWarningMessage').text('');
            /*$('#spinnerRenameTag').removeClass('d-none');*/
            $.ajax({
                url: 'TagManagement.aspx/renameTag?tagName=' + JSON.stringify($('#txtRenameTagName').val()) + '&IsInAppropriateFlagged=' + JSON.stringify($('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val()) + '&tagId=' + JSON.stringify($('#ContentPlaceHolder1_selectedTagId').val()),
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    /*$('#spinnerRenameTag').addClass('d-none');*/

                    if (data != null) {

                        if (data.d.IsAppropriate == true) {
                            $('#InRenameTagApprWarning').show();

                            var txtMsg = 'The word(s) "' + $('#txtRenameTagName').val() + '" have been flagged as inappropriate. TRM Admins monitor all site activity.';
                            $('#lblRenameTagInApporipateWarningMessage').html(txtMsg);

                            var txtMsg1 = 'You may change the name or continue adding the group name if you received this message in error.';
                            $('#lblRenameTagInApporipateWarningMessage1').html(txtMsg1);

                            $('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val('True');
                            $('#lblRenameTagErrorMessage').text('Inappropriate word detected');
                        }
                        else if (!data.d.IsValid) {
                            //data.d.Message
                            $('#lblRenameTagErrorMessage').text(data.d.Message)
                        }
                        else {
                            $("#renameTagModel").modal('hide');
                            $('#lblGroupSuccessMessage').text('Tag renamed successfully.');
                            $("#lblGroupSuccessMessage").show().delay(5000).fadeOut();
                            getAllUserWorkGroups();
                            //getAllPersonalTags();
                            //lblSuccessMessage
                            //$('#lblRenameGroupSuccessMessage').text(data.d.Message)
                            //window.location.reload();
                            //getWGMembersById(wgId);
                        }
                    }

                },
                error: function (jqXHR, status, error) {
                    /*$('#spinnerRenameTag').addClass('d-none');*/

                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });

        }
        function deleteTagModel() {
            $("#deleteTagModel").modal('show');
            $('#deleteTagpopuptext').html('Are you sure you want to delete the tag <b>' + $('#ContentPlaceHolder1_selectedTagName').val() + '</b> from the group <b>' + $('#ContentPlaceHolder1_hdnSelectedWGName').val() + '</b>? This cannot be undone.');
            $('#dvTagPopup').hide();
        }
        function optoutGroupModal() {
            $("#optoutGroupModal").modal('show');
            $('#lbloptoutErrorMessage').text('');
            $('#lbloptoutSuccessMessage').text('');
            $('#lbloptoutWarningMessage').text('');


            $('#optoutpopuptext').html("By choosing to opt out of the <b>" + $('#ContentPlaceHolder1_hdnSelectedWGName').val() + "</b> group, you will no longer see group tags or receive notifications about the group's activity.");
            $('#dvGroupPopup').hide();
        }

        function optoutGroup() {
            //ajax method
            //$('#InRenameApprWarning').hide();
            //$('#lblRenameInApporipateWarningMessage').html('');
            //$('#lblRenameInApporipateWarningMessage1').html('');
            //$('#lblRenameGroupWarningMessage').text('');
            //$('#spinnerOptOut').removeClass('d-none');
            $.ajax({
                url: 'TagManagement.aspx/optoutGroup?&WgId=' + $('#ContentPlaceHolder1_hdnSelectedWGId').val(),
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    //$('#spinnerOptOut').addClass('d-none');
                    if (data != null) {
                        if (!data.d.IsValid) {
                            //data.d.Message
                            $('#lbloptoutErrorMessage').text(data.d.Message)
                        }
                        else {
                            //lblSuccessMessage
                            //$('#lblDeleteGroupSuccessMessage').text(data.d.Message)
                            //window.location.reload();
                            $("#optoutGroupModal").modal('hide');
                            $('#lblGroupSuccessMessage').text('Opted out from group successfully.');
                            $("#lblGroupSuccessMessage").show().delay(5000).fadeOut();
                            getAllUserWorkGroups();
                            //getAllPersonalTags();
                            //getWGMembersById(wgId);
                        }
                    }
                },
                error: function (jqXHR, status, error) {
                    //$('#spinnerOptOut').addClass('d-none');
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });
        }

        function deleteTag() {
            //ajax method
            $('#InRenameApprWarning').hide();
            $('#lblRenameInApporipateWarningMessage').html('');
            $('#lblRenameInApporipateWarningMessage1').html('');
            $('#lblRenameGroupWarningMessage').text('');
            //$('#spinnerDeleteTag').removeClass('d-none');
            $.ajax({
                url: 'TagManagement.aspx/deleteTag?tgId=' + JSON.stringify($('#ContentPlaceHolder1_selectedTagId').val()),
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    //$('#spinnerDeleteTag').addClass('d-none');
                    if (data != null) {
                        if (!data.d.IsValid) {
                            //data.d.Message
                            $('#lblDeleteTagErrorMessage').text(data.d.Message)
                        }
                        else {
                            //lblSuccessMessage
                            //$('#lblDeleteGroupSuccessMessage').text(data.d.Message)
                            //window.location.reload();
                            $("#deleteTagModel").modal('hide');
                            $('#lblGroupSuccessMessage').text('Tag deleted successfully.');
                            $("#lblGroupSuccessMessage").show().delay(5000).fadeOut();
                            getAllUserWorkGroups();
                            //getAllPersonalTags();
                            //getWGMembersById(wgId);
                        }
                    }
                },
                error: function (jqXHR, status, error) {
                    //$('#spinnerDeleteTag').addClass('d-none');
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });
        }

        function btnDoneChange() {
            getAllUserWorkGroups();
            //getAllPersonalTags();
            $("#MembersModel").modal('hide');
        }
        function closeDeleteGroupModel() {
            $("#deleteModel").modal('hide');
        }
        function closeRenameGroupModel() {
            $("#renameModel").modal('hide');
        }
        function closeRenameTagModel() {
            $("#renameTagModel").modal('hide');
            $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', '#c4dcef');
        }
        function renameWorkGroup() {

            $('#InRenameApprWarning').hide();
            $('#lblRenameInApporipateWarningMessage').html('');
            $('#lblRenameInApporipateWarningMessage1').html('');
            $('#lblRenameGroupWarningMessage').text('');
            $('#lblRenameGroupErrorMessage').text('');

            //$('#spinnerRenameWorkGroup').removeClass('d-none');
            $.ajax({
                url: 'TagManagement.aspx/renameGroup?groupName=' + JSON.stringify($('#txtRenameGroupName').val()) + '&IsInAppropriateFlagged=' + JSON.stringify($('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val()) + '&WgId=' + JSON.stringify($('#ContentPlaceHolder1_hdnSelectedWGId').val()),
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    //$('#spinnerRenameWorkGroup').addClass('d-none');
                    if (data != null) {

                        if (data.d.IsAppropriate == true) {
                            $('#InRenameApprWarning').show();
                            var txtMsg = 'The word(s) "' + $('#txtRenameGroupName').val() + '" have been flagged as inappropriate. TRM Admins monitor all site activity.';
                            $('#lblRenameInApporipateWarningMessage').html(txtMsg);
                            var txtMsg1 = 'You may change the name or continue adding the group name if you received this message in error.';
                            $('#lblRenameInApporipateWarningMessage1').html(txtMsg1);
                            $('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val('True');
                            $('#lblRenameCreateGroupErrorMessage').text('Inappropriate word detected');
                        }
                        else if (!data.d.IsValid) {
                            //data.d.Message
                            $('#lblRenameGroupErrorMessage').text(data.d.Message)
                        }
                        else {
                            $("#renameModel").modal('hide');
                            $('#lblGroupSuccessMessage').text('Group renamed successfully.');
                            $("#lblGroupSuccessMessage").show().delay(5000).fadeOut();

                            getAllUserWorkGroups();
                            //getAllPersonalTags();
                            //lblSuccessMessage
                            //$('#lblRenameGroupSuccessMessage').text(data.d.Message)
                            //window.location.reload();
                            //getWGMembersById(wgId);
                        }
                    }

                },
                error: function (jqXHR, status, error) {
                    //$('#spinnerRenameWorkGroup').addClass('d-none');
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });
        }

        function deleteWorkGroup() {
            $('#InRenameApprWarning').hide();
            $('#lblRenameInApporipateWarningMessage').html('');
            $('#lblRenameInApporipateWarningMessage1').html('');
            $('#lblRenameGroupWarningMessage').text('');
            //$('#spinnerDeleteGroup').removeClass('d-none');

            $.ajax({
                url: 'TagManagement.aspx/deleteGroup?WgId=' + JSON.stringify($('#ContentPlaceHolder1_hdnSelectedWGId').val()),
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    //$('#spinnerDeleteGroup').addClass('d-none');

                    if (data != null) {
                        if (!data.d.IsValid) {
                            //data.d.Message
                            $('#lblDeleteGroupErrorMessage').text(data.d.Message)
                        }
                        else {
                            //lblSuccessMessage
                            //$('#lblDeleteGroupSuccessMessage').text(data.d.Message)
                            //window.location.reload();
                            $("#deleteModel").modal('hide');
                            $('#lblGroupSuccessMessage').text('Group deleted successfully.');
                            $("#lblGroupSuccessMessage").show().delay(5000).fadeOut();

                            getAllUserWorkGroups();
                            //getAllPersonalTags();
                            //getWGMembersById(wgId);
                        }
                    }
                },
                error: function (jqXHR, status, error) {
                    //$('#spinnerDeleteGroup').addClass('d-none');
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });
        }

        function renameGroup() {
            $('#txtRenameGroupName').val($('#ContentPlaceHolder1_hdnSelectedWGName').val());
            $('#renamecharcounter').text($('#txtRenameGroupName').val().length + '/30');
            $("#renameModel").modal('show');
            $('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val('False');
            $('.grouppop').slideFadeToggle();
            $('#lblRenameGroupErrorMessage').text('');
            $('#txtRenameGroupName').focus();
        }
        function deleteGroup() {
            $('#txtDeleteGroupName').val('');
            $('#spandeletetext').text('Group Name - ' + $('#ContentPlaceHolder1_hdnSelectedWGName').val())
            $('#deletegrouppopuptext').html('<p>Deleting the group named <b>' + $('#ContentPlaceHolder1_hdnSelectedWGName').val() + '</b> will remove the group from your view as well as all group members view. All <b>' + $('#ContentPlaceHolder1_hdnSelectedWGName').val() + '</b> tags will be removed from any TRM entry tagged with a <b>' + $('#ContentPlaceHolder1_hdnSelectedWGName').val() + '</b> tag.</p><p>Type the name "' + $('#ContentPlaceHolder1_hdnSelectedWGName').val() + '" below to confirm you want to delete the <b>' + $('#ContentPlaceHolder1_hdnSelectedWGName').val() + '</b> group and any associated group tags. </p>')
            /*$('#deletegrouppopuptext').text('Are you sure you want to delete "' + $('#ContentPlaceHolder1_hdnSelectedWGName').val() + '" group ?')*/
            $('#btnDeleteWorkGroup').removeClass('deleteenabledbutton').addClass('disabledbutton');
            $('#btnDeleteWorkGroup').attr('disabled', 'disabled');
            $("#deleteModel").modal('show');
            
            $('.grouppop').slideFadeToggle();

        }
        //function optoutGroup() {

        //    $("#optoutModel").modal('show');
        //    $('.grouppop').slideFadeToggle();
        //}
        function manageGroupMember() {
            $('.grouppop').slideFadeToggle();
        }


        function closeNewGroupModel() {
            $("#newGroupModel").modal('hide');
        }

        function closeMemberModel() {
            $("#MembersModel").modal('hide');
        }

        function validateGroupText() {

        }
        
        function OpenNewGroupDialog() {
            $('#lblCreateGroupErrorMessage').text('');
            $('#lblCreateGroupSuccessMessage').text('');
            $('#txtNewGroupName').val('');

            $('#btnCreateWorkGroup').attr('disabled', 'disabled');
            $('#btnCreateWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
            // $('#btnCreateWorkGroup').css('background-color', 'grey');
            $("#newGroupModel").modal('show');
            $('#InApprWarning').hide();
            $('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val('False');
            $('#lblInApporipateWarningMessage').html('');
            $('#lblInApporipateWarningMessage1').html('');
            $('#charcounter').text('0/30');
            return false;
        }

        function validateIsInAppropriateWord() {

        }

        function createNewGroup() {

            $('#InApprWarning').hide();
            $('#lblInApporipateWarningMessage').html('');
            $('#lblInApporipateWarningMessage1').html('');
            $('#lblCreateGroupWarningMessage').text('');
            //$('#spinnerCreateWorkGroup').removeClass('d-none');

            var enteredtext = $("#txtNewGroupName").val().trim();

            if (enteredtext.length > 0) {
                $.ajax({
                    url: 'TagManagement.aspx/createGroup?groupName=' + JSON.stringify($('#txtNewGroupName').val()) + '&IsInAppropriateFlagged=' + JSON.stringify($('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val()),
                    type: 'GET',
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function (data, status, jqXHR) {
                        //$('#spinnerCreateWorkGroup').addClass('d-none');
                        if (data != null) {

                            if (data.d.IsAppropriate == true) {
                                $('#InApprWarning').show();
                                var txtMsg = 'The word(s) "' + $('#txtNewGroupName').val() + '" have been flagged as inappropriate. TRM Admins monitor all site activity.';
                                $('#lblInApporipateWarningMessage').html(txtMsg);
                                var txtMsg1 = 'You may change the name or continue adding the group name if you received this message in error.';
                                $('#lblInApporipateWarningMessage1').html(txtMsg1);
                                $('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val('True');
                                $('#lblCreateGroupErrorMessage').text('Inappropriate word detected');
                            }
                            else if (!data.d.IsValid) {
                                //data.d.Message
                                $('#lblCreateGroupErrorMessage').text(data.d.Message)
                            }
                            else {
                                //lblSuccessMessage
                                //$('#lblCreateGroupSuccessMessage').text(data.d.Message)
                                //window.location.reload();
                                $('#lblGroupSuccessMessage').text('Group created successfully.');
                                $("#lblGroupSuccessMessage").show().delay(5000).fadeOut();
                                getAllUserWorkGroups();
                                //getAllPersonalTags();
                                closeNewGroupModel();
                                //getWGMembersById(wgId);
                            }
                        }

                    },
                    error: function (jqXHR, status, error) {
                        //$('#spinnerCreateWorkGroup').addClass('d-none');
                        //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                        //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                    }
                });
            }
            else {
                $('#lblCreateGroupErrorMessage').text("Name must include visible characters")
            }

        }

        function getAllPersonalTags() {

            $.ajax({
                url: 'TagManagement.aspx/getAllPersonalTags',
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    if (data != null) {
                        if (data.d.IsValid) {

                            var lstWgs = data.d.lstWgs;
                            var lstAllWgTags = data.d.lstAllWgTags;
                            var lstAllWgMembers = data.d.lstAllWgMembers;
                            //var lstAllWgMembers = JSON.parse($('#ContentPlaceHolder1_hdnlstAllWgMembers').val());
                            $('#dvWGPersonalTagsContainer').empty();
                            var userId = $('#ContentPlaceHolder1_hdnLoggedInUserId').val();

                            $('#ContentPlaceHolder1_hdnlstWgs').val('');
                            $('#ContentPlaceHolder1_hdnlstAllWgTags').val('');
                            $('#ContentPlaceHolder1_hdnlstAllWgMembers').val('');
                            var Counter = 0;
                            $.each(lstWgs, function (key, val) {

                                var wgId = val.WG_ID;
                                var divId = 'div' + Counter;
                                var groupId = 'Group' + wgId;
                                var u = lstAllWgMembers.find(m => m.WG_ID == wgId && m.UserId == $('#ContentPlaceHolder1_hdnLoggedInUserId').val());
                                var parentDiv = '<div class="col">';
                                var counter = 0;
                                $.each(lstAllWgTags, function (key, val) {
                                    var dbbuttonstemp = 'dvButtonsTag' + val.WG_ID;
                                    btnId = "perbtn" + val.TAG_ID;
                                    var dvId = "perdv" + val.TAG_ID;
                                    if (wgId == val.WG_ID) {
                                        var record = _.find(lstAllWgMembers, function (item) { return item.WG_ID === val.WG_ID });
                                        if (record != undefined) {
                                            parentDiv += '<div style="display:inline-block;padding:4px 4px 4px 4px;"><div Id=' + dvId + ' style="display:inline-block;background-color:#c4dcef;border-radius:2px;padding-bottom:1px;" ><div style="font-size:12px;display:inline-block;border-radius:6px;">'
                                            parentDiv += '&nbsp;<div perRoleId=' + u.Role + ' Id=' + btnId + ' wgId=' + val.WG_ID + ' tagId=' + val.TAG_ID + ' tagName="' + val.TAG_LABEL + '" class="pvttagellipsisbutton"  style="width:7px;display: inline-block;cursor:pointer;"><i class="fas fa-ellipsis-v tag" style="color: #757575;cursor:pointer;"></i></div>'
                                            parentDiv += '<div style="display: inline-block;padding-right:10px;font-size:11px;font-family: Roboto, sans-serif;font-weight:border-radius: 3px">&nbsp;&nbsp;&nbsp;' + val.TAG_LABEL + '</div></div></div></div>';

                                            counter++;
                                        }
                                    }
                                });
                               
                                
                                parentDiv += '</div>';
                                Counter++;
                              //  $('#dvWGPersonalTagsContainer').append(parentDiv);


                            });
                            Counter = 0;
                            if (Counter == 0) {
                                $('#dvWGPersonalTagsContainer').empty;
                                var parentDiv = '<div class="emptyPersonalTag">You have no personnal tag</div>';
                                $('#dvWGPersonalTagsContainer').append(parentDiv);
                            }
                            $('.membersbutton').each(function () {
                                document.querySelector('#' + $(this).attr('id')).addEventListener('click', createRippleDifColor);

                            });

                            $('.newtagbutton').each(function () {
                                document.querySelector('#' + $(this).attr('id')).addEventListener('click', createRippleDifColor);

                            });

                            $('.pvttagellipsisbutton').click(function () {
                                var btnid = $(this).attr('tagId');
                                $('#perdv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', '#c4dcef');

                                if ($('#dvTagPopup').is(':visible')) {
                                    $('#perdv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', '#c4dcef');
                                    $('#dvTagPopup').hide();
                                }
                                else {
                                    var tagId = $('#perbtn' + btnid).attr('tagId');
                                    var tagName = $('#perbtn' + btnid).attr('tagName');
                                    var wgId = $('#perbtn' + btnid).attr('wgId');
                                    var RoleId = $('#perbtn' + btnid).attr('perRoleId');
                                    
                                    $('#ContentPlaceHolder1_selectedTagId').val(tagId);
                                    $('#ContentPlaceHolder1_selectedTagName').val(tagName);
                                    $('#ContentPlaceHolder1_hdnSelectedWGId').val(wgId);

                                    $('#perdv' + tagId).css('background-color', 'lightgrey');

                                    if (RoleId != 1 && RoleId != 2) {
                                        $('#dvtagTRMEntry').hide();
                                        $('#dvRenameTag').hide();
                                        $('#dvDeleteTag').hide();
                                    }
                                    else {
                                        $('#dvtagTRMEntry').show();
                                        $('#dvRenameTag').show();
                                        $('#dvDeleteTag').show();
                                    }

                                    var btn1 = $(this);
                                    $('.tagpop').css('position', 'absolute');
                                    var top = btn1.offset().top + btn1.outerHeight();
                                    var left = btn1.offset().left - 4;

                                    console.log('left' + left);
                                    console.log('content' + $('#content-main').width());

                                    if (left > $('#content-main').width()) {
                                        var diff = (left - $('#content-main').width()) - 10;
                                        left = left - diff;
                                    }
                                    $('.tagpop').css('top', (top - 117));
                                    $('.tagpop').css('left', left);

                                    $('#dvTagPopup').show();
                                    

                                }


                            });


                        }
                        else {

                        }
                    }
                },
                error: function (jqXHR, status, error) {
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });
        }

        function getAllUserWorkGroups() {

            $.ajax({
                url: 'TagManagement.aspx/getAllUserWorkGroups',
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    if (data != null) {
                        if (data.d.IsValid) {

                            var lstWgs = data.d.lstWgs;
                            var lstAllWgTags = data.d.lstAllWgTags;
                            var lstAllWgMembers = data.d.lstAllWgMembers;
                            //var lstAllWgMembers = JSON.parse($('#ContentPlaceHolder1_hdnlstAllWgMembers').val());
                            $('#dvWGTagsContainer').empty();
                            var userId = $('#ContentPlaceHolder1_hdnLoggedInUserId').val();

                            $('#ContentPlaceHolder1_hdnlstWgs').val('');
                            $('#ContentPlaceHolder1_hdnlstAllWgTags').val('');
                            $('#ContentPlaceHolder1_hdnlstAllWgMembers').val('');
                            var Counter = 0;
                            $.each(lstWgs, function (key, val) {

                                var wgId = val.WG_ID;
                                var divId = 'div' + Counter;
                                var groupId = 'Group' + wgId;
                                var u = lstAllWgMembers.find(m => m.WG_ID == wgId && m.UserId == $('#ContentPlaceHolder1_hdnLoggedInUserId').val());
                                var parentDiv = '<div class="col " ><div class="card shadow">';
                                parentDiv += '<div class="card-body">';
                                parentDiv += '<div class="card-title"> ';
                                parentDiv += '<div class="row"><div class="col-sm-1" style="display:inline-block;vertical-align: middle;"> '
                                //if (u.Role == '1') {
                                parentDiv += '<div class="CustomButtons" RoleId=' + u.Role + ' Id=' + groupId + '  groupId="' + wgId + '" groupName="' + val.WG_LABEL + '" style="width:7px;display: inline-block;cursor:pointer;"><i class="fas fa-ellipsis-v grp" style="color: #757575;cursor:pointer;"></i></div>'
                                //}
                                parentDiv += '</div>';
                                parentDiv += '<div class="col-sm-8" style="padding-top:3px;display:inline-block;vertical-align: middle;font-family: Roboto, sans-serif;font-size:12px;color: #283154;font-weight:bold;padding-left:0px;white-space: pre-wrap;">' + val.WG_LABEL;

                                //parentDiv += '<p style="font-size:10px">Group Owner:</p></div></div><div class="col-sm-6">'
                                parentDiv += '</div><div class="col-sm-3">'
                                parentDiv += '<div style="text-align:right" class="card-toggle" data-toggle="collapse" data-target="#' + divId + '"> </div>'
                                //< i class="icons float-right fas fa-chevron-up" ></i >
                                parentDiv += '</div>';

                                var creatorlen = 0;
                                if (val.Creator != null) {
                                    creatorlen = val.Creator.length;
                                    parentDiv += '<div class="row"><div class="col-sm-1"></div><div class="col-sm-10" style="padding-left:5px;"><span style="font-family: Roboto, sans-serif;font-size:9px;color: #283154;font-weight:500;">Creator: ' + val.Creator.substring(0, 34) + '</span>'
                                }
                                else {
                                    parentDiv += '<div class="row"><div class="col-sm-1"></div><div class="col-sm-10" style="padding-left:5px;"><span style="font-family: Roboto, sans-serif;font-size:9px;color: #283154;font-weight:500;">Creator: ' + val.Creator + '</span>'

                                }
                                //parentDiv += '<div class="row"><div class="col-sm-1"></div><div class="col-sm-10" style="padding-left:5px;"><span style="font-family: Roboto, sans-serif;font-size:9px;color: #283154;font-weight:500;">Creator : ' + val.Creator.substring(0, 29) + '</span>'
                                if (creatorlen > 35) {
                                    parentDiv += '<span style="cursor: pointer;" title="' + val.Creator + '">... </span>';
                                }
                                parentDiv += '</div></div>'
                                parentDiv += '</div><hr></div>';

                                parentDiv += '<div class="card-text showdiv" id="' + divId + '"  >'
                                parentDiv += '<div class="row"><div class="col-sm-7"><span style="font-family: Roboto;font-size:10px;font-weight:bold">&nbsp;&nbsp;TAGS</span></div><div class="col-sm-5" style="padding-left:30px;">';


                                u1 = lstAllWgMembers.find(m => m.WG_ID == wgId && m.UserId == $('#ContentPlaceHolder1_hdnLoggedInUserId').val());
                                var btnId = 'btnaddNewWGTag' + wgId;
                                if (u1.Role == '1' || u1.Role == '2') {
                                    parentDiv += '<button id="' + btnId + '" OnClick="javascript:openWgTagModel(' + wgId + ');return false;" class="newtagbutton"><i class="fas fa-plus"></i> &nbsp;&nbsp;NEW TAG</button>';
                                }
                                parentDiv += '</div></div>'


                                var counter = 0;
                                parentDiv += '<div class="row" style="padding-top:5px;"><div class="col-sm-12">'
                                $.each(lstAllWgTags, function (key, val) {
                                    var dbbuttonstemp = 'dvButtonsTag' + val.WG_ID;
                                    btnId = "btn" + val.TAG_ID;
                                    var dvId = "dv" + val.TAG_ID;
                                    if (wgId == val.WG_ID) {
                                        var record = _.find(lstAllWgMembers, function (item) { return item.WG_ID === val.WG_ID });
                                        if (record != undefined) {
                                            parentDiv += '<div style="display:inline-block;padding:4px 4px 4px 4px;"><div Id=' + dvId + ' style="display:inline-block;background-color:#c4dcef;border-radius:2px;padding-bottom:1px;" ><div style="font-size:12px;display:inline-block;border-radius:6px;">'
                                            parentDiv += '&nbsp;<div RoleId=' + u.Role + ' Id=' + btnId + ' wgId=' + val.WG_ID + ' tagId=' + val.TAG_ID + ' tagName="' + val.TAG_LABEL + '" class="tagellipsisbutton"  style="width:7px;display: inline-block;cursor:pointer;"><i class="fas fa-ellipsis-v tag" style="color: #757575;cursor:pointer;"></i></div>'
                                            parentDiv += '<div style="display: inline-block;padding-right:10px;font-size:11px;font-family: Roboto, sans-serif;font-weight:border-radius: 3px">&nbsp;&nbsp;&nbsp;' + val.TAG_LABEL + '</div></div></div></div>';
                                            counter++;
                                        }
                                    }
                                });

                                parentDiv += '</div>';
                                parentDiv += '</div>';
                                parentDiv += '</div>';
                                parentDiv += '</div><span class="horizontallinecardbody" style="margin-left:10px;margin-right:10px;"></span>';
                                parentDiv += '<div class="card-body"><div class="row"> <div class="col-sm-7"></div><div class="col-sm-5" style="padding-right:0px;padding-left:30px">'
                                //u = lstAllWgMembers.find(m => m.WG_ID == wgId && m.UserId == $('#ContentPlaceHolder1_hdnLoggedInUserId').val());
                                var btnId = "btnMembers" + val.WG_ID;
                                if (u.Role == '1') {
                                    parentDiv += '<button id="' + btnId + '" OnClick="getWGMembersById(' + val.WG_ID + ');return false;" class="membersbutton" ><i class="fas fa-users"></i>&nbsp;&nbsp;MEMBERS</button>';
                                }
                                parentDiv += '</div> </div> </div></div>';
                                Counter++;
                                $('#dvWGTagsContainer').append(parentDiv);


                            });

                            $('.membersbutton').each(function () {
                                document.querySelector('#' + $(this).attr('id')).addEventListener('click', createRippleDifColor);

                            });

                            $('.newtagbutton').each(function () {
                                document.querySelector('#' + $(this).attr('id')).addEventListener('click', createRippleDifColor);

                            });

                            $('.CustomButtons').click(function () {
                                var btnid = $(this).attr('groupId');

                                if ($('#dvGroupPopup').is(':visible')) {
                                   
                                    $('#dvGroupPopup').hide();
                                }
                                else {
                                    var groupId = $('#Group' + btnid).attr('groupId');
                                    var groupName = $('#Group' + btnid).attr('groupName');
                                    var RoleId = $('#Group' + btnid).attr('RoleId');

                                    $('#ContentPlaceHolder1_hdnSelectedWGId').val(groupId);
                                    $('#ContentPlaceHolder1_hdnSelectedWGName').val(groupName);
                                    if (RoleId != 1) {
                                        $('#dvRenameGroup').hide();
                                        $('#dvDeleteGroup').hide();
                                    }
                                    else {
                                        $('#dvRenameGroup').show();
                                        $('#dvDeleteGroup').show();
                                    }
                                    var btn1 = $(this);
                                    $('.grouppop').css('position', 'absolute');
                                    var top = btn1.offset().top + btn1.outerHeight();
                                    var left = btn1.offset().left;
                                    $('.grouppop').css('top', (top - 100));
                                    $('.grouppop').css('left', left);

                                    $('#dvGroupPopup').show();
                                }
                            });



                            $('.tagellipsisbutton').click(function () {
                                var btnid = $(this).attr('tagId');
                                $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', '#c4dcef');

                                if ($('#dvTagPopup').is(':visible')) {
                                    $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', '#c4dcef');
                                    $('#dvTagPopup').hide();
                                }
                                else {
                                    var tagId = $('#btn' + btnid).attr('tagId');
                                    var tagName = $('#btn' + btnid).attr('tagName');
                                    var wgId = $('#btn' + btnid).attr('wgId');
                                    var RoleId = $('#btn' + btnid).attr('RoleId');

                                    $('#ContentPlaceHolder1_selectedTagId').val(tagId);
                                    $('#ContentPlaceHolder1_selectedTagName').val(tagName);
                                    $('#ContentPlaceHolder1_hdnSelectedWGId').val(wgId);
                                    $('#dv' + tagId).css('background-color', 'lightgrey');
                                   
                                    $('#ContentPlaceHolder1_hdnSelectedWGName').val($('#Group' + wgId).attr('groupname'));
                                    if (RoleId != 1 && RoleId != 2) {
                                        $('#dvtagTRMEntry').hide();
                                        $('#dvRenameTag').hide();
                                        $('#dvDeleteTag').hide();
                                    }
                                    else {
                                        $('#dvtagTRMEntry').show();
                                        $('#dvRenameTag').show();
                                        $('#dvDeleteTag').show();
                                    }

                                    var btn1 = $(this);
                                    $('.tagpop').css('position', 'absolute');
                                    var top = btn1.offset().top + btn1.outerHeight();
                                    var left = btn1.offset().left - 4;

                                    console.log('left' + left);
                                    console.log('content' + $('#content-main').width());

                                    if (left > $('#content-main').width()) {
                                        var diff = (left - $('#content-main').width()) - 10;
                                        left = left - diff;
                                    }
                                    $('.tagpop').css('top', (top - 116));
                                    $('.tagpop').css('left', left);

                                    $('#dvTagPopup').show();

                                }


                            });


                        }
                        else {

                        }
                    }
                },
                error: function (jqXHR, status, error) {
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });
        }

        $(document).ready(function () {

            document.querySelector("#btnAddMember").addEventListener('click', createRipple);
            document.querySelector("#btnValidate").addEventListener('click', createRipple);
            //document.querySelector("#btnaddNewWGTag").addEventListener('click', createRipple);
            //document.querySelector("#btnMembers").addEventListener('click', createRipple);
            document.querySelector("#btnDone").addEventListener('click', createRippleDifColor);
            document.querySelector("#btnnewgroup").addEventListener('click', createRipple);
            document.querySelector("#btnnewpersonaltag").addEventListener('click', createRipple);            
            document.querySelector("#btnCreateWorkGroup").addEventListener('click', createRipple);
            document.querySelector("#btncancelcreategroup").addEventListener('click', createRipple);
            document.querySelector("#btnCreateWgTag").addEventListener('click', createRipple);
            document.querySelector("#btncancelcreatetag").addEventListener('click', createRipple);
            document.querySelector("#btnRenameWorkGroup").addEventListener('click', createRipple);
            document.querySelector("#btncancelrenamegroup").addEventListener('click', createRipple);
            document.querySelector("#btncancelrenametag").addEventListener('click', createRipple);
            document.querySelector("#btnRenameTag").addEventListener('click', createRipple);
            document.querySelector("#btncanceldeletegroup").addEventListener('click', createRipple);
            document.querySelector("#btnDeleteWorkGroup").addEventListener('click', createRipple);
            document.querySelector("#btncanceldeletetag").addEventListener('click', createRipple);
            document.querySelector("#btnDeleteTag").addEventListener('click', createRipple);
            document.querySelector("#btncancelapplytag").addEventListener('click', createRipple);
            document.querySelector("#btnApplyTag").addEventListener('click', createRipple);
            document.querySelector("#btncanceloptout").addEventListener('click', createRipple);
            document.querySelector("#btnoptout").addEventListener('click', createRipple);
            document.querySelector("#btnOkTaggedEntires").addEventListener('click', createRipple);






            $(".grpellipsemenu").mouseover(function () {
                $(this).css("background-color", "lightgrey");
            });
            $(".grpellipsemenu").mouseout(function () {
                $(this).css("background-color", "white");
            });

            $('#siteHeader1').attr('height', '70');
            $('#siteHeader2').attr('height', '30');

            $("#dvTagGroups").on("click", function (e) {

                console.log(e.target.className);
                if (e.target.className != undefined) {

                    if (e.target.className != 'fas fa-ellipsis-v grp') {
                        if ($('#dvGroupPopup').is(':visible')) {
                            $('#dvGroupPopup').hide();
                        }

                    }
                    if (e.target.className != 'fas fa-ellipsis-v tag') {
                        if ($('#dvTagPopup').is(':visible')) {
                            $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', '#c4dcef');
                            ;
                            $('#dvTagPopup').hide();
                        }
                    }
                }

            });

            // var lstAllInAppropriateWords = JSON.parse($('#ContentPlaceHolder1_hdnInApprWords').val());

            localStorage.removeItem('INAPPROWORDS');
            localStorage.setItem('INAPPROWORDS', $('#ContentPlaceHolder1_hdnInApprWords').val());

            //autocomplete(document.getElementById("ContentPlaceHolder1_txtToolEntryName"), lstEntries);

            $('#ContentPlaceHolder1_hdnInApprWords').val('');
            getAllPersonalTags();
            getAllUserWorkGroups();
            
            // autocomplete(document.getElementById("myInput"), countries);
            var lstEntries = JSON.parse($('#ContentPlaceHolder1_hdnToolEntries').val());
            var lstusertags = JSON.parse($('#ContentPlaceHolder1_hdnUserTags').val());

            $('#ContentPlaceHolder1_hdnToolEntries').val('');
            $('#ContentPlaceHolder1_hdnUserTags').val('');




            //refreshTags();

        });

        function openWgTagModel(wgId) {
            $('#ContentPlaceHolder1_hdnSelectedWGId').val(wgId);
            $('#txtNewWgTagName').val('');
            $('#lblInApporipateWgTagWarningMessage').html('');
            $('#lblInApporipateWgTagWarningMessage1').html('');
            $('#lblCreateWgTagErrorMessage').text('');
            $('#lblCreateWgTagSuccessMessage').text('');
            $('#lblCreateWgTagWarningMessage').text('');
            $('#InApprWgTagWarning').hide();
            $('#btnCreateWgTag').attr('disabled', 'disabled');
            $('#btnCreateWgTag').removeClass('enabledbutton').addClass('disabledbutton');
            // $('#btnCreateWgTag').css('background-color', 'grey');
            $('#charWgTagcounter').text('0/30');

            $('#lblCreateWgTagWarningMessage').text('');
            $('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val('False');
            $('#newWGTagModel').modal('show');
        }
        function closeNewWGTagModel() {
            $('#newWGTagModel').modal('hide');
        }
        function createWgTag() {
            $('#InApprWgTagWarning').hide();
            $('#lblInApporipateWgTagWarningMessage').html('');
            $('#lblInApporipateWgTagWarningMessage1').html('');
            //$('#lblCreateGroupWgTagWarningMessage').text('');
            $('#lblCreateWgTagWarningMessage').text('');
            var charlength = $('#txtNewWgTagName').val().trim().length;
            //$('#spinnerCreateTag').removeClass('d-none');
            if (charlength > 0) {
                $.ajax({
                    url: 'TagManagement.aspx/createWgTag?tagName=' + JSON.stringify($('#txtNewWgTagName').val()) + '&WgId=' + $('#ContentPlaceHolder1_hdnSelectedWGId').val() + '&IsInAppropriateFlagged=' + JSON.stringify($('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val()),
                    type: 'GET',
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function (data, status, jqXHR) {
                        //$('#spinnerCreateTag').addClass('d-none');
                        if (data != null) {

                            if (data.d.IsAppropriate == true) {
                                $('#InApprWgTagWarning').show();
                                var txtMsg = 'The word(s) "' + $('#txtNewWgTagName').val() + '" have been flagged as inappropriate. TRM Admins monitor all site activity.';
                                $('#lblInApporipateWgTagWarningMessage').html(txtMsg);
                                var txtMsg1 = 'You may change the name or continue adding the group name if you received this message in error.';
                                $('#lblInApporipateWgTagWarningMessage1').html(txtMsg1);
                                $('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val('True');
                                $('#lblCreateWgTagErrorMessage').text('Inappropriate word detected');
                            }
                            else if (!data.d.IsValid) {
                                //data.d.Message
                                $('#lblCreateWgTagErrorMessage').text(data.d.Message)
                            }
                            else {
                                //lblSuccessMessage
                                //$('#lblCreateGroupSuccessMessage').text(data.d.Message)
                                //window.location.reload();
                                $('#lblGroupSuccessMessage').text('Tag created successfully.');
                                $("#lblGroupSuccessMessage").show().delay(5000).fadeOut();

                                getAllUserWorkGroups();
                               // getAllPersonalTags();
                                closeNewWGTagModel();
                                //getWGMembersById(wgId);
                            }
                        }

                    },
                    error: function (jqXHR, status, error) {
                        //$('#spinnerCreateTag').addClass('d-none');
                        //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                        //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                    }
                });
            }
            else {
                $('#lblCreateWgTagErrorMessage').text('Name must include visible characters');
            }

        }

        function getWGMembersById(wgId) {

            $('#ContentPlaceHolder1_hdnSelectedWGId').val(wgId);
            $('#spanselectedGroupName').text($('#Group' + wgId).attr('GroupName'));
            $('#lblErrorMessage').text('');
            $('#lblSuccessMessage').text('');
            $('#DisplayEmailText').text('');

            $('#lblErrorMessage').hide();
            $('#lblSuccessMessage').hide();
            $('#DisplayEmailText').hide();

            $('#txtMemberName').val('');
            refreshWorkGroupMembers(wgId);

            return false;
        }

        function validateUser() {

            $('#spinnerValidateUser').removeClass('d-none');


            var wgId = $('#ContentPlaceHolder1_hdnSelectedWGId').val();
            var email = $('#txtMemberName').val();
            $('#lblErrorMessage').text('');
            $('#lblSuccessMessage').text('');
            $('#DisplayEmailText').text('');
            $('#lblErrorMessage').hide();
            $('#lblSuccessMessage').hide();
            $('#DisplayEmailText').hide();
            $.ajax({
                url: 'TagManagement.aspx/validateUser?&email=' + JSON.stringify(email),
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {

                    $('#spinnerValidateUser').addClass('d-none')
                    if (data != null) {
                        if (!data.d.IsValid) {
                            //data.d.Message
                            $('#lblErrorMessage').text(data.d.Message);
                            $('#lblErrorMessage').show();
                            $('#lblSuccessMessage').hide();
                            $('#DisplayEmailText').hide();
                            //$('#lblErrorMessage').show("slow").delay(5000).hide("slow");
                        }
                        else {
                            $('#DisplayEmailText').html(data.d.DisplayEmailText);

                            $('#lblErrorMessage').hide();
                            $('#lblSuccessMessage').hide();
                            $('#DisplayEmailText').show();
                        }
                    }

                },
                error: function (jqXHR, status, error) {
                    $('#spinnerValidateUser').addClass('d-none')
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });
            return false;
        }

        function roleChange(wgMemberId) {
            var id = 'ddlRole' + wgMemberId;
            var selectedRole = $('select#' + id + ' option:selected').val();

            //var wgId = $('#ContentPlaceHolder1_hdnSelectedWGId').val();
            //var email = $('#txtMemberName').val();
            $('#lblErrorMessage').text('');
            $('#lblSuccessMessage').text('');
            $('#DisplayEmailText').text('');
            $('#lblErrorMessage').hide();
            $('#lblSuccessMessage').hide();
            $('#DisplayEmailText').hide();
            $.ajax({
                url: 'TagManagement.aspx/UpdateRoleChange?&wgMemberId=' + JSON.stringify(wgMemberId) + '&roleId=' + selectedRole,
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    if (data != null) {
                        if (!data.d.IsValid) {
                            //data.d.Message
                            $('#lblErrorMessage').text(data.d.Message);
                            $('#lblErrorMessage').show();
                            $('#lblSuccessMessage').hide();
                            $('#DisplayEmailText').hide();
                            //$('#lblErrorMessage').show("slow").delay(5000).hide("slow");
                            refreshWorkGroupMembers($('#ContentPlaceHolder1_hdnSelectedWGId').val());
                        }
                        else {
                            $('#lblSuccessMessage').text(data.d.Message)
                            $('#lblErrorMessage').hide();
                            $('#lblSuccessMessage').show();
                            $('#DisplayEmailText').hide();
                            refreshWorkGroupMembers($('#ContentPlaceHolder1_hdnSelectedWGId').val());
                        }
                    }

                },
                error: function (jqXHR, status, error) {
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });

            return false;

        }
        function refreshWorkGroupMembers(wgId) {
            $.ajax({
                url: 'TagManagement.aspx/getMemberList?WgId=' + wgId,
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                // data: JSON.stringify(requestObj),
                success: function (data, status, jqXHR) {
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);

                    var results = data;
                    results = results.d ? results.d : results;
                    // if (results.failedLockItems && results.failedLockItems.length) {
                    var tblmember = '<table style="width:100%;font-family: Roboto; font-size: 12px;"><thead><tr> <td  class="memberHeaderStyle" style="padding-bottom:10px;width:40%">NAME</td>  <td  class="memberHeaderStyle" style="padding-bottom:10px;width:30%">EMAIL</td> <td  class="memberHeaderStyle" style="padding-bottom:10px;width:26%">ROLE</td> <td style="padding-bottom:10px;width:4%"  class="memberHeaderStyle"></td> </tr><tr style="border-bottom-width: thin;border-color:lightgrey;"></thead > ';
                    var selectId = '';
                    for (var i = 0; i < results.length; i++) {

                        var rec = results[i];
                        selectId = "ddlRole" + rec.TAG_MEMBER_ID;
                        tblmember += '<tr style="border-bottom-width: thin;border-color:lightgrey;">';
                        tblmember += '<td class="" style="font-family: Roboto;font-size:12px;width:40%;font-color:grey;">' + rec.FullName + '</td>';
                        tblmember += '<td class="" style="font-family: Roboto;font-size:12px;width:30%;font-color:grey;">' + rec.Email + '</td>';
                        tblmember += '<td class="" style="font-family: Roboto;font-size:12px;width:26%;font-color:grey;"><select style="width:80%;font-family: Roboto;font-size:12px;border-bottom-width:3px;border-bottom-color:darkgrey;" onchange="javascript:roleChange(' + rec.TAG_MEMBER_ID + ')" class="form-select form-select roleoption" id="' + selectId + '">';
                        if (rec.Role == 1) { tblmember += '<option value ="1" selected >Owner</option >' } else { tblmember += '<option value ="1">Owner</option >' };
                        if (rec.Role == 2) { tblmember += '<option value ="2" selected >Tag Manager</option >' } else { tblmember += '<option value ="2">Tag Manager</option >' };
                        if (rec.Role == 3) { tblmember += '<option value ="3" selected >Viewer</option >' } else { tblmember += '<option value ="3">Viewer</option >' };
                        tblmember += '</select>'
                        tblmember += '<td class="" style="font-family: Roboto;font-size:12px;width:4%"><button style="border-width:0px;background-color:white;" onClick="javascript:deleteTagMember(' + rec.TAG_MEMBER_ID + ',' + wgId + ');return false;" id="LockButton" class="fas fa-trash"> </button></td>';
                        tblmember += '</tr>'


                    }
                    //New Tag - Owner and Contributor
                    //Member - Owner
                    tblmember += '</table>';
                    $('#dvMembersList').empty();
                    $('#dvMembersList').append(tblmember);
                    $("#MembersModel").modal('show');
                    $('#MembersModel .modal-dialog').css('right', '250px')
                    $('.roleoption').click(function () {
                        $('#lblErrorMessage').val('');
                        $('#lblSuccessMessage').val('');
                        $('#DisplayEmailText').val('');
                        $('#lblErrorMessage').hide();
                        $('#lblSuccessMessage').hide();
                        $('#DisplayEmailText').hide();
                    });
                },
                error: function (jqXHR, status, error) {
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });
        }
        function deleteTagMember(WgMemberId, wgId) {
            $('#lblErrorMessage').text('');
            $('#lblSuccessMessage').text('');
            $('#DisplayEmailText').text('');
            $('#lblErrorMessage').hide();
            $('#lblSuccessMessage').hide();
            $('#DisplayEmailText').hide();
            $.ajax({
                url: 'TagManagement.aspx/deleteMember?WgMemberId=' + WgMemberId,
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {

                    if (data != null) {
                        if (!data.d.IsValid) {
                            //data.d.Message
                            $('#lblErrorMessage').text(data.d.Message);
                            $('#lblErrorMessage').show();
                            $('#lblSuccessMessage').hide();
                            $('#DisplayEmailText').hide();
                            //$('#lblErrorMessage').show("slow").delay(5000).hide("slow");
                        }
                        else {
                            if (data.d.IsPageRefresh) {
                                $("#MembersModel").modal('hide');
                                getAllUserWorkGroups();
                               // getAllPersonalTags();
                            }
                            else {
                                $('#lblSuccessMessage').text(data.d.Message)
                                $('#lblErrorMessage').hide();
                                $('#lblSuccessMessage').show();
                                $('#DisplayEmailText').hide();
                                getWGMembersById(wgId);
                            }

                        }
                    }

                },
                error: function (jqXHR, status, error) {
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });

        }

        function addMember() {
            var wgId = $('#ContentPlaceHolder1_hdnSelectedWGId').val();
            var email = $('#txtMemberName').val();
            $('#lblErrorMessage').text('');
            $('#lblSuccessMessage').text('');
            $('#DisplayEmailText').text('');
            $('#lblErrorMessage').hide();
            $('#lblSuccessMessage').hide();
            $('#DisplayEmailText').hide();
            $('#spinnerValidateUser').removeClass('d-none');
            $.ajax({
                url: 'TagManagement.aspx/addNewMember?wgId=' + JSON.stringify(wgId) + "&email=" + JSON.stringify(email),
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    $('#spinnerValidateUser').addClass('d-none');
                    if (data != null) {
                        if (!data.d.IsValid) {
                            //data.d.Message
                            $('#lblErrorMessage').text(data.d.Message);
                            $('#lblErrorMessage').show();
                            $('#lblSuccessMessage').hide();
                            $('#DisplayEmailText').hide();
                            //  $('#lblErrorMessage').show("slow").delay(5000).hide("slow");
                        }
                        else {
                            getWGMembersById(wgId);
                        }
                    }

                },
                error: function (jqXHR, status, error) {
                    $('#spinnerValidateUser').addClass('d-none');
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });
            return false;
        }

        $.fn.slideFadeToggle = function (easing, callback) {
            return this.animate({ opacity: 'toggle', height: 'toggle' }, 'fast', easing, callback);
        };

        //function groupellipsisclick(e) {

        //    $('.grouppop').css('top', pageYOffset);
        //    $('.grouppop').css('left', pageY);
        //    $('.grouppop').slideFadeToggle();
        //}
        function groupPopUp(btnid, pageX, pageY) {

            var groupId = $('#Group' + btnid).attr('groupId');
            var groupName = $('#Group' + btnid).attr('groupName');
            var RoleId = $('#Group' + btnid).attr('RoleId');
            //var top = $('#Group' + btnid).position().top;
            //var left = $('#Group' + btnid).position().left;
            $('#ContentPlaceHolder1_hdnSelectedWGId').val(groupId);
            $('#ContentPlaceHolder1_hdnSelectedWGName').val(groupName);
            if (RoleId != 1) {
                $('#dvRenameGroup').hide();
                $('#dvDeleteGroup').hide();
            }
            else {
                $('#dvRenameGroup').show();
                $('#dvDeleteGroup').show();
            }

            $('.grouppop').css('top', (pageY - 100));
            $('.grouppop').css('left', (pageX + 5));
            $('.grouppop').slideFadeToggle();
            //e.preventDefault();
        }

        function tagPopUp(btnid, pageX, pageY) {

            $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', '#c4dcef');
            var tagId = $('#btn' + btnid).attr('tagId');
            var tagName = $('#btn' + btnid).attr('tagName');
            var wgId = $('#btn' + btnid).attr('wgId');
            var RoleId = $('#btn' + btnid).attr('RoleId');
            //var top = $('#Group' + btnid).position().top;
            //var left = $('#Group' + btnid).position().left;
            $('#ContentPlaceHolder1_selectedTagId').val(tagId);
            $('#ContentPlaceHolder1_selectedTagName').val(tagName);
            $('#ContentPlaceHolder1_hdnSelectedWGId').val(wgId);

            $('#dv' + tagId).css('background-color', 'lightgrey');

            $('#ContentPlaceHolder1_hdnSelectedWGName').val($('#Group' + wgId).attr('groupname'));
            if (RoleId != 1 && RoleId != 2) {
                $('#dvtagTRMEntry').hide();
                $('#dvRenameTag').hide();
                $('#dvDeleteTag').hide();
            }
            else {
                $('#dvtagTRMEntry').show();
                $('#dvRenameTag').show();
                $('#dvDeleteTag').show();
            }

            $('.tagpop').css('top', (pageY - 100));
            var left = pageX - 8;
            if (left > $('#content-main').width()) {
                var diff = (left - $('#content-main').width()) - 10;
                left = left - diff;
            }
            $('.tagpop').css('left', (left));

            if ($('#dvTagPopup').is(':visible')) {
                $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', '#c4dcef');
                $('#dvTagPopup').hide();
            }
            else
                $('.tagpop').slideFadeToggle();

            //e.preventDefault();
        }

        $(document).ready(function () {

            $('.list-group > a').click(function (e) {
                // find/remove all active classes from each a
                $('.list-group > a').removeClass('active');

                // add active selected a
                $(this).addClass('active');
            });

            $("#txtDeleteGroupName").on('keydown keyup change', function (e) {

                var _value = $(this).val();
                var selectedGroupName = $('#ContentPlaceHolder1_hdnSelectedWGName').val();
                if (_value == selectedGroupName) {
                    $('#btnDeleteWorkGroup').removeAttr('disabled');
                    $('#btnDeleteWorkGroup').removeClass('disabledbutton').addClass('deleteenabledbutton');
                }
                else {
                    $('#btnDeleteWorkGroup').attr('disabled', 'disabled');
                    $('#btnDeleteWorkGroup').removeClass('deleteenabledbutton').addClass('disabledbutton');
                }



            });

            $('#txtDeleteGroupName').keypress(function (event) {

                if ((event.keyCode || event.which) == 13) {

                    event.preventDefault();
                    return false;

                }

            });
            $("#txtNewWgTagName").on('keydown keyup change', function (e) {
                $('#lblErrorMessage').text('');
                if ((e.keyCode || e.which) == 13) {

                    e.preventDefault();
                    return false;

                }
            });

            $('#txtMemberName').keypress(function (event) {
                $('#lblErrorMessage').text('');
                if ((event.keyCode || event.which) == 13) {

                    event.preventDefault();
                    return false;

                }

            });

            $("#txtMemberName").click(function () {
                $('#lblErrorMessage').text('');
                $('#lblSuccessMessage').text('');
                $('#DisplayEmailText').text('');
            });



            $('#txtToolEntry').keypress(function (event) {

                if ((event.keyCode || event.which) == 13) {

                    event.preventDefault();
                    return false;

                }

            });

            $("#txtDeleteTagName").on('keydown keyup change', function (e) {

                var _value = $(this).val();
                var selectedGroupName = $('#ContentPlaceHolder1_selectedTagName').val();
                if (_value == selectedGroupName) {
                    $('#btnDeleteTag').removeAttr('disabled');
                    $('#btnDeleteTag').removeClass('disabledbutton').addClass('enabledbutton');
                }
                else {
                    $('#btnDeleteTag').attr('disabled', 'disabled');
                    $('#btnDeleteTag').removeClass('enabledbutton').addClass('disabledbutton');
                }


            });




            $("#txtNewGroupName").on('keydown keyup change', function (e) {
                var k = e.keyCode || e.which;
                $('#lblCreateGroupErrorMessage').text('');
                $('#lblCreateGroupWarningMessage').text('');
                var maxLength = 30;
                var charLength = $(this).val().length;
                var trimLength = $(this).val().trim().length

                if (charLength > 0 && trimLength == 0) {
                    $('#btnCreateWorkGroup').attr('disabled', 'disabled');
                    $('#btnCreateWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
                    $('#lblCreateGroupErrorMessage').text('Name must include visible characters');
                    return;
                }
                else if (charLength == 0) {
                    $('#btnCreateWorkGroup').attr('disabled', 'disabled');
                    $('#btnCreateWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
                }
                else {
                    $('#btnCreateWorkGroup').removeAttr('disabled');
                    $('#btnCreateWorkGroup').removeClass('disabledbutton').addClass('enabledbutton');
                }

                var enteredtext = $("#txtNewGroupName").val();
                var regex = /^[ A-Za-z0-9_()-]*$/
                if (charLength > 0 && regex.test(enteredtext) == false) {
                    $('#lblCreateGroupErrorMessage').text('Valid characters are alphanumeric and _-()');
                    $('#btnCreateWorkGroup').attr('disabled', 'disabled');
                    $('#btnCreateWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
                }

                else {
                    $('#lblCreateGroupErrorMessage').text('');
                    $('#btnCreateWorkGroup').removeAttr('disabled');
                    $('#btnCreateWorkGroup').removeClass('disabledbutton').addClass('enabledbutton');
                }


                var splittext = enteredtext.split(' ');
                var InApprWords = localStorage.getItem('INAPPROWORDS');
                var test = JSON.parse(InApprWords)
                var isapprworddetected = false;
                for (var i = 0; i <= splittext.length; i++) {
                    //InApprWords.find()

                    var tempstring = splittext[i];
                    if (tempstring != '' && tempstring != undefined) {

                        var s = test.find((s) => s.TEXT.toLowerCase() === tempstring.toString().toLocaleLowerCase());
                        if (s != undefined) {
                            isapprworddetected = true;
                        }
                    }

                }
                if (isapprworddetected) {
                    $('#lblCreateGroupWarningMessage').text('Inapproprite word detected');
                }

                $('#charcounter').text($(this).val().length + '/' + maxLength);
                if (k != 8 && k != 46) {

                    if (charLength < maxLength) {


                        var ok = k >= 65 && k <= 90 || // A-Z
                            k >= 96 && k <= 105 || // a-z
                            k >= 35 && k <= 40 || // arrows
                            k == 9 || //tab
                            k == 46 || //del
                            k == 8 || // backspaces
                            k == 32 || // space
                            k == 16 || // 
                            k == 57 || // (
                            k == 48 || // )
                            k == 189 || // -
                            (!e.shiftKey && k >= 48 && k <= 57); // only 0-9 (ignore SHIFT options)
                        //if (k == 32) {
                        //    //Validate Inappropirate Word
                        //}
                        if (!ok || (e.ctrlKey && e.altKey)) {
                            // e.preventDefault();
                            // $('#lblCreateGroupErrorMessage').text('Valid characters are alphanumeric and _-()');
                        }

                    }
                    else
                        e.preventDefault();
                }
                else {
                    $('#charcounter').text($(this).val().length + '/' + maxLength);
                }
            });

            $("#txtRenameGroupName").on('keydown keyup change', function (e) {
                var k = e.keyCode || e.which;
                $('#lblRenameGroupErrorMessage').text('');
                $('#lblRenameGroupWarningMessage').text('');
                var maxLength = 30;
                var charLength = $(this).val().length;

                if (charLength == 0) {
                    $('#btnRenameWorkGroup').attr('disabled', 'disabled');
                    $('#btnRenameWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
                }
                else {
                    $('#btnRenameWorkGroup').removeAttr('disabled');
                    $('#btnRenameWorkGroup').removeClass('disabledbutton').addClass('enabledbutton');
                }


                var enteredtext = $("#txtRenameGroupName").val();

                var regex = /^[ A-Za-z0-9_()-]*$/
                if (charLength > 0 && regex.test(enteredtext) == false) {
                    $('#lblRenameGroupErrorMessage').text('Valid characters are alphanumeric and _-()');
                    $('#btnRenameWorkGroup').attr('disabled', 'disabled');
                    $('#btnRenameWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
                }
                else {
                    $('#lblRenameGroupErrorMessage').text('');
                    $('#btnRenameWorkGroup').removeAttr('disabled');
                    $('#btnRenameWorkGroup').removeClass('disabledbutton').addClass('enabledbutton');
                }


                var splittext = enteredtext.split(' ');
                var InApprWords = localStorage.getItem('INAPPROWORDS');
                var test = JSON.parse(InApprWords)
                var isapprworddetected = false;
                for (var i = 0; i <= splittext.length; i++) {
                    //InApprWords.find()
                    var tempstring = splittext[i];
                    if (tempstring != '' && tempstring != undefined) {
                        var s = test.find((s) => s.TEXT.toLowerCase() === tempstring.toString().toLocaleLowerCase());
                        if (s != undefined) {
                            isapprworddetected = true;
                        }
                    }
                }
                if (isapprworddetected) {
                    $('#lblRenameGroupWarningMessage').text('Inapproprite word detected');
                }

                $('#renamecharcounter').text($(this).val().length + '/' + maxLength)
                if (k != 8 && k != 46) {
                    if (charLength < maxLength) {


                        var ok = k >= 65 && k <= 90 || // A-Z
                            k >= 96 && k <= 105 || // a-z
                            k >= 35 && k <= 40 || // arrows
                            k == 9 || //tab
                            k == 46 || //del
                            k == 8 || // backspaces
                            k == 32 || // space
                            k == 16 || // 
                            k == 57 || // (
                            k == 48 || // )
                            k == 189 || // -
                            (!e.shiftKey && k >= 48 && k <= 57); // only 0-9 (ignore SHIFT options)
                        //if (k == 32) {
                        //    //Validate Inappropirate Word
                        //}
                        if (!ok || (e.ctrlKey && e.altKey)) {
                            // e.preventDefault();
                            //  $('#lblRenameGroupErrorMessage').text('Valid characters are alphanumeric and _-()');
                        }

                    }
                    else
                        e.preventDefault();
                }
                else {
                    $('#renamecharcounter').text($(this).val().length + '/' + maxLength)
                }

            });

            $("#txtRenameTagName").on('keydown keyup change', function (e) {
                var k = e.keyCode || e.which;
                $('#lblRenameTagErrorMessage').text('');
                $('#lblRenameTagWarningMessage').text('');
                var maxLength = 30;
                var charLength = $(this).val().length;

                if (charLength == 0) {
                    $('#btnRenameTag').attr('disabled', 'disabled');
                    $('#btnRenameTag').removeClass('enabledbutton').addClass('disabledbutton');
                }
                else {
                    $('#btnRenameTag').removeAttr('disabled');
                    $('#btnRenameTag').removeClass('disabledbutton').addClass('enabledbutton');
                }


                var enteredtext = $("#txtRenameTagName").val();
                var regex = /^[ A-Za-z0-9_()-]*$/
                if (charLength > 0 && regex.test(enteredtext) == false) {
                    $('#lblRenameTagErrorMessage').text('Valid characters are alphanumeric and _-()');
                    $('#btnRenameTag').attr('disabled', 'disabled');
                    $('#btnRenameTag').removeClass('enabledbutton').addClass('disabledbutton');
                }
                else {
                    $('#lblRenameTagErrorMessage').text('');
                    $('#btnRenameTag').removeAttr('disabled');
                    $('#btnRenameTag').removeClass('disabledbutton').addClass('enabledbutton');
                }
                var splittext = enteredtext.split(' ');
                var InApprWords = localStorage.getItem('INAPPROWORDS');
                var test = JSON.parse(InApprWords)
                var isapprworddetected = false;
                for (var i = 0; i <= splittext.length; i++) {
                    //InApprWords.find()

                    var tempstring = splittext[i];
                    if (tempstring != '' && tempstring != undefined) {
                        var s = test.find((s) => s.TEXT.toLowerCase() === tempstring.toString().toLocaleLowerCase());
                        if (s != undefined) {
                            isapprworddetected = true;
                        }
                    }


                }
                if (isapprworddetected) {
                    $('#lblRenameTagWarningMessage').text('Inapproprite word detected');
                }
                $('#renameTagcharcounter').text($(this).val().length + '/' + maxLength)
                if (k != 8 && k != 46) {
                    if (charLength < maxLength) {


                        var ok = k >= 65 && k <= 90 || // A-Z
                            k >= 96 && k <= 105 || // a-z
                            k >= 35 && k <= 40 || // arrows
                            k == 9 || //tab
                            k == 46 || //del
                            k == 8 || // backspaces
                            k == 32 || // space
                            k == 16 || // 
                            k == 57 || // (
                            k == 48 || // )
                            k == 189 || // -
                            (!e.shiftKey && k >= 48 && k <= 57); // only 0-9 (ignore SHIFT options)
                        //if (k == 32) {
                        //    //Validate Inappropirate Word
                        //}
                        if (!ok || (e.ctrlKey && e.altKey)) {
                            //e.preventDefault();
                            //  $('#lblRenameGroupErrorMessage').text('Valid characters are alphanumeric and _-()');
                        }

                    }
                    else
                        e.preventDefault();
                }
                else {
                    $('#renameTagcharcounter').text($(this).val().length + '/' + maxLength)
                }

            });



            $("#txtNewWgTagName").on('keydown keyup change', function (e) {
                var k = e.keyCode || e.which;
                $('#lblCreateWgTagErrorMessage').text('');
                $('#lblCreateWgTagWarningMessage').text('');
                var maxLength = 30;
                var charLength = $(this).val().length;
                var trimLength = $(this).val().trim().length



                if (charLength > 0 && trimLength == 0) {
                    $('#btnCreateWgTag').attr('disabled', 'disabled');
                    $('#btnCreateWgTag').removeClass('enabledbutton').addClass('disabledbutton');
                    $('#lblCreateWgTagErrorMessage').text('Name must include visible characters');
                    return;
                }
                else if (charLength == 0) {
                    $('#btnCreateWgTag').attr('disabled', 'disabled');
                    $('#btnCreateWgTag').removeClass('enabledbutton').addClass('disabledbutton');


                }
                else {
                    $('#btnCreateWgTag').removeAttr('disabled');
                    $('#btnCreateWgTag').removeClass('disabledbutton').addClass('enabledbutton');
                }


                var enteredtext = $("#txtNewWgTagName").val();
                var regex = /^[ A-Za-z0-9_()-]*$/
                if (charLength > 0 && regex.test(enteredtext) == false) {
                    $('#lblCreateWgTagErrorMessage').text('Valid characters are alphanumeric and _-()');
                    $('#btnCreateWgTag').attr('disabled', 'disabled');
                    $('#btnCreateWgTag').removeClass('enabledbutton').addClass('disabledbutton');
                }
                else {
                    $('#lblCreateWgTagErrorMessage').text('');
                    $('#btnCreateWgTag').removeAttr('disabled');
                    $('#btnCreateWgTag').removeClass('disabledbutton').addClass('enabledbutton');
                }
                var splittext = enteredtext.split(' ');
                var InApprWords = localStorage.getItem('INAPPROWORDS');
                var test = JSON.parse(InApprWords)
                var isapprworddetected = false;
                for (var i = 0; i <= splittext.length; i++) {
                    //InApprWords.find()
                    var tempstring = splittext[i];
                    if (tempstring != '' && tempstring != undefined) {
                        var s = test.find((s) => s.TEXT.toLowerCase() === tempstring.toString().toLocaleLowerCase());
                        if (s != undefined) {
                            isapprworddetected = true;
                        }
                    }

                }
                if (isapprworddetected) {
                    $('#lblCreateWgTagWarningMessage').text('Inapproprite word detected');
                }
                $('#charWgTagcounter').text($(this).val().length + '/' + maxLength);
                if (k != 8 && k != 46) {
                    if (charLength < maxLength) {


                        var ok = k >= 65 && k <= 90 || // A-Z
                            k >= 96 && k <= 105 || // a-z
                            k >= 35 && k <= 40 || // arrows
                            k == 9 || //tab
                            k == 46 || //del
                            k == 8 || // backspaces
                            k == 32 || // space
                            k == 16 || // 
                            k == 57 || // (
                            k == 48 || // )
                            k == 189 || // -
                            (!e.shiftKey && k >= 48 && k <= 57); // only 0-9 (ignore SHIFT options)
                        //if (k == 32) {
                        //    //Validate Inappropirate Word
                        //}
                        if (!ok || (e.ctrlKey && e.altKey)) {
                            //e.preventDefault();
                            // $('#lblCreateGroupErrorMessage').text('Valid characters are alphanumeric and _-()');
                        }

                    }
                    else
                        e.preventDefault();
                }
                else {
                    $('#charWgTagcounter').text($(this).val().length + '/' + maxLength);
                }

            });
        });


    </script>
    <script>




        function createRipple(e) {

            let btn = e.target;
            let boundingBox = btn.getBoundingClientRect();
            let x = e.clientX - boundingBox.left;
            let y = e.clientY - boundingBox.top;

            let ripple = document.createElement('span');
            ripple.classList.add('ripple');
            ripple.style.left = `${x}px`;
            ripple.style.top = `${y}px`;

            btn.appendChild(ripple);

            ripple.addEventListener('animationend', () => { ripple.remove() });
        }

        function createRippleDifColor(e) {

            let btn = e.target;
            let boundingBox = btn.getBoundingClientRect();
            let x = e.clientX - boundingBox.left;
            let y = e.clientY - boundingBox.top;

            let anotherripple = document.createElement('span');
            anotherripple.classList.add('anotherripple');
            anotherripple.style.left = `${x}px`;
            anotherripple.style.top = `${y}px`;

            btn.appendChild(anotherripple);

            anotherripple.addEventListener('animationend', () => { anotherripple.remove() });
        }

    </script>
    <style>
        .addmemberbutton {
            position: relative;
            border-width: 0px;
            border-radius: 5px;
            padding: 8px 18px 8px 18px;
            /*width:120px;
            height:50px;*/
            background-color: #1266f1;
            color: white;
            font-family: Roboto;
            font-size: 11px;
            display: inline-block;
            overflow: hidden;
            transition: .3s;
        }

        .ripple {
            position: absolute;
            transform: translate(-50%, -50%);
            width: 0;
            height: 0;
            border-radius: 50%;
            background-color: white;
            pointer-events: none;
            opacity: .5;
            animation: ripple .5s linear;
        }

        .anotherripple {
            position: absolute;
            transform: translate(-50%, -50%);
            width: 0;
            height: 0;
            border-radius: 50%;
            background-color: lightgray;
            pointer-events: none;
            opacity: .5;
            animation: ripple .5s linear;
        }

        @keyframes anotherripple {
            to {
                width: 15rem;
                height: 15rem;
                opacity: 0;
            }
        }

        @keyframes ripple {
            to {
                width: 15rem;
                height: 15rem;
                opacity: 0;
            }
        }

        .addmemberbutton:hover {
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.6);
        }
    </style>
    <style type="text/css">
        #loader {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            width: 100%;
            background-color: grey;
            /*opacity: 0.5;*/
            background: rgba(0,0,0,0.75) no-repeat center center;
            z-index: 10000;
        }
    </style>

    <style>
        .modal-footer {
            text-align: center;
        }



        .textcss {
            font-family: Roboto, sans-serif;
            font-size: 12px
        }
        /*style="font-size: .875rem;border-radius:.2rem;padding: 3px 3px;"><span style="font-size:13px"*/







        .card {
            background-color: #F6F6F6;
        }

        .card-footer {
            background-color: #F6F6F6;
        }

        .card-body {
            flex: 1 1 auto;
            font-family: "Roboto, sans-serif";
            color: #283154;
            padding: 10px 10px 10px 10px;
            /* padding: 1rem 1rem; */
            /*border:solid;*/
        }



        hr {
            margin: 0;
            color: inherit;
            background-color: currentColor;
            border: 0;
            opacity: .25;
        }

        .horizontalline {
            border-top: 0.2px solid rgb(0 0 0 / 10%);
        }

        .horizontallinecardbody {
            display: inline-block;
            border-top: 0.5px solid lightgrey;
        }

        .showdiv {
            display: block;
        }

        .hidediv {
            display: none;
        }

        .messagepop {
            font-family: "Roboto, sans-serif";
            cursor: default;
            display: none;
            background-color: white;
            /* margin-top: 15px; */
            position: absolute;
            text-align: left;
            /* width: 394px; */
            z-index: 50;
            padding: 5px 5px 5px;
            width: 220px;
            /*height: 150px;*/
        }

            .messagepop p, .messagepop.div {
                border-bottom: 1px solid #EFEFEF;
                margin: 8px 0;
                padding-bottom: 8px;
            }


        .modal-content {
            position: relative;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-direction: column;
            flex-direction: column;
            width: 100%;
            pointer-events: auto;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid rgba(0,0,0,.2);
            border-radius: .3rem;
            outline: 0;
            /*width: 1000px;*/
            font-family: "Roboto, sans-serif"
        }

        .modal-open {
            overflow-y: auto;
            padding-right: 0 !important;
        }

        .modal-header {
            padding: 16px 16px;
            color: #FFF;
        }

        .tableHeaderStyle {
            background-color: grey;
            color: white;
            border: 1pt #d9d9d9 solid;
            text-align: left;
            padding-top: 1px;
            padding-bottom: 1px;
            padding-left: 5px;
            padding-right: 5px;
        }

        table.MainContent {
            width: 100%;
        }

        /*.tagellipsisbutton {
            position: absolute;
            display: absolute;
            border: 1px solid;*/
        /*margin-top: 2rem;
            margin-bottom: 5rem;*/
        /*padding: 1rem;
            z-level: -9999;
            background-color:#c4dcef;
        }*/
    </style>

    <style>
        #dvToolEntry .container,
        #dvnewWgTagModel .container,
        #dvcreateTagModel .container,
        #dvrenameTagModel .container,
        #dvemailaddressModel .container,
        #dvdeletegrpModel .container,
        #dvrenamegrpModel .container,
        #dvnewgrpModel .container {
            font-family: 'Roboto';
            display: block;
            background: #FFF;
        }

        /* form starting stylings ------------------------------- */
        #dvToolEntry .group,
        #dvnewWgTagModel .group
        #dvcreateTagModel .group,
        #dvrenameTagModel .group,
        #dvemailaddressModel .group,
        #dvdeletegrpModel .group,
        #dvrenamegrpModel .group,
        #dvnewgrpModel .group {
            position: relative;
        }

        #dvToolEntry input,
        #dvnewWgTagModel input,
        #dvcreateTagModel input,
        #dvrenameTagModel input,
        #dvemailaddressModel input,
        #dvdeletegrpModel input,
        #dvrenamegrpModel input,
        #dvnewgrpModel input {
            font-size: 18px;
            padding: 10px 10px 10px 5px;
            display: block;
            width: 300px;
            border: none;
            border-bottom: 1px solid #757575;
        }

            #dvToolEntry input:focus,
            #dvnewWgTagModel input:focus,
            #dvrenameTagModel input:focus,
            #dvemailaddressModel input:focus,
            #dvdeletegrpModel input:focus,
            #dvrenamegrpModel input:focus,
            #dvnewgrpModel input:focus {
                outline: none;
            }

        /* LABEL ======================================= */
        #dvToolEntry label,
        #dvcreateTagModel label,
        #dvrenameTagModel label,
        #dvemailaddressModel label,
        #dvdeletegrpModel label,
        #dvrenamegrpModel label,
        #dvnewgrpModel label {
            color: #999;
            font-size: 18px;
            font-weight: normal;
            position: absolute;
            pointer-events: none;
            left: 5px;
            top: 10px;
            transition: 0.2s ease all;
            -moz-transition: 0.2s ease all;
            -webkit-transition: 0.2s ease all;
        }

        #dvnewWgTagModel label {
            color: #999;
            font-size: 18px;
            font-weight: normal;
            position: absolute;
            pointer-events: none;
            left: 35px;
            top: 75px;
            transition: 0.2s ease all;
            -moz-transition: 0.2s ease all;
            -webkit-transition: 0.2s ease all;
        }

        /* active state */
        #dvToolEntry input:focus ~ label,
        #dvToolEntry input:valid ~ label,
        #dvnewWgTagModel input:focus ~ label,
        #dvnewWgTagModel input:valid ~ label,
        #dvcreateTagModel input:focus ~ label,
        #dvcreateTagModel input:valid ~ label,
        #dvrenameTagModel input:focus ~ label,
        #dvrenameTagModel input:valid ~ label,
        #dvemailaddressModel input:focus ~ label,
        #dvemailaddressModel input:valid ~ label,
        #dvdeletegrpModel input:focus ~ label,
        #dvdeletegrpModel input:valid ~ label,
        #dvrenamegrpModel input:focus ~ label,
        #dvrenamegrpModel input:valid ~ label,
        #dvnewgrpModel input:focus ~ label,
        #dvnewgrpModel input:valid ~ label {
            top: -20px;
            font-size: 14px;
            color: grey;
        }

        #dvnewWgTagModel input:focus ~ label, #dvnewWgTagModel input:valid ~ label {
            top: 45px;
            font-size: 14px;
            color: grey;
        }


        /* BOTTOM BARS ================================= */
        #dvToolEntry .bar,
        #dvnewWgTagModel .bar,
        #dvcreateTagModel .bar,
        #dvrenameTagModel .bar,
        #dvemailaddressModel .bar,
        #dvdeletegrpModel .bar,
        #dvrenamegrpModel .bar,
        #dvnewgrpModel .bar {
            position: relative;
            display: block;
        }

            #dvToolEntry .bar:before,
            #dvToolEntry .bar:after,
            #dvnewWgTagModel .bar:before,
            #dvnewWgTagModel .bar:after,
            #dvcreateTagModel .bar:before,
            #dvcreateTagModel .bar:after,
            #dvrenameTagModel .bar:before,
            #dvrenameTagModel .bar:after,
            #dvemailaddressModel .bar:before,
            #dvemailaddressModel .bar:after,
            #dvdeletegrpModel .bar:before,
            #dvdeletegrpModel .bar:after,
            #dvrenamegrpModel .bar:before,
            #dvrenamegrpModel .bar:after,
            #dvnewgrpModel .bar:before,
            #dvnewgrpModel .bar:after {
                content: '';
                height: 2px;
                width: 0;
                bottom: 1px;
                position: absolute;
                transition: 0.2s ease all;
                -moz-transition: 0.2s ease all;
                -webkit-transition: 0.2s ease all;
            }

            #dvToolEntry .bar:before,
            #dvnewWgTagModel .bar:before,
            #dvcreateTagModel .bar:before,
            #dvrenameTagModel .bar:before,
            #dvemailaddressModel .bar:before,
            #dvdeletegrpModel .bar:before,
            #dvrenamegrpModel .bar:before,
            #dvnewgrpModel .bar:before {
                left: 50%;
            }

            #dvToolEntry .bar:after,
            #dvnewWgTagModel .bar:after,
            #dvcreateTagModel .bar:after,
            #dvrenameTagModel .bar:after,
            #dvemailaddressModel .bar:after,
            #dvdeletegrpModel .bar:after,
            #dvrenamegrpModel .bar:after,
            #dvnewgrpModel .bar:after {
                right: 50%;
            }

        /* active state */
        #dvToolEntry input:focus ~ .bar:before,
        #dvnewWgTagModel input:focus ~ .bar:before,
        #dvnewWgTagModel input:focus ~ .bar:after,
        #dvcreateTagModel input:focus ~ .bar:before,
        #dvcreateTagModel input:focus ~ .bar:after,
        #dvrenameTagModel input:focus ~ .bar:before,
        #dvrenameTagModel input:focus ~ .bar:after,
        #dvemailaddressModel input:focus ~ .bar:before,
        #dvemailaddressModel input:focus ~ .bar:after,
        #dvdeletegrpModel input:focus ~ .bar:before,
        #dvdeletegrpModel input:focus ~ .bar:after,
        #dvrenamegrpModel input:focus ~ .bar:before,
        #dvrenamegrpModel input:focus ~ .bar:after,
        #dvnewgrpModel input:focus ~ .bar:before,
        #dvnewgrpModel input:focus ~ .bar:after {
            width: 50%;
        }

        /* HIGHLIGHTER ================================== */
        #dvToolEntry .highlight,
        #dvnewWgTagModel .highlight,
        #dvcreateTagModel .highlight,
        #dvrenameTagModel .highlight,
        #dvemailaddressModel .highlight,
        #dvdeletegrpModel .highlight,
        #dvrenamegrpModel .highlight,
        #dvnewgrpModel .highlight {
            position: absolute;
            height: 60%;
            width: 100px;
            top: 25%;
            left: 0;
            pointer-events: none;
            opacity: 0.5;
        }

        /* active state */
        #dvToolEntry input:focus ~ .highlight,
        #dvnewWgTagModel input:focus ~ .highlight,
        #dvcreateTagModel input:focus ~ .highlight,
        #dvrenameTagModel input:focus ~ .highlight,
        #dvemailaddressModel input:focus ~ .highlight,
        #dvdeletegrpModel input:focus ~ .highlight,
        #dvrenamegrpModel input:focus ~ .highlight,
        #dvnewgrpModel input:focus ~ .highlight {
            -webkit-animation: inputHighlighter 0.3s ease;
            -moz-animation: inputHighlighter 0.3s ease;
            animation: inputHighlighter 0.3s ease;
        }

        .modal-dialog {
            position: absolute;
            top: 50px;
            right: 0px;
            bottom: 0;
            left: 0;
            z-index: 10040;
        }

        .container, .container-fluid {
            width: 100%;
            padding-right: var(--bs-gutter-x,.75rem);
            padding-left: var(--bs-gutter-x,.75rem);
            margin-right: auto;
            /* margin-left: auto; */
        }

        .modal-header {
            display: flex;
            flex-shrink: 0;
            align-items: center;
            justify-content: space-between;
            padding: 1rem 1rem;
            border-bottom: 0px;
            border-top-left-radius: calc(.3rem - 1px);
            border-top-right-radius: calc(.3rem - 1px);
        }

            .modal-header .close {
                padding: 0 1rem;
                margin: -1rem -1rem -1rem auto;
            }

        /* .btntrans {
            transition: all 0.3s ease 0s;
        }*/


        .btntrans:hover {
            background-color: darkblue;
            color: white;
        }

        .disabledbutton {
            font-family: Roboto, sans-serif;
            font-size: 12px;
            font-weight: normal;
            border-radius: .25rem;
            padding: .625rem 1.5rem .5rem;
            background-color: grey;
            color: white;
            border-width: 0px;
        }

        .enabledbutton {
            font-family: Roboto, sans-serif;
            font-size: 12px;
            font-weight: normal;
            border-radius: .25rem;
            padding: .625rem 1.5rem .5rem;
            background-color: #1266f1;
            color: white;
            border-width: 0px;
            overflow: hidden;
            transition: .3s;
            position: relative;
            display: inline-block;
        }

            .enabledbutton:hover {
                background-color: #0c56d0;
                box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 10%);
            }



        .deleteenabledbutton {
            font-family: Roboto, sans-serif;
            font-size: 12px;
            font-weight: normal;
            border-radius: .25rem;
            padding: .625rem 1.5rem .5rem;
            background-color: orangered;
            color: white;
            border-width: 0px;
            overflow: hidden;
            transition: .3s;
            position: relative;
            display: inline-block;
        }

            .deleteenabledbutton:hover {
                background-color: red;
                box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 10%);
            }

        .cancelButton {
            font-family: Roboto, sans-serif;
            font-size: 12px;
            Color: #283154;
            font-weight: normal;
            border-radius: .25rem;
            padding: .625rem 1.5rem .5rem;
            background-color: white;
            border-width: 0px;
            display: inline-block;
            overflow: hidden;
            transition: .3s;
            position: relative;
        }

            .cancelButton:hover {
                background-color: #f5f5f5;
            }

        /*.addmemberbutton {
            border-width: 0px;
            border-radius: 5px;
            padding: 8px 18px 8px 18px;
            background-color: #1266f1;
            color: white;
            font-family: Roboto;
            font-size: 11px;
            display: inline-block;
        }*/

        /*.addmemberbutton:hover {
            background-color: #0c56d0;
                box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 10%);
        }*/

        .donebutton {
            border-radius: 5px;
            padding: 5px 25px 5px 25px;
            /* border-color: #39c0ed;*/
            color: #39c0ed;
            background-color: white;
            font-family: Roboto;
            font-size: 11px;
            display: inline-block;
            background-color: transparent;
            border: 1.5px solid;
            line-height: 1.5;
            overflow: hidden;
            transition: .3s;
            position: relative;
            display: inline-block;
        }

            .donebutton:hover {
                box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 10%);
            }

        .newtagbutton {
            /* width:85%;*/
            border-width: 1px;
            border-radius: 3px;
           padding: 4px 15px 4px 15px;
            /*border-color: grey;*/
            color: grey;
            background-color: white;
            font-family: Roboto;
            font-size: 9px;
            display: inline-block;
            border: 1.4px solid;
          /*  float: right;*/
            overflow: hidden;
            transition: .3s;
            position: relative;
            margin-left : 20px;
        }

            .newtagbutton:hover {
                box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 10%);
            }

        .membersbutton {
            border-width: 1px;
            border-radius: 3px;
            padding: 4px 12px 4px 12px;
            /*border-color: grey;*/
            color: grey;
            background-color: white;
            font-family: Roboto;
            font-size: 9px;
            display: inline-block;
            border: 1.4px solid;
            overflow: hidden;
            transition: .3s;
            float: right;
            position: relative;
            margin-right: 15px;
        }

            .membersbutton:hover {
                box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 10%);
            }

        .list-group-item.active {
            z-index: 2;
            color: black;
            background-color: lightgrey;
            border-color: lightgray;
        }

        .title-bar2 {
            width: 847px;
            padding: 15px 25px 5px 21px;
            border-bottom: 1px solid #000000;
            background-color: #6B1424;
            color: #FFFFFF;
            font-size: 16px;
            font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
            font-variant: small-caps;
            font-weight: bold;
            letter-spacing: 1px;
        }
    </style>

</asp:Content>



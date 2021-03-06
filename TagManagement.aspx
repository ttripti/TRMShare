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
        .membersDialog{
            -webkit-transform : none !important;
            transform : none !important;
        }

        #tagManagementTable {
            border: solid 0.5px;
            border-color: lightgrey;
            width: 100%;
            margin-top: 15px;
        }

        a.collapseClass {
            color: black;
        }

        .newgroupbutton {
            font-family: Roboto, sans-serif;
            font-size: 13px;
            font-weight: normal;
            border-radius: 24px;
            padding: 10px 18px 10px 18px;
            background-color: #283154;
            color: white;
            border-width: 0px;
            overflow: hidden;
            transition: .3s;
            position: relative;
            display: inline-block;
        }

            .newgroupbutton:hover {
                box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 10%);
            }

        .newtagbutton {
            /* width:85%;*/
            border-width: 1px;
            border-radius: 3px;
            padding: 4px 15px 4px 15px;
            /*border-color: grey;*/
            color: #283154;
            background-color: white;
            font-family: Roboto;
            font-size: 9px;
            display: inline-block;
            border: 1.4px solid;
            float: right;
            overflow: hidden;
            transition: .3s;
            position: relative;
        }

            .newtagbutton:hover {
                box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 10%);
            }

            .ptnewtagbutton {
            /* width:85%;*/
            border-width: 1px;
            border-radius: 3px;
            padding: 6px 15px 5px 15px;
            /*border-color: grey;*/
            color: #283154;
            background-color: white;
            font-family: Roboto;
            font-size: 9px;
            display: inline-block;
            border: 1.4px solid;
            margin-left:10px;
            overflow: hidden;
            transition: .3s;
            position: relative;
        }

            .ptnewtagbutton:hover {
                box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 10%);
            }

        #dvTagGroups {
            margin-left: 15px;
            margin-right: 15px;
            margin-bottom: 20px;
        }

        #dvPersonalTag {
            margin-left: 15px;
            margin-right: 15px;
            margin-bottom: 20px;
        }

        a[aria-expanded=true] .fa-chevron-down {
            display: none;
        }

        a[aria-expanded=false] .fa-chevron-up {
            display: none;
        }

        html {
            overflow-y: scroll;
        }

        #personalCollapse {
            position: absolute;
            right: 30px;
            text-align: right;
        }

        #GrpCollapse {
            position: absolute;
            right: 30px;
            text-align: right;
        }

        /*#falsebtn, #Dwnfalsebtn {
            background-color: white;
            color: black;
            font-family: Roboto, sans-serif;
            font-size: 12px;
            font-weight: normal;
            border-radius: .25rem;
            padding: 6px 20px 6px 20px;
            border-width: 0px;
            overflow: hidden;
            transition: .3s;
            right: 100px;
            display: inline-block;
        }
        #truebtn, #DwnTruebtn {
            background-color: #f44336;
            color: white;
            font-family: Roboto, sans-serif;
            font-size: 12px;
            font-weight: normal;
            border-radius: .25rem;
            padding: 6px 20px 6px 20px;
            border-width: 0px;
            overflow: hidden;
            transition: .3s;
            position: relative;
            display: inline-block;
        }*/
        #confrmMembrDiv .button:hover {
            background-color: #ddd;
        }
        #confrmMembrDiv .showdiv {
            display: block;
        }
        #confrmMembrDiv .hidediv {
            display: none;
        }
        #confirmBox .message {
            text-align: left;
            margin-bottom: 8px;
        }

        #more {display: none;}
        
        .tagMgntVideoLinks{
            font-family: Roboto, sans-serif;
            font-size: 11px;
            width : 842px;
            vertical-align : 1.5px;  
            
        }
        .infoButton{
         cursor:pointer;
         margin-left:5px;
        }
        .fa-check{
            color:green;
            font-size:15px;
         }
    </style>
    <div class="row">
        <div class="col-12" style="font-weight: 500; font-family: 'Roboto', sans-serif; font-size: 17px; margin-top: 5px;">
            Tag Management
        </div>
    </div>
    <div  class="row">
        <div class="col-7">
           <i class="fa fa-video fa-sm"></i>&nbsp;&nbsp;<a class="tagMgntVideoLinks" href="TRMTrainingVideos.aspx" target="_blank">How to Use Tag Management in the TRM</a>
        </div>
        <div class="col-5">
             <select id="tagFilter" class="form-select" style="width:180px;font-family: Roboto;font-size:12px;float:right">
                   <option value="PopularHighest">Popular - Highest</option>
                   <option value="PopularLowest">Popular - Lowest</option>
                   <option value="NameAtoZ">Name - A to Z</option>
                   <option value="NameZtoA">Name - Z to A</option>
                   <option value="CreatedNewest">Created - Newest</option>
                   <option value="CreatedOldest">Created - Oldest</option>
             </select>
        </div>
    </div>
    <div class="row" style="padding-top:10px;"></div>
    <div style="max-width:826px;min-width:400px" >  
        <p style="font-size:11px;font-family: Arial;text-align:left;">Welcome to your TRM Tag Management profile. Tag Management helps you organize your collection of TRM entries in a personalized and meaningful  
        <span id="dots">...&nbsp;</span>
        <span id="more">manner. You may use this page to view and manage your personal and group tags. Here, you may easily add TRM entries to your tags within the My Personal Tags or My Group Tags sections.<br /><br />
            My Personal Tags – This section contains the tags that are private to the user. The purpose of personal tag management is to create and manage tags that organize technologies and standards in a personalized matter.<br /><br />
            My Group Tags – This is semi-private tag management category that allows a user to create, manage or view specific tags catered towards a group of people with a common interest. Here you may assign roles to each of the members.<br /><br />
            General help files and training videos are available and contain explanations about Tag Management.
        </span>
        <a style="color:blue;cursor:pointer;" onclick="morelessFunction()" id="moreless"><u>Show more</u></a></p>
    </div>

    <div id="dvTags">
        <table id="tagManagementTable">
            <tr style="border-bottom: 0.5pt solid lightgrey;">
                <td>
                    <div id="dvPersonalTag">
                        <div class="row" style="padding-top:20px">
                            <div class="col-5" style="font-weight: 400; font-family: 'Roboto', sans-serif; font-size: 17px">
                                My Personal Tags (<span id="spanPersonalTotalTags"> </span>)
                            <button id="btnnewpersonaltag" class="ptnewtagbutton" onclick="javascript:openPsnlTagModel();return false;">
                                <i class="fas fa-plus" style="color:#283154"></i>&nbsp;&nbsp;&nbsp;NEW TAG
                            </button>
                            </div>
                            <div class="col-6">
                                <span id="lblPTSuccessMessage" style="font-family: 'Roboto', sans-serif; color: green;"></span>
                            </div>
                            <div class="col-1" id="personalCollapse">
                                <a aria-expanded="true" class="collapseClass" data-toggle="collapse" href="#dvWGPersonalTagsContainer">
                                    <i class="fa fa-chevron-up"></i>
                                    <i class="fa fa-chevron-down"></i>
                                </a>
                            </div>
                        </div>
                        <div style="padding-top:7px;padding-bottom:7px;">
                           <i class="fa fa-video fa-sm"></i>&nbsp;&nbsp;<a class="tagMgntVideoLinks" href="TRMTrainingVideos.aspx" target="_blank">How To - Personal Tags</a>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="collapse show row" id="dvWGPersonalTagsContainer"></div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr style="border-bottom: 0.5pt solid lightgrey;">
                <td>
                    <div id="dvTagGroups">
                        <div class="row" style="padding-top:20px">
                            <div class="col-4" style="font-weight: 400; font-family: 'Roboto', sans-serif; font-size: 17px">
                                My Groups (<span id="spanGroupCount"></span>)                
                        <button id="btnnewgroup" class="ptnewtagbutton" onclick="javascript:OpenNewGroupDialog();return false;">
                            <i class="fas fa-plus"></i>&nbsp;&nbsp;&nbsp;NEW GROUP
                        </button>
                            </div>
                            <div class="col-7">
                                <span id="lblGroupSuccessMessage" style="font-family: 'Roboto', sans-serif; color: green;"></span>
                            </div>
                            <div class="col-1" id="GrpCollapse">
                                <a aria-expanded="true" class="collapseClass" data-toggle="collapse" href="#dvWGTagsContainer">
                                    <i class="fa fa-chevron-up"></i>
                                    <i class="fa fa-chevron-down"></i>
                                </a>
                            </div>
                        </div>
                        <div style="padding-top:7px;">
                           <i class="fa fa-video fa-sm"></i>&nbsp;&nbsp;<a class="tagMgntVideoLinks" href="TRMTrainingVideos.aspx" target="_blank">How To - Group Tags</a>
                        </div>
                         <div class="row" ><br /></div>
                        <div class="row">
                            <div class="col-12">
                                <div class=" collapse show row row-cols-1 row-cols-md-3 g-4" id="dvWGTagsContainer">
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div id="dvGroupPopup" class="messagepop grouppop shadow-sm mb-5 bg-white rounded" style="display: none; width: 170px; border: 1px solid #dee2e6; border-radius: 5px;">

        <%--<div class="row">
            <div class="col-sm-2" style="text-align: center;">
            </div>
            <div class="col-sm-10" style="padding-top: 10px;">
                <a href="#" style="text-decoration: none; color: black; font-size: 14px; font-family: Roboto, sans-serif;" onclick="javascript:manageGroupMember();return false;">Manage Members</a>
            </div>
        </div>--%>
        <div style="padding-top: 5px; padding-bottom: 5px; background-color: white; cursor: pointer;" class="grpellipsemenu" id="dvRenameGroup" onclick="javascript:renameGroup();return false;">
            <div style="padding-left: 10px; display: inline-block; color: rgb(80,80,80)">
                <i class="fas fa-pen"></i>
            </div>
            <div style="display: inline-block;">
                <a href="#" style="text-decoration: none; color: rgb(100,100,100); font-size: 12px; font-family: Roboto, sans-serif;">&nbsp;&nbsp;Rename Group</a>
            </div>
        </div>
        <div style="padding-top: 5px; padding-bottom: 5px; background-color: white; cursor: pointer" class="grpellipsemenu" id="dvOptOut" onclick="javascript:optoutGroupModal();return false;">
            <div style="padding-left: 10px; display: inline-block; color: rgb(80,80,80)">
                <i class="fas fa-times-circle"></i>
            </div>
            <div style="display: inline-block;">
                <a href="#" style="text-decoration: none; color: rgb(100,100,100); font-size: 12px; font-family: Roboto, sans-serif;">&nbsp;&nbsp;Opt Out</a>
            </div>
        </div>
        <div class="horizontalline" id="dvhorzline"></div>
        <div style="padding-top: 5px; padding-bottom: 5px; background-color: white; cursor: pointer" class="grpellipsemenu" id="dvDeleteGroup" onclick="javascript:deleteGroup();return false;">
            <div style="padding-left: 10px; display: inline-block; color: rgb(80,80,80)">
                <i class="fas fa-trash"></i>
            </div>
            <div style="display: inline-block;">
                <a href="#" style="text-decoration: none; color: rgb(100,100,100); font-size: 12px; font-family: Roboto, sans-serif;">&nbsp;&nbsp;Delete Group</a>
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

    <div id="dvTagPopup" class="messagepop tagpop shadow-sm mb-5 bg-white rounded" style="display: none; width: 170px; border: 1px solid #dee2e6; border-radius: 5px">

        <div style="padding-top: 5px; padding-bottom: 5px; background-color: white; cursor: pointer" class="grpellipsemenu" id="dvtagTRMEntry" onclick="javascript:createTagEntryModel();return false;">
            <div style="padding-left: 10px; display: inline-block; color: rgb(80,80,80)">
                <i class="fas fa-tag"></i>
            </div>
            <div style="display: inline-block;">
                <a href="#" style="text-decoration: none; color: rgb(100,100,100); font-size: 12px; font-family: Roboto, sans-serif;">&nbsp;&nbsp;Tag TRM Entry</a>
            </div>
        </div>
        <div style="padding-top: 5px; padding-bottom: 5px; background-color: white; cursor: pointer" class="grpellipsemenu" id="dvViewTRMEntriesmenu" onclick="javascript:viewTRMEntriesModel();return false;">
            <div style="padding-left: 10px; display: inline-block; color: rgb(80,80,80)">
                <i class="fas fa-eye"></i>
            </div>
            <div style="display: inline-block;">
                <a href="#" style="text-decoration: none; color: rgb(100,100,100); font-size: 12px; font-family: Roboto, sans-serif;">&nbsp;&nbsp;View Tagged Entries</a>
            </div>
        </div>
        <div style="padding-top: 5px; padding-bottom: 5px; background-color: white; cursor: pointer" class="grpellipsemenu" id="dvRenameTag" onclick="javascript:renameTagModel();return false;">
            <div style="padding-left: 10px; display: inline-block; color: rgb(80,80,80)">
                <i class="fas fa-pen"></i>
            </div>
            <div style="display: inline-block;">
                <a href="#" style="text-decoration: none; color: rgb(100,100,100); font-size: 12px; font-family: Roboto, sans-serif;">&nbsp;&nbsp;Rename Tag</a>
            </div>
        </div>
        <div class="horizontalline" id="dvTagshorzline"></div>
        <div style="padding-top: 5px; padding-bottom: 5px; background-color: white; cursor: pointer" class="grpellipsemenu" id="dvDeleteTag" onclick="javascript:deleteTagModel();return false;">
            <div style="padding-left: 10px; display: inline-block; color: rgb(80,80,80)">
                <i class="fas fa-trash"></i>
            </div>
            <div style="display: inline-block;">
                <a href="#" style="text-decoration: none; color: rgb(100,100,100); font-size: 12px; font-family: Roboto, sans-serif;">&nbsp;&nbsp;&nbsp;Delete Tag</a>
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
    <!-- add member confirm popup -->
    <div class="modal fade" data-spy="affix" data-offset-top="10" data-backdrop="static" id="confrmMembrDiv" aria-labelledby="confrmMembrDivLabel" aria-hidden="true" tabindex="0">
        <div class="modal-dialog" role="document" style="width: 400px">
            <div class="modal-content" style="width:400px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="javascript:closeconfrmMembrDiv();">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p style="text-decoration: none; font-family: Roboto, sans-serif; font-size: 24px; font-weight: bold">
                        <i class='fas fa-exclamation-triangle' style='font-size: 24px; color: #EB5757'></i>
                        <span style="font-family: Roboto, sans-serif; font-size: 16px; color: black">REMOVE USER</span>
                    </p>
                    <span id="spandeletemembermsg" style="font-family: Roboto, sans-serif; font-size: 14px; color: black">Are you sure you want to remove yourself from the group?</span><br />
                    <p></p>
                </div>
                <div class="modal-footer">
                    <button type="button" id="falsebtn" class="cancelButton" data-dismiss="modal">CANCEL</button>
                    <button type="button" id="truebtn" class="deleteenabledbutton">REMOVE</button>
                </div>
            </div>
        </div>
    </div>
        <!-- change member role popup -->
    <div class="modal fade" id="checkDowngradeMember" data-backdrop="static" aria-labelledby="checkDowngradeMemberLabel" aria-hidden="true" tabindex="0">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="width:400px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="javascript:closeDowngradeMember();">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p style="text-decoration: none; font-family: Roboto, sans-serif; font-size: 24px; font-weight: bold">
                        <i class='fas fa-exclamation-triangle' style="font-size: 24px; color: #EB5757"></i>
                        <span style="font-family: Roboto, sans-serif; font-size: 16px; color: black">DOWNGRADE ROLE</span>
                    </p>
                    <span style="font-family: Roboto, sans-serif; font-size: 14px; color: black">Are you sure you want to downgrade yourself from <b>Owner</b> to
                         <label id="lblRole" style="font-family: Roboto; font-size: 14px; font-weight: bold"></label>?
                    </span><br />
                    <p></p>
                </div>
            <div class="modal-footer">
                <button id="Dwnfalsebtn" class="cancelButton" data-dismiss="modal">CANCEL</button>
                <button id="Dwntruebtn" class="deleteenabledbutton">APPLY</button>
            </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="MembersModel" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" aria-labelledby="membersModalLabel" aria-hidden="true">

        <div id="dvRolePopup" class="messagepop shadow-sm mb-5 bg-white roleInfoPopup" style="border-radius:5px;font-family: 'Roboto', sans-serif; font-size: 10px;display: none; width: 430px;height:375px;">
            <div style="padding-bottom:15px;">
            <button type="button" class="close" aria-label="Close" style="font-family: 'Roboto', sans-serif; font-size: 14px;margin-right:5px;" onclick="javascript:closeRoleInfoPopup();">
                        <span aria-hidden="true"> &times;</span>
            </button></div>
            <div style="font-family: 'Roboto', sans-serif; font-size: 10px; width: 420px;padding-left:30px;padding-right:30px;padding-bottom:-10px;">

             <table class="table table-borderless">
           <thead>
               <tr class="border-bottom" style="width:15%;">
                   <th scope="col" style="width:15%;"></th>
                   <th class="text-center" style="width:5%;" scope="col">Owner</th>
                   <th class="text-center" style="width:9%;" scope="col">Tag Manager</th>
                   <th class="text-center " style="width:4%;" scope="col">Viewer</th>
               </tr>
           </thead>
           <tbody>
               <tr class="border-bottom ">
                   <th scope="row" class="font-weight-normal text-cen">Add Members</th>
                   <td class="text-center"><i class="fas fa-check"></i></td>
                   <td class="text-center"><i class="fas fa-minus"></i></td>
                   <td class="text-center"><i class="fas fa-minus"></i></td>
               </tr>
               <tr class="border-bottom ">
                   <th scope="row" class="font-weight-normal" >Edit Roles</th>
                   <td class="text-center"><i class="fas fa-check"></i></td>
                   <td class="text-center"><i class="fas fa-minus"></i></td>
                   <td class="text-center"><i class="fas fa-minus"></i></td>
               </tr>
               <tr class="border-bottom">
                   <th scope="row" class="font-weight-normal" >Create Tags</th>
                   <td class="text-center"><i class="fas fa-check"></i></td>
                   <td class="text-center"><i class="fas fa-check"></i></td>
                   <td class="text-center"><i class="fas fa-minus"></i></td>
               </tr>
               <tr class="border-bottom">
                   <th scope="row" class="font-weight-normal">Rename Tags</th>
                   <td class="text-center"><i class="fas fa-check"></i></td>
                   <td class="text-center"><i class="fas fa-check"></i></td>
                   <td class="text-center"><i class="fas fa-minus"></i></td>
               </tr>
               <tr class="border-bottom">
                   <th scope="row" class="font-weight-normal">Delete Tags</th>
                   <td class="text-center"><i class="fas fa-check"></i></td>
                   <td class="text-center"><i class="fas fa-check"></i></td>
                   <td class="text-center"><i class="fas fa-minus"></i></td>
               </tr>
               <tr class="border-bottom">
                   <th scope="row" class="font-weight-normal">Tag TRM Entries</th>
                   <td class="text-center"><i class="fas fa-check"></i></td>
                   <td class="text-center"><i class="fas fa-check"></i></td>
                   <td class="text-center"><i class="fas fa-minus"></i></td>
               </tr>
               <tr >
                   <th scope="row" class="font-weight-normal">View Tagged Entries</th>
                   <td class="text-center"><i class="fas fa-check"></i></td>
                   <td class="text-center"><i class="fas fa-check"></i></td>
                   <td class="text-center"><i class="fas fa-check"></i></td>
               </tr>
           </tbody>
       </table>
            </div>
    </div>
        <div class="modal-dialog membersDialog" role="document" style="width: 800px;">
            <div class="modal-content" style="width: 800px;">
                <div class="modal-header">

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row" style="width: 100%;">
                        <div class="col-5">
                            <div id="dvemailaddressModel">
                                <div class="">
                                    <div class="group">

                                        <input type="text" id="txtMemberName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 12px; background-color: #F6F6F6;" required />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label style="font-family: Roboto, sans-serif; font-size: 11px; color: grey; text-align: center; padding-top: 2px;">VA Email Address</label>
                                    </div>

                                </div>
                            </div>
                            <%--<input type="text" id="txtMemberName" style="border-radius: 35px; font-family: Roboto; font-size: 14px;" />--%>
                        </div>
                        <div class="col-3" style="text-align: left">
                            <div style="display: inline-block; height: 100px; overflow-y: auto;">
                                <label id="DisplayEmailText" style="color: black; font-family: Roboto; font-size: 10px; font-weight: normal"></label>
                                <label id="lblErrorMessage" style="color: red; font-family: Roboto; font-size: 10px; font-weight: normal"></label>
                                <label id="lblSuccessMessage" style="color: green; font-family: Roboto; font-size: 10px; font-weight: normal"></label>
                            </div>
                        </div>
                        <%--padding-top: 10px;--%>
                        <div class="col-4" style="padding-right: 0px; padding-left: 0px">
                            <div style="width: 20px; display: inline-block;">
                                <span class="d-none spinner-border spinner-border-sm" id="spinnerValidateUser" role="status" aria-hidden="true"></span>
                            </div>
                            <div style="display: inline-block;">
                                <div id='clickableDisabledValidate'></div>
                                <button type="button" class="cancelButton" onclick="validateUser(this);return false;" id="btnValidate">

                                    <%--<div style="width: 20px; display: inline-block;">--%>
                                        VALIDATE
                                    <%--</div>--%>
                                </button>
                            </div>
                            <%--&nbsp; &nbsp; &nbsp; &nbsp;--%>
                            <div style="display: inline-block;">
                                <div id='clickableDisabledAddMember'></div>
                                <button type="button" class="addmemberbutton" onclick="addMember();return false;" id="btnAddMember">
                                    <%--<div style="display: inline-block;">--%>
                                    <i class="fas fa-plus"></i>&nbsp;&nbsp;ADD MEMBER
                                    <%--</div>--%>
                                </button>
                            </div>

                            <%--<div style="display: inline-block;">
                                <i class="fas fa-times" style="color: black; cursor: pointer;" onclick="javascript:closeMemberModel();"></i>
                            </div>--%>
                        </div>

                    </div>

                    <div class="row" style="font-family: Roboto; font-size: 14px; font-weight: bold;">
                        <div class="col-12">
                            Members - <span id="spanselectedGroupName" style="font-family: Roboto; font-size: 14px; font-weight: bold; white-space: pre-wrap;"></span>
                        </div>
                    </div>
                    <br />
                    <div id="dvMembersList">
                    </div>
                </div>
                <div class="modal-footer">

                    <button type="button" id="btnDone" class="donebutton" onclick="javascript:btnDoneChange();return false;">
                        DONE
                    </button>

                    <%--<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="newGroupModel" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="newGroupModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document" style="width: 400px">
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
                        <div class="col-8">
                            <i class="fas fa-exclamation-triangle" id="InApprWarning" style="color: darkorange; display: none;"></i><span class="textcss" style="color: black; font-weight: bold; font-size: 14px;">&nbsp;CREATE NEW GROUP</span>
                        </div>
                        <%--<div class="col-sm-4" style="text-align: right">
                            <i class="fas fa-times" style="color: black; cursor: pointer;" onclick="javascript:closeNewGroupModel();"></i>
                        </div>--%>
                    </div>
                    <div class="row">
                        <br />
                    </div>
                    <div id="dvnewgrpModel">
                        <div class="container">
                            <div class="group">

                                <input type="text" id="txtNewGroupName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 12px; width: 100%; background-color: #F6F6F6;" required />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label style="font-family: Roboto, sans-serif; font-size: 11px; color: grey; text-align: center; padding-top: 2px">Group Name</label>
                            </div>

                        </div>
                    </div>

                    <%--  </div>
                    </div>--%>

                    <div class="row">
                        <div class="col-9" style="padding-left: 30px;">
                            <%--<label id="lblCreateGroupSuccessMessage" style="color: green; font-family: Roboto, sans-serif; font-weight: normal"></label>--%>
                            <label id="lblCreateGroupErrorMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal;"></label>
                            <label id="lblCreateGroupWarningMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal;"></label>

                        </div>
                        <div class="col-2" style="text-align: right; padding-right: 0px;">
                            <span id="charcounter" class="textcss">0/30</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12" style="padding-left: 30px;">
                            <span id="lblInApporipateWarningMessage" style="font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal"></span>
                        </div>
                    </div>
                    <%-- <div class="row" style="padding-top: 15px;">
                        <div class="col-12">
                            <span id="lblInApporipateWarningMessage1" style="font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal"></span>
                        </div>
                    </div>--%>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-12" style="text-align: center;">
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

    <div class="modal fade" id="newWGTagModel" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="newWGTagModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document" style="width: 400px">
            <div class="modal-content" style="width: 400px">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row" style="width: 100%">
                        <div class="col-8">
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

                                <input type="text" id="txtNewWgTagName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 12px; width: 100%; background-color: #F6F6F6;" required />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label style="font-family: Roboto, sans-serif; font-size: 11px; color: grey; text-align: center; padding-top: 1px;">Tag Name</label>
                            </div>

                        </div>
                    </div>

                    <%--  </div>
                    </div>--%>

                    <div class="row">
                        <div class="col-9" style="padding-left: 30px;">
                            <%--<label id="lblCreateWgTagSuccessMessage" style="color: green; font-family: Roboto, sans-serif; font-weight: normal"></label>--%>
                            <label id="lblCreateWgTagErrorMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal;"></label>
                            <label id="lblCreateWgTagWarningMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal"></label>

                        </div>
                        <div class="col-2" style="text-align: right; padding-right: 0px;">
                            <span id="charWgTagcounter" class="textcss">0/30</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12" style="padding-left: 30px;">
                            <span id="lblInApporipateWgTagWarningMessage" style="font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal"></span>
                        </div>
                    </div>
                    <%--<div class="row" style="padding-top: 15px;">
                        <div class="col-12">
                            <span id="lblInApporipateWgTagWarningMessage1" style="font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal"></span>
                        </div>
                    </div>--%>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-12" style="text-align: center;">
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

    <div class="modal fade" id="renameModel" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="renameModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document" style="width: 400px">
            <div class="modal-content" style="width: 400px">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row" style="width: 100%">
                        <div class="col-6">
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
                                <input type="text" id="txtRenameGroupName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 12px; width: 100%; background-color: #F6F6F6;" required />
                                <%--<input type="text" id="txtNewGroupName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 15px; width: 100%; background-color: #F6F6F6;" required />--%>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label style="font-family: Roboto, sans-serif; font-size: 11px; color: grey; text-align: center;">Group Name</label>
                            </div>

                        </div>
                    </div>

                    <%-- </div>
                    </div>--%>

                    <div class="row">
                        <div class="col-9" style="padding-left: 30px;">
                            <%--<label id="lblRenameGroupSuccessMessage" style="color: green; font-family: Roboto, sans-serif; font-weight: normal;"></label>--%>
                            <label id="lblRenameGroupErrorMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal;"></label>
                            <label id="lblRenameGroupWarningMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal;"></label>

                        </div>
                        <div class="col-2" style="text-align: right; padding-right: 0px;">
                            <span id="renamecharcounter" class="textcss">0/30</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12" style="padding-left: 30px;">
                            <span id="lblRenameInApporipateWarningMessage" style="font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal;"></span>
                        </div>
                    </div>
                    <%--<div class="row" style="padding-top: 15px;">
                        <div class="col-12">
                            <span id="lblRenameInApporipateWarningMessage1" style="font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal;"></span>
                        </div>
                    </div>--%>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-12" style="text-align: center;">
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

    <div class="modal fade" id="deleteModel" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document" style="width: 600px; right: 100px;">
            <div class="modal-content" style="width: 600px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row" style="width: 100%;">
                        <div class="col-6">
                            <i class="fas fa-exclamation-triangle" id="DeleteWarning" style="color: #EB5757;"></i><span class="textcss" style="color: black; font-weight: bold; font-size: 16px;">&nbsp; DELETE GROUP</span>
                        </div>
                        <%--<div class="col-sm-6" style="text-align: right">
                            <i class="fas fa-times" style="color: black; cursor: pointer;" onclick="javascript:closeDeleteGroupModel();"></i>
                        </div>--%>
                    </div>
                    <div class="row">
                        <br />
                    </div>
                    <div class="row" style="padding-bottom: 10px;">
                        <div class="col-12">
                            <span class="textcss" id="spandeletetext" style="color: black; font-weight: bold; font-size: 14px; white-space: pre-wrap;"></span>
                        </div>
                    </div>
                    <div class="row" style="padding-bottom: 10px;">
                        <div class="col-12">
                            <span id="deletegrouppopuptext" style="white-space: pre-wrap; font-family: Roboto, sans-serif; font-size: 12px;">Deleteing the group named <b>group name here</b> will remove the group from your view
                                as well as all group member's view. All <b>group name here</b> tags will be removed from any TRM entry tagged with a <b>group name here</b> tag.
                                Type the name "<b>group name here</b>" belwo to confirm you want to delete the <b>group name here</b> group and any associated group tags.
                            </span>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
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
                        <div class="col-8">
                            <label id="lblDeleteGroupErrorMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal;"></label>

                        </div>
                        <div class="col-4" style="text-align: right;">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-12" style="text-align: center;">
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

    <div class="modal fade" id="optoutGroupModal" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="optoutModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document" style="width: 400px">
            <div class="modal-content" style="width: 400px">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row" style="width: 100%">
                        <div class="col-6">
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
                        <div class="col-12">
                            <span id="optoutpopuptext" style="font-family: Roboto, sans-serif; font-size: 13px; white-space: pre-wrap;">Are you sure you want to delete this record?</span>

                        </div>
                    </div>
                    <br />
                    <%--<div class="row">
                        <div class="col-sm-12">

                            <input type="text" id="txtDeleteTagName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 15px; border-radius: 5px; width: 100%;" />
                        </div>
                    </div>--%>

                    <div class="row">
                        <div class="col-12">
                            <label id="lbloptoutErrorMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal;"></label>
                            <%--<label id="lbloptoutSuccessMessage" style="color: green; font-family: Roboto, sans-serif; font-weight: normal;"></label>
                            <label id="lbloptoutWarningMessage" style="color: deepskyblue; font-family: Roboto, sans-serif; font-weight: normal;"></label>--%>
                        </div>
                        <%--<div class="col-sm-4" style="text-align: right;">
                        </div>--%>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-12" style="text-align: center;">
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


    <div class="modal fade" id="renameTagModel" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="renameTagModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document" style="width: 400px">
            <div class="modal-content" style="width: 400px">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="javascript:closeRenameTagModel();">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row" style="width: 100%">
                        <div class="col-6">
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
                                <input type="text" id="txtRenameTagName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 12px; width: 100%; background-color: #F6F6F6;" required />
                                <%--<input type="text" id="txtNewGroupName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 15px; width: 100%; background-color: #F6F6F6;" required />--%>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label style="font-family: Roboto, sans-serif; font-size: 11px; color: grey; text-align: center; padding-top: 2px;">Tag Name</label>
                            </div>

                        </div>
                    </div>
                    <%--<input type="text" id="txtRenameTagName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 15px; border-radius: 5px; width: 100%;" />--%>
                    <%-- </div>
                    </div>--%>

                    <div class="row">
                        <div class="col-9" style="padding-left: 30px;">
                            <%--<label id="lblRenameTagSuccessMessage" style="color: green; font-family: Roboto, sans-serif; font-weight: normal;"></label>--%>
                            <label id="lblRenameTagErrorMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal;"></label>
                            <label id="lblRenameTagWarningMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal;"></label>

                        </div>
                        <div class="col-2" style="text-align: right; padding-right: 0px;">
                            <span id="renameTagcharcounter" class="textcss">0/30</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12" style="padding-left: 30px;">
                            <span id="lblRenameTagInApporipateWarningMessage" style="font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal;"></span>
                        </div>
                    </div>
                    <%--<div class="row" style="padding-top: 15px;">
                        <div class="col-12">
                            <span id="lblRenameTagInApporipateWarningMessage1" style="font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal;"></span>
                        </div>
                    </div>--%>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-12" style="text-align: center;">
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

    <div class="modal fade" id="deleteTagModel" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="deleteTagModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document" style="width: 400px">
            <div class="modal-content" style="width: 400px">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="javascript:closeDeleteTagModel();">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row" style="width: 100%">
                        <div class="col-6">
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
                        <div class="col-12">
                            <span id="deleteTagpopuptext" style="font-family: Roboto, sans-serif; font-size: 13px; white-space: pre-wrap;">Are you sure you want to delete this record?</span>

                        </div>
                    </div>
                    <br />
                    <%--<div class="row">
                        <div class="col-sm-12">

                            <input type="text" id="txtDeleteTagName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 15px; border-radius: 5px; width: 100%;" />
                        </div>
                    </div>--%>

                    <div class="row">
                        <div class="col-8">
                            <label id="lblDeleteTagErrorMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal;"></label>

                        </div>
                        <div class="col-4" style="text-align: right;">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-12" style="text-align: center;">
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


    <div class="modal fade" id="viewTRMModel" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="ViewTRMModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="javascript:closeviewTRMModel();">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row" style="width: 100%; padding-bottom: 5px;">
                        <div class="col-12">
                            <span style="color: black; font-family: Roboto, sans-serif; font-size: 16px; font-weight: bold;">TAGGED ENTRIES</span>
                        </div>
                    </div>
                    <div class="row" style="width: 100%; padding-top: 5px;" id="dvTaggedGroupName">
                        <div class="col-12">
                            <i class="fas fa-user-friends"></i> 
                            <span style="color: black; font-family: Roboto, sans-serif; font-size: 12px; font-weight: bold; white-space: pre-wrap;" id="spanTaggedGroupName"></span>
                        </div>
                    </div>
                    <div class="row" style="width: 100%; padding-top: 5px; padding-bottom: 5px;">
                        <div class="col-12">
                            <i class="fas fa-tag" style="color:black"></i>
                            <span style="color: black; font-family: Roboto, sans-serif; font-size: 12px; font-weight: bold; white-space: pre-wrap;" id="spanTaggedTagName"></span>
                        </div>
                    </div>
                    <div id="dvViewTRMEntries" style="height: 250px; overflow-y: auto; overflow-x: hidden;">
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-12" style="text-align: center;">

                            <button type="button" id="btnOkTaggedEntires" style="padding: 10px 30px 10px 30px;" class="enabledbutton" onclick="javascript:cancelviewTRMModal();return false;">
                                OK
                            </button>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="tagTRMModel" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="tagTRMModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="javascript:closetagTRMModel();">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="font-family: Roboto, sans-serif;">
                    <div class="row" style="width: 100%;">
                        <div class="col-12">
                            <span style="color: deepskyblue; font-family: Roboto, sans-serif; font-size: 11px;" id="lbltagEntryErrorMessage"></span>
                        </div>
                    </div>
                    <div class="row" style="width: 100%;">
                        <div class="col-12">
                            <span style="color: black; font-family: Roboto, sans-serif; font-size: 12px; white-space: pre-wrap;" id="tagentryGroupName"></span>
                        </div>
                    </div>
                    <div class="row" style="width: 100%; padding-bottom: 20px;">
                        <div class="col-12">
                            <span style="color: black; font-family: Roboto, sans-serif; font-size: 12px; white-space: pre-wrap;" id="tagentryTagName"></span>
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
                        <div class="col-12" style="text-align: center;">
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
    <input type="hidden" runat="server" id="hdnSelectedFilterType" value="PopularHighest"/>
    

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
        function morelessFunction() {
            var dots = document.getElementById("dots");
            var moreText = document.getElementById("more");
            var btnText = document.getElementById("moreless");
            if (dots.style.display === "none") {
                dots.style.display = "inline";
                btnText.innerHTML = "<u style='cursor:pointer'>Show more</u>";
                moreText.style.display = "none";
            } else {
                dots.style.display = "none";
                btnText.innerHTML = "<u style='cursor:pointer'>Show less</u>";
                moreText.style.display = "inline";
            }
        }

        function closeDowngradeMember() {
            $('#checkDowngradeMember').modal('hide');
            $("#MembersModel").modal('show');
            refreshWorkGroupMembers($('#ContentPlaceHolder1_hdnSelectedWGId').val(), 0);
        }
        function closeconfrmMembrDiv() {
            $('#confrmMembrDiv').modal('hide');
            $("#MembersModel").modal('show');
            refreshWorkGroupMembers($('#ContentPlaceHolder1_hdnSelectedWGId').val(), 0);
        }

        function closeRoleInfoPopup() {
            $("#dvRolePopup").hide();
            var enteredText = $("#txtMemberName").val();
            var enabled = false;
            if (enteredText.length == 0) {
                $('#btnValidate').attr('disabled', 'disabled');
                $('#btnValidate').removeClass('cancelButton').addClass('validatedisabledButton');
                $('#btnAddMember').attr('disabled', 'disabled');
                $('#btnAddMember').removeClass('addmemberbutton').addClass('disableaddmemberbutton');
            }
            else {
                enabled = true;
                $('#btnValidate').removeAttr('disabled');
                $('#btnValidate').removeClass('validatedisabledButton').addClass('cancelButton');
                $('#btnAddMember').removeAttr('disabled');
                $('#btnAddMember').removeClass('disableaddmemberbutton').addClass('addmemberbutton');
            }
            $('#clickableDisabledTrash').css({ 'width': '0px', 'height': '0px' });
            //$('#LockButton').removeAttr('disabled');

            $('.LockButton').each(function () {
                $(this).removeAttr('disabled');
            });
            enableClickonDisabled(enabled);
        }

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
            $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');

        }
        function canceltagTRMModel() {
            $("#tagTRMModel").modal('hide');
            $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
        }

        function closeviewTRMModel() {
            $("#viewTRMModel").modal('hide');
            $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
        }
        function cancelviewTRMModal() {
            $("#viewTRMModel").modal('hide');
            $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
        }
        function cancelRenameTagModal() {
            $("#renameTagModel").modal('hide');
            $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
        }
        function closeDeleteTagModel() {
            $("#deleteTagModel").modal('hide');
            $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
        }
        function cancelDeleteTagModal() {
            $("#deleteTagModel").modal('hide');
            $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
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

                        if ($('#ContentPlaceHolder1_hdnSelectedWGId').val() == '-1') {
                            $('#lblPTSuccessMessage').text('Tag applied successfully.');
                            $("#lblPTSuccessMessage").show().delay(5000).fadeOut();
                        }
                        else {
                            $('#lblGroupSuccessMessage').text('Tag applied successfully.');
                            $("#lblGroupSuccessMessage").show().delay(5000).fadeOut();
                        }

                        //$('#lblGroupSuccessMessage').text('Tag applied successfully.');                                                
                        $("#tagTRMModel").modal('hide');
                        $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                        getPersonalTags();
                        getAllUserWorkGroups();
                    }
                    else {
                        $('#lbltagEntryErrorMessage').text(data.d.Message);
                        $("#lbltagEntryErrorMessage").show().delay(5000).fadeOut();
                    }
                },
                error: function (jqXHR, status, error) {
                    if (status == 'error') {
                        $('#lbltagEntryErrorMessage').text('Internal Server Error occured');
                        $("#lbltagEntryErrorMessage").show().delay(5000).fadeOut();
                    }
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


            $('#hdnSelectedToolId').val('');
            $('#selectedToolTagtoApply').text('');

            $('#btnApplyTag').removeClass('enabledbutton').addClass('disabledbutton');
            $('#btnApplyTag').attr('disabled', 'disabled');

            if ($('#txtToolEntry').val().trim() != "") {
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

                                parentDiv += '<div class="row" style="font-family: Roboto;padding-top:10px;padding-bottom:10px;font-size:11px;"><div class="col-12"> Found ' + data.d.lstTools.length + ' entries in TRM </div></div>';
                                parentDiv += '<div class="list-group">';

                                $.each(data.d.lstTools, function (key, val) {
                                    var aid = 'a' + val.Tool_Id;
                                    parentDiv += '<a href="#" style="text-decoration: none;font-family: Roboto;font-size:11px;" class="list-group-item list-group-item-action" id="' + aid + '" onclick="javascript:selectedTool(' + val.Tool_Id + ');return false;">' + val.Tool_Name + '</a>'

                                });
                                //parentDiv += '</table>';
                                parentDiv += '</div>';
                                $('#dvViewTRMToolEntries').append(parentDiv);
                            }
                            $('#dvViewTRMToolEntries').scrollTop(0);
                            $('#btnApplyTag').removeClass('enabledbutton').addClass('disabledbutton');
                            $('#btnApplyTag').attr('disabled', 'disabled');
                        }

                    },
                    error: function (jqXHR, status, error) {
                        $('#spinnersearch').addClass('d-none');
                        //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                        //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                    }
                });
            }


        }

        function viewTRMEntriesModel(showGrp, aTagId, aWID, groupName) {

            $("#dvViewTRMEntries").animate({ scrollTop: 0 }, "slow");
            $("#viewTRMModel").modal('show');
            $('#dvTagPopup').hide();
            $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
           
            if (groupName != undefined) {
                $('#ContentPlaceHolder1_hdnSelectedWGName').val(groupName);
            }


            //if (showGrp == null && aTagId == null && aWID == null) { showGrp = true; }

            //if (groupName != "null") { showGrp = true; }

            if (aTagId != null) {
                $('#ContentPlaceHolder1_selectedTagId').val($('#btn' + aTagId).attr('tagId'));
                $('#ContentPlaceHolder1_selectedTagName').val($('#btn' + aTagId).attr('tagName'));
                //showGrp = true;
            }
            var wgId = $('#ContentPlaceHolder1_hdnSelectedWGId').val()
            if (showGrp == null) {
                if (wgId == "-1") {
                    showGrp = false;
                }
                else {
                    showGrp = true;
                }
            }
            if (aWID != null) {
                var tagId = $('#btn' + aWID).attr('tagId');
                var tagName = $('#btn' + aWID).attr('tagName');
                if (!showGrp) {
                    $('#ContentPlaceHolder1_selectedTagId').val(tagId);
                    $('#ContentPlaceHolder1_selectedTagName').val(tagName);
                }
            }

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
                            //var wgId = $('#ContentPlaceHolder1_hdnSelectedWGId').val()
                            //parentDiv += '<div class="row"><div class="col-sm-12"><span id="spanVwGroupName">' + $('#Group' + wgId).attr('groupName') +'<span></div></div>';

                            if (showGrp) {
                                //$('#spanTaggedGroupName').text(' Group - ' + $('#Group' + $('#ContentPlaceHolder1_hdnSelectedWGId').val()).attr('groupName'));
                                $('#spanTaggedGroupName').text(' Group - ' + $('#ContentPlaceHolder1_hdnSelectedWGName').val())
                                $('#spanTaggedGroupName').show();
                                $('#dvTaggedGroupName').show();
                            } else {
                                $('#spanTaggedGroupName').text('');
                                $('#dvTaggedGroupName').hide();
                                $('#spanTaggedGroupName').hide();
                            }
                            if (showGrp) {
                                $('#spanTaggedTagName').text('  Group Tag - ' + $('#ContentPlaceHolder1_selectedTagName').val());
                            }
                            else {
                                $('#spanTaggedTagName').text(' Personal Tag - ' + $('#ContentPlaceHolder1_selectedTagName').val());
                            }

                            parentDiv += '<div class="row" style="font-family: Roboto;padding-top:10px;padding-bottom:10px;font-size:11px;font-weight:bold;"><div class="col-12"> Entries (' + data.d.lstTools.length + ')</div></div>';

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
            $('#renameTagcharcounter').css('color', 'black');
            $("#renameTagModel").modal('show');
            $('#dvTagPopup').hide();
            $('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val('False');
            $('#lblRenameTagErrorMessage').text('');
            $('#lblRenameTagWarningMessage').text('');
            $('#lblRenameTagInApporipateWarningMessage').html('');
            $('#InRenameTagApprWarning').hide();
            //$('#renamecharcounter').text('0/30');
            $('#btnRenameTag').attr('disabled', 'disabled');
            $('#btnRenameTag').removeClass('enabledbutton').addClass('disabledbutton');
        }
        function renameTag() {
            //ajax method rename
            $('#InRenameTagApprWarning').hide();
            $('#lblRenameTagInApporipateWarningMessage').html('');
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

                            var txtMsg = '<p style="text-align:left;">The word(s) "' + $('#txtRenameTagName').val() + '" have been flagged as inappropriate. TRM Admins monitor all site activity.</p><p style="text-align:left;">You may change the name or continue adding the group name if you received this message in error.</p>';
                            $('#lblRenameTagInApporipateWarningMessage').html(txtMsg);

                            //var txtMsg1 = 'You may change the name or continue adding the group name if you received this message in error.';
                            //$('#lblRenameTagInApporipateWarningMessage1').html(txtMsg1);

                            $('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val('True');
                            $('#lblRenameTagErrorMessage').text('Inappropriate word detected');
                            $('#lblRenameTagWarningMessage').text('');
                        }
                        else if (!data.d.IsValid) {
                            //data.d.Message
                            $('#lblRenameTagErrorMessage').text(data.d.Message)
                        }
                        else {
                            $("#renameTagModel").modal('hide');

                            if ($('#ContentPlaceHolder1_hdnSelectedWGId').val() == '-1') {
                                $('#lblPTSuccessMessage').text('Tag renamed successfully.');
                                $("#lblPTSuccessMessage").show().delay(5000).fadeOut();
                            }
                            else {
                                $('#lblGroupSuccessMessage').text('Tag renamed successfully.');
                                $("#lblGroupSuccessMessage").show().delay(5000).fadeOut();
                            }
                            getAllUserWorkGroups();
                            getPersonalTags();
                            //lblSuccessMessage
                            //$('#lblRenameGroupSuccessMessage').text(data.d.Message)
                            //window.location.reload();
                            //getWGMembersById(wgId);
                        }
                    }

                },
                error: function (jqXHR, status, error) {
                    /*$('#spinnerRenameTag').addClass('d-none');*/
                    if (status == 'error') {
                        $('#lblRenameTagErrorMessage').show();
                        $('#lblRenameTagErrorMessage').text('Internal Server Error occured');
                    }
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });

        }
        function deleteTagModel() {
            $("#deleteTagModel").modal('show');
            if ($('#ContentPlaceHolder1_hdnSelectedWGId').val() == '-1')
                $('#deleteTagpopuptext').html("Are you sure you want to delete the tag <b>" + $('#ContentPlaceHolder1_selectedTagName').val() + "</b>? This cannot be undone.");
            else
                $('#deleteTagpopuptext').html("Are you sure you want to delete the tag <b>" + $('#ContentPlaceHolder1_selectedTagName').val() + "</b> from the group <b>" + $('#ContentPlaceHolder1_hdnSelectedWGName').val() + "</b>? This cannot be undone.");


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
                            //getWGMembersById(wgId);
                        }
                    }
                },
                error: function (jqXHR, status, error) {
                    if (status == 'error') {
                        $('#lbloptoutErrorMessage').show();
                        $('#lbloptoutErrorMessage').text('Internal Server Error occured');
                    }
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
                            if ($('#ContentPlaceHolder1_hdnSelectedWGId').val() == '-1') {
                                $('#lblPTSuccessMessage').text('Tag deleted successfully.');
                                $("#lblPTSuccessMessage").show().delay(5000).fadeOut();
                            }
                            else {
                                $('#lblGroupSuccessMessage').text('Tag deleted successfully.');
                                $("#lblGroupSuccessMessage").show().delay(5000).fadeOut();
                            }
                            //$('#lblGroupSuccessMessage').text('Tag deleted successfully.');                                                       
                            getAllUserWorkGroups();
                            getPersonalTags();
                            //getWGMembersById(wgId);
                        }
                    }
                },
                error: function (jqXHR, status, error) {
                    if (status == 'error') {
                        $('#lblDeleteTagErrorMessage').show();
                        $('#lblDeleteTagErrorMessage').text('Internal Server Error occured');
                    }
                    //$('#spinnerDeleteTag').addClass('d-none');
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });
        }

        function btnDoneChange() {
            getAllUserWorkGroups();
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
            $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
        }
        function renameWorkGroup() {

            $('#InRenameApprWarning').hide();
            $('#lblRenameInApporipateWarningMessage').html('');
            /*$('#lblRenameInApporipateWarningMessage1').html('');*/
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
                            var txtMsg = '<p style="text-align:left;">The word(s) "' + $('#txtRenameGroupName').val() + '" have been flagged as inappropriate. TRM Admins monitor all site activity.</p><p style="text-align:left;">You may change the name or continue adding the group name if you received this message in error.</p>';
                            $('#lblRenameInApporipateWarningMessage').html(txtMsg);
                            //var txtMsg1 = 'You may change the name or continue adding the group name if you received this message in error.';
                            //$('#lblRenameInApporipateWarningMessage1').html(txtMsg1);
                            $('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val('True');
                            $('#lblRenameGroupErrorMessage').text('Inappropriate word detected');
                            $('#lblRenameGroupWarningMessage').text('');
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
                            //lblSuccessMessage
                            //$('#lblRenameGroupSuccessMessage').text(data.d.Message)
                            //window.location.reload();
                            //getWGMembersById(wgId);
                        }
                    }

                },
                error: function (jqXHR, status, error) {
                    if (status == 'error') {
                        $('#lblRenameGroupErrorMessage').show();
                        $('#lblRenameGroupErrorMessage').text('Internal Server Error occured');
                    }
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
                            //getWGMembersById(wgId);
                        }
                    }
                },
                error: function (jqXHR, status, error) {
                    if (status == 'error') {
                        $('#lblDeleteGroupErrorMessage').show();
                        $('#lblDeleteGroupErrorMessage').text('Internal Server Error occured');
                    }
                    //$('#spinnerDeleteGroup').addClass('d-none');
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });
        }

        function renameGroup() {
            $('#txtRenameGroupName').val($('#ContentPlaceHolder1_hdnSelectedWGName').val());
            $('#renamecharcounter').text($('#txtRenameGroupName').val().length + '/30');
            $('#renamecharcounter').css('color', 'black');
            $("#renameModel").modal('show');
            $('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val('False');
            $('.grouppop').slideFadeToggle();
            $('#lblRenameGroupErrorMessage').text('');
            $('#lblRenameGroupWarningMessage').text('');
            $('#lblRenameInApporipateWarningMessage').html('');
            $('#txtRenameGroupName').focus();
            $('#btnRenameWorkGroup').attr('disabled', 'disabled');
            $('#btnRenameWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
            $('#InRenameApprWarning').hide();
        }
        function deleteGroup() {
            $('#txtDeleteGroupName').val('');
            $('#spandeletetext').text('Group Name - ' + $('#ContentPlaceHolder1_hdnSelectedWGName').val())
            $('#deletegrouppopuptext').html('<p style="text-align:left;">Deleting the group named <b>' + $('#ContentPlaceHolder1_hdnSelectedWGName').val() + '</b> will remove the group from your view as well as all group members view. All <b>' + $('#ContentPlaceHolder1_hdnSelectedWGName').val() + '</b> tags will be removed from any TRM entry tagged with a <b>' + $('#ContentPlaceHolder1_hdnSelectedWGName').val() + '</b> tag.</p><p style="text-align:left;">Type the name "' + $('#ContentPlaceHolder1_hdnSelectedWGName').val() + '" below to confirm you want to delete the <b>' + $('#ContentPlaceHolder1_hdnSelectedWGName').val() + '</b> group and any associated group tags. </p>')
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
            $('#lblCreateGroupWarningMessage').text('');
            $('#btnCreateWorkGroup').attr('disabled', 'disabled');
            $('#btnCreateWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
            // $('#btnCreateWorkGroup').css('background-color', 'grey');
            $("#newGroupModel").modal('show');
            $('#InApprWarning').hide();
            $('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val('False');
            $('#lblInApporipateWarningMessage').html('');
            $('#lblInApporipateWarningMessage1').html('');
            $('#charcounter').text('0/30');
            $('#charcounter').css('color', 'black');
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
                                var txtMsg = '<p style="text-align:left;">The word(s) "' + $('#txtNewGroupName').val() + '" have been flagged as inappropriate. TRM Admins monitor all site activity.</p><p style="text-align:left;">You may change the name or continue adding the group name if you received this message in error.</p>';
                                $('#lblInApporipateWarningMessage').html(txtMsg);
                                //var txtMsg1 = 'You may change the name or continue adding the group name if you received this message in error.';
                                //$('#lblInApporipateWarningMessage1').html(txtMsg1);
                                $('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val('True');
                                $('#lblCreateGroupErrorMessage').text('Inappropriate word detected');
                                $('#lblCreateGroupWarningMessage').text('');
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
                                closeNewGroupModel();
                                //getWGMembersById(wgId);
                            }
                        }

                    },
                    error: function (jqXHR, status, error) {
                        if (status == 'error') {
                            $('#lblCreateGroupErrorMessage').show();
                            $('#lblCreateGroupErrorMessage').text('Internal Server Error occured');
                        }
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
        function getPersonalTags() {

            $.ajax({
                url: 'TagManagement.aspx/getPersonalTags',
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    if (data != null) {

                        if (data.d.IsValid) {

                            var lstTags = data.d.lstAllTags;
                            $('#dvWGPersonalTagsContainer').empty();
                            var userId = $('#ContentPlaceHolder1_hdnLoggedInUserId').val();
                            // hdnSelectedFilterType
                           
                            var filtertype = $('#ContentPlaceHolder1_hdnSelectedFilterType').val();
                            var templstAllTags = '';
                            if (filtertype == "PopularHighest") {
                               // templstAllTags = _.sortBy(data.d.lstAllTags, 'EntryCount').reverse();
                                templstAllTags = _.sortBy(data.d.lstAllTags, [{ 'EntryCount': 'desc' }, { 'LOWER_TAG_LABEL': 'asc' }]);
                            }
                            else if (filtertype == "PopularLowest") {
                                templstAllTags = _.sortBy(data.d.lstAllTags, 'EntryCount');
                            }
                            else if (filtertype == "NameAtoZ") {
                                templstAllTags = _.sortBy(data.d.lstAllTags, 'LOWER_TAG_LABEL');
                            }
                            else if (filtertype == "NameZtoA") {
                                templstAllTags = _.sortBy(data.d.lstAllTags, 'LOWER_TAG_LABEL').reverse();
                            }
                            else if (filtertype == "CreatedNewest") {
                                templstAllTags = _.sortBy(data.d.lstAllTags, 'CREATED_DATE').reverse();
                            }
                            else if (filtertype == "CreatedOldest") {
                                templstAllTags = _.sortBy(data.d.lstAllTags, 'CREATED_DATE');
                            }
                            else
                                templstAllTags = data.d.lstAllTags;

                            //$('#ContentPlaceHolder1_hdnlstpersonalTags').val('');
                           
                            var Counter = 0;
                            var counter = 0;
                            var totalPersonalCount = 0;
                            var parentDiv = '<div class="row" style="padding-top:5px;"><div class="col-12">'
                            $.each(templstAllTags, function (key, val) {

                                //var dbbuttonstemp = 'dvButtonsTag' + val.WG_ID;
                                btnId = "btn" + val.TAG_ID;
                                var dvId = "dv" + val.TAG_ID;
                                var aNull = null;
                                parentDiv += '<div style="display:inline-block;padding:4px 4px 4px 4px;"><div Id=' + dvId + ' style="display:flex;background-color:rgb(220, 230, 250);border-radius:2px;height:28px;" ><div style="font-size:12px;display:inline-block;border-radius:6px;">'
                                parentDiv += '<div Id=' + btnId + ' tagId=' + val.TAG_ID + ' tagName="' + val.TAG_LABEL + '" class="tagellipsisbuttonpt"  style="height:100%;width:7px;float:left;cursor:pointer;padding-left:5px;padding-right:5px;padding-top:5px;"><i class="fas fa-ellipsis-v tag" style="color: #757575;cursor:pointer;"></i></div>'
                                parentDiv += '<div style="height:100%;float:left;padding-right:10px;padding-top:7px;font-size:11px;font-family: Roboto, sans-serif;font-weight:border-radius: 3px;white-space: pre-wrap;cursor:pointer" onclick="javascript:viewTRMEntriesModel(' + false + ',' + val.TAG_ID + ',' + aNull + ',null);return false;">&nbsp;&nbsp;<i class="fas fa-user"></i>&nbsp;&nbsp;' + val.TAG_LABEL + ' (' + val.EntryCount + ')' + '</div></div></div></div>';
                                counter++;

                            });

                            parentDiv += '</div>';
                            // parentDiv += '</div>'
                            $('#dvWGPersonalTagsContainer').append(parentDiv);
                            if (counter == 0) {
                                parentDiv = '';
                                parentDiv += '<div style="display: inline-block;padding-right:10px;font-size:11px;font-family: Roboto, sans-serif;"><p> You have no personal tags</p></div>';
                                $('#dvWGPersonalTagsContainer').append(parentDiv);
                            }
                            $('#spanPersonalTotalTags').text(counter);


                            $('.newtagbutton').each(function () {
                                document.querySelector('#' + $(this).attr('id')).addEventListener('click', createRippleDifColor);

                            });

                            $('.confrmMembrDiv').each(function () {
                                document.querySelector('#' + $(this).attr('id')).addEventListener('click', createRippleDifColor);
                            });

                            $('.tagellipsisbuttonpt').click(function () {
                                $('#tagentryGroupName').hide();
                                $('#spanTaggedGroupName').hide();
                                $('#dvTaggedGroupName').hide();
                                $('#ContentPlaceHolder1_hdnSelectedWGId').val(-1);
                                var btnid = $(this).attr('tagId');
                                $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');

                                if ($('#dvTagPopup').is(':visible')) {
                                    $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                                    $('#dvTagPopup').hide();
                                }
                                else {
                                    var tagId = $('#btn' + btnid).attr('tagId');
                                    var tagName = $('#btn' + btnid).attr('tagName');

                                    $('#ContentPlaceHolder1_selectedTagId').val(tagId);
                                    $('#ContentPlaceHolder1_selectedTagName').val(tagName);

                                    $('#dv' + tagId).css('background-color', 'rgb(205, 207, 215)');

                                    var btn1 = $(this);
                                    $('.tagpop').css('position', 'absolute');
                                    var top = btn1.offset().top + btn1.outerHeight() + 3;
                                    var left = btn1.offset().left - 3;

                                    if (left > $('#content-main').width()) {
                                        var diff = (left - $('#content-main').width()) - 10;
                                        left = left - diff;
                                    }
                                    $('.tagpop').css('top', (top - 100));
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
                            var WorkGroupCounter = 0;
                            //spanGroupCount
                            var tagEntryCount = 0;
                            $.each(lstWgs, function (key, val) {
                                WorkGroupCounter++;
                                var wgId = val.WG_ID;
                                var wgLabel = val.WG_LABEL;
                                var divId = 'div' + Counter;
                                var groupId = 'Group' + wgId;
                                var u = lstAllWgMembers.find(m => m.WG_ID == wgId); // Tripti && m.UserId == $('#ContentPlaceHolder1_hdnLoggedInUserId').val());
                                var parentDiv = '<div class="col" style="min-width:450px;"><div class="card shadow">';
                                parentDiv += '<div class="card-body">';
                                parentDiv += '<div class="card-title"> ';
                                parentDiv += '<div class="row"><div class="col-1" style="display:inline-block;vertical-align: middle;"> '
                                //if (u.Role == '1') {
                                parentDiv += '<div class="CustomButtons" RoleId=' + u.Role + ' Id=' + groupId + '  groupId="' + wgId + '" groupName="' + val.WG_LABEL + '" style="width:7px;display: inline-block;cursor:pointer;"><i class="fas fa-ellipsis-v grp" style="color: #757575;cursor:pointer;"></i></div>'
                                //}
                                parentDiv += '</div>';
                                parentDiv += '<div class="col-10" style="padding-top:3px;display:inline-block;vertical-align: middle;font-family: Roboto, sans-serif;font-size:12px;color: #283154;font-weight:bold;padding-left:0px;white-space: pre-wrap;">' + val.WG_LABEL;

                                //parentDiv += '<p style="font-size:10px">Group Owner:</p></div></div><div class="col-sm-6">'
                                parentDiv += '</div><div class="col-1">'
                                parentDiv += '<div style="text-align:right" class="card-toggle" data-toggle="collapse" data-target="#' + divId + '"> </div>'
                                //< i class="icons float-right fas fa-chevron-up" ></i >
                                parentDiv += '</div>';

                                var creatorlen = 0;
                                if (val.Creator != null) {
                                    creatorlen = val.Creator.length;
                                    parentDiv += '<div class="row"><div class="col-1"></div><div class="col-11" style="padding-left:5px;"><span style="font-family: Roboto, sans-serif;font-size:9px;color: #283154;font-weight:500;">Creator: ' + val.Creator.substring(0, 34) + '</span>'
                                }
                                else {
                                    parentDiv += '<div class="row"><div class="col-1"></div><div class="col-11" style="padding-left:5px;"><span style="font-family: Roboto, sans-serif;font-size:9px;color: #283154;font-weight:500;">Creator: ' + val.Creator + '</span>'

                                }
                                //parentDiv += '<div class="row"><div class="col-sm-1"></div><div class="col-sm-10" style="padding-left:5px;"><span style="font-family: Roboto, sans-serif;font-size:9px;color: #283154;font-weight:500;">Creator : ' + val.Creator.substring(0, 29) + '</span>'
                                if (creatorlen > 35) {
                                    parentDiv += '<span style="cursor: pointer;" title="' + val.Creator + '">... </span>';
                                }
                                parentDiv += '</div></div>'
                                parentDiv += '</div><hr style="border-top:0px;margin:0px"></div>';
                                var counter = 0;

                                var tagsdiv = '';
                                var groupName = "";
                                tagsdiv += '<div class="row" style="padding-top:5px;"><div class="col-12">'


                                var filtertype = $('#ContentPlaceHolder1_hdnSelectedFilterType').val();
                              
                                var filteredTags = _.filter(lstAllWgTags, function (item, i) {
                                    return item.WG_ID.toString() === wgId.toString()
                                });

                                if (filtertype == "PopularHighest") {

                                    templstAllTags = _.sortBy(filteredTags, [{ 'EntryCount': 'desc' }, { 'LOWER_TAG_LABEL': 'asc' }]);
                                    //.reverse();
                                }
                                else if (filtertype == "PopularLowest") {
                                    templstAllTags = _.sortBy(filteredTags, 'EntryCount');
                                }
                                else if (filtertype == "NameAtoZ") {
                                    templstAllTags = _.sortBy(filteredTags, 'LOWER_TAG_LABEL');
                                }
                                else if (filtertype == "NameZtoA") {
                                    templstAllTags = _.sortBy(filteredTags, 'LOWER_TAG_LABEL').reverse()
                                }
                                else if (filtertype == "CreatedNewest") {
                                    templstAllTags = _.sortBy(filteredTags, 'CREATED_DATE').reverse();
                                }
                                else if (filtertype == "CreatedOldest") {
                                    templstAllTags = _.sortBy(filteredTags, 'CREATED_DATE');
                                }
                                else
                                    templstAllTags = filteredTags;

                                $.each(templstAllTags, function (key, val) {
                                    var dbbuttonstemp = 'dvButtonsTag' + val.WG_ID;
                                    btnId = "btn" + val.TAG_ID;
                                    var dvId = "dv" + val.TAG_ID;
                                    if (wgId == val.WG_ID) {
                                        var record = _.find(lstAllWgMembers, function (item) { return item.WG_ID === val.WG_ID });
                                        var wrecord = _.find(lstWgs, function (item) { return item.WG_ID === val.WG_ID });
                                        if (wrecord != null) {
                                            groupName = wrecord.WG_LABEL;
                                        }

                                        if (record != undefined) {
                                            tagsdiv += '<div style="display:inline-block;padding:4px 4px 4px 4px;"><div Id=' + dvId + ' style="display:flex;height:28px;background-color:rgb(220, 230, 250);border-radius:2px;" ><div style="font-size:12px;display:inline-block;border-radius:6px;">'
                                            tagsdiv += '&nbsp;<div RoleId=' + u.Role + ' Id=' + btnId + ' wgId=' + val.WG_ID + ' tagId=' + val.TAG_ID + ' tagName="' + val.TAG_LABEL + '" groupName="' + groupName + '" class="tagellipsisbutton"  style="width:7px;float:left;height:100%;cursor:pointer;padding-left:5px;padding-right:5px;padding-top:5px;"><i class="fas fa-ellipsis-v tag" style="color: #757575;cursor:pointer;"></i></div>'
                                            tagsdiv += '<div style="height:100%;float:left;padding-right:10px;padding-top:7px;font-size:11px;font-family: Roboto, sans-serif;font-weight:border-radius: 3px;white-space: pre-wrap;cursor:pointer" onclick="javascript:viewTRMEntriesModel(' + true + ',' + val.TAG_ID + ',' + val.WG_ID + ',\'' + groupName + '\');return false;">&nbsp;&nbsp;<i class="fas fa-user-friends"></i>&nbsp;&nbsp;' + val.TAG_LABEL + ' (' + val.EntryCount + ')' + '</div></div></div></div>';
                                            counter++;
                                        }
                                    }
                                });

                                tagsdiv += '</div>';
                                tagsdiv += '</div>';

                                parentDiv += '<div class="card-text showdiv" id="' + divId + '"  >'
                                parentDiv += '<div class="row"><div class="col-7"><span style="font-family: Roboto;font-size:10px;font-weight:bold">&nbsp;&nbsp;TAGS&nbsp;(' + counter + ')</span></div><div class="col-5" style="padding-left:30px;">';



                                u1 = lstAllWgMembers.find(m => m.WG_ID == wgId);// Tripti && m.UserId == $('#ContentPlaceHolder1_hdnLoggedInUserId').val());
                                var btnId = 'btnaddNewWGTag' + wgId;
                                if (u1.Role == '1' || u1.Role == '2') {
                                    parentDiv += '<button id="' + btnId + '" OnClick="javascript:openWgTagModel(' + wgId + ');return false;" class="newtagbutton"><i class="fas fa-plus" style="color:#283154"></i> &nbsp;&nbsp;NEW TAG</button>';
                                }
                                parentDiv += '</div></div>'

                                parentDiv += tagsdiv;

                                parentDiv += '</div>';
                                parentDiv += '</div><span class="horizontallinecardbody" style="margin-left:10px;margin-right:10px;"></span>';
                                parentDiv += '<div class="card-body"><div class="row"> <div class="col-7"></div><div class="col-5" style="padding-right:0px;padding-left:30px">'
                                //u = lstAllWgMembers.find(m => m.WG_ID == wgId && m.UserId == $('#ContentPlaceHolder1_hdnLoggedInUserId').val());
                                var btnId = "btnMembers" + val.WG_ID;
                                if (u.Role == '1') {
                                    parentDiv += '<button id="' + btnId + '" wgLabel="' + wgLabel +'" OnClick="getWGMembersById(' + val.WG_ID + ');return false;" class="membersbutton" ><i class="fas fa-users"></i>&nbsp;&nbsp;MEMBERS</button>';
                                }
                                parentDiv += '</div> </div> </div></div>';
                                Counter++;
                                $('#dvWGTagsContainer').append(parentDiv);


                            });
                            $('#spanGroupCount').text(WorkGroupCounter);
                            if (WorkGroupCounter == 0) {
                                parentDiv = '';
                                parentDiv += '<div style="display: inline-block;padding-right:10px;font-size:11px;font-family: Roboto, sans-serif;"><p> You are not a member of any groups</p></div>';
                                $('#dvWGTagsContainer').append(parentDiv);
                            }
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
                                        $('#dvhorzline').hide();
                                    }
                                    else {
                                        $('#dvRenameGroup').show();
                                        $('#dvDeleteGroup').show();
                                        $('#dvhorzline').show();
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
                                $('#tagentryGroupName').show();
                                $('#spanTaggedGroupName').show();
                                $('#dvTaggedGroupName').show();
                                $('#ContentPlaceHolder1_hdnSelectedWGId').val(0);
                                var btnid = $(this).attr('tagId');
                                $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');

                                if ($('#dvTagPopup').is(':visible')) {
                                    $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                                    $('#dvTagPopup').hide();
                                }
                                else {
                                    var tagId = $('#btn' + btnid).attr('tagId');
                                    var tagName = $('#btn' + btnid).attr('tagName');
                                    var wgId = $('#btn' + btnid).attr('wgId');
                                    var RoleId = $('#btn' + btnid).attr('RoleId');
                                    var groupName = $('#btn' + btnid).attr('groupName');

                                    $('#ContentPlaceHolder1_selectedTagId').val(tagId);
                                    $('#ContentPlaceHolder1_selectedTagName').val(tagName);
                                    $('#ContentPlaceHolder1_hdnSelectedWGId').val(wgId);
                                    $('#ContentPlaceHolder1_hdnSelectedWGName').val(groupName);


                                    $('#dv' + tagId).css('background-color', 'rgb(205, 207, 215)');

                                    $('#ContentPlaceHolder1_hdnSelectedWGName').val($('#Group' + wgId).attr('groupname'));
                                    if (RoleId != 1 && RoleId != 2) {
                                        $('#dvtagTRMEntry').hide();
                                        $('#dvRenameTag').hide();
                                        $('#dvDeleteTag').hide();
                                        $('#dvTagshorzline').hide();
                                    }
                                    else {
                                        $('#dvtagTRMEntry').show();
                                        $('#dvRenameTag').show();
                                        $('#dvDeleteTag').show();
                                        $('#dvTagshorzline').show();
                                    }

                                    var btn1 = $(this);
                                    $('.tagpop').css('position', 'absolute');
                                    var top = btn1.offset().top + btn1.outerHeight() + 3;
                                    var left = btn1.offset().left - 3;

                                    if (left > $('#content-main').width()) {
                                        var diff = (left - $('#content-main').width()) - 10;
                                        left = left - diff;
                                    }
                                    $('.tagpop').css('top', (top - 100));
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
        function changefilter(filtertype) {

            $('#ContentPlaceHolder1_hdnSelectedFilterType').val(filtertype);

            getAllUserWorkGroups();
            getPersonalTags();
        }

        $(document).ready(function () {

            $('#tagFilter').change(function () {
                changefilter($(this).val());
            });

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

            //$('#siteHeader1').attr('height', '72');
            //$('#siteHeader2').attr('height', '30');

            $('#clickableDisabledValidate').on('click', function () {
                var enabled = false;
                if ($('#btnValidate:disabled').length > 0) {
                    if ($('#dvRolePopup').is(':visible')) {
                        $('#dvRolePopup').hide();
                        var enteredText = $("#txtMemberName").val();
                        if (enteredText.length == 0) {
                            $('#btnValidate').attr('disabled', 'disabled');
                            $('#btnValidate').removeClass('cancelButton').addClass('validatedisabledButton');
                            $('#btnAddMember').attr('disabled', 'disabled');
                            $('#btnAddMember').removeClass('addmemberbutton').addClass('disableaddmemberbutton');
                        }
                        else {
                            enabled = true;
                            $('#btnValidate').removeAttr('disabled');
                            $('#btnValidate').removeClass('validatedisabledButton').addClass('cancelButton');
                            $('#btnAddMember').removeAttr('disabled');
                            $('#btnAddMember').removeClass('disableaddmemberbutton').addClass('addmemberbutton');
                        }
                    }
                }
                enableClickonDisabled(enabled);
            });

            $('#clickableDisabledTrash').on('click', function () {

                if ($('#LockButton:disabled').length > 0) {
                    if ($('#dvRolePopup').is(':visible')) {
                        $('#dvRolePopup').hide();
                        $('#clickableDisabledTrash').css({ 'width': '0px', 'height': '0px' });
                        //$('#LockButton').removeAttr('disabled');
                        $('.LockButton').each(function () {
                            $(this).removeAttr('disabled');
                        });
                    }
                }

            });
            $('#clickableDisabledAddMember').on('click', function () {
                var enabled = false;
                if ($('#btnAddMember:disabled').length > 0) {
                    if ($('#dvRolePopup').is(':visible')) {
                        $('#dvRolePopup').hide();
                        var enteredText = $("#txtMemberName").val();
                        if (enteredText.length == 0) {
                            $('#btnValidate').attr('disabled', 'disabled');
                            $('#btnValidate').removeClass('cancelButton').addClass('validatedisabledButton');
                            $('#btnAddMember').attr('disabled', 'disabled');
                            $('#btnAddMember').removeClass('addmemberbutton').addClass('disableaddmemberbutton');
                        }
                        else {
                            enabled = true;
                            $('#btnValidate').removeAttr('disabled');
                            $('#btnValidate').removeClass('validatedisabledButton').addClass('cancelButton');
                            $('#btnAddMember').removeAttr('disabled');
                            $('#btnAddMember').removeClass('disableaddmemberbutton').addClass('addmemberbutton');
                        }
                    }
                }
                enableClickonDisabled(enabled);
            });

            $(document).on("click", function (e) {

                if (e.target.className != undefined) {

                    if ((e.target.className != 'fas fa-ellipsis-v grp') && (e.target.className != 'CustomButtons')) {
                        if ($('#dvGroupPopup').is(':visible')) {
                            $('#dvGroupPopup').hide();
                        }

                    }
                    if ((e.target.className != 'fas fa-ellipsis-v tag') && (e.target.className != 'tagellipsisbuttonpt') && (e.target.className != 'tagellipsisbutton')) {
                        if ($('#dvTagPopup').is(':visible')) {
                            $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                            ;
                            $('#dvTagPopup').hide();
                        }
                    }
                    if (e.target.className != 'fa fa-info-circle infoButton') {
                        var enabled = false;
                        if ($('#dvRolePopup').is(':visible')) {
                            $('#dvRolePopup').hide();
                            $('#clickableDisabledTrash').css({ 'width': '0px', 'height': '0px' });
                            //$('#LockButton').removeAttr('disabled');
                            $('.LockButton').each(function () {
                                $(this).removeAttr('disabled');
                            });
                            var enteredText = $("#txtMemberName").val();
                            if (enteredText.length == 0) {
                                $('#btnValidate').attr('disabled', 'disabled');
                                $('#btnValidate').removeClass('cancelButton').addClass('validatedisabledButton');
                                $('#btnAddMember').attr('disabled', 'disabled');
                                $('#btnAddMember').removeClass('addmemberbutton').addClass('disableaddmemberbutton');
                            }
                            else {
                                enabled = true;
                                $('#btnValidate').removeAttr('disabled');
                                $('#btnValidate').removeClass('validatedisabledButton').addClass('cancelButton');
                                $('#btnAddMember').removeAttr('disabled');
                                $('#btnAddMember').removeClass('disableaddmemberbutton').addClass('addmemberbutton');
                            }
                            enableClickonDisabled(enabled);
                        }
                    }
                }

            });

            // var lstAllInAppropriateWords = JSON.parse($('#ContentPlaceHolder1_hdnInApprWords').val());

            localStorage.removeItem('INAPPROWORDS');
            localStorage.setItem('INAPPROWORDS', $('#ContentPlaceHolder1_hdnInApprWords').val());

            //autocomplete(document.getElementById("ContentPlaceHolder1_txtToolEntryName"), lstEntries);

            $('#ContentPlaceHolder1_hdnInApprWords').val('');

            getAllUserWorkGroups();
            getPersonalTags();
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
            $('#charWgTagcounter').css('color', 'black');
            $('#lblCreateWgTagWarningMessage').text('');
            $('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val('False');
            $('#newWGTagModel').modal('show');
        }
        function openPsnlTagModel() {
            $('#txtNewWgTagName').val('');
            $('#lblInApporipateWgTagWarningMessage').html('');
            $('#lblInApporipateWgTagWarningMessage1').html('');
            $('#lblCreateWgTagErrorMessage').text('');
            $('#lblCreateWgTagSuccessMessage').text('');
            $('#lblCreateWgTagWarningMessage').text('');
            $('#InApprWgTagWarning').hide();
            $('#btnCreateWgTag').attr('disabled', 'disabled');
            $('#btnCreateWgTag').removeClass('enabledbutton').addClass('disabledbutton');
            $('#charWgTagcounter').text('0/30');
            $('#charWgTagcounter').css('color', 'black');
            $('#lblCreateWgTagWarningMessage').text('');
            $('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val('False');
            $('#ContentPlaceHolder1_hdnSelectedWGId').val(-1);
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
            $('#lblCreateWgTagErrorMessage').text('');
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
                                var txtMsg = '<p style="text-align:left;">The word(s) "' + $('#txtNewWgTagName').val() + '" have been flagged as inappropriate. TRM Admins monitor all site activity.</p><p style="text-align:left;">You may change the name or continue adding the group name if you received this message in error.</p>';
                                $('#lblInApporipateWgTagWarningMessage').html(txtMsg);
                                //var txtMsg1 = 'You may change the name or continue adding the group name if you received this message in error.';
                                //$('#lblInApporipateWgTagWarningMessage1').html(txtMsg1);
                                $('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val('True');
                                $('#lblCreateWgTagErrorMessage').text('Inappropriate word detected');
                                $('#lblCreateWgTagWarningMessage').text('');
                            }
                            else if (!data.d.IsValid) {
                                //data.d.Message
                                $('#lblCreateWgTagErrorMessage').text(data.d.Message)
                            }
                            else {
                                //lblSuccessMessage
                                //$('#lblCreateGroupSuccessMessage').text(data.d.Message)
                                //window.location.reload();

                                if ($('#ContentPlaceHolder1_hdnSelectedWGId').val() == '-1') {
                                    $('#lblPTSuccessMessage').text('Tag created successfully.');
                                    $("#lblPTSuccessMessage").show().delay(5000).fadeOut();
                                }
                                else {
                                    $('#lblGroupSuccessMessage').text('Tag created successfully.');
                                    $("#lblGroupSuccessMessage").show().delay(5000).fadeOut();
                                }

                                // $('#lblGroupSuccessMessage').text('Tag created successfully.');                               
                                getAllUserWorkGroups();
                                getPersonalTags();
                                closeNewWGTagModel();
                                //getWGMembersById(wgId);
                            }
                        }

                    },
                    error: function (jqXHR, status, error) {
                        if (status == 'error') {
                            $('#lblCreateWgTagErrorMessage').show();
                            $('#lblCreateWgTagErrorMessage').text('Internal Server Error occured');
                        }
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
            refreshWorkGroupMembers(wgId, 0);

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
                    $('#spinnerValidateUser').addClass('d-none');
                    if (status == 'error') {
                        $('#lblErrorMessage').show();
                        $('#lblErrorMessage').text(email + ' is not a valid VA email address');
                    }
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });
            return false;
        }

        function roleChange(wgMemberId, origRole) {
            var id = 'ddlRole' + wgMemberId;
            var selectedRole = $('select#' + id + ' option:selected').val();
            var userId = $('#' + id).attr('UserId');
            var loggedInUser = $('#ContentPlaceHolder1_hdnLoggedInUserId').val();
            //var wgId = $('#ContentPlaceHolder1_hdnSelectedWGId').val();
            //var email = $('#txtMemberName').val();
            const daRoles = ["Owner", "Tag Manager", "Viewer"];
            $('#lblRole').text(daRoles[selectedRole - 1]);
            $('#lblErrorMessage').text('');
            $('#lblSuccessMessage').text('');
            $('#DisplayEmailText').text('');
            $('#lblErrorMessage').hide();
            $('#lblSuccessMessage').hide();
            $('#DisplayEmailText').hide();
            $('#Dwntruebtn').unbind('click');

            if (origRole == selectedRole) {
                // do nothing
            } else if (origRole > selectedRole) {
                changeRole(wgMemberId, selectedRole);
            } else {
                // Owner to tag manager or viewer
                if (origRole == 1 && userId == loggedInUser) {
                    $('#checkDowngradeMember').modal('show');
                    $('#checkDowngradeMember').focus();
                    $("#MembersModel").modal('hide');
                    $('#Dwntruebtn').on('click', function () {
                        $("#checkDowngradeMember").modal('hide');
                        
                        changeRole(wgMemberId, selectedRole);
                        $("#MembersModel").modal('hide');
                    });
                    // actually closed on the button
                    $('#Dwnfalsebtn').on('click', function () {
                        $("#checkDowngradeMember").modal('hide');
                        $("#MembersModel").modal('show');
                        refreshWorkGroupMembers($('#ContentPlaceHolder1_hdnSelectedWGId').val(), 0);
                    });
                } else {
                    // Tag manager to viewer
                    changeRole(wgMemberId, selectedRole);
                };
            }
            return false;
        }
        function changeRole(wgMemberId, selectedRole) {
            //confirm(wgMemberId+'<-->'+selectedRole)
            $.ajax({
                url: 'TagManagement.aspx/UpdateRoleChange?&wgMemberId=' + JSON.stringify(wgMemberId) + '&WgId=' + $('#ContentPlaceHolder1_hdnSelectedWGId').val() + '&roleId=' + selectedRole,
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    if (data != null) {
                        if (!data.d.IsValid) {
                            //data.d.Message
                            if (data.d.IsOwnerChanged) {
                                $("#MembersModel").modal('hide');
                                getAllUserWorkGroups();
                                //$('#lblErrorMessage').show("slow").delay(5000).hide("slow");
                                //refreshWorkGroupMembers($('#ContentPlaceHolder1_hdnSelectedWGId').val());
                            }
                            else {
                                $('#lblErrorMessage').text(data.d.Message);
                                $('#lblErrorMessage').show();
                                $('#lblSuccessMessage').hide();
                                $('#DisplayEmailText').hide();
                                //$('#lblErrorMessage').show("slow").delay(5000).hide("slow");
                                refreshWorkGroupMembers($('#ContentPlaceHolder1_hdnSelectedWGId').val(), 0);
                            }

                        }
                        else {
                            $('#lblSuccessMessage').text(data.d.Message)
                            $("#lblSuccessMessage").show().delay(5000).fadeOut();
                            $('#lblErrorMessage').hide();
                            $('#lblSuccessMessage').show();
                            $('#DisplayEmailText').hide();
                            var prePos = $('#tabbody').scrollTop();
                            refreshWorkGroupMembers($('#ContentPlaceHolder1_hdnSelectedWGId').val(), prePos);

                        }
                    }

                },
                error: function (jqXHR, status, error) {
                    if (status == 'error') {
                        $('#lblErrorMessage').show();
                        $('#lblErrorMessage').text('Internal Server Error occured');
                    }
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });

            return false;

        }
        function refreshWorkGroupMembers(wgId, scrollPosition) {
            $.ajax({
                url: 'TagManagement.aspx/getMemberList?WgId=' + wgId,
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                // data: JSON.stringify(requestObj),
                success: function (data, status, jqXHR) {
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    var winHeight = parseFloat($(window).height());
                    // alert($('document').height);
                    var maxheight = parseFloat(winHeight - 460);
                    if (maxheight < 100)
                        maxheight = parseFloat(winHeight - 50);
                    var results = data;
                    results = results.d ? results.d : results;
                    // if (results.failedLockItems && results.failedLockItems.length) {
                    var tblmember = '<div id="tabhead"><table style="width:100%;font-family: Roboto;font-size: 12px;"><tr> <td style="padding-bottom:10px;width:40%;padding-left:8px;">NAME</td>  <td style="padding-bottom:10px;width:30%">EMAIL</td> <td style="padding-bottom:10px;width:26%">ROLE<i class="fa fa-info-circle infoButton" onClick="javascript:displayRoleInfo()"></i></td> <td style="padding-bottom:10px;width:4%"></td> </tr><tr style="border-bottom-width: thin;border-color:lightgrey;"></table></div> ';
                    tblmember += ' <div id="tabbody" style="width:100%;max-height:' + maxheight + 'px;overflow-y:auto;overflow-x:hidden"><table> ';
                    var selectId = '';
                    for (var i = 0; i < results.length; i++) {

                        var rec = results[i];
                        selectId = "ddlRole" + rec.TAG_MEMBER_ID;
                        tblmember += '<tr style="border-bottom-width: thin;border-color:lightgrey;">';
                        tblmember += '<td class="" style="font-family: Roboto;font-size:12px;width:40%;font-color:grey;padding-left:8px;">' + rec.FullName + '</td>';
                        tblmember += '<td class="" style="font-family: Roboto;font-size:12px;width:30%;font-color:grey;padding-left:8px;">' + rec.Email + '</td>';
                        tblmember += '<td class="" style="font-family: Roboto;font-size:12px;width:26%;font-color:grey;padding-left:8px;"><input type="hidden" id="" value=""><select style="width:80%;font-family: Roboto;font-size:12px;border-bottom-width:3px;border-bottom-color:darkgrey;" UserId="' + rec.UserId + '" onchange="javascript:roleChange(' + rec.TAG_MEMBER_ID + ',' + rec.Role + ')" class="form-select form-select roleoption" id="' + selectId + '">';
                        if (rec.Role == 1) { tblmember += '<option value ="1" selected >Owner</option >' } else { tblmember += '<option value ="1">Owner</option >' };
                        if (rec.Role == 2) { tblmember += '<option value ="2" selected >Tag Manager</option >' } else { tblmember += '<option value ="2">Tag Manager</option >' };
                        if (rec.Role == 3) { tblmember += '<option value ="3" selected >Viewer</option >' } else { tblmember += '<option value ="3">Viewer</option >' };
                        tblmember += '</select>'
                        tblmember += '<td class="" style="font-family: Roboto;font-size:12px;width:4%;padding-left:8px;"><div id="clickableDisabledTrash"></div><button style="border-width:0px;background-color:white;" UserId="' + rec.UserId + '" onClick="javascript:deleteTagMember(' + rec.TAG_MEMBER_ID + ',' + wgId + ');return false;" id="LockButton" class="fas fa-trash LockButton"> </button></td>';
                        tblmember += '</tr>'


                    }
                    //New Tag - Owner and Contributor
                    //Member - Owner
                    tblmember += '</table></div>';
                    $('#dvMembersList').empty();
                    $('#dvMembersList').append(tblmember);
                    $('#tabbody').scrollTop(scrollPosition);
                    $("#MembersModel").modal('show');
                    $('#MembersModel .modal-dialog').css('right', '300px')
                    $('#btnValidate').attr('disabled', 'disabled');
                    $('#btnAddMember').attr('disabled', 'disabled');


                    $('#btnValidate').removeClass('cancelButton').addClass('validatedisabledButton');

                    $('#btnAddMember').removeClass('addmemberbutton').addClass('disableaddmemberbutton');


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
                    if (status == 'error') {
                        $('#lblErrorMessage').show();
                        $('#lblErrorMessage').text('Internal Server Error occured');
                    }
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });
        }
        function enableClickonDisabled(enabled) {
            if (enabled == true) {
                $('#clickableDisabledValidate').css({ 'width': '0px', 'height': '0px' });
                $('#clickableDisabledAddMember').css({ 'width': '0px', 'height': '0px' });
                // $('#clickableDisabledTrash').css({ 'width': '0px', 'height': '0px' });

            } else {
                $('#clickableDisabledValidate').css({ 'width': '80px', 'height': '25px' });
                $('#clickableDisabledAddMember').css({ 'width': '120px', 'height': '35px' });
                // $('#clickableDisabledTrash').css({ 'width': '20px', 'height': '20px' });
            }
        }
        function displayRoleInfo() {
            var enabled = false;
            if ($('#dvRolePopup').is(':visible')) {
                $('#dvRolePopup').hide();
                $('#clickableDisabledTrash').css({ 'width': '0px', 'height': '0px' });
                //$('#LockButton').removeAttr('disabled');
                $('.LockButton').each(function () {
                    $(this).removeAttr('disabled');
                });
                var enteredText = $("#txtMemberName").val();
                if (enteredText.length == 0) {
                    $('#btnValidate').attr('disabled', 'disabled');
                    $('#btnValidate').removeClass('cancelButton').addClass('validatedisabledButton');
                    $('#btnAddMember').attr('disabled', 'disabled');
                    $('#btnAddMember').removeClass('addmemberbutton').addClass('disableaddmemberbutton');
                }
                else {
                    enabled = true;
                    $('#btnValidate').removeAttr('disabled');
                    $('#btnValidate').removeClass('validatedisabledButton').addClass('cancelButton');
                    $('#btnAddMember').removeAttr('disabled');
                    $('#btnAddMember').removeClass('disableaddmemberbutton').addClass('addmemberbutton');
                }
            }
            else {
                enabled = false;
                $('#clickableDisabledTrash').css({ 'width': '20px', 'height': '20px' });
                //$('#LockButton').attr('disabled', 'disabled');
                $('.LockButton').each(function () {
                    $(this).attr('disabled', 'disabled');
                });
                $('#btnValidate').attr('disabled', 'disabled');
                $('#btnValidate').attr('disabled', 'disabled');
                $('#btnAddMember').attr('disabled', 'disabled');
                $('#btnValidate').removeClass('cancelButton').addClass('validatedisabledButton');
                $('#btnAddMember').removeClass('addmemberbutton').addClass('disableaddmemberbutton');
                $('.roleInfoPopup').css('position', 'absolute');
                var btn1 = $('#tabhead');
                var modalTopScroll = $('#MembersModel').scrollTop();
                var modalLeftScroll = $('#MembersModel').scrollLeft();
                var top = (btn1.offset().top - (window.scrollY - modalTopScroll)) + 123;
                var left = (btn1.offset().left - (window.scrollX - modalLeftScroll)) + 280;


                if (left > $('#content-main').width()) {
                    var diff = (left - $('#content-main').width()) - 10;
                    left = left - diff;
                }
                $('.roleInfoPopup').css('top', (top - 100));
                $('.roleInfoPopup').css('left', left);

                $('#dvRolePopup').show();

            }

            enableClickonDisabled(enabled);

        }
        function deleteTagMember(WgMemberId, wgId) {
            var id = 'ddlRole' + WgMemberId;
            var userId = $('#' + id).attr('UserId');
            var loggedInUser = $('#ContentPlaceHolder1_hdnLoggedInUserId').val();

            $('#lblErrorMessage').text('');
            $('#lblSuccessMessage').text('');
            $('#DisplayEmailText').text('');
            $('#lblErrorMessage').hide();
            $('#lblSuccessMessage').hide();
            $('#DisplayEmailText').hide();

            if (userId == loggedInUser) {
                if ($("#MembersModel").is(':visible')) {
                    $("#MembersModel").modal('hide');
                }
               
                $('#confrmMembrDiv').modal('show');
                $('#spandeletemembermsg').html('Are you sure you want to remove yourself from the group <b>' + $('#spanselectedGroupName').text() + '</b>?');
                $('#confrmMembrDiv').focus();
                $('#truebtn').unbind('click');
                $('#truebtn').on('click', function () {
                    $.ajax({
                        url: 'TagManagement.aspx/deleteMember?wgId=' + wgId + '&WgMemberId=' + WgMemberId,
                        type: 'GET',
                        contentType: 'application/json',
                        dataType: 'json',
                        success: function (data, status, jqXHR) {
                            if (data != null) {
                                if (!data.d.IsValid) {
                                    //data.d.Message
                                    $("#MembersModel").modal('show');
                                    $('#lblErrorMessage').text(data.d.Message);
                                    $('#lblErrorMessage').show();
                                    $('#lblSuccessMessage').hide();
                                    $('#DisplayEmailText').hide();
                                }
                                else {
                                    if (data.d.IsPageRefresh) {
                                        $("#MembersModel").modal('hide');
                                        getAllUserWorkGroups();
                                    }
                                    else {
                                        $('#lblSuccessMessage').text(data.d.Message);
                                        $('#lblErrorMessage').hide();
                                        $('#lblSuccessMessage').show();
                                        $('#DisplayEmailText').hide();
                                        getWGMembersById(wgId);
                                        //window.location.reload();
                                    }

                                }
                            }

                        },
                        error: function (jqXHR, status, error) {
                            if (status == 'error') {
                                $('#lblErrorMessage').show();
                                $('#lblErrorMessage').text('Internal Server Error occured');
                            }
                        }
                    });

                    $("#confrmMembrDiv").modal('hide');
                })

                $('#falsebtn').on('click', function () {
                    $("#confrmMembrDiv").modal('hide');
                    $("#MembersModel").modal('show');
                    //event.preventDefault();
                });
                //if ($("#MembersModel").is(':visible')) {
                //    $("#MembersModel").modal('hide');
                //}
            }
            else {
                $.ajax({
                    url: 'TagManagement.aspx/deleteMember?wgId=' + wgId + '&WgMemberId=' + WgMemberId,
                    type: 'GET',
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function (data, status, jqXHR) {
                        if (data != null) {
                            if (!data.d.IsValid) {
                                //data.d.Message
                                $("#MembersModel").modal('show');
                                $('#lblErrorMessage').text(data.d.Message);
                                $('#lblErrorMessage').show();
                                $('#lblSuccessMessage').hide();
                                $('#DisplayEmailText').hide();
                            }
                            else {
                                if (data.d.IsPageRefresh) {
                                    $("#MembersModel").modal('hide');
                                    getAllUserWorkGroups();
                                }
                                else {
                                    $('#lblSuccessMessage').text(data.d.Message);
                                    $('#lblErrorMessage').hide();
                                    $('#lblSuccessMessage').show();
                                    $('#DisplayEmailText').hide();
                                    getWGMembersById(wgId);
                                    //window.location.reload();
                                }

                            }
                        }

                    },
                    error: function (jqXHR, status, error) {
                        if (status == 'error') {
                            $('#lblErrorMessage').show();
                            $('#lblErrorMessage').text('Internal Server Error occured');
                        }
                    }
                });
            }
                return false;
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
                    if (status == 'error') {
                        $('#lblErrorMessage').show();
                        $('#lblErrorMessage').text(email + ' is not a valid VA email address');
                    }
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
                $('#dvhorzline').hide();
            }
            else {
                $('#dvRenameGroup').show();
                $('#dvDeleteGroup').show();
                $('#dvhorzline').show();
            }

            $('.grouppop').css('top', (pageY - 100));
            $('.grouppop').css('left', (pageX + 5));
            $('.grouppop').slideFadeToggle();
            //e.preventDefault();
        }

        function tagPopUp(btnid, pageX, pageY) {

            $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
            var tagId = $('#btn' + btnid).attr('tagId');
            var tagName = $('#btn' + btnid).attr('tagName');
            var wgId = $('#btn' + btnid).attr('wgId');
            var RoleId = $('#btn' + btnid).attr('RoleId');
            //var top = $('#Group' + btnid).position().top;
            //var left = $('#Group' + btnid).position().left;
            $('#ContentPlaceHolder1_selectedTagId').val(tagId);
            $('#ContentPlaceHolder1_selectedTagName').val(tagName);
            $('#ContentPlaceHolder1_hdnSelectedWGId').val(wgId);

            $('#dv' + tagId).css('background-color', 'rgb(205, 207, 215)');

            $('#ContentPlaceHolder1_hdnSelectedWGName').val($('#Group' + wgId).attr('groupname'));
            if (RoleId != 1 && RoleId != 2) {
                $('#dvtagTRMEntry').hide();
                $('#dvRenameTag').hide();
                $('#dvDeleteTag').hide();
                $('#dvTagshorzline').hide();
            }
            else {
                $('#dvtagTRMEntry').show();
                $('#dvRenameTag').show();
                $('#dvDeleteTag').show();
                $('#dvTagshorzline').show();
            }

            $('.tagpop').css('top', (pageY - 100));
            var left = pageX - 8;
            if (left > $('#content-main').width()) {
                var diff = (left - $('#content-main').width()) - 10;
                left = left - diff;
            }
            $('.tagpop').css('left', (left));

            if ($('#dvTagPopup').is(':visible')) {
                $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
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

            $(window).resize(function () {
                $('#dvGroupPopup').hide();
                $('#dvTagPopup').hide();
                $('#dvRolePopup').hide();
                $('#dv' + $('#ContentPlaceHolder1_selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                $('#MembersModel .modal-dialog').css('right', '300px');
            });

            $('#MembersModel').on('keydown', function (event) {
                if ((event.keyCode || event.which) == 27) {
                    if ($('#dvRolePopup').is(':visible')) {
                        $('#dvRolePopup').hide();
                        $('#clickableDisabledTrash').css({ 'width': '0px', 'height': '0px' });
                        //$('#LockButton').removeAttr('disabled');
                        $('.LockButton').each(function () {
                            $(this).removeAttr('disabled');
                        });
                        var enabled = false;
                        var enteredText = $("#txtMemberName").val();
                        if (enteredText.length == 0) {
                            $('#btnValidate').attr('disabled', 'disabled');
                            $('#btnValidate').removeClass('cancelButton').addClass('validatedisabledButton');
                            $('#btnAddMember').attr('disabled', 'disabled');
                            $('#btnAddMember').removeClass('addmemberbutton').addClass('disableaddmemberbutton');
                        }
                        else {
                            enabled = true;
                            $('#btnValidate').removeAttr('disabled');
                            $('#btnValidate').removeClass('validatedisabledButton').addClass('cancelButton');
                            $('#btnAddMember').removeAttr('disabled');
                            $('#btnAddMember').removeClass('disableaddmemberbutton').addClass('addmemberbutton');
                        }
                        enableClickonDisabled(enabled);
                    }
                    else if ($('#MembersModel').is(':visible')) {
                        $("#MembersModel").removeClass('fade');
                        $("#MembersModel").modal('hide');
                        return false;

                    }
                }
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
            $('#txtNewGroupName').keypress(function (event) {

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

            $("#txtRenameGroupName").on('keydown keyup change', function (e) {
                $('#lblErrorMessage').text('');
                if ((e.keyCode || e.which) == 13) {

                    e.preventDefault();
                    return false;

                }
            });

            $("#txtRenameTagName").on('keydown keyup change', function (e) {
                $('#lblErrorMessage').text('');
                if ((e.keyCode || e.which) == 13) {

                    e.preventDefault();
                    return false;

                }
            });

            $("#txtMemberName").on('keydown keyup change', function (e) {
                var enteredText = $("#txtMemberName").val();

                var enabled = false;
                if (enteredText.length == 0) {
                    $('#btnValidate').attr('disabled', 'disabled');
                    $('#btnValidate').removeClass('cancelButton').addClass('validatedisabledButton');
                    $('#btnAddMember').attr('disabled', 'disabled');
                    $('#btnAddMember').removeClass('addmemberbutton').addClass('disableaddmemberbutton');
                }
                else {
                    enabled = true;
                    $('#btnValidate').removeAttr('disabled');
                    $('#btnValidate').removeClass('validatedisabledButton').addClass('cancelButton');
                    $('#btnAddMember').removeAttr('disabled');
                    $('#btnAddMember').removeClass('disableaddmemberbutton').addClass('addmemberbutton');
                }
                enableClickonDisabled(enabled);


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

                var value = $("#txtToolEntry").val();

                if (value == "") {
                    $('#btnApplyTag').removeClass('enabledbutton').addClass('disabledbutton');
                    $('#btnApplyTag').attr('disabled', 'disabled');
                }

                if ((event.keyCode || event.which) == 13) {

                    event.preventDefault();
                    return false;

                }

            });

            $("#checkDowngradeMember").on('keydown keyup change', function (e) {
                // ESCAPE key pressed
                if ((e.keyCode || e.which) == 27) {
                    $('#checkDowngradeMember').modal('hide');
                    $("#MembersModel").modal('show');
                    refreshWorkGroupMembers($('#ContentPlaceHolder1_hdnSelectedWGId').val(), 0);
                    event.preventDefault();
                }
            });
            $("#confrmMembrDiv").on('keydown keyup change', function (e) {
                // ESCAPE key pressed
                if ((e.keyCode || e.which) == 27) {
                    $('#confrmMembrDiv').modal('hide');
                    $("#MembersModel").modal('show');
                    refreshWorkGroupMembers($('#ContentPlaceHolder1_hdnSelectedWGId').val(), 0);
                    event.preventDefault();
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
                $('#InApprWarning').hide();
                $('#lblInApporipateWarningMessage').html('');
                $('#lblCreateGroupWarningMessage').text('');
                $('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val('False');
                var maxLength = 30;
                var charLength = $('#txtNewGroupName').val().length;
                var trimLength = $('#txtNewGroupName').val().trim().length

                if (charLength > maxLength) {
                    $('#charcounter').css('color', 'red');
                    $('#btnCreateWorkGroup').attr('disabled', 'disabled');
                    $('#btnCreateWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
                    $('#charcounter').text(charLength + '/' + maxLength);
                }
                else {
                    $('#charcounter').css('color', 'black');
                }

                if (charLength > 0 && trimLength == 0 && charLength <= maxLength) {
                    $('#btnCreateWorkGroup').attr('disabled', 'disabled');
                    $('#btnCreateWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
                    $('#lblCreateGroupErrorMessage').text('Name must include visible characters');
                    $('#charcounter').text(charLength + '/' + maxLength);
                    return;
                }
                else if (charLength == 0) {
                    $('#btnCreateWorkGroup').attr('disabled', 'disabled');
                    $('#btnCreateWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
                    $('#charcounter').text(charLength + '/' + maxLength);
                    return;
                }
                else {
                    if (charLength <= maxLength) {
                        $('#btnCreateWorkGroup').removeAttr('disabled');
                        $('#btnCreateWorkGroup').removeClass('disabledbutton').addClass('enabledbutton');
                    }
                }

                var enteredtext = $("#txtNewGroupName").val();
                var regex = /^[ A-Za-z0-9_()-]*$/
                if (charLength > 0 && regex.test(enteredtext) == false) {
                    $('#lblCreateGroupErrorMessage').text('Valid characters are alphanumeric and _-()');
                    $('#btnCreateWorkGroup').attr('disabled', 'disabled');
                    $('#btnCreateWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
                }

                else {
                    if (charLength <= maxLength) {
                        $('#lblCreateGroupErrorMessage').text('');
                        $('#btnCreateWorkGroup').removeAttr('disabled');
                        $('#btnCreateWorkGroup').removeClass('disabledbutton').addClass('enabledbutton');
                    }
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
                    $('#lblCreateGroupWarningMessage').text('Inappropriate word detected');
                }

                $('#charcounter').text(charLength + '/' + maxLength);
            });

            $("#txtRenameGroupName").on('keydown keyup change', function (e) {
                var k = e.keyCode || e.which;
                if (k == 13 && $('#txtRenameGroupName').val() == $('#ContentPlaceHolder1_hdnSelectedWGName').val()) {
                    $('#btnRenameWorkGroup').attr('disabled', 'disabled');
                    $('#btnRenameWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
                    return;
                }
                $('#lblRenameGroupErrorMessage').text('');
                $('#lblRenameGroupWarningMessage').text('');
                $('#InRenameApprWarning').hide();
                $('#lblRenameInApporipateWarningMessage').html('');
                $('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val('False');
                var maxLength = 30;
                var charLength = $('#txtRenameGroupName').val().length;
                var trimLength = $('#txtRenameGroupName').val().trim().length

                if (charLength > maxLength) {
                    $('#renamecharcounter').css('color', 'red');
                    $('#btnRenameWorkGroup').attr('disabled', 'disabled');
                    $('#btnRenameWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
                    $('#renamecharcounter').text(charLength + '/' + maxLength);
                }
                else {
                    $('#renamecharcounter').css('color', 'black');
                }

                if (charLength > 0 && trimLength == 0 && charLength <= maxLength) {
                    $('#btnRenameWorkGroup').attr('disabled', 'disabled');
                    $('#btnRenameWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
                    $('#lblRenameGroupErrorMessage').text('Name must include visible characters');
                    $('#renamecharcounter').text(charLength + '/' + maxLength);
                    return;
                }
                else if (charLength == 0) {
                    $('#btnRenameWorkGroup').attr('disabled', 'disabled');
                    $('#btnRenameWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
                    $('#renamecharcounter').text(charLength + '/' + maxLength);
                    return;
                }
                else {
                    if (charLength <= maxLength) {
                        $('#btnRenameWorkGroup').removeAttr('disabled');
                        $('#btnRenameWorkGroup').removeClass('disabledbutton').addClass('enabledbutton');
                    }
                }


                var enteredtext = $("#txtRenameGroupName").val();

                var regex = /^[ A-Za-z0-9_()-]*$/
                if (charLength > 0 && regex.test(enteredtext) == false) {
                    $('#lblRenameGroupErrorMessage').text('Valid characters are alphanumeric and _-()');
                    $('#btnRenameWorkGroup').attr('disabled', 'disabled');
                    $('#btnRenameWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
                }
                else {
                    if (charLength <= maxLength) {
                        $('#lblRenameGroupErrorMessage').text('');
                        $('#btnRenameWorkGroup').removeAttr('disabled');
                        $('#btnRenameWorkGroup').removeClass('disabledbutton').addClass('enabledbutton');
                    }
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
                    $('#lblRenameGroupWarningMessage').text('Inappropriate word detected');
                }

                $('#renamecharcounter').text(charLength + '/' + maxLength)

            });

            $("#txtRenameTagName").on('keydown keyup change', function (e) {
                var k = e.keyCode || e.which;
                //$('#ContentPlaceHolder1_selectedTagName').val()

                if (k == 13 && $('#txtRenameTagName').val() == $('#ContentPlaceHolder1_selectedTagName').val()) {
                    $('#btnRenameTag').attr('disabled', 'disabled');
                    $('#btnRenameTag').removeClass('enabledbutton').addClass('disabledbutton');
                    return;
                }
                $('#lblRenameTagErrorMessage').text('');
                $('#lblRenameTagWarningMessage').text('');
                $('#InRenameTagApprWarning').hide();
                $('#lblRenameTagInApporipateWarningMessage').html('');
                $('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val('False');
                var maxLength = 30;
                var charLength = $('#txtRenameTagName').val().length;
                var trimLength = $('#txtRenameTagName').val().trim().length

                if (charLength > maxLength) {
                    $('#renameTagcharcounter').css('color', 'red');
                    $('#btnRenameTag').attr('disabled', 'disabled');
                    $('#btnRenameTag').removeClass('enabledbutton').addClass('disabledbutton');
                    $('#renameTagcharcounter').text(charLength + '/' + maxLength);
                }
                else {
                    $('#renameTagcharcounter').css('color', 'black');
                }

                if (charLength > 0 && trimLength == 0 && charLength <= maxLength) {
                    $('#btnRenameTag').attr('disabled', 'disabled');
                    $('#btnRenameTag').removeClass('enabledbutton').addClass('disabledbutton');
                    $('#lblRenameTagErrorMessage').text('Name must include visible characters');
                    $('#renameTagcharcounter').text(charLength + '/' + maxLength);
                    return;
                }
                else if (charLength == 0) {
                    $('#btnRenameTag').attr('disabled', 'disabled');
                    $('#btnRenameTag').removeClass('enabledbutton').addClass('disabledbutton');
                    $('#renameTagcharcounter').text(charLength + '/' + maxLength);
                    return;
                }
                else {
                    if (charLength <= maxLength) {
                        $('#btnRenameTag').removeAttr('disabled');
                        $('#btnRenameTag').removeClass('disabledbutton').addClass('enabledbutton');
                    }
                }


                var enteredtext = $("#txtRenameTagName").val();
                var regex = /^[ A-Za-z0-9_()-]*$/
                if (charLength > 0 && regex.test(enteredtext) == false) {
                    $('#lblRenameTagErrorMessage').text('Valid characters are alphanumeric and _-()');
                    $('#btnRenameTag').attr('disabled', 'disabled');
                    $('#btnRenameTag').removeClass('enabledbutton').addClass('disabledbutton');
                }
                else {
                    if (charLength <= maxLength) {
                        $('#lblRenameTagErrorMessage').text('');
                        $('#btnRenameTag').removeAttr('disabled');
                        $('#btnRenameTag').removeClass('disabledbutton').addClass('enabledbutton');
                    }
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
                    $('#lblRenameTagWarningMessage').text('Inappropriate word detected');
                }
                $('#renameTagcharcounter').text(charLength + '/' + maxLength)

            });

            $("#txtNewWgTagName").on('keydown keyup change', function (e) {
                var k = e.keyCode || e.which;
                $('#lblCreateWgTagErrorMessage').text('');
                $('#lblCreateWgTagWarningMessage').text('');
                $('#InApprWgTagWarning').hide();
                $('#lblInApporipateWgTagWarningMessage').html('');
                $('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val('False');
                var maxLength = 30;
                var charLength = $('#txtNewWgTagName').val().length;
                var trimLength = $('#txtNewWgTagName').val().trim().length

                if (charLength > maxLength) {
                    $('#charWgTagcounter').css('color', 'red');
                    $('#btnCreateWgTag').attr('disabled', 'disabled');
                    $('#btnCreateWgTag').removeClass('enabledbutton').addClass('disabledbutton');
                    $('#charWgTagcounter').text(charLength + '/' + maxLength);
                    //   return;
                }
                else {
                    $('#charWgTagcounter').css('color', 'black');
                }

                if (charLength > 0 && trimLength == 0 && charLength <= maxLength) {
                    $('#btnCreateWgTag').attr('disabled', 'disabled');
                    $('#btnCreateWgTag').removeClass('enabledbutton').addClass('disabledbutton');
                    $('#lblCreateWgTagErrorMessage').text('Name must include visible characters');
                    $('#charWgTagcounter').text(charLength + '/' + maxLength);
                    return;
                }
                else if (charLength == 0) {
                    $('#btnCreateWgTag').attr('disabled', 'disabled');
                    $('#btnCreateWgTag').removeClass('enabledbutton').addClass('disabledbutton');
                    $('#charWgTagcounter').text(charLength + '/' + maxLength);
                    return;

                }
                else {
                    if (charLength <= maxLength) {
                        $('#btnCreateWgTag').removeAttr('disabled');
                        $('#btnCreateWgTag').removeClass('disabledbutton').addClass('enabledbutton');
                    }
                }


                var enteredtext = $("#txtNewWgTagName").val();
                var regex = /^[ A-Za-z0-9_()-]*$/
                if (charLength > 0 && regex.test(enteredtext) == false) {
                    $('#lblCreateWgTagErrorMessage').text('Valid characters are alphanumeric and _-()');
                    $('#btnCreateWgTag').attr('disabled', 'disabled');
                    $('#btnCreateWgTag').removeClass('enabledbutton').addClass('disabledbutton');
                }
                else {
                    if (charLength <= maxLength) {
                        $('#lblCreateWgTagErrorMessage').text('');
                        $('#btnCreateWgTag').removeAttr('disabled');
                        $('#btnCreateWgTag').removeClass('disabledbutton').addClass('enabledbutton');
                    }

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
                    $('#lblCreateWgTagWarningMessage').text('Inappropriate word detected');
                }

                $('#charWgTagcounter').text(charLength + '/' + maxLength);
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
        .mb-5, .my-5 {
            margin-bottom: 3rem !important;
        }

        .shadow-sm {
            box-shadow: 0 .125rem .25rem darkgray !important;
        }

        .rounded {
            border-radius: .25rem !important;
        }

        .bg-white {
            background-color: #fff !important;
        }

        .fixed_header {
            width: 400px;
            table-layout: fixed;
            border-collapse: collapse;
        }

            .fixed_header tbody {
                display: block;
                width: 100%;
                overflow: auto;
                height: 100px;
            }

            .fixed_header thead tbody tr {
                display: block;
            }

        /*.fixed_header thead {
            display:table;
            table-layout:fixed;
        }*/

        /*.fixed_header th, .fixed_header td {
            padding: 5px;
            text-align: left;
            width: 200px;
        }*/
    </style>
    <style>
        /*@media (min-width: 768px) {
            .row-cols-md-3 > * {
                -ms-flex: 0 0 33.333333%;
                flex: 0 0 33.333333%;
                min-width: 450px;
            }
        }*/

        /*@media (min-width: 500px) {
            .col-sm-10 {
                -ms-flex: 0 0 83.333333%;
                flex: 0 0 83.333333%;
                max-width: 450px;
            }
        }*/
        /*.row-cols-3 > * {
                -ms-flex: 0 0 33.333333%;
                flex: 0 0 33.333333%;
                min-width: 450px;
            }*/

        .addmemberbutton {
            /*position: relative;
            border-width: 0px;
            border-radius: 5px;
            padding: 8px 18px 8px 18px;*/
            /*width:120px;
            height:50px;*/
            /*background-color: #1266f1;
            color: white;
            font-family: Roboto;
            font-size: 11px;
            display: inline-block;
            overflow: hidden;
            transition: .3s;*/
            border-width: 1px;
            border-radius: 3px;
            padding: 8px 16px 6px 16px;
            /*border-color: grey;*/
            color: #283154;
            background-color: white;
            font-family: Roboto;
            font-size: 11px;
            display: inline-block;
            border: 1.4px solid;
            /*float: right;*/
            overflow: hidden;
            transition: .3s;
            position: relative;
        }

        .disableaddmemberbutton {           
            border-width: 1px;
            border-radius: 3px;
            padding: 8px 16px 6px 16px;
            color: #283154;
            background-color: white;
            font-family: Roboto;
            font-size: 11px;
            /*display: inline-block;*/
            border: 1.4px solid;
            /*overflow: hidden;
            transition: .3s;
            position: relative;*/
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
            box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 10%);
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



        /*hr {
            margin: 0;
            color: inherit;
            background-color: currentColor;
            border: 0;
            opacity: .25;
        }*/

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
            padding-right: 0px !important;
        }

            .modal-open .modal {
                overflow-x: auto;
            }

        /*        html {
             overflow-y: scroll !important;
        }*/

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
            /*//z-index: 10040;*/
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
            background-color: #EB5757;
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

            #clickableDisabledValidate{
            position:absolute;
            width:80px;
            height:25px;
        }
        #clickableDisabledAddMember{
            position:absolute;
            width:120px;
            height:35px;
        }
         #clickableDisabledTrash{
            position:absolute;
            width:0px;
            height:0px;
         }

            .validatedisabledButton {
            font-family: Roboto, sans-serif;
            font-size: 12px;
            Color: #283154;
            font-weight: normal;
            border-radius: .25rem;
            padding: .625rem 1.5rem .5rem;
            background-color: white;
            border-width: 0px;
            /*display: inline-block;
            overflow: hidden;
            transition: .3s;
            position: relative;*/
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
            /*border-radius: 5px;
            padding: 5px 25px 5px 25px;*/
            /* border-color: #39c0ed;*/
            /*color: #39c0ed;
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
            display: inline-block;*/
            font-family: Roboto, sans-serif;
            font-size: 10px;
            font-weight: normal;
            border-radius: .25rem;
            padding: 6px 20px 6px 20px;
            background-color: #1266f1;
            color: white;
            border-width: 0px;
            overflow: hidden;
            transition: .3s;
            position: relative;
            display: inline-block;
        }

            .donebutton:hover {
                background-color: #0c56d0;
                box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 10%);
            }



        .membersbutton {
            border-width: 1px;
            border-radius: 3px;
            padding: 4px 12px 4px 12px;
            /*border-color: grey;*/
            color: #283154;
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
            padding: 15px 25px 0px 21px;
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



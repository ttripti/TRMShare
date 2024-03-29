﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="NewTag.aspx.vb" Inherits="VA.TRM.PresentationO.NewTag" %>

<%@ Import Namespace="VA.TRM.PresentationO.TRMPresentation.inc.TRMConfig.TRMConfig" %>
<%@ Import Namespace="VA.TRM.PresentationO.TRMPresentation.inc.TRMGlobals" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <%-- Change History    
    09092022    TT      SQA Regression Testing
    09122022    GKohr   Clean up Tagged Entries display 
    09132022    TT      TRM-634 Implementation
    09142022    DO      TRM-641 Changed video links at the top of the page
    09142022    TT      TRM-634 SQA fixes
    09142022    TT      View Tagged Entries UAT Issue 
    09152022    DO      Removed "Deselect" message if user group role is viewer
    09192022    TT      UAT Fixes
    09192022    TT      UAT Inappropriate tag creation fix
    09222022    TT      Error Messages in red
    09262022    TT      TRM 565 and TRM 570 
    09302022    TT      TRM 733
    10042022    TT      TRM 564
    10242022    TT      TRM 567
    --%>

    <script src="js/lib/jquery-3.1.0.min.js" type="text/javascript"></script>
    <script src="js/lib/jquery-ui-1.12.0.custom/jquery-ui.min.js" type="text/javascript"></script>
    <script src="js/lib/quilljs/quill.min.js" type="text/javascript"></script>
    <script src="js/One-VA-TRM.js" type="text/javascript"></script>
    <script src="js/App.js" type="text/javascript"></script>
    <script src="js/WidgetFactory/RichEditorFactory.js" type="text/javascript"></script>
    <link rel="stylesheet" href="js/lib/jquery-ui-1.12.0.custom/jquery-ui.css" />
    <link rel="stylesheet" type="text/css" href="js/lib/quilljs/trm.quill.snow.css" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />

    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>

    <%-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">--%>
    <!-- Optional theme -->
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">--%>
    <!-- Latest compiled and minified JavaScript -->
    <%--  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>--%>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<body>
    <style>
        .entryNameStyle{
            top: -20px !important;
            font-size: 14px;
            color: grey;
        }

        .addpersonaltagsButton {
            border-width: 1px;
            border-radius: 3px;
            padding: 5px 15px 4px 15px;
            color: #283154;
            background-color: white;
            font-family: Roboto;
            font-size: 9px;
            display: inline-block;
            border: 1.4px solid;
            margin: 10px;
            overflow: hidden;
            transition: .3s;
            position: relative;
        }

        .addpersonaltagsButton:hover {
            box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 10%);
        }

        .addgrouptagsButton {
            border-width: 1px;
            border-radius: 3px;
            padding: 5px 15px 4px 15px;
            color: #283154;
            background-color: white;
            font-family: Roboto;
            font-size: 9px;
            display: inline-block;
            border: 1.4px solid;
            overflow: hidden;
            transition: .3s;
            position: relative;
        }

        .addgrouptagsButton:hover {
            box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 10%);
        }

        .savebutton {
            font-family: Roboto, sans-serif;
            font-size: 12px;
            font-weight: normal;
            border-radius: .25rem;
            padding: .625rem 1.15rem .5rem;
            background-color: #EB5757;
            color: white;
            border-width: 0px;
            overflow: hidden;
            transition: .3s;
            position: relative;
            display: inline-block;
        }

        .savebutton:hover {
            background-color: red;
            box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 10%);
        }

        #tagManagementTable {
            border: solid 0.5px;
            border-color: lightgrey;
            width: 100%;
            overflow-x: auto;
        }

        .tagManagementRow {
            border: solid 0.5px;
            border-color: lightgrey;
        }

        a.collapseClass {
            color: black;
        }

        div[aria-expanded=true] .fa-chevron-down {
            display: none;
        }

        div[aria-expanded=false] .fa-chevron-up {
            display: none;
        }

        html {
            overflow: hidden;
        }

        #personalCollapse {
            position: absolute;
            right: 20px;
            text-align: right;
        }

        #GrpCollapse {
            position: absolute;
            right: 20px;
            text-align: right;
        }

        #dvTagGroups {
            border-bottom: solid 1px lightgrey;
            border-left: solid 1px lightgrey;
            border-right: solid 1px lightgrey;
            padding: 25px 15px 15px 15px;
        }

        #dvPersonalTag {
            border: solid 1px lightgrey;
            padding: 10px 15px 15px 15px;
        }

        .groupDv {
            width: fit-content;
            padding: 0px 0px 0px 0px;
        }

        .tagMgntVideoLinks {
            font-family: Roboto, sans-serif;
            font-size: 11px;
            width: 842px;
            vertical-align: 1.5px;
            text-decoration: underline;
        }

        #more {
            display: none;
        }

        .daLink:hover {
            text-decoration: underline !important;
        }

        .chkTool:focus,.chkTool:active,
        #tagFilter:focus,#tagFilter:active{
           border-color: lightgrey !important;
           box-shadow: none !important;
        } 

        .closebutton {
            margin-right:68px;
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

        .closebutton:hover {
            background-color: #0c56d0;
            box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 10%);
        }

        ul.timelist {
            list-style:none;
            padding-left:0;
        }

        a.time {
            color: #0000FF;
            cursor: pointer;
        }
    </style>
    <form id="form1" runat="server" style="width: 100%">
 
        <div class="col" style="width:850px;margin-top:10px;margin-left:-5px;font-size:8.5pt;font-family:arial">
            Tagging is now in the TRM! You can add tags to this entry or go to My Tag Management to manage your personal and group tags. For a 
            <span id="dots">...&nbsp;</span>
            <span id="more">comprehensive list of tagging training videos, click on TRM Training Videos in the left sidebar or select a video below.<br />
            <br />
            <!--<i class="fa fa-video fa-sm"></i>&nbsp;&nbsp;<a class="tagMgntVideoLinks" href="<%= tagManagementVideoLink %>" target="_blank">How to Use Tag Management in the TRM</a>-->
            <i class="fa fa-video fa-sm"></i>&nbsp;
            <a class="tagMgntVideoLinks" href="javascript:showVideoModal('<%= tagManagementVideoLink %>','<%= tagManagementVideoText %>','<%= tagManagementVideoDetails %>','<%= tagManagementVideoDetails %>')" title="<%= tagManagementVideoDesc %>">How to Use Tag Management in the TRM </a>
            <br />
            <!--<i class="fa fa-video fa-sm"></i>&nbsp;&nbsp;<a class="tagMgntVideoLinks" href="<%= personalTagVideoLink %>" target="_blank">How To - Personal Tags</a>-->
            <i class="fa fa-video fa-sm"></i>&nbsp;
            <a class="tagMgntVideoLinks" href="javascript:showVideoModal('<%= personalTagVideoLink %>','<%= personalTagVideoText %>','<%= personalTagVideoDetails %>','<%= personalTagVideoDetails %>')" title="<%= personalTagVideoDesc %>">How To - Personal Tags</a>
            <br />
            <!--<i class="fa fa-video fa-sm"></i>&nbsp;&nbsp;<a class="tagMgntVideoLinks" href="<%= groupTagVideoLink %>" target="_blank">How To - Group Tags</a></span>-->
            <i class="fa fa-video fa-sm"></i>&nbsp;
            <a class="tagMgntVideoLinks" href="javascript:showVideoModal('<%= groupTagVideoLink %>','<%= groupTagVideoText %>','<%= groupTagVideoDetails %>','<%= groupTagVideoDetails %>')" title="<%= groupTagVideoDesc %>">How To - Group Tags</a></span>
            <a style="color: blue; cursor: pointer;" onclick="morelessFunction()" id="moreless"><u>Show more</u></a>
       </div>

        <div style="padding-left: 855px; margin-bottom: -8px; width:100%">
            <select id="tagFilter" class="form-select form-select" style="width: 145px; font-family: Roboto; font-size: 12px;">
                <option value="PopularHighest">Popular - Highest</option>
                <option value="PopularLowest">Popular - Lowest</option>
                <option value="NameAtoZ">Name - A to Z</option>
                <option value="NameZtoA">Name - Z to A</option>
                <option value="CreatedNewest">Created - Newest</option>
                <option value="CreatedOldest">Created - Oldest</option>
            </select>
        </div>

       <div class="toast text-success text-center" style="position: fixed; top: 10rem; left: 50%; z-index: 9998; background-color: honeydew; width: fit-content;" id="goodToast" data-autohide="false">
            <div style="display:inline;">
                <span style="padding-left: 10px; padding-right: 5px; font-family: Roboto, sans-serif; font-size: 11px;" id="toastSuccess"></span>
            </div>
            <div style="display:inline;">
                <button style="display:flex;height:25px;" type="button" class="ml-2 mb-1 m-auto close" data-dismiss="toast" aria-label="Close">
                    <span style="margin-top:4px;padding-right:5px;font-family: Roboto, sans-serif; font-size: 16px;color:#23903c;" aria-hidden="true">&times;</span>
                </button>
            </div>
        </div>
        <div class="toast text-danger" style="position: fixed; top: 10rem; left: 50%; z-index: 9998; background-color: lightsalmon; width: fit-content;" id="burntToast" data-autohide="false">
            <div style="display:inline;">
                <span style="padding-left: 10px; padding-right: 5px; font-family: Roboto, sans-serif; font-size: 11px;color:#DC3545;" id="toastError"></span>
            </div>
            <div style="display:inline;">
                <button style="display:flex;height:25px;" type="button" class="ml-2 mb-1 m-auto close" data-dismiss="toast" aria-label="Close">
                    <span style="margin-top:4px;padding-right:5px;font-family: Roboto, sans-serif; font-size: 16px;" aria-hidden="true">&times;</span>
                </button>
            </div>
        </div>
        <div class="row" style="padding-top: 1px;"></div>

        <!--<div style="max-width: 80%;">
            <p style="font-size: 11px; font-family: Arial; text-align: left;">
                Welcome to your TRM Tag Management profile. Tag Management helps you organize your collection of TRM entries in a personalized and 
                <span id="dots">...&nbsp;</span>
                <span id="more">meaningful manner. You may use this page to view and manage your personal and group tags. Here, you may easily add TRM entries to your tags within the Personal Tags or My Group Tags sections.<br />
                    <br />
                    Personal Tags – This section contains the tags that are private to the user. The purpose of personal tag management is to create and manage tags that organize technologies and standards in a personalized matter.<br />
                    <br />
                    My Group Tags – This is semi-private tag management category that allows a user to create, manage or view specific tags catered towards a group of people with a common interest. Here you may assign roles to each of the members.<br />
                    <br />
                    General help files and training videos are available and contain explanations about Tag Management.</span>
                <a style="color: blue; cursor: pointer;" onclick="morelessFunction()" id="moreless"><u>Show more</u></a>
            </p>
        </div>-->
        <div class="" id="dvNewTag">
            <div class="row" style="height: 10px;">
                <div class="col-12">
                    <div id="dvErrorMessage"></div>
                    <span id="lblGroupSuccessMessage" style="font-family: 'Roboto', sans-serif; color: green; font-size: 14px;"></span>
                </div>
            </div>
            <div id="dvPersonalTag">
                <div class="row" >
                    <div class="col-4" style="width: 80%;">
                        <div style="font-family: 'Roboto', sans-serif; font-size: 17px; font-weight: 400">
                            Personal Tags (<span id="personaltagsCount"></span>)
                            <button id="btnaddNewPersonalTag" onclick="javascript:openWgTagModel(-1,);return false;" class="addpersonaltagsButton">
                                <i class="fas fa-tag" style="color: black"></i>&nbsp;&nbsp;&nbsp;PERSONAL TAGS
                            </button>
                        </div>
                    </div>
                    <div style="margin-left: 5px; padding-top: 0px; padding-bottom: 7px;">
                        <!--<i class="fa fa-video fa-sm"></i>&nbsp;&nbsp;<a class="tagMgntVideoLinks" href="<%= personalTagVideoLink %>" target="_blank">How To - Personal Tags</a>-->
                        <i class="fa fa-video fa-sm"></i>&nbsp;
                        <a class="tagMgntVideoLinks" href="javascript:showVideoModal('<%= personalTagVideoLink %>','<%= personalTagVideoText %>','<%= personalTagVideoDetails %>','<%= personalTagVideoDetails %>')" title="<%= personalTagVideoDesc %>">How To - Personal Tags</a>
                    </div>
                    <div class="col-8" id="personalCollapse" style="padding-top: 15px;">
                        <div aria-expanded="true" class="collapseClass" data-toggle="collapse" href="#dvpersonnalrowtag" style="cursor:pointer">
                            <i class="fa fa-chevron-up"></i>
                            <i class="fa fa-chevron-down"></i>
                        </div>
                    </div>
                </div>
                <div class="row collapse show" id="dvpersonnalrowtag">
                    <div class="col-12" id="dvpersonalTags"></div>
                </div>
            </div>
            <div id="dvTagGroups">
                <div class="row">
                    <div class="col-4" style="width: 80%; font-family: 'Roboto', sans-serif; font-size: 17px; font-weight: 400">
                        <div>
                            My Group Tags 
                        </div>
                    </div>
                    <div style="padding-top: 5px; margin-left: 5px;">
                        <!--<i class="fa fa-video fa-sm"></i>&nbsp;&nbsp;<a class="tagMgntVideoLinks" href="<%= groupTagVideoLink %>" target="_blank">How To - Group Tags</a>-->
                        <i class="fa fa-video fa-sm"></i>&nbsp;
                        <a class="tagMgntVideoLinks" href="javascript:showVideoModal('<%= groupTagVideoLink %>','<%= groupTagVideoText %>','<%= groupTagVideoDetails %>','<%= groupTagVideoDetails %>')" title="<%= groupTagVideoDesc %>">How To - Group Tags</a>
                    </div>
                    <div class="col-8" id="GrpCollapse">
                        <div aria-expanded="true" class="collapseClass" data-toggle="collapse" href="#dvrowtag" style="cursor:pointer">
                            <i class="fa fa-chevron-up"></i>
                            <i class="fa fa-chevron-down"></i>
                        </div>
                    </div>
                </div>


                <div class="row collapse show" id="dvrowtag">
                    <%--<div class="row">
                        <br />
                    </div>--%>
                    <div class="col-4">
                        <span style="font-family: 'Roboto', sans-serif; font-size: 14px; font-weight: 400">My Groups</span>
                        <br />
                        <br />
                        <ul class="list-group" id="dvMrGroups" style="font-family: Roboto; font-size: 11px; overflow-y: auto; height: 500px; word-wrap: break-word;">
                        </ul>
                    </div>
                    <div class="col-8">
                        <div class="row" style="padding-left: 20px">
                            <div class="groupDv">
                                <span style="font-family: 'Roboto', sans-serif; font-size: 14px; font-weight: 400">Group Tags - </span>
                                <span id="spanselectedGroupName" style="font-family: Roboto; font-size: 14px; white-space: pre-wrap; font-weight: 400"></span>
                            </div>
                            <div class="col-3">
                                <button id="btnaddNewWGTag" onclick="javascript:openWgTagModel(0,);return false;" class="addgrouptagsButton">
                                    <i class="fas fa-tag" style="color: black"></i>&nbsp;&nbsp;&nbsp;GROUP TAGS
                                </button>
                            </div>
                        </div>
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <div class="col-12" id="dvTags"></div>
                        </div>
                    </div>

                </div>
                <div class="row" style="height: 10px;"></div>
            </div>
        </div>
        <div class="" id="dvTagmenu">
            <div id="dvTagPopup" class="messagepop tagpop shadow-sm  bg-white rounded" style="margin-top: 1px; display: none; width: 220px; border: 1px solid #dee2e6; border-radius: 5px;">

                <div style="padding-top: 5px; padding-bottom: 5px; background-color: white; cursor: pointer" class="grpellipsemenu" id="dvtagTRMEntry" onclick="javascript:createTagEntryModel();return false;">
                    <div style="padding-left: 10px; display: inline-block; color: rgb(80,80,80)">
                        <i class="fas fa-tag"></i>
                    </div>
                    <div style="display: inline-block;">
                        <a href="#" style="text-decoration: none; color: rgb(100,100,100); font-size: 12px; font-family: Roboto, sans-serif;">&nbsp;&nbsp;Tag a TRM Entry</a>
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
                <div style="padding-top: 5px; padding-bottom: 5px; background-color: white; cursor: pointer" class="grpellipsemenu" id="dvTagCompTech" onclick="javascript:TagComparableTech();return false;">
                    <div style="padding-left: 10px; display: inline-block; color: rgb(80,80,80)">
                        <i class="fas fa-plus-circle"></i>
                    </div>
                    <div style="display: inline-block;">
                        <a href="#" style="text-decoration: none; color: rgb(100,100,100); font-size: 12px; font-family: Roboto, sans-serif;">&nbsp;&nbsp;Tag Comparable Technologies</a>
                    </div>
                </div>
                <div style="padding-top: 5px; padding-bottom: 5px; background-color: white; cursor: pointer" class="grpellipsemenu" id="dvRemoveTag" onclick="javascript:removeTag();return false;">
                    <div style="padding-left: 10px; display: inline-block; color: rgb(80,80,80)">
                        <i class="fas fa-minus-circle"></i>
                    </div>
                    <div style="display: inline-block;">
                        <a href="#" style="text-decoration: none; color: rgb(100,100,100); font-size: 12px; font-family: Roboto, sans-serif;">&nbsp;&nbsp;Remove Tag from Entry</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="unsavedChanges" data-backdrop="static" aria-labelledby="unsavedChangesLabel" aria-hidden="true" tabindex="0">
            <div class="modal-dialog" role="document">
                <div class="modal-content" style="width: 425px; padding-left: 10px; padding-right: 10px; padding-top: 5px;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="javascript:cancelUnsavedChanges();">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="padding-top: 0px;">
                        <p style="text-decoration: none; font-family: Roboto, sans-serif; font-size: 24px; font-weight: bold">
                            <i class='fas fa-exclamation-triangle' style="font-size: 24px; color: #EB5757"></i>
                            <span style="font-family: Roboto, sans-serif; font-size: 16px; color: black">UNSAVED CHANGES</span>
                        </p>
                        <span id="unsavedText" style="font-family: Roboto, sans-serif; font-size: 14px; color: black">You have unsaved changes. Do you want to save
                        or discard your changes?
                        </span>
                        <br />
                        <p></p>
                    </div>
                    <div class="modal-footer">
                        <button id="unsavedCancel" class="unSavedChangesButton" onclick="javascript:cancelUnsavedChanges();">CANCEL</button>
                        <button style="margin-right: 13px;" id="unsavedDiscard" class="unSavedChangesButton" data-dismiss="modal" onclick="javascript:discardUnsavedChanges();">DISCARD</button>
                        <button id="unsavedApply" class="savebutton" onclick="javascript:saveUnsavedChanges();">SAVE</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="newToolTagModel" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="newWGTagModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document" style="width: 500px">
                <div class="modal-content" style="width: 500px">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="javascript:closenewToolTagModel();">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="padding-top: 0px;">
                        <%-- <div class="row" style="width: 100%">
                            <div class="col-sm-8">
                                <i class="fas fa-exclamation-triangle" id="InApprWgTagWarning" style="color: darkorange; display: none;"></i>
                                <span class="textcss" style="color: black; font-weight: bold; font-size: 14px;">&nbsp;CREATE TAG</span>
                            </div>
                           
                        </div>--%>
                        <%-- <div class="row">
                            <br />

                        </div>--%>
                        <div class="row">
                            <div class="col-12">
                                <span style="font-weight: bold; font-size: 12px; font-family: Roboto, sans-serif;">ADD/REMOVE ENTRY TAGS</span>
                                <br />
                                <div id="groupNameDiv">
                                    <i class="fas fa-user-friends" style="font-size: 12px;"></i>
                                    <span id="spanGroupName" style="font-weight: bold; font-size: 10px; font-family: Roboto, sans-serif; white-space: pre-wrap">Group - <span id="lblGroupName"></span></span>
                                    <br />
                                </div>
                                <span style="font-weight: bold; font-size: 10px; font-family: Roboto, sans-serif;">Entry - <span id="lblToolName"></span></span>
                            </div>
                        </div>
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <div class="col-7" style="padding-right: 0px;padding-left: 10px;">
                                <div id="dvnewToolTagModel" style="float:left;padding-left: 0px;">
                                    <div class="group">
                                        <input type="text" id="txtNewWgTagName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 12px; background-color: #F6F6F6;" required="required" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label style="font-family: Roboto, sans-serif; font-size: 11px; color: grey; text-align: center; padding-top: 2px;">Search Tag</label>
                                    </div>
                                </div>
                            </div>
                            <div style="padding-left: 0px; padding-right: 0px; float:left;width:fit-content;">
                                <span id="btnTagSearch" style="border-width: 0px; border-style: none; background-color: white; color: grey;padding-right : 10px;padding-left:2px;"><i class="fas fa-search" style="padding-top:11px;"></i></span>
                            </div>
                            <div class="col-4" style="padding-left: 15px; padding-top:3px; float:left;"><button id="btnAddTag" onclick="javascript:addTag();return false;" class="disabledaddTagtoListButton"> <i class="fas fa-plus" ></i> ADD TO TAG LIST</button>
                           </div>
                        </div>

                        <div class="row">
                            <div style="padding-left:15px;height:25px;width:253px;">
                                <span style="color: red; font-family: Roboto, sans-serif; font-weight: normal; font-size: 12px;" id="spanaddEntryErrorMessage"></span>
                            </div>
                            <div style="text-align: center; padding-right: 0px;padding-left: 0px;width:40px;">
                                <span id="charcounter" class="textcss">0/30</span>
                            </div>
                            <div class="col-3">
                            </div>
                        </div>
                        <div class="row" style="padding-bottom: 10px; padding-left: inherit; padding-top: 10px; font-family: Roboto; font-size: 11px; font-weight: bold;">
                            <div style="padding-left: 0px;" class="col-12">
                                If there are no search results, you may create this new tag by clicking the Add to Tag List button.
                            All changes occur when you click Apply.
                            </div>
                        </div>

                <!--      <div class="row">
                            <div class="col-12" style="padding-left: 20px;height:25px;">
                                <span style="color: red; font-family: Roboto, sans-serif; font-weight: normal; font-size: 12px;" id="spanaddEntryErrorMessage"></span>
                            </div>
                        </div> -->

                        <div class="row">
                            <div class="col-12" id="dvWgTags" style="overflow-y: auto; height: 200px;">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row">
                            <div class="col-12" style="text-align: center;">
                                <button type="button" id="btncancelsaveworkgroup" onclick="javascript:cancelnewToolTagModel();" class="cancelButton">CANCEL</button>
                                <button type="button" id="btnSaveWorkGroup" class="disabledbutton" onclick="javascript:saveWorkgroupTags();return false;">
                                    <%--<span class="spinner-border spinner-border-sm d-none" id="spinnerWGTag" role="status" aria-hidden="true"></span>--%>
                                    APPLY
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
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="javascript:closenewWGTagModel();">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row" style="width: 100%">
                            <div class="col-8">
                                <i class="fas fa-exclamation-triangle" id="InApprWgTagWarning" style="color: orangered; display: none;"></i><span class="textcss" style="color: black; font-weight: bold; font-size: 14px;">&nbsp;&nbsp;NEW TAG</span>
                            </div>
                            <%--<div class="col-sm-4" style="text-align: right">
                            <i class="fas fa-times" style="color: black; cursor: pointer;" onclick="javascript:closeNewWGTagModel();"></i>
                        </div>--%>
                        </div>
                        <div class="row">
                            <br />
                        </div>
                        <div id="dvnewWgTagModel">
                            
                                <div class="group">
                                    <input type="text" id="txtTagName" autocomplete="off" style="padding-left:10px; font-family: Roboto, sans-serif; font-size: 15px; width: 95.5%; background-color: #F6F6F6;" required="required" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label style="font-family: Roboto, sans-serif; font-size: 11px; color: grey; text-align: center">Tag Name</label>
                                </div>
                            
                        </div>
                        <%--  </div>
                    </div>--%>

                        <div class="row">
                            <div class="col-9" style="padding-left: 25px;height:30px;">
                                <%--<label id="lblCreateWgTagSuccessMessage" style="color: green; font-family: Roboto, sans-serif; font-weight: normal"></label>--%>
                                <label id="lblCreateWgTagErrorMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal;font-size: 12px;display:block;padding-top:5px;"></label>
                                <label id="lblCreateWgTagWarningMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal"></label>
                            </div>
                            <div class="col-2" style="text-align: right; padding-right: 0px;height:30px;">
                                <span id="charWgTagcounter" class="textcss">0/30</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12" style="padding-left: 15px;padding-top:20px;">
                                <span id="lblInApporipateWgTagWarningMessage" style="font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal"></span>
                            </div>
                        </div>
                        <%--<div class="row" style="padding-top: 15px;">
                            <div class="col-sm-12">
                                <span id="lblInApporipateWgTagWarningMessage1" style="font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal"></span>
                            </div>
                        </div>--%>
                    </div>
                    <div class="modal-footer">
                        <div class="row">
                            <div class="col-12" style="text-align: center;">
                                <button type="button" id="btncanceladd" class="cancelButton" data-dismiss="modal" onclick="javascript:closenewWGTagModel();">CANCEL</button>
                                <button type="button" id="btnCreateWgTag" class="enabledbutton" onclick="javascript:addinapprTag();return false;">
                                    ADD
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="deleteTagModel" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="deleteTagModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content" style="width: 400px">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row" style="width: 100%">
                            <div class="col-6">
                                <span class="textcss" style="color: black; font-weight: bold; font-size: 16px;">&nbsp;Remove Tag</span>
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
                            <div class="col-8">
                                <label id="lblDeleteTagErrorMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal;"></label>
                                <label id="lblDeleteTagSuccessMessage" style="color: green; font-family: Roboto, sans-serif; font-weight: normal;"></label>
                                --%>
                            </div>
                            <div class="col-4" style="text-align: right;">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row">
                            <div class="col-12" style="text-align: center;">
                                <button type="button" id="btncancelremovetag" class="cancelButton" data-dismiss="modal">CANCEL</button>
                                <button type="button" id="btnDeleteTag" class="enabledbutton" onclick="javascript:removeTag();return false;">
                                    <%--<span class="spinner-border spinner-border-sm d-none" id="spinnerDeleteTag" role="status" aria-hidden="true"></span>--%>
                                REMOVE
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="viewTRMModel" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" aria-labelledby="ViewTRMModalLabel" aria-hidden="true" >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="javascript:closeviewTRMModel();">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row" style="width: 100%; padding-bottom: 5px;">
                            <div class="col-sm-auto">
                                <span style="color: black; font-family: Roboto, sans-serif; font-size: 16px; font-weight: bold;">TAGGED ENTRIES</span>
                            </div>
                            <%--                            <div class="col-md-auto">
                                <label id="lblRemoveTagSuccessMessage" style="color: green; font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal;"></label>
                                <label id="lblRemoveTagErrorMessage" style="color: red; font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal;"></label>
                            </div>--%>
                        </div>
                        <div class="row" style="width: 100%; padding-top: 5px;" id="dvTaggedGroupName">
                            <div class="col-12">
                                <i class="fas fa-user-friends"></i>
                                <span style="color: black; font-family: Roboto, sans-serif; font-size: 12px; font-weight: bold;" id="spanTaggedGroupName"></span>
                            </div>
                        </div>
                        <div class="row" style="width: 100%; padding-top: 5px; padding-bottom: 5px;">
                            <div class="col-12">
                                <i class="fas fa-tag" style="color: black"></i>
                                <span style="color: black; font-family: Roboto, sans-serif; font-size: 12px; font-weight: bold;" id="spanTaggedTagName"></span>
                            </div>
                        </div>
                        <div id="tagdefinition" class="messagepop shadow-sm mb-5 bg-white tagDefPopup" style="border-radius: 5px; display: none; width: 335px;">
                            <div class="row tagDefPopup"> 
                                <div class="col-10 tagDefPopup" style="font-family: Roboto,sans-serif;font-size:14px;font-weight:bold;padding-top:5px;padding-left:23px;padding-bottom:10px;">Tag Definition</div>
                                    <div class="col-2 tagDefPopup" style="float:right"><button type="button" class="close" aria-label="Close" onclick="javascript:closeTagDefinition();">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                </div> 
                            <div class="tagDefPopup" style="padding-left:10px;padding-right:12px;font-family: Roboto,sans-serif;font-size:12px;font-weight:normal;overflow-y:auto;overflow-x:hidden;" id="tgdefinition"></div>
                        </div>
                            <div id="deselect1" class="row" style="font-family: Roboto; font-size: 11px; padding-top: 10px; padding-bottom: 10px; font-weight: bold;">
                                <div class="col-12">
                                    Deselected entries will be removed from the current tag.
                                </div>
                            </div>
                        <div id="dvViewTRMEntries" style="height: 250px; overflow-y: auto; overflow-x: hidden;">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row">
                            <div class="col-12" style="text-align: center;">
                                <button type="button" id="btnTaggedEntires" class="cancelButton" data-dismiss="modal" onclick="javascript:closeviewTRMModel();return false;">CANCEL</button>
                                <button type="button" id="btnItOKTaggedEntires" class="daOKButton" data-dismiss="modal" onclick="javascript:closeviewTRMModel();return false;">OK</button>
                                <button type="button" id="btnOkTaggedEntires" style="padding: 10px 30px 10px 30px;" class="enabledbutton" onclick="javascript:removeTool();return false;canceltagTRMModel();">APPLY</button>
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
                            <div class="col-sm-auto">
                                <span style="color: black; font-family: Roboto, sans-serif; font-size: 16px; font-weight: bold;" id="tagentryTitle"></span>
                            </div>
                            <div class="col-12" style="height:15px;display:flex;">
                                <span style="color: red; font-family: Roboto, sans-serif; font-size: 11px;height:100%;" id="lbltagEntryErrorMessage"></span>
                            </div>
                        </div>
                        <div class="row" style="width: 100%;">
                            <div class="col-12">
                                <i class="fas fa-user-friends" style="color: black; font-size: 12px; padding-left: 3px;" id="tagEntryGroupIcon"></i>
                                <span style="color: black; font-family: Roboto, sans-serif; font-size: 12px; font-weight: bold; white-space: pre-wrap" id="tagentryGroupName"></span>
                            </div>
                        </div>
                        <div class="row" style="width: 100%; padding-bottom: 20px;">
                            <div class="col-12">
                                <i class="fas fa-tag" style="color: black; font-size: 12px; padding-left: 3px;"></i>
                                <span style="color: black; font-family: Roboto, sans-serif; font-size: 12px; font-weight: bold; white-space: pre-wrap;" id="tagentryTagName"></span>
                            </div>
                        </div>
                        <div class="row" style="width: 100%; padding-top: 10px;">

                            <div id="dvToolEntry" style="display: inline-block; width: 250px;">
                                <div class="group">
                                    <input type="text" id="txtToolEntry" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 15px; width: 250px; background-color: #F6F6F6;" required="required" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label id="entryNameLbl" style="font-family: Roboto, sans-serif; font-size: 11px; color: grey; text-align: center; padding-top: 4px;">Entry Name</label>
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
                        </div>

                        <div class="row" style="width: 100%; padding-top: 10px; padding-bottom: 10px;height:50px;">
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

        <div class="modal fade" id="tagComparableTechModel" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="tagTRMModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="javascript:closetagCompTechModel();">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="font-family: Roboto, sans-serif;">
                        <div class="row" style="width: 100%; padding-bottom: 5px;">
                            <div class="col-12">
                                <span style="color: black; font-family: Roboto, sans-serif; font-size: 16px; font-weight: bold;">TAG COMPARABLE TECHNOLOGIES</span>
                            </div>
                        </div>
                        <div class="row" style="width: 100%; padding-top: 5px;" id="dvTaggedGroupNameCompTech">
                            <div class="col-12">
                                <i class="fas fa-user-friends"></i>
                                <span style="color: black; font-family: Roboto, sans-serif; font-size: 12px; font-weight: bold; white-space: pre-wrap" id="tagCompTechGroupName"></span>
                            </div>
                        </div>
                        <div class="row" style="width: 100%; padding-top: 5px; padding-bottom: 5px;">
                            <div class="col-12">
                                <i class="fas fa-tag" style="color: black"></i>
                                <span style="color: black; font-family: Roboto, sans-serif; font-size: 12px; font-weight: bold; white-space: pre-wrap;" id="tagCompTechTagName"></span>
                            </div>
                        </div>
                            <div id="deselect2" class="row" style="font-family: Roboto; font-size: 11px; padding-top: 10px; padding-bottom: 10px; font-weight: bold;">
                                <div class="col-12">
                                    Deselected entries will be removed from the current tag.
                                </div>
                            </div>
                       <div class="row">
                            <div class="col-12" id="dvCompTechTags" style="overflow-y: auto; height: 200px;">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row">
                            <div class="col-12" style="text-align: center;">
                                <button type="button" id="btncancelCompTechtag" class="cancelButton" data-dismiss="modal" onclick="javascript:closetagCompTechModel();">CANCEL</button>
                                <button type="button" id="btnCompTechApplyTag" class="enabledbutton" onclick="javascript:saveTechCompTools();return false;">
                                    <%--<span class="spinner-border spinner-border-sm d-none" id="spinnerapplytag" role="status" aria-hidden="true"></span>--%>
                                APPLY
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <asp:HiddenField ID="hdnlstWgs" runat="server" />
        <asp:HiddenField ID="hdnlstTags" runat="server" />
        <asp:HiddenField ID="hdnToolId" runat="server" />
        <asp:HiddenField ID="hdnSelectedWgId" runat="server" />
        <asp:HiddenField ID="hdnWgId" runat="server" />
        <asp:HiddenField ID="hdnTagId" runat="server" />
        <asp:HiddenField ID="hdnTagsByWgId" runat="server" />
        <asp:HiddenField ID="hdnIsInAppropriateFlagged" runat="server" Value="False" />
        <asp:HiddenField ID="hdnGroupName" runat="server" />
        <asp:HiddenField ID="hdnToolName" runat="server" />
        <asp:HiddenField ID="hdnInApprWords" runat="server" />
        <asp:HiddenField ID="hdnSelectedTags" runat="server" />
        <asp:HiddenField ID="hdnSelectedToolId" runat="server" />
        <asp:HiddenField ID="hdnTagName" runat="server" />
        <asp:HiddenField ID="hdnlstAllWgMembers" runat="server" />
        <asp:HiddenField ID="hdnUserId" runat="server" />
        <asp:HiddenField ID="hdnRoleId" runat="server" />
        <asp:HiddenField ID="hdnWgTagSelected" runat="server" />
        <asp:HiddenField ID="hdnSelectedFilterType" runat="server" Value="PopularHighest" />
        <asp:HiddenField ID="hdnTriggerModal" runat="server" />
        <asp:HiddenField ID="hdnSelectedComTechTags" runat="server" />
        <asp:HiddenField ID="hdnOriginalSelections" runat="server" />
        <asp:HiddenField ID="hdnSelectedToolTags" runat="server" />
    </form>

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

        .textcss {
            font-family: Roboto, sans-serif;
            font-size: 12px
        }

        .modal-backdrop.show {
            background-color: #000000;
            opacity: .5;
        }

        .messagepop {
            font-family: "Roboto, sans-serif";
            cursor: default;
            display: none;
            background-color: white;
            margin-top: 2px;
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

        .modal-dialog {
            position: absolute;
            top: 0px;
            right: 0px;
            bottom: 0;
            left: 0;
            z-index: 10040;
        }

        .modal-header {
            padding: 16px 16px;
            color: #FFF;
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

        .cancelButton {
            font-family: Roboto, sans-serif;
            font-size: 12px;
            Color: #283154;
            font-weight: normal;
            border-radius: .25rem;
            padding: .625rem 1.5rem .5rem;
            background-color: white;
            border-width: 0px;
            overflow: hidden;
            transition: .3s;
            position: relative;
            display: inline-block;
        }

        .cancelButton:hover {
            background-color: #f5f5f5;
        }

        #unsavedChanges .modal-dialog {
            margin-top: 30px;
        }

        .unSavedChangesButton {
            font-family: Roboto, sans-serif;
            font-size: 12px;
            Color: #283154;
            font-weight: normal;
            border-radius: .25rem;
            padding: .625rem .50rem .5rem .50rem;
            background-color: white;
            border-width: 0px;
            overflow: hidden;
            transition: .3s;
            position: relative;
            display: inline-block;
            text-align: center;
            /* border: solid 1px;*/
        }

        .unSavedChangesButton:hover {
            background-color: #f5f5f5;
        }

        .addTagtoListButton {
            font-family: Roboto, sans-serif;
            font-size: 12px;
            Color: #2196F3;
            font-weight: normal;
            border-radius: .25rem;
            padding: .4rem .75rem .3rem;
            background-color: white;
            border-width: 2px;
            overflow: hidden;
            transition: .3s;
            position: relative;
            display: inline-block;
            border-color:#2196F3;
            opacity : 1;
            border: 1.4px solid;
        }

        .addTagtoListButton:hover {
            background-color: white;
            box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 10%);
        }

        .disabledaddTagtoListButton {
            font-family: Roboto, sans-serif;
            font-size: 12px;
            Color: #000000;
            font-weight: normal;
            border-radius: .25rem;
            padding: .4rem .75rem .3rem ;
            background-color: white;
            border-width: 2px;
            opacity : 0.24;
            border: 1.4px solid;
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

        .enabledbutton, .daOKButton {
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

        .enabledbutton:hover,  .daOKButton:hover {
            background-color: #0c56d0;
            box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 10%);
        }

        .list-group-item.active {
            z-index: 2;
            color: black;
            background-color: lightgray;
            border-color: lightgray;
        }

        .tagcheckbox {
            width: 1em;
            height: 1em;
            margin-top: .25em;
            vertical-align: top;
            background-color: #fff;
            background-repeat: no-repeat;
            background-position: center;
            background-size: contain;
            border: 1px solid rgba(0,0,0,.25);
            -webkit-appearance: none;
            -moz-appearance: none;
            border-radius: .25em;
        }

        .tagcheckbox:checked {
            /*//background-image: '/images/check-mark-png.PNG';*/
            background-color: #0d6efd;
            border-color: #0d6efd;
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
                btnText.innerHTML = "<u style='cursor:pointer'><br /><br />Show less</u>";
                moreText.style.display = "inline";
            }
        }

        function showVideoModal(videoURL, videoTitle, linkShortDetail, linkFullDetail) {
            videoURL = videoURL.trim() + "?autoplay=true&showinfo=true";
            window.parent.document.getElementById('videoText').innerHTML = linkFullDetail;
            window.parent.document.getElementById('video').src = videoURL;
            window.parent.document.getElementById('videoText').style.display = "inline";
            window.parent.document.getElementById('videoDesc').scrollTop = 0;
            window.parent.document.getElementById('streamURL').innerHTML = videoURL;
            window.parent.$('#videoModal').modal('show');
        }

        function closeVideoModal() {
            window.parent.document.getElementById('video').src = "";
            window.parent.postMessage(JSON.stringify('close'), '*');
       }

        window.parent.$("#videoModal").on('keydown keyup change', function (e) {
            // ESCAPE key pressed                
            if ((e.keyCode || e.which) == 27) {
                window.parent.document.getElementById('video').src = "";
                window.parent.$('videoModal').modal('hide');
           }
        });

        function timestamp(time) {
            var streamURL = document.getElementById("streamURL");
            document.getElementById('video').src = streamURL.innerHTML + "&st=" + time;
        }

        function TagComparableTech(isReopen) {
            $("#dvCompTechTags").animate({ scrollTop: 0 }, "slow");
            $("#hdnTriggerModal").val(1);
            $("#tagComparableTechModel").modal('show');
            $('#tagComparableTechModel').attr('error', 0);
            window.parent.postMessage(JSON.stringify('open'), '*');
            if (isReopen != undefined && isReopen) {
                $('#btnCompTechApplyTag').removeAttr('disabled', 'disabled');
                $('#btnCompTechApplyTag').removeClass('disabledbutton').addClass('enabledbutton');
            }
            else {
                $('#btnCompTechApplyTag').attr('disabled', 'disabled');
                $('#btnCompTechApplyTag').removeClass('enabledbutton').addClass('disabledbutton');
            }
            var groupName = $('#hdnGroupName').val();
            if (groupName.lastIndexOf('(') > 0) {
                groupName = groupName.substr(groupName, groupName.lastIndexOf('(') - 1);
            }

            if ($('#hdnSelectedWgId').val() != "-1") {
                $('#tagCompTechGroupName').text('Group - ' + groupName);
                $('#dvTaggedGroupNameCompTech').show();
            } else {
                $('#dvTaggedGroupNameCompTech').hide();
                $('#tagCompTechGroupName').text('');
            }

            if ($('#hdnSelectedWgId').val() != "-1") {
                $('#tagCompTechTagName').text(' Group Tag - ' + $('#hdnTagName').val());
            }
            else {
                $('#tagCompTechTagName').text(' Personal Tag - ' + $('#hdnTagName').val());
            }

            $.ajax({
                url: 'NewTag.aspx/getComparableTechnologies?toolId=' + JSON.stringify($('#hdnToolId').val()) + '&tagId=' + $('#hdnTagId').val(),
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    // $('#spinnersearch').addClass('d-none');
                    if (data != null) {
                        $('#dvCompTechTags').empty();
                        if (isReopen != undefined) {
                            if (isReopen) {
                                data.d.lstTools = JSON.parse($('#hdnSelectedComTechTags').val());
                            }
                            else if (!isReopen) {
                                $('#hdnSelectedComTechTags').val(JSON.stringify(data.d.lstTools));
                            }
                        }
                        else {
                            $('#hdnSelectedComTechTags').val(JSON.stringify(data.d.lstTools));
                            $('#hdnOriginalSelections').val(JSON.stringify(data.d.lstTools));
                        }
                        var parentDiv = '';
                        if (data.d.lstTools != null) {

                            parentDiv += '<div class="row" style="font-family: Roboto;padding-top:10px;padding-bottom:10px;font-size:11px;font-weight:bold;"><div class="col-12"> Comparable Technologies (' + data.d.lstTools.length + ')</div></div>';
                            $.each(data.d.lstTools, function (key, val) {
                                var aid = 'a' + val.Tool_Id;
                                var cid = 'chk' + val.Tool_Id;

                                parentDiv += '<div style="text-decoration: none;font-family: Roboto;font-size:11px;padding-left:30px;padding-bottom:5px;" class="list-group-item list-group-item-action" id="' + aid + '" ><input type="checkbox"  onchange="toolChange(this)" toolid="' + val.Tool_Id + '"';

                                if (val.IsChecked > 0) {
                                    parentDiv += ' checked="checked" ';
                                }
                                parentDiv += 'class="form-check-input chkTool" id="' + cid + '"/><label style="padding-top:2px;white-space: pre-wrap;" for="' + cid + '">&nbsp;&nbsp;' + '<a href="ToolPage.aspx?tid=' + val.Tool_Id + '" target="_parent" style="color:#4169e1;font-family: Roboto;font-size:12px;">' + val.Tool_Name + '</a></label></div>';
                            });
                            $('#dvCompTechTags').append(parentDiv);
                        }
                        //$('#dvCompTechTags').scrollTop(0);
                    }

                },
                error: function (jqXHR, status, error) {
                    $('#spinnersearch').addClass('d-none');
                    //$('#toastError').text('Internal Server Error occured');
                    //$('#burntToast').toast('show').show().delay(3000).fadeOut();
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });

        }
        function closenewWGTagModel() {
            $('#newWGTagModel').modal('hide');
            $("#txtNewWgTagName").val('');
            $('#charcounter').text('0/30');
            $('#btnAddTag').attr('disabled', 'disabled');
            $('#btnAddTag').removeClass('addTagtoListButton').addClass('disabledaddTagtoListButton');
            rePopulateTagsList();
            $('#newToolTagModel').focus();
        }

        function closetagCompTechModel() {
            $("#tagComparableTechModel").modal('hide');
            let isError = $('#tagComparableTechModel').attr('error');
            if ($('#btnCompTechApplyTag:disabled').length == 0 && isError == '0') {
                $("#unsavedChanges").modal('show');
            }
            else
                window.parent.postMessage(JSON.stringify('close'), '*');
        }

        function rePopulateTagsList() {
            $('#dvWgTags').empty();
            var lstTags = JSON.parse($('#hdnTagsByWgId').val());
            var enteredText = $("#txtNewWgTagName").val();
            var newlstTags = _.filter(lstTags, function (val) {
                return 0 === val.TAG_LABEL.toLowerCase().indexOf(enteredText.toLowerCase());
            });

            if (enteredText != '') {
                _(lstTags).each(function (item) {
                    var posn = 0;
                    var numbr = -1;
                    var j = -1;
                    while (posn != -1) {
                        posn = item.TAG_LABEL.toLowerCase().indexOf(enteredText.toLowerCase(), j + 1);
                        numbr += 1;
                        j = posn;
                    }
                    if (numbr > 0) {
                        if (newlstTags.find(x => x.TAG_ID === item.TAG_ID)) {
                            console.log("Exist");
                        } else {
                            newlstTags.push(item);
                        }
                    }
                });
            }
            else
                newlstTags = lstTags

            var parentDiv = '';
            $.each(newlstTags, function (key, val) {
                var aid = 'a' + val.TAG_ID;
                var cid = 'chk' + val.TAG_ID;
                parentDiv += '<div style="text-decoration: none;font-family: Roboto;font-size:11px;padding-left:30px;padding-bottom:5px;" class="list-group-item list-group-item-action" id="' + aid + '" ><input type="checkbox"  onchange="tagChange(this)" tagid="' + val.TAG_ID + '"';
                if (val.IsChecked > 0) {
                    parentDiv += ' checked="checked" ';
                }
                parentDiv += 'class="form-check-input chkTool" id="' + cid + '"/><label style="padding-top:2px;white-space: pre-wrap;" for="' + cid + '">&nbsp;&nbsp;' + val.TAG_LABEL + '</label></div>';
            });

            $('#dvWgTags').append(parentDiv);
        }

        function trmEntryChange(element) {
            var toolId = $('#' + element.id).attr('id');
            var lstTags = JSON.parse($('#hdnSelectedToolTags').val());
            var i;
             $.each(lstTags, function (index, value) {
                if (value.Tool_Id == toolId) {
                    i = index;
                    return false; // retrun false to stop the loops
                }
            });
            if (element.checked)
                lstTags[i].IsChecked = 1;
            else
                lstTags[i].IsChecked = 0;
            var orgLstTags = JSON.parse($('#hdnOriginalSelections').val());
            var isChanged = false;
            var orgIndex;
            $.each(orgLstTags, function (index, value) {
                var tid = value.Tool_Id;
                $.each(lstTags, function (otherIndex, otherValue) {
                    if (tid == otherValue.Tool_Id) {
                        var orgCheck = orgLstTags[index].IsChecked;
                        if (orgCheck == null)
                            orgCheck = 1;
                        var check = lstTags[otherIndex].IsChecked;
                        if( check == null)
                            check = 1
                        if (orgCheck != check)
                            isChanged = true;
                        return false;
                    }
                });
            });

            if (isChanged) {
                $('#btnOkTaggedEntires').removeAttr('disabled');
                $('#btnOkTaggedEntires').removeClass('disabledbutton').addClass('enabledbutton');
            } else {
                $('#btnOkTaggedEntires').attr('disabled', 'disabled');
                $('#btnOkTaggedEntires').removeClass('enabledbutton').addClass('disabledbutton');
            }
            $('#hdnSelectedToolTags').val(JSON.stringify(lstTags));
        }
        //btnCompTechApplyTag
        function toolChange(element) {
            //  $('#btnCompTechApplyTag').removeAttr('disabled', 'disabled');
            //   $('#btnCompTechApplyTag').removeClass('disabledbutton').addClass('enabledbutton');
            var isAtleastOneItemSelected = false;
            $('.chkTool').each(function () {
                if ($(this).is(':checked')) {
                    isAtleastOneItemSelected = true;
                }
            });
            var toolId = $('#' + element.id).attr('toolid');
            var lstTags = JSON.parse($('#hdnSelectedComTechTags').val());

            var i;
            $.each(lstTags, function (index, value) {
                if (value.Tool_Id == toolId) {
                    i = index;
                    return false; // retrun false to stop the loops
                }
            });
            if (element.checked)
                lstTags[i].IsChecked = 1;
            else
                lstTags[i].IsChecked = 0;

            var orgLstTags = JSON.parse($('#hdnOriginalSelections').val());
            var isChanged = false;
            var orgIndex;
            $.each(orgLstTags, function (index, value) {
                var tid = value.Tool_Id;
                $.each(lstTags, function (otherIndex, otherValue) {
                    if (tid == otherValue.Tool_Id) {
                        if (orgLstTags[index].IsChecked != lstTags[otherIndex].IsChecked)
                            isChanged = true;
                        return false;
                    }
                });
            });

            if (isChanged) {
                $('#btnCompTechApplyTag').removeAttr('disabled');
                $('#btnCompTechApplyTag').removeClass('disabledbutton').addClass('enabledbutton');
            } else {
                $('#btnCompTechApplyTag').attr('disabled', 'disabled');
                $('#btnCompTechApplyTag').removeClass('enabledbutton').addClass('disabledbutton');
            }
            $('#hdnSelectedComTechTags').val(JSON.stringify(lstTags));
        }

        function saveTechCompTools() {
            let isError = false;
            var selectedToolIds = ''; var unselectedToolIds = '';
            $('.chkTool').each(function () {
                if ($(this).is(':checked')) {
                    selectedToolIds += $(this).attr('toolid') + ',';
                }
                else
                    unselectedToolIds += $(this).attr('toolid') + ',';
            });
            selectedToolIds = selectedToolIds.slice(0, -1);
            unselectedToolIds = unselectedToolIds.slice(0, -1);
            var grpId = 0;
            if ($('#hdnSelectedWgId').val() == "-1")
                grpId = $('#hdnSelectedWgId').val()
            else
                grpId = $('#hdnWgId').val();
            $.ajax({
                url: 'NewTag.aspx/saveTechCompTools?selectedToolIds=' + JSON.stringify(selectedToolIds) + '&unselectedToolIds=' + JSON.stringify(unselectedToolIds) + '&tagId=' + $('#hdnTagId').val() + '&tagName=' + JSON.stringify($('#hdnTagName').val()) + '&wgId=' + grpId + '&toolId=' + $('#hdnToolId').val(),
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    if (data != null) {
                        if (!data.d.IsValid) {
                            //data.d.Message
                            $('#lblDeleteTagErrorMessage').text(data.d.Message);
                            $('#lblDeleteTagErrorMessage').show().delay(3000).fadeOut();
                            //$('#toastError').text('Internal Server Error occured');
                            //$('#burntToast').toast('show').show();
                            isError = 1;
                            $('#tagComparableTechModel').attr('error', isError);
                            if (data.d.Message == "You are not authorized to perform this action") {
                                $('#toastError').text('You are not authorized to perform this action');
                                $('#burntToast').toast('show').show().delay(3000).fadeOut();
                                getToolWorkGroups();
                                $("#tagComparableTechModel").modal('hide');
                                window.parent.postMessage(JSON.stringify('close'), '*');
                            }
                        }
                        else {
                            $("#tagComparableTechModel").modal('hide');
                            window.parent.postMessage(JSON.stringify('close'), '*');
                            //$('#lblGroupSuccessMessage').text('Entry tags applied successfully.');
                            //$("#lblGroupSuccessMessage").show().delay(5000).fadeOut();
                            $('#toastSuccess').text('Tag(s) applied successfully.');
                            $('#goodToast').toast('show').show().delay(3000).fadeOut();
                            getToolWorkGroupTags();
                            getToolPersonalTags();
                        }
                    }
                },
                error: function (jqXHR, status, error) {
                    $('#lblDeleteTagErrorMessage').text(error);
                    $('#lblDeleteTagErrorMessage').show().delay(3000).fadeOut();
                    //$('#toastError').text('Internal Server Error occured');
                    //$('#burntToast').toast('show').show();
                    isError = 1;
                    $('#tagComparableTechModel').attr('error', isError);
                }
            });

        }

        function removeTag() {
            //ajax method
            $('#InRenameApprWarning').hide();
            $('#lblRenameInApporipateWarningMessage').html('');
            $('#lblRenameInApporipateWarningMessage1').html('');
            $('#lblRenameGroupWarningMessage').text('');
            /*$('#spinnerDeleteTag').removeClass('d-none');*/
            var grpId = 0;
            if ($('#hdnSelectedWgId').val() == "-1")
                grpId = $('#hdnSelectedWgId').val()
            else
                grpId = $('#hdnWgId').val();
            $.ajax({
                url: 'NewTag.aspx/removeTag?tgId=' + JSON.stringify($('#hdnTagId').val()) + '&toolId=' + $('#hdnToolId').val() + '&tagName=' + JSON.stringify($('#hdnTagName').val()) + '&wgId=' + grpId,
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    /*$('#spinnerDeleteTag').addClass('d-none');*/
                    if (data != null) {
                        if (!data.d.IsValid) {
                            //uncomment for debug messages to be displayed
                            //$('#lblDeleteTagErrorMessage').text(data.d.Message)
                            window.parent.postMessage(JSON.stringify('close'), '*');
                            $('#toastError').text(data.d.Message);
                            $('#burntToast').toast('show').show().delay(3000).fadeOut();
                            if (data.d.Message == "You are not authorized to perform this action") {
                                $('#toastError').text('You are not authorized to perform this action');
                                $('#burntToast').toast('show').show().delay(3000).fadeOut();                                
                                getToolWorkGroups();
                                $("#deleteTagModel").modal('hide');
                            }
                        }
                        else {
                            //lblSuccessMessage
                            $('#toastSuccess').text(data.d.Message);
                            $('#goodToast').toast('show').show().delay(3000).fadeOut();
                            //$('#lblDeleteGroupSuccessMessage').text(data.d.Message)
                            //window.location.reload();
                            $("#deleteTagModel").modal('hide');
                            //uncomment for debug messages to be displayed
                            //$('#lblGroupSuccessMessage').text('Tag removed from entry successfully.');
                            //$("#lblGroupSuccessMessage").show().delay(5000).fadeOut();
                            getToolWorkGroupTags();
                            getToolPersonalTags();
                            //getWGMembersById(wgId);
                        }
                    }
                    $('#dvTagPopup').hide();
                },
                error: function (jqXHR, status, error) {
                    $('#toastError').text('Internal Server Error occured');
                    $('#burntToast').toast('show').show().delay(3000).fadeOut();
                    /*$('#spinnerDeleteTag').addClass('d-none');*/
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });
        }

        function applyTag() {
            var grpId = 0;
            if ($('#hdnSelectedWgId').val() == "-1")
                grpId = $('#hdnSelectedWgId').val()
            else
                grpId = $('#hdnWgId').val();
           $.ajax({
               url: 'NewTag.aspx/applyTag?tagId=' + $('#hdnTagId').val() + '&toolId=' + $('#hdnSelectedToolId').val() + '&tagName=' + JSON.stringify($('#hdnTagName').val()) + '&wgId=' + grpId,
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    /*$('#spinnerapplytag').addClass('d-none');*/
                    if (data.d.IsValid) {
                        //$('#lblGroupSuccessMessage').text('Tag applied successfully.');
                        // $("#lblGroupSuccessMessage").show().delay(5000).fadeOut();
                        $('#toastSuccess').text('Tag(s) applied successfully.');
                        $('#goodToast').toast('show').show().delay(3000).fadeOut();
                        $("#tagTRMModel").modal('hide');
                        window.parent.postMessage(JSON.stringify('close'), '*');
                        $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                        getToolPersonalTags();
                        getToolWorkGroupTags();
                    }
                    else {
                        //$('#lbltagEntryErrorMessage').text(data.d.Message);
                        //$("#lbltagEntryErrorMessage").show().delay(5000).fadeOut();
                        window.parent.postMessage(JSON.stringify('close'), '*');
                        if (data.d.Message == "You are not authorized to perform this action") {
                            $('#toastError').text('You are not authorized to perform this action');
                            $('#burntToast').toast('show').show().delay(3000).fadeOut();
                            getToolWorkGroups();
                            closetagTRMModel();                           
                        }
                    }
                },
                error: function (jqXHR, status, error) {
                    if (status == 'error') {
                        $('#lbltagEntryErrorMessage').text('Internal Server Error occured');
                        $('#lbltagEntryErrorMessage').show().delay(3000).fadeOut();

                        //$('#toastError').text('Internal Server Error occured');
                        //   $('#burntToast').toast('show').show().delay(3000).fadeOut();
                    }
                    /*$('#spinnerapplytag').addClass('d-none');*/
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });
        }

        function selectedTool(toolId) {
            $('#hdnSelectedToolId').val(toolId);
            $('#lbltagEntryErrorMessage').text('');
            $('#selectedToolTagtoApply').text('Add tag "' + $('#hdnTagName').val() + '" to TRM entry "' + $('#a' + toolId).text() + '"');
            $('#btnApplyTag').removeClass('disabledbutton').addClass('enabledbutton');
            $('#btnApplyTag').removeAttr('disabled');
        }

        function getToolEntries() {
            //tagentryGroupName
            //tagentryTagName

            $('#btnApplyTag').removeClass('enabledbutton').addClass('disabledbutton');
            $('#btnApplyTag').attr('disabled', 'disabled');

            $('#hdnSelectedToolId').val('');
            $('#selectedToolTagtoApply').text('');

            if ($('#txtToolEntry').val().trim() != "") {
                $('#btnSearch').attr('disabled', 'disabled');
                $('#txtToolEntry').attr('disabled', 'disabled');
                $('#entryNameLbl').addClass('entryNameStyle');
                $('#spinnersearch').removeClass('d-none');
                $.ajax({
                    url: 'NewTag.aspx/getToolEntires?toolText=' + JSON.stringify($('#txtToolEntry').val()),
                    type: 'GET',
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function (data, status, jqXHR) {
                        $('#spinnersearch').addClass('d-none');
                        if (data != null) {
                            $('#dvViewTRMToolEntries').empty();
                            var parentDiv = '';
                            if (data.d.lstTools != null) {

                                parentDiv += '<div class="row" style="font-family: Roboto;padding-top:10px;padding-bottom:10px;font-size:11px;color:black;"><div class="col-12" style="font-family: Roboto;font-size:11px;color:black";> Found ' + data.d.lstTools.length + ' entries in TRM </div></div>';
                                parentDiv += '<div class="list-group">';

                                $.each(data.d.lstTools, function (key, val) {
                                    var aid = 'a' + val.Tool_Id;
                                    parentDiv += '<a href="#" style="text-decoration: none;font-family: Roboto;font-size:11px; color:black;" class="list-group-item list-group-item-action" id="' + aid + '" onclick="javascript:selectedTool(' + val.Tool_Id + ');return false;">' + val.Tool_Name + '</a>'

                                });
                                //parentDiv += '</table>';
                                parentDiv += '</div>';
                                $('#dvViewTRMToolEntries').append(parentDiv);
                            }
                            $('#dvViewTRMToolEntries').scrollTop(0);
                            $('#btnSearch').removeAttr('disabled');
                            $('#txtToolEntry').removeAttr('disabled');
                            $('#entryNameLbl').removeClass('entryNameStyle');
                        }
                    },
                    error: function (jqXHR, status, error) {
                        $('#spinnersearch').addClass('d-none');
                        $('#btnSearch').removeAttr('disabled');
                        $('#txtToolEntry').removeAttr('disabled');
                        $('#entryNameLbl').removeClass('entryNameStyle');
                        //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                        //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                    }
                });
            }
        }

        function openToolPage(tid) {
            $("#viewTRMModel").modal('hide');
            var pageUrl = '\ToolPage.aspx?tid=' + tid;
           // window.open(pageUrl, "_top");
        }

        function closetagTRMModel() {
            $("#tagTRMModel").modal('hide');
            $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
            window.parent.postMessage(JSON.stringify('close'), '*');
        }

        function canceltagTRMModel() {
            $("#tagTRMModel").modal('hide');
            $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
            window.parent.postMessage(JSON.stringify('close'), '*');
        }
        function createTagEntryModel() {
            $("#tagTRMModel").modal('show');
            $('#lbltagEntryErrorMessage').text('');
            var wgId = $('#hdnSelectedWGId').val();
            window.parent.postMessage(JSON.stringify('open'), '*');
            $('#dvViewTRMToolEntries').empty();
            $('#tagentryTitle').text('TAG A TRM ENTRY');
            var groupName = $('#hdnGroupName').val();
            if (groupName.lastIndexOf('(') > 0) {
                groupName = groupName.substr(groupName, groupName.lastIndexOf('(') - 1);
            }
            if (wgId >= 0 || $('#hdnSelectedWgId').val() == 0) {
                $('#dvGroupEntry').show();
                $('#tagEntryGroupIcon').show();
                $('#tagentryGroupName').text('Group - ' + groupName);
                $('#tagentryTagName').text('Group Tag - ' + $('#hdnTagName').val());
            } else {
                $('#dvGroupEntry').hide();
                $('#tagEntryGroupIcon').hide();
                $('#tagentryTagName').text('Personal Tag - ' + $('#hdnTagName').val());
            }
            $('#txtToolEntry').val('');
            $('#dvTagPopup').hide();
            $('#selectedToolTagtoApply').text('');
            $('#btnApplyTag').removeClass('enabledbutton').addClass('disabledbutton');
            $('#btnApplyTag').attr('disabled', 'disabled');
         }

        function closeviewTRMModel() {
            $("#viewTRMModel").modal('hide');
            if ($('#btnOkTaggedEntires:disabled').length == 0) {
                $("#unsavedChanges").modal('show');
            }
            else {
                $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                window.parent.postMessage(JSON.stringify('close'), '*');
            }
        }

        function cancelviewTRMModel() {
            $("#viewTRMModel").modal('hide');
            let isError = $('#viewTRMModel').attr('error');
            if ($('#btnOkTaggedEntires:disabled').length == 0 && isError == '0') {
                $("#unsavedChanges").modal('show');
            }
            else {
                $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                window.parent.postMessage(JSON.stringify('close'), '*');
            }
        }

        function closeDeleteTagModel() {
            $("#deleteTagModel").modal('hide');
            window.parent.postMessage(JSON.stringify('close'), '*');
        }

        function removeTool() {
            let isError = false;
            $('#InRenameApprWarning').hide();
            $('#lblRemoveTagErrorMessage').text('');
            $('#lblRemoveTagSuccessMessage').text('');
            if ($('#btnOkTaggedEntires').val() == "OK") {
                $('#dvGroupPopup').hide();
            } else {
                var grpId = 0;
                if ($('#hdnSelectedWgId').val() == "-1")
                    grpId = $('#hdnSelectedWgId').val()
                else
                    grpId = $('#hdnWgId').val();
                /* iterate over the tools and remove those not selected */
                for (var j = 0; j < toolArray.length; j++) {
                    if (!document.getElementById(toolArray[j]).checked) {
                        //confirm("removeToolfromTag tagid-->" + $('#hdnTagId').val() + " toolId-->" + toolArray[j] )

                        $.ajax({
                            url: 'NewTag.aspx/removeToolFromTag?tgId=' + $('#hdnTagId').val() + '&toolId=' + toolArray[j] + '&tagName=' + JSON.stringify($('#hdnTagName').val()) + '&wgId=' + grpId,
                            type: 'GET',
                            contentType: 'application/json',
                            dataType: 'json',
                            success: function (data, status, jqXHR) {
                                if (data != null) {
                                    if (!data.d.IsValid) {
                                        $('#lblRemoveTagErrorMessage').text(data.d.Message);
                                        $('#lblRemoveTagErrorMessage').show().delay(5000).fadeOut();
                                        //$('#toastError').text(data.d.Message);
                                        //$('#burntToast').toast('show').show().delay(3000).fadeOut();
                                        window.parent.postMessage(JSON.stringify('close'), '*');
                                        isError = 1;
                                        $('#viewTRMModel').attr('error', isError);
                                        if (data.d.Message == "You are not authorized to perform this action") {
                                            $('#toastError').text('You are not authorized to perform this action');
                                            $('#burntToast').toast('show').show().delay(3000).fadeOut();                                            
                                            getToolWorkGroups();
                                            $("#viewTRMModel").modal('hide');                                            
                                        }
                                    } else {
                                        //$('#lblRemoveTagSuccessMessage').text('Tool removed from entry successfully.');
                                        //$('#lblRemoveTagSuccessMessage').text(data.d.Message);
                                        //$("#lblRemoveTagSuccessMessage").show().delay(5000).fadeOut();
                                        //getAllUserWorkGroups();
                                        //getPersonalTags();
                                        $('#toastSuccess').text('Entry removed from tag successfully.');
                                        $('#goodToast').toast('show').show().delay(3000).fadeOut();
                                        getToolWorkGroupTags();
                                        getToolPersonalTags();
                                        $("#viewTRMModel").modal('hide');
                                    }
                                }
                                canceltagTRMModel();
                                $('#viewTRMModel').hide();
                            },
                            error: function (jqXHR, status, error) {
                                $('#lblRemoveTagErrorMessage').text(error);
                                $('#lblRemoveTagErrorMessage').show().delay(5000).fadeOut();
                                //$('#toastError').text(status + " ---- " + error);
                                //$('#burntToast').toast('show').show().delay(3000).fadeOut();
                                isError = 1;
                                $('#viewTRMModel').attr('error', isError);
                            }
                        });
                    }
                }
            }
        }

        let numElements = 0;
        const toolArray = [];

        function viewTRMEntriesModel(aTagID, isPersonal, isReopen) {
            $('#btnItOKTaggedEntires').children('.ripple').remove();
            $('#btnItOKTaggedEntires').removeClass('ripple');
            $("#dvViewTRMEntries").animate({ scrollTop: 0 }, "slow");
            $("#viewTRMModel").modal('show');
            $("#viewTRMModel").attr('error', 0);
            window.parent.postMessage(JSON.stringify('open'), '*');
            $('#dvTagPopup').hide();
            $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
            if (isReopen != undefined && isReopen) {
                $('#btnOkTaggedEntires').removeAttr('disabled', 'disabled');
                $('#btnOkTaggedEntires').removeClass('disabledbutton').addClass('enabledbutton');
            }
            else {
                $('#btnOkTaggedEntires').attr('disabled', 'disabled');
                $('#btnOkTaggedEntires').removeClass('enabledbutton').addClass('disabledbutton');
            }
            if(isPersonal == undefined ){
                if($('#hdnSelectedWgId').val() != "-1")
                    isPersonal = false;
                else
                    isPersonal = true;
            }
                
            var RoleId = 0;
            var tagtype = '';
            var tagdef = '';
            
            if(!isPersonal){
                RoleId = $('#btn' + aTagID).attr('RoleId');
                if (typeof RoleId == 'undefined') {
                    var lstAllWgMembers = JSON.parse($('#hdnlstAllWgMembers').val());
                    var member = lstAllWgMembers.find(m => m.WG_ID == $('#hdnWgId').val());
                    RoleId = member.Role;
                }
            }
            if (aTagID != null) {
                $('#hdnTagId').val(aTagID);
                $('#hdnTagName').val($('#btn' + aTagID).attr('tagname'));
                tagtype = $('#btn' + aTagID).attr('tagtype');
                tagdef = $('#btn' + aTagID).attr('tagdef');
            }

            var btnid = $('#hdnTagId').val();
            tagtype = $('#btn' + btnid).attr('tagtype');
            tagdef = $('#btn' + btnid).attr('tagdef');

            if (isPersonal != undefined) {
                if (isPersonal) {
                    // personal tag
                    $('#dvTaggedGroupName').hide();
                    $('#hdnSelectedWgId').val(-1);
                    $("#hdnTriggerModal").val(2);
                }
                else {
                    $('#dvTaggedGroupName').show();
                    $('#hdnSelectedWgId').val(0);
                    $("#hdnTriggerModal").val(3);
                }
            }
            else {
                // ellipses selected
                if (RoleId < 3) {
                    $('#dvTaggedGroupName').show();
                    $('#hdnSelectedWgId').val(0);
                    $("#hdnTriggerModal").val(4);
                } else {
                    $('#dvTaggedGroupName').hide();
                    $('#hdnSelectedWgId').val(-1)
                    $("#hdnTriggerModal").val(4);
                }
            }
            $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(205, 207, 215)');

            //confirm(" R-->" + RoleId + "<- isP->" + isPersonal )
            if (RoleId < 3) {
                $('#btnOkTaggedEntires').text('APPLY');
                $('#btnOkTaggedEntires').show();
                $('#btnTaggedEntires').text('CANCEL');
                $('#btnTaggedEntires').show();
                $('#btnItOKTaggedEntires').hide();
                $('#taggedEntriesDeselectedMessage').show();
                $('#deselect1').show();
                $('#deselect2').show();
            } else {
                if ((isPersonal != false || typeof isPersonal == 'undefined') && RoleId < 3) {
                    $('#btnOkTaggedEntires').text('APPLY');
                    $('#btnOkTaggedEntires').show();
                    $('#btnTaggedEntires').text('CANCEL');
                    $('#btnTaggedEntires').show();
                    $('#btnItOKTaggedEntires').hide();
                    $('#taggedEntriesDeselectedMessage').show();
                } else {
                    $('#btnOkTaggedEntires').hide();
                    $('#btnTaggedEntires').hide();
                    $('#btnItOKTaggedEntires').text('OK');
                    $('#btnItOKTaggedEntires').show();
                    $('#taggedEntriesDeselectedMessage').hide();
                }
                $('#deselect1').hide();
                $('#deselect2').hide();
            }
            //confirm(aTagID + "<<" + isPersonal + "<>" + RoleId + "--" + $('#hdnTagId').val() + "<->" + $('#hdnRoleId').val())
            $.ajax({
                url: 'NewTag.aspx/getviewTRMEntries?tgId=' + $('#hdnTagId').val(),
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {

                    if (data != null) {
                        $('#dvViewTRMEntries').empty();
                        var parentDiv = '';
                        if (data.d.lstTools != null) {
                            var groupName = $('#hdnGroupName').val();
                            if (groupName.lastIndexOf('(') > 0) {
                                groupName = groupName.substr(groupName, groupName.lastIndexOf('(') - 1);
                            }
                            if ($('#hdnSelectedWgId').val() != "-1") {
                                $('#spanTaggedGroupName').text('Group - ' + groupName);
                                $('#dvTaggedGroupName').show();
                                $('#spanTaggedGroupName').show();
                                $('#hdnTriggerModal').val(3);
                            } else {
                                $('#spanTaggedGroupName').text('');
                                $('#dvTaggedGroupName').hide();
                                $('#spanTaggedGroupName').hide();
                                $('#hdnTriggerModal').val(2);
                            }
                            //$('#spanTaggedGroupName').text('Group - ' + groupName);
                            if ($('#hdnSelectedWgId').val() != "-1") {
                                if (tagtype == "GLOBAL") {
                                    if (tagdef == "null" || tagdef == " " || tagdef == null) {
                                        $('#spanTaggedTagName').html('  Global Tag - ' + $('#hdnTagName').val());
                                    }
                                    else {
                                        $('#spanTaggedTagName').html('  Global Tag - ' + $('#hdnTagName').val() + '<i tgdefinition = "' + tagdef + '" class="fa fa-info-circle tagDef" style="padding-left:7px;cursor:pointer;font-size:12px;"></i>');
                                    }
                                }
                                else {
                                    $('#spanTaggedTagName').html('  Group Tag - ' + $('#hdnTagName').val());
                                }
                                //$('#spanTaggedTagName').text(' Group Tag - ' + $('#hdnTagName').val());
                            }
                            else {
                                $('#spanTaggedTagName').html(' Personal Tag - ' + $('#hdnTagName').val());
                            }
                            parentDiv += '<div class="row" style="font-family: Roboto;padding-top:10px;padding-bottom:10px;font-size:11px;font-weight:bold;">';
                            parentDiv += '<div class="col-12">Entries (' + data.d.lstTools.length + ')</div >';
                            parentDiv += '</div > ';
                            numElements = 0;
                            if (isReopen != undefined) {
                                if (isReopen) {
                                    data.d.lstTools = JSON.parse($('#hdnSelectedToolTags').val());
                                } else {
                                    $('#hdnSelectedToolTags').val(JSON.stringify(data.d.lstTools));
                                }
                            }
                            else {
                                $('#hdnSelectedToolTags').val(JSON.stringify(data.d.lstTools));
                                $('#hdnOriginalSelections').val(JSON.stringify(data.d.lstTools));
                            }
                            $.each(data.d.lstTools, function (key, val) {
                                toolArray[numElements] = val.Tool_Id;
                                numElements++;
                                parentDiv += '<div style="text-decoration: none;font-family: Roboto;font-size:11px;padding-left:30px;padding-bottom:5px;" class="list-group-item" id="' + val.TAG_ID + '" >';
                                if ((RoleId < 3 && isPersonal != false) || ((RoleId < 3 && isPersonal == false) && $('#hdnSelectedWgId').val() == 0)) {
                                    parentDiv += '<input type="checkbox" class="form-check-input chkTool active" data-toggle="toggle" id="' + val.Tool_Id + '"';
                                    if (val.IsChecked == null || val.IsChecked) {
                                        parentDiv += ' checked="checked" ';
                                    }
                                    parentDiv += '  onclick = "trmEntryChange(this);"/>';
                                    parentDiv += '<label style="padding-top:2px;white-space: pre-wrap;">&nbsp;&nbsp;'
                                }
                                parentDiv += '<a href="ToolPage.aspx?tid=' + val.Tool_Id + '" target="_top" onclick = "javascript:openToolPage(' + val.Tool_Id + ')" class="daLink" style="text-decoration:none;color:#4169e1;font-family: Roboto;font-size:12px;">' + val.Tool_Name + '</a>';
                                if ((RoleId < 3 && isPersonal != false) || ((RoleId < 3 && isPersonal == false) && $('#hdnSelectedWgId').val() == 0)) {
                                    parentDiv += '</label>'
                                }
                                parentDiv += '</div>';
                            });
                            parentDiv += '</div>';

                            $('#dvViewTRMEntries').append(parentDiv);

                            $('.fa-info-circle').click(function () {
                                if ($('#tagdefinition').is(':visible')) {
                                    $('#tagdefinition').hide();
                                }
                                else {
                                    //var btn1 = $('#dvAffectedEntries');
                                    $('#tgdefinition').empty();
                                    let desc = $(this).attr('tgdefinition');
                                    desc = desc.replace(/<br>/g, '<br class="tagDefPopup">');
                                    desc = desc.replace(/<b>/g, '<b class="tagDefPopup">');
                                    $('#tgdefinition').append(desc);
                                    $('#tagdefinition').css('position', 'absolute');
                                    var top = $('#tagdefinition').offset().top + 200;
                                    var left = $('#tagdefinition').offset().left + 125;
                                    if (left > $('#content-main').width()) {
                                        var diff = (left - $('#content-main').width()) - 10;
                                        left = left - diff;
                                    }
                                    $('#tgdefinition').css("max-height", 150 + 'px');
                                    $('#tagdefinition').css("height", 195 + 'px');
                                    $('#tagdefinition').css("width", 350 + 'px');
                                    $('#tagdefinition').css('top', (top - 100));
                                    $('#tagdefinition').css('left', left);

                                    $('#tagdefinition').show();
                                    $('#tgdefinition').scrollTop(0);

                                }
                            });
                        }
                    }
                },
                error: function (jqXHR, status, error) {
                    $('#dvViewTRMEntries').text(error + " ---- " + status);
                }
            });
        }

        function closeTagDefinition() {
            if ($('#tagdefinition').is(':visible'))
                $('#tagdefinition').hide();
        }

        function getToolPersonalTags() {
            $.ajax({
                url: 'NewTag.aspx/getToolPersonalTags?toolId=' + $('#hdnToolId').val(),
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    if (data != null) {
                        var parentDiv = '';
                        if (data.d != null) {

                            $('#dvpersonalTags').empty();
                            var counter = 0;
                            var templstAllTags = '';
                            var filtertype = $('#hdnSelectedFilterType').val();
                            if (filtertype == "PopularHighest") {
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

                            //var sortedAsc = _.sortBy(collection, 'propertyName');
                            //var sortedDesc = _.sortBy(collection, 'propertyName').reverse();

                            $.each(templstAllTags, function (key, val) {
                                ptbtnId = "btn" + val.TAG_ID;
                                var ptdvid = "dv" + val.TAG_ID;
                                parentDiv = '';
                                parentDiv += '<div style="display:inline-block;padding:4px 4px 4px 4px;"><div id=' + ptdvid + ' style="display:flex;background-color:rgb(220, 230, 250);border-radius:2px;height:28px;"><div style="font-size:12px;display:inline-block;border-radius:6px;text-align:center;">';
                                parentDiv += '<div id = ' + ptbtnId + ' tagid = "' + val.TAG_ID + '" tagname = "' + val.TAG_LABEL + '" class="tagellipsisbuttonpt" style = "width:7px;float:left;height:100%;cursor:pointer;padding-left:6px;padding-right:10px;padding-top:5px;"><i class="fas fa-ellipsis-v" style="color: #757575;"></i></div>';
                                parentDiv += '<div style="height:100%;float:left;padding-right:10px;padding-top:7px;font-size:11px;font-family: Roboto, sans-serif;border-radius: 3px;white-space: pre-wrap;cursor:pointer" onclick = "javascript:viewTRMEntriesModel(' + val.TAG_ID + ',true);return false;">&nbsp;&nbsp;<i class="fas fa-user" style="padding-top:2px;float:left;padding-right:2px;"></i>' + val.TAG_LABEL + ' (' + val.EntryCount + ')' + '</div></div></div></div>';
                                $('#dvpersonalTags').append(parentDiv);
                                counter++;
                            });
                            if (counter == 0) {
                                parentDiv = '';
                                parentDiv += '<div style="display: inline-block;padding-right:10px;font-size:11px;font-family: Roboto, sans-serif;"><p> No personal tags have been applied to this entry.</p></div>';
                                $('#dvpersonalTags').append(parentDiv);
                            }
                            $('#personaltagsCount').text(counter);
                            pttagpopupclick();
                        }
                    }
                },
                error: function (jqXHR, status, error) {
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });
        }

        function getWGMember() {
            $.ajax({
                url: 'NewTag.aspx/getWGMember',
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    if (data != null) {
                        
                        if (data.d != null) {
                            $('#hdnlstAllWgMembers').val(JSON.stringify(data.d));
                          
                        }
                    }
                },
                error: function (jqXHR, status, error) {
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });
        }
        function getToolWorkGroups() {
           
            $.ajax({
                url: 'NewTag.aspx/getToolWorkGroups?toolId=' + $('#hdnToolId').val(),
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    if (data != null) {
                        var parentDiv = '';
                      
                        $('#dvMrGroups').empty();
                        if (data.d != null) {
                                                     
                            var lstWgs = data.d;
                            var lstTags = JSON.parse($('#hdnlstTags').val());
                            var parentDiv = ''; var grpId = ''; var groupTagCounter = 0; groupCounter = 0; totalgroupcounter = 0;

                            $.each(lstWgs, function (key, val) {
                                grpId = 'grp' + val.WG_ID;
                                groupTagCounter = 0
                                $.each(lstTags, function (key, valtag) {
                                    if (val.WG_ID == valtag.WG_ID) {
                                        groupTagCounter++;
                                    }
                                });
                                groupCounter += groupTagCounter;
                                $('#dvMrGroups').append('<li style="cursor:pointer;white-space: pre-wrap;" class="list-group-item list-group-item-action" id="' + grpId + '" onclick="loadTagforSelectedWg(' + val.WG_ID + ');">' + val.WG_LABEL + ' (' + groupTagCounter + ')' + '</li>');
                                totalgroupcounter++;
                            });
                            parentDiv = '';
                            if (totalgroupcounter == 0) {
                                $('#dvTagGroups').hide();
                            }
                           
                            var wgId = $('#hdnWgId').val();
                            var lstfiltered = lstWgs.filter(m => m.WG_ID == wgId);
                           
                            if (lstfiltered != null) {
                                if (lstfiltered.length == 0) {
                                    $('#hdnWgId').val(lstWgs[0].WG_ID);
                                    $('#spanselectedGroupName').text(lstWgs[0].WG_LABEL);
                                    $('#grp' + lstWgs[0].WG_ID).addClass('active');
                                }
                                else {
                                    $('#grp' + wgId).addClass('active');
                                }
                            }
                            else {
                                $('#hdnWgId').val(lstWgs[0].WG_ID);
                                $('#spanselectedGroupName').text(lstWgs[0].WG_LABEL);
                                $('#grp' + lstWgs[0].WG_ID).addClass('active');
                            }
                           
                            getWGMember();
                            getToolWorkGroupTags();
                        }
                    }
                },
                error: function (jqXHR, status, error) {
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });
        }


        function getToolWorkGroupTags() {

            $.ajax({
                url: 'NewTag.aspx/getToolWorkGroupTags?toolId=' + $('#hdnToolId').val() + '&groupId=' + $('#hdnWgId').val(),
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    if (data != null) {
                        var parentDiv = '';
                        if (data.d != null) {

                            $('#dvTags').empty();

                            var lstAllWgMembers = JSON.parse($('#hdnlstAllWgMembers').val());
                            var member = lstAllWgMembers.find(m => m.WG_ID == $('#hdnWgId').val());
                            var tagCounter = 0;

                            if (member.Role === "3") {
                                $('#btnaddNewWGTag').css("display", "none");
                            }
                            else {
                                $('#btnaddNewWGTag').css("display", "block");
                            }

                            var filtertype = $('#hdnSelectedFilterType').val();
                            if (filtertype == "PopularHighest") {
                                templstAllTags = _.sortBy(data.d, [{ 'EntryCount': 'desc' }, { 'LOWER_TAG_LABEL': 'asc' }]);
                            }
                            else if (filtertype == "PopularLowest") {
                                templstAllTags = _.sortBy(data.d, 'EntryCount');
                            }
                            else if (filtertype == "NameAtoZ") {
                                templstAllTags = _.sortBy(data.d, 'LOWER_TAG_LABEL');
                            }
                            else if (filtertype == "NameZtoA") {
                                templstAllTags = _.sortBy(data.d, 'LOWER_TAG_LABEL').reverse();
                            }
                            else if (filtertype == "CreatedNewest") {
                                templstAllTags = _.sortBy(data.d, 'CREATED_DATE').reverse();
                            }
                            else if (filtertype == "CreatedOldest") {
                                templstAllTags = _.sortBy(data.d, 'CREATED_DATE');
                            }
                            else
                                templstAllTags = data.d;

                            $.each(templstAllTags, function (key, val) {
                                btnId = "btn" + val.TAG_ID;
                                var dvid = "dv" + val.TAG_ID;
                                var u = lstAllWgMembers.find(m => m.WG_ID == val.WG_ID && m.UserId == $('#hdnUserId').val());
                                if (val.IsChecked === 1) {
                                    parentDiv = '';
                                    parentDiv += '<div style="display:inline-block;padding:4px 4px 4px 4px;"><div id=' + dvid + ' style="display:flex;height:28px;background-color:rgb(220, 230, 250);border-radius:2px;"><div style="font-size:12px;display:inline-block;border-radius:6px;text-align:center;">';
                                    parentDiv += '<div  RoleId=' + u.Role + ' id = ' + btnId + ' tagid = "' + val.TAG_ID + '" tagname = "' + val.TAG_LABEL + '" tagdef="' + val.TAG_DEFINITION + '" tagtype="' + val.TAG_TYPE + '" class="tagellipsisbutton" style = "height:100%;width:7px;float:left;cursor:pointer;padding-left:6px;padding-right:10px;padding-top:5px;"><i class="fas fa-ellipsis-v" style="color: #757575;"></i></div>';
                                    parentDiv += '<div style="height:100%;padding-right:10px;float:left;padding-top:6px;font-size:11px;font-family: Roboto, sans-serif;border-radius: 3px;white-space: pre-wrap;cursor:pointer" onclick = "javascript:viewTRMEntriesModel(' + val.TAG_ID + ',false);return false;"><i ';
                                    if (val.TAG_TYPE == "GLOBAL") {
                                        parentDiv += 'class="fas fa-globe"'
                                    }
                                    else {
                                        parentDiv += 'class="fas fa-user-friends"'
                                    }
                                    parentDiv +=' style = "padding-top:3px;float:left;padding-right:2px;" ></i > ' + val.TAG_LABEL + ' (' + val.EntryCount + ')' + '</div ></div ></div ></div > ';
                                    $('#dvTags').append(parentDiv);
                                    tagCounter++;
                                }
                            });

                            var ligroupName = $('#grp' + $('#hdnWgId').val()).text();
                            var groupName = ligroupName.substr(0, ligroupName.lastIndexOf('('));
                            groupName = groupName + '(' + tagCounter + ')';
                            $('#grp' + $('#hdnWgId').val()).text(groupName)

                            if (tagCounter == 0) {
                                parentDiv = '';
                                parentDiv += '<div style="display: inline-block;padding-right:10px;padding-left: 5px;font-size:11px;font-family: Roboto, sans-serif;"><p>No group tags for the selected group have been applied to this entry.</p></div>';
                                $('#dvTags').append(parentDiv);
                            }

                            tagpopupclick();
                            $('#hdnSelectedWgId').val(0);
                        }
                    }
                },
                error: function (jqXHR, status, error) {
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });
        }

        function tagChange(element) {

            //  $('#btnSaveWorkGroup').removeAttr('disabled');
            //  $('#btnSaveWorkGroup').removeClass('disabledbutton').addClass('enabledbutton');
            var tagId = $('#' + element.id).attr('tagid')
            var lstTags = JSON.parse($('#hdnTagsByWgId').val());

            var i;
            $.each(lstTags, function (index, value) {
                if (value.TAG_ID == tagId) {
                    i = index;
                    return false; // retrun false to stop the loops
                }
            });

            if (element.checked)
                lstTags[i].IsChecked = 1;
            else
                lstTags[i].IsChecked = 0;
            var orgLstTags = JSON.parse($('#hdnOriginalSelections').val());
            var orgLen = orgLstTags.length;
            var len = lstTags.length;
            var isChanged = false;
            var orgIndex;
            var orgTids = [];
            $.each(orgLstTags, function (index, value) {
                var tid = value.TAG_ID;
                orgTids[index] = tid;
                $.each(lstTags, function (otherIndex, otherValue) {
                    if (tid == otherValue.TAG_ID) {
                        if (orgLstTags[index].IsChecked != lstTags[otherIndex].IsChecked)
                            isChanged = true;
                        return false;
                    }
                });
            });
            if (orgLen != len) {
                $.each(lstTags, function (index, value) {
                    var tid = value.TAG_ID;
                    if ($.inArray(tid, orgTids) == -1) {
                        if (lstTags[index].IsChecked)
                            isChanged = true;
                    }
                });
            }
            if (isChanged) {
                $('#btnSaveWorkGroup').removeAttr('disabled');
                $('#btnSaveWorkGroup').removeClass('disabledbutton').addClass('enabledbutton');
            } else {
                $('#btnSaveWorkGroup').attr('disabled', 'disabled');
                $('#btnSaveWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
            }
            $('#hdnTagsByWgId').val(JSON.stringify(lstTags))
        }

        function addinapprTag() {
            //Check if the list already exits in the list
            var tagId = Math.ceil(Math.random() * 100);
            var lstTags = JSON.parse($('#hdnTagsByWgId').val());
            if (lstTags.filter(x => x.TAG_LABEL.trim() === $('#txtTagName').val().trim()).length > 0) {
               // if ($('#hdnSelectedWgId').val() == -1)
                    $('#spanaddEntryErrorMessage').text('Duplicate Tag Name');
                //else
                  //  $('#spanaddEntryErrorMessage').text('Tag already exists in the group');
                $('#newWGTagModel').modal('hide');
                $('#newToolTagModel').focus();
            }
            else {
                var newrow = {
                    CREATED_BY: null,
                    CREATED_DATE: null,
                    IsChecked: 1,
                    IsDeleted: null,
                    MODIFIED_BY: null,
                    MODIFIED_DATE: null,
                    TAG_ID: tagId,
                    TAG_LABEL: $('#txtTagName').val(),
                    WG_ID: $('#hdnwgId').val(),
                    IS_NEW: true
                }
                lstTags.push(newrow);
               
              /*  var aid = 'a' + tagId;
                var cid = 'chk' + tagId;
                var parentDiv = '<div style="text-decoration: none;font-family: Roboto;font-size:11px;padding-left:30px;padding-bottom:5px;" class="list-group-item list-group-item-action" id="' + aid + '" ><input type="checkbox" onchange="tagChange(this)" tagid="' + tagId + '"';
                parentDiv += ' checked="checked" ';
                parentDiv += ' class="form-check-input chkTool" id="' + cid + '"/><label style="padding-top:2px;" for="' + cid + '">&nbsp;&nbsp;' + $('#txtTagName').val() + '</label></div>';
*/
                $('#hdnTagsByWgId').val(JSON.stringify(lstTags));
              //  $('#dvWgTags').append(parentDiv);
               $('#newWGTagModel').modal('hide');
               $("#txtNewWgTagName").val('');
               $('#charcounter').text('0/30');
                rePopulateTagsList();
               $('#btnAddTag').attr('disabled', 'disabled');
               $('#btnAddTag').removeClass('addTagtoListButton').addClass('disabledaddTagtoListButton');
               $('#newToolTagModel').focus();
               $('#btnSaveWorkGroup').removeAttr('disabled');
               $('#btnSaveWorkGroup').removeClass('disabledbutton').addClass('enabledbutton');
            }
        }

        function logInapproriate() {
           var grpId = 0;
            if ($('#hdnSelectedWgId').val() == "-1")
                grpId = $('#hdnSelectedWgId').val()
            else
                grpId = $('#hdnWgId').val();
            $.ajax({
                url: 'NewTag.aspx/logInAppropriate?tagName=' + JSON.stringify($('#txtNewWgTagName').val()) + '&wgId=' + grpId,
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    //do nothing as this call is just for logging
                },
                error: function (jqXHR, status, error) {
                    if (status == 'error') {
                        $('#toastError').text('Internal Server Error occured');
                        $('#burntToast').toast('show').show().delay(3000).fadeOut();
                    }
               }
            });
        }
        function addTag() {
            var lstTags = JSON.parse($('#hdnTagsByWgId').val());
            if (lstTags.filter(x => x.TAG_LABEL.trim() === $('#txtNewWgTagName').val().trim()).length > 0) {
                $('#spanaddEntryErrorMessage').text('Duplicate Tag Name');
            }
            else {
                $('#txtTagName').val('');
                var lstTags = JSON.parse($('#hdnTagsByWgId').val());
                var enteredtext = $("#txtNewWgTagName").val().trim();
                var regex = /^[ A-Za-z0-9_()-]*$/
                $('#spanaddEntryErrorMessage').text('');

                //next 2 lines are for testing purposes
                // enteredtext = "c  ??? vvvvvvvvvvvvvvvvvvvvvvvvyyyyyyyyyyy";
                //  alert("name= " + enteredtext + " : " + regex.test(enteredtext));

                if (enteredtext.length > 30) {
                    // $('#spanaddEntryErrorMessage').text('Name is too long');
                    $('#charcounter').text(enteredtext.length + '/' + 30);
                    $('#charcounter').css('color', 'red');
                    $('#btnAddTag').attr('disabled', 'disabled');
                    $('#btnAddTag').removeClass('addTagtoListButton').addClass('disabledaddTagtoListButton');
                    if (regex.test(enteredtext) == false)
                        $('#spanaddEntryErrorMessage').text('Valid characters are alphanumeric and _-()');
                }
                else if (regex.test(enteredtext) == false) {
                    $('#spanaddEntryErrorMessage').text('Valid characters are alphanumeric and _-()');
                    $('#charcounter').text(enteredtext.length + '/' + 30);
                    $('#btnAddTag').attr('disabled', 'disabled');
                    $('#btnAddTag').removeClass('addTagtoListButton').addClass('disabledaddTagtoListButton');
                }
                else if (enteredtext.length > 0) {
                    // if (enteredtext.length > 0) {
                    var splittext = enteredtext.split(' ');
                    var InApprWords = localStorage.getItem('INAPPROWORDS');
                    var test = JSON.parse(InApprWords)
                    var isapprworddetected = false;
                    var maxLength = 30;
                    var charLength = $('#txtNewWgTagName').val().length;
                    var trimLength = $('#txtNewWgTagName').val().trim().length;

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
                        logInapproriate();
                        $('#InApprWgTagWarning').show();
                        var txtMsg = '<p>The word(s) "' + enteredtext + '" have been flagged as inappropriate. TRM Admins monitor all site activity.</p><p>You may change the name or continue adding the tag name if you received this message in error.</p>';
                        $('#lblInApporipateWgTagWarningMessage').html(txtMsg);
                        //var txtMsg1 = 'You may change the name or continue adding the group name if you received this message in error.';
                        //$('#lblInApporipateWgTagWarningMessage1').html(txtMsg1);
                        $('#lblCreateWgTagErrorMessage').text('Inappropriate word detected');
                        $('#charWgTagcounter').text(charLength + '/' + maxLength);
                        $('#txtTagName').val(enteredtext);
                        // $('#lblCreateWgTagErrorMessage').css('font-size', '15px');
                        $('#newWGTagModel').modal('show');
                        $('#btnCreateWgTag').removeAttr('disabled');
                        $('#btnCreateWgTag').removeClass('disabledbutton').addClass('enabledbutton');
                        window.parent.postMessage(JSON.stringify('open'), '*');
                    }
                    else {
                        if (lstTags.filter(x => x.TAG_LABEL.trim().toLowerCase() === $('#txtNewWgTagName').val().trim().toLowerCase()).length > 0) {
                            //if ($('#hdnSelectedWgId').val() == -1)
                            $('#spanaddEntryErrorMessage').text('Duplicate Tag Name');
                            //else
                            //  $('#spanaddEntryErrorMessage').text('Tag already exists in the group');
                        }
                        else {
                            var tagId = Math.ceil(Math.random() * 100);
                            var newrow = {
                                CREATED_BY: null,
                                CREATED_DATE: null,
                                IsChecked: 1,
                                IsDeleted: null,
                                MODIFIED_BY: null,
                                MODIFIED_DATE: null,
                                TAG_ID: tagId,
                                TAG_LABEL: $('#txtNewWgTagName').val(),
                                WG_ID: $('#hdnwgId').val(),
                                IS_NEW: true
                            }
                            lstTags.push(newrow);
                            $('#hdnTagsByWgId').val(JSON.stringify(lstTags));

                            $("#txtNewWgTagName").val('');
                            $('#dvWgTags').empty();

                            var lstTags = JSON.parse($('#hdnTagsByWgId').val());
                            var enteredText = $("#txtNewWgTagName").val();

                            var newlstTags = _.filter(lstTags, function (val) {
                                return 0 === val.TAG_LABEL.toLowerCase().indexOf(enteredText.toLowerCase());
                            });

                            var parentDiv = '';
                            $.each(newlstTags, function (key, val) {
                                var aid = 'a' + val.TAG_ID;
                                var cid = 'chk' + val.TAG_ID;
                                parentDiv += '<div style="text-decoration: none;font-family: Roboto;font-size:11px;padding-left:30px;padding-bottom:5px;" class="list-group-item list-group-item-action" id="' + aid + '" ><input type="checkbox"  onchange="tagChange(this)" tagid="' + val.TAG_ID + '"';

                                if (val.IsChecked > 0) {
                                    parentDiv += ' checked="checked" ';
                                }
                                parentDiv += 'class="form-check-input chkTool" id="' + cid + '"/><label style="padding-top:2px;white-space: pre-wrap;" for="' + cid + '">&nbsp;&nbsp;' + val.TAG_LABEL + '</label></div>';
                            });
                            $('#dvWgTags').append(parentDiv);
                            //Add Here
                            $('#charcounter').text('0/30');
                            $('#btnAddTag').attr('disabled', 'disabled');
                            $('#btnAddTag').removeClass('addTagtoListButton').addClass('disabledaddTagtoListButton');
                            $('#btnSaveWorkGroup').removeAttr('disabled');
                            $('#btnSaveWorkGroup').removeClass('disabledbutton').addClass('enabledbutton');
                            $('#newToolTagModel').focus();
                        }
                    }


                }
                else {
                    $('#spanaddEntryErrorMessage').text('Name must include visible characters');
                }
            }
        }
        function createWgTag() {
            $('#InApprWgTagWarning').hide();
            $('#lblInApporipateWgTagWarningMessage').html('');
            $('#lblInApporipateWgTagWarningMessage1').html('');
            //$('#lblCreateGroupWgTagWarningMessage').text('');
            $('#lblCreateWgTagWarningMessage').text('');
            /*$('#spinnerCreateTag').removeClass('d-none');*/
            $.ajax({
                url: 'NewTag.aspx/createToolTag?tagName=' + JSON.stringify($('#txtNewWgTagName').val()) + '&WgId=' + $('#hdnWgId').val() + '&toolId=' + $('#hdnToolId').val() + '&IsInAppropriateFlagged=' + JSON.stringify($('#hdnIsInAppropriateFlagged').val()),
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    /*$('#spinnerCreateTag').addClass('d-none');*/
                    if (data != null) {

                        if (data.d.IsAppropriate == true) {
                            $('#InApprWgTagWarning').show();
                            var txtMsg = '<p>The word(s) "' + $('#txtNewWgTagName').val() + '" have been flagged as inappropriate. TRM Admins monitor all site activity.</p><p>You may change the name or continue adding the tag name if you received this message in error.</p>';
                            $('#lblInApporipateWgTagWarningMessage').html(txtMsg);
                            //var txtMsg1 = 'You may change the name or continue adding the group name if you received this message in error.';
                            //$('#lblInApporipateWgTagWarningMessage1').html(txtMsg1);
                            $('#hdnIsInAppropriateFlagged').val('True');
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
                            // $('#lblGroupSuccessMessage').text('Tag created successfully.');
                            // $("#lblGroupSuccessMessage").show().delay(5000).fadeOut();
                            $('#toastSuccess').text('Tag created successfully.');
                            $('#goodToast').toast('show').show().delay(3000).fadeOut();
                            closetagTRMModel();
                        }
                    }
                },
                error: function (jqXHR, status, error) {
                    if (status == 'error') {
                        // $('#lblCreateWgTagErrorMessage').show();
                        // $('#lblCreateWgTagErrorMessage').text('Internal Server Error occured');
                        $('#toastError').text('Internal Server Error occured');
                        $('#burntToast').toast('show').show().delay(3000).fadeOut();
                    }
                    /*$('#spinnerCreateTag').addClass('d-none');*/
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });
        }

        $("#txtNewWgTagName").on('keyup keydown', function (e) {
            if ((e.keyCode || e.which) == 13) {
                e.preventDefault();
                return false;
            }
            rePopulateTagsList();

        });
        $("#txtNewWgTagName").on('keydown keyup change', function (e) {
            var maxLength = 30;
            var k = e.keyCode || e.which;
            $('#lblCreateWgTagErrorMessage').text('');
            $('#lblCreateWgTagWarningMessage').text('');
            var charLength = $(this).val().length;
            var trimLength = $(this).val().trim().length
            $('#spanaddEntryErrorMessage').text('');

            if (charLength > maxLength) {
                $('#charcounter').css('color', 'red');
                $('#btnAddTag').attr('disabled', 'disabled');
                $('#btnAddTag').removeClass('addTagtoListButton').addClass('disabledaddTagtoListButton');
                //e.preventDefault();
                $('#charcounter').text(charLength + '/' + maxLength);
            }
            else {
                $('#charcounter').css('color', 'black');
            }

            if (charLength > 0 && trimLength == 0 && charLength <= maxLength) {
                $('#btnAddTag').attr('disabled', 'disabled');
                $('#btnAddTag').removeClass('addTagtoListButton').addClass('disabledaddTagtoListButton');
                $('#spanaddEntryErrorMessage').text('Name must include visible characters');
                $('#charcounter').text(charLength + '/' + maxLength);
                return;
            }
            else if (charLength == 0) {
                $('#btnAddTag').attr('disabled', 'disabled');
                $('#btnAddTag').removeClass('addTagtoListButton').addClass('disabledaddTagtoListButton');
                $('#charcounter').text(charLength + '/' + maxLength);
                return;
            }
            else {
                if (charLength <= maxLength) {
                    $('#btnAddTag').removeAttr('disabled');
                    $('#btnAddTag').removeClass('disabledaddTagtoListButton').addClass('addTagtoListButton');
                }
            }

            //$('#dvWgTags').empty();
            var lstTags = JSON.parse($('#hdnTagsByWgId').val());
            var enteredText = $("#txtNewWgTagName").val();
            var regex = /^[ A-Za-z0-9_()-]*$/
            if (charLength > 0 && regex.test(enteredText) == false) {
                $('#spanaddEntryErrorMessage').text('Valid characters are alphanumeric and _-()');
                //$('#toastError').text('Valid characters are alphanumeric and _-()');
                //$('#burntToast').toast('show').show().delay(3000).fadeOut();
                $('#btnAddTag').attr('disabled', 'disabled');
                $('#btnAddTag').removeClass('addTagtoListButton').addClass('disabledaddTagtoListButton');
            }
            else {
                if (charLength <= maxLength) {
                    $('#spanaddEntryErrorMessage').text('');
                    $('#btnAddTag').removeAttr('disabled');
                    $('#btnAddTag').removeClass('disabledaddTagtoListButton').addClass('addTagtoListButton');
                }
            }

            //var newlstTags = _.filter(lstTags, function (val) {
            //    return val.TAG_LABEL.toLowerCase().indexOf(enteredText.toLowerCase());

            //});

            $('#charcounter').text($(this).val().length + '/' + maxLength);

            //var para = "newtag tag tagmine.";
            //var findWord = "tag";
            //while (posn != -1) {
            //    posn = para.indexOf(enteredText, j + 1);
            //    numbr += 1;
            //    j = posn;
            //} 
        });

        function openWgTagModel(wgId, isReopen) {
            $("#dvWgTags").animate({ scrollTop: 0 }, "slow");
            $('#hdnTriggerModal').val(wgId);
            if (wgId == 0) {
                wgId = $('#hdnWgId').val();
                $('#hdnSelectedWgId').val(wgId);
                $('#groupNameDiv').show();
            }
            else {
                $('#hdnSelectedWgId').val(-1);
                $('#groupNameDiv').hide();
            }

            // $('#hdnWgId').val(wgId);
            //$('#lblGroupName').text($('#hdnGroupName').val());

            var selectedGroupName = $('#hdnGroupName').val().trimEnd();

            if (selectedGroupName.lastIndexOf('(') > 0) {
                $('#lblGroupName').text(selectedGroupName.substr(selectedGroupName, selectedGroupName.lastIndexOf('(') - 1));
            }
            else {
                $('#lblGroupName').text(selectedGroupName);
            }

            $('#lblToolName').text($('#hdnToolName').val());
            $('#txtNewWgTagName').val('');
            $('#lblInApporipateWgTagWarningMessage').html('');
            $('#lblInApporipateWgTagWarningMessage1').html('');
            $('#lblCreateWgTagErrorMessage').text('');
            $('#lblCreateWgTagSuccessMessage').text('');
            $('#lblCreateWgTagWarningMessage').text('');
            $('#InApprWgTagWarning').hide();
            // $('#btnCreateWgTag').attr('disabled', 'disabled');
            // $('#btnCreateWgTag').css('background-color', 'grey');
            $('#charcounter').text('0/30');
            $('#charcounter').css('color', 'black');
            $('#spanaddEntryErrorMessage').text('');
            $('#btnAddTag').attr('disabled', 'disabled');
            $('#btnAddTag').removeClass('addTagtoListButton').addClass('disabledaddTagtoListButton');
            $('#newToolTagModel').attr('error', 0);
            if (isReopen != undefined && isReopen) {
                $('#btnSaveWorkGroup').removeAttr('disabled');
                $('#btnSaveWorkGroup').removeClass('disabledbutton').addClass('enabledbutton');
            }
            else {
                $('#btnSaveWorkGroup').attr('disabled', 'disabled');
                $('#btnSaveWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
            }
            $('#lblCreateWgTagWarningMessage').text('');
            $('#hdnIsInAppropriateFlagged').val('False');

            //get Selected WG Tags
            $.ajax({
                url: 'NewTag.aspx/getTagsByWgId?wgId=' + wgId + '&toolId=' + $('#hdnToolId').val(),
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    // $('#spinnersearch').addClass('d-none');
                    if (data != null) {
                        var tagData = null;
                        if (isReopen != undefined) {
                            if (isReopen) {
                                data.d = JSON.parse($('#hdnTagsByWgId').val());
                            }
                            else if (!isReopen) {
                                $('#hdnTagsByWgId').val(JSON.stringify(data.d));
                            }
                        }
                        else {
                            $('#hdnOriginalSelections').val();
                            $('#hdnTagsByWgId').val(JSON.stringify(data.d));
                            $('#hdnOriginalSelections').val(JSON.stringify(data.d));
                        }

                        $('#dvWgTags').empty();
                        var parentDiv = '';
                        /*var selectedTagGroup = []*/;
                        if (data.d != null) {
                            $.each(data.d, function (key, val) {
                                var aid = 'a' + val.TAG_ID;
                                var cid = 'chk' + val.TAG_ID;
                                parentDiv += '<div style="text-decoration: none;font-family: Roboto;font-size:11px;padding-left:30px;padding-bottom:5px;" class="list-group-item list-group-item-action" id="' + aid + '" ><input type="checkbox" onchange="tagChange(this)" tagid="' + val.TAG_ID + '"';

                                if (val.IsChecked > 0) {
                                    parentDiv += ' checked="checked" ';
                                    //item = {
                                    //    TAG_ID: val.TAG_ID,
                                    //    TAG_LABEL: val.TAG_LABEL,
                                    //    IS_NEW: false,
                                    //    IsChecked: val.IsChecked

                                    //}
                                    //selectedTagGroup.push(item);
                                }
                                parentDiv += 'class="form-check-input chkTool" id="' + cid + '"/><label style="padding-top:2px;white-space: pre-wrap;" for="' + cid + '">&nbsp;&nbsp;' + val.TAG_LABEL + '</label></div>';

                            });

                            $('#dvWgTags').append(parentDiv);
                            $('#newToolTagModel').modal('show');

                            window.parent.postMessage(JSON.stringify('open'), '*');
                        }
                        //$('#hdnSelectedTags').val(JSON.stringify(selectedTagGroup))
                    }
                },
                error: function (jqXHR, status, error) {
                    // $('#spinnersearch').addClass('d-none');
                    //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });
        }

        function closenewToolTagModel() {
            $('#newToolTagModel').modal('hide');
            let isError = $('#newToolTagModel').attr('error');
            if ($('#btnSaveWorkGroup:disabled').length == 0 && isError == '0') {
                $("#unsavedChanges").modal('show');
            }
            else
                window.parent.postMessage(JSON.stringify('close'), '*');
        }

        function cancelnewToolTagModel() {
            $('#newToolTagModel').modal('hide');
            let isError = $('#newToolTagModel').attr('error');
            if ($('#btnSaveWorkGroup:disabled').length == 0 && isError == '0') {
                $("#unsavedChanges").modal('show');
            }
            else
                window.parent.postMessage(JSON.stringify('close'), '*');
        }

        function saveWorkgroupTags() {
            $('#btnSaveWorkGroup').attr('disabled', 'disabled');
            $('#btnSaveWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
            var selectedTags = '';
            let isError = false;
            var selectedTagitems = [];
            var lstWgs = JSON.parse($('#hdnTagsByWgId').val());
            var tempItem;
            $.each(lstWgs, function (key, val) {
                if (val.IsChecked === 1) {
                    item = {
                        TAG_ID: val.TAG_ID,
                        TAG_LABEL: val.TAG_LABEL.trim(),
                        IS_NEW: (val.IS_NEW == null ? false : val.IS_NEW),
                        IsChecked: val.IsChecked
                    }
                    selectedTagitems.push(item);
                    tempItem = val.TAG_LABEL.trim();
                }
            });
            //confirm(tempItem + "==" + $('#hdnToolId').val()+"=="+$('#hdnSelectedWgId').val())
            $.ajax({
                url: 'NewTag.aspx/saveToolTags?selectedTags=' + JSON.stringify(selectedTagitems) + '&toolId=' + $('#hdnToolId').val() + "&wgId=" + $('#hdnSelectedWgId').val(),
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    // $('#spinnersearch').addClass('d-none');
                    //getToolWorkGroupTags();
                    //$('#newToolTagModel').modal('hide');
                    if (data != null) {
                        if (!data.d.IsValid) {
                            //alert(data.d.Message) // all that returns is word
                            //data.d.Message
                            //$('#lblDeleteTagErrorMessage').text(data.d.Message)
                            window.parent.postMessage(JSON.stringify('close'), '*');
                            isError = 1;
                            $('#newToolTagModel').attr('error', isError);
                            if (data.d.Message == "You are not authorized to perform this action") {
                                $('#toastError').text('You are not authorized to perform this action');
                                $('#burntToast').toast('show').show().delay(3000).fadeOut();

                                getToolWorkGroups();
                                $('#newToolTagModel').modal('hide');
                            }
                        }
                        else {
                            //lblSuccessMessage
                            //$('#lblDeleteGroupSuccessMessage').text(data.d.Message)
                            //window.location.reload();
                            $('#newToolTagModel').modal('hide');
                            window.parent.postMessage(JSON.stringify('close'), '*');
                            // $('#lblGroupSuccessMessage').text('Entry tags applied successfully.');
                            // $("#lblGroupSuccessMessage").show().delay(5000).fadeOut();
                            $('#toastSuccess').text('Tag(s) applied successfully.');
                            $('#goodToast').toast('show').show().delay(3000).fadeOut();
                            if ($('#hdnSelectedWgId').val() == '-1') {
                                getToolPersonalTags();
                            }
                            else {
                                getToolWorkGroupTags();
                            }
                            //getWGMembersById(wgId);
                        }
                    }
                },
                error: function (jqXHR, status, error) {
                    //alert(status+" --saveworhgrouptags-- "+error)
                    isError = 1;
                    $('#newToolTagModel').attr('error', isError);
                }
            });
            if ($('#hdnSelectedWgId').val() == '-1') {
                getToolPersonalTags();
            }
            else {
                getToolWorkGroupTags();
            }
        }

        window.addEventListener('message', function (e) {
            const data = JSON.parse(e.data);
            const channel = data.channel;
            $("#backgroundfadediv").css('display', 'none');

        });
        function changefilter(filtertype) {

            $('#hdnSelectedFilterType').val(filtertype);
            getToolWorkGroupTags();
            getToolPersonalTags();
        }

        function saveUnsavedChanges() {
            var caller = $("#hdnTriggerModal").val();
            $("#unsavedChanges").modal('hide');
            window.parent.postMessage(JSON.stringify('close'), '*');
            if (caller == '-1' || caller == '0')
                saveWorkgroupTags();
            else if (caller == '1')
                saveTechCompTools();
            else
                removeTool();
        }

        function discardUnsavedChanges() {
            window.parent.postMessage(JSON.stringify('close'), '*');
            $("#unsavedChanges").attr("action", "discard")
            $("#unsavedChanges").modal('hide');           ;
            $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
        }
        $('#unsavedChanges').on('hidden.bs.modal', function (e) {
            var action = $("#unsavedChanges").attr("action");
            var caller = $("#hdnTriggerModal").val();
            window.parent.postMessage(JSON.stringify('close'), '*');
            if (action == "close" || action == "escape") {
                if (caller == '-1' || caller == '0')
                    openWgTagModel(caller, true);
                else if (caller == '1')
                    TagComparableTech(true);
                else if (caller == '2')
                    viewTRMEntriesModel($('#hdnTagId').val(), true, true);
                else if (caller == '3')
                    viewTRMEntriesModel($('#hdnTagId').val(), false, true);
                else if (caller == '4')
                    viewTRMEntriesModel(undefined, undefined, true);
            }
        })

        function cancelUnsavedChanges() {
            var caller = $("#hdnTriggerModal").val();
            $("#unsavedChanges").attr("action", "close");
            $("#unsavedChanges").modal('hide');
          //  window.parent.postMessage(JSON.stringify('close'), '*');
           /* if (caller == '-1' || caller == '0')
                openWgTagModel(caller, true);
            else if (caller == '1')
                TagComparableTech(true);
            else if (caller == '2')
                viewTRMEntriesModel($('#hdnTagId').val(), true, true);
            else if (caller == '3')
                viewTRMEntriesModel($('#hdnTagId').val(), false, true);
            else if (caller == '4')
                viewTRMEntriesModel(undefined, undefined, true);*/
        }

        $(document).ready(function () {            

            $("#txtTagName").on('keydown keyup change', function (e) {
                var k = e.keyCode || e.which;
                let errorText = $('#lblCreateWgTagErrorMessage').html();
                if (errorText == "Duplicate Tag Name") {
                    errorText = "";
                }             
                $('#lblCreateWgTagErrorMessage').html('');
                $('#lblCreateWgTagWarningMessage').text('');
                $('#InApprWgTagWarning').hide();
                $('#lblInApporipateWgTagWarningMessage').html('');
                $('#hdnIsInAppropriateFlagged').val('False');
                var maxLength = 30;
                var charLength = $('#txtTagName').val().length;
                var trimLength = $('#txtTagName').val().trim().length
                var e1 = 'Name must include visible characters';
                var e2 = 'Valid characters are alphanumeric and _-()';
                var e3 = 'Inappropriate word detected';
               
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
                   /* if (errorText.length != 0) {
                        if(errorText.search(e1) == -1)
                            errorText += "<br>Name must include visible characters";
                    }                     
                    else*/
                        errorText = "Name must include visible characters";
                    $('#lblCreateWgTagErrorMessage').html(errorText);
                  //  $('#lblCreateWgTagErrorMessage').text('Name must include visible characters');
                    $('#charWgTagcounter').text(charLength + '/' + maxLength);
                    return;
                }
                else if (charLength == 0) {
                    $('#btnCreateWgTag').attr('disabled', 'disabled');
                    $('#btnCreateWgTag').removeClass('enabledbutton').addClass('disabledbutton');
                    $('#charWgTagcounter').text(charLength + '/' + maxLength);
                    errorText = '';
                    $('#lblCreateWgTagErrorMessage').html(errorText);
                    return;

                }
                else {
                    if (charLength <= maxLength) {
                        $('#btnCreateWgTag').removeAttr('disabled');
                        $('#btnCreateWgTag').removeClass('disabledbutton').addClass('enabledbutton');
                        var splitError = errorText.split('<br>');
                        errorText = '';
                        for (var i = 0; i <= splitError.length; i++) {
                            //InApprWords.find()
                            var tempstring = splitError[i];

                            if (tempstring != '' && tempstring != undefined) {
                                if (tempstring != e1) {
                                    if (errorText == '')
                                        errorText = tempstring;
                                    else
                                        errorText += '<br>' + tempstring;
                                }
                            }
                        }
                        $('#lblCreateWgTagErrorMessage').html('');
                    }
                }

                var enteredtext = $("#txtTagName").val();
                var regex = /^[ A-Za-z0-9_()-]*$/
                if (charLength > 0 && regex.test(enteredtext) == false) {
                    if (errorText.length != 0) {
                        if (errorText.search(e2) == -1) {
                            errorText += "<br>Valid characters are alphanumeric and _-()";
                       }
                    }
                    else {
                        errorText = "Valid characters are alphanumeric and _-()";
                    } 
                    $('#lblCreateWgTagErrorMessage').html(errorText);
                  //  $('#lblCreateWgTagErrorMessage').text('Valid characters are alphanumeric and _-()');
                   // $('#lblCreateWgTagErrorMessage').css('font-size', '15px');
                    $('#btnCreateWgTag').attr('disabled', 'disabled');
                    $('#btnCreateWgTag').removeClass('enabledbutton').addClass('disabledbutton');
                }
                else {
                    if (charLength <= maxLength) {
                        $('#lblCreateWgTagErrorMessage').html('');
                        $('#btnCreateWgTag').removeAttr('disabled');
                        $('#btnCreateWgTag').removeClass('disabledbutton').addClass('enabledbutton');
                    }
                    var splitError = errorText.split('<br>');
                    errorText = '';
                    for (var i = 0; i <= splitError.length; i++) {
                        //InApprWords.find()
                        var tempstring = splitError[i];
                       
                        if (tempstring != '' && tempstring != undefined) {
                            if (tempstring != e2) {
                                if (errorText == '')
                                    errorText = tempstring;
                                else
                                    errorText += '<br>' + tempstring;
                            }                                
                        }
                    }
                    $('#lblCreateWgTagErrorMessage').html(errorText);
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
                    $('#InApprWgTagWarning').show();
                    var txtMsg = '<p>The word(s) "' + enteredtext + '" have been flagged as inappropriate. TRM Admins monitor all site activity.</p><p>You may change the name or continue adding the tag name if you received this message in error.</p>';
                    $('#lblInApporipateWgTagWarningMessage').html(txtMsg);
                    //var txtMsg1 = 'You may change the name or continue adding the group name if you received this message in error.';
                    //$('#lblInApporipateWgTagWarningMessage1').html(txtMsg1);
                    // let errorText = $('#lblCreateWgTagErrorMessage').text();
                   if (errorText.length != 0) {
                        if (errorText.search(e3) == -1)
                            errorText += "<br>Inappropriate word detected";
                    }
                    else
                        errorText = "Inappropriate word detected";
                    $('#lblCreateWgTagErrorMessage').html(errorText);
                    $('#charWgTagcounter').text(charLength + '/' + maxLength);
                    $('#txtTagName').val(enteredtext);
                    // $('#lblCreateWgTagErrorMessage').css('font-size', '15px');
                }
                else {
                    var splitError = errorText.split('<br>');
                    errorText = '';
                    for (var i = 0; i <= splitError.length; i++) {
                        //InApprWords.find()
                        var tempstring = splitError[i];
                        if (tempstring != '' && tempstring != undefined) {
                            if (tempstring != e3) {
                                if (errorText == '')
                                    errorText = tempstring;
                                else
                                    errorText += '<br>' + tempstring;
                            }
                        }
                    }
                    $('#lblCreateWgTagErrorMessage').html(errorText);
                }
                $('#charWgTagcounter').text(charLength + '/' + maxLength);
            });

            $('#tagTRMModel').on('keydown', function (event) {
                if ((event.keyCode || event.which) == 27) {
                    $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                    window.parent.postMessage(JSON.stringify('close'), '*');
                }
                else if ((event.keyCode || event.which) == 9) {
                    let lastElement = 'btncancelapplytag';
                    if ($('#btnApplyTag:disabled').length == 0)
                        lastElement = 'btnApplyTag';
                    if (document.activeElement.id == lastElement) {
                        document.getElementById("tagTRMModel").focus();
                        event.preventDefault();
                    }
                }
            });

            $('#newWGTagModel').on('keydown', function (event) {
                if ((event.keyCode || event.which) == 27) {
                    $('#newWGTagModel').modal('hide');
                    $("#txtNewWgTagName").val('');
                    $('#charcounter').text('0/30');
                    $('#btnAddTag').attr('disabled', 'disabled');
                    $('#btnAddTag').removeClass('addTagtoListButton').addClass('disabledaddTagtoListButton');
                    rePopulateTagsList();
                    $('#newToolTagModel').focus();
                }
                else if ((event.keyCode || event.which) == 9) {
                    let lastElement = 'btncanceladd';
                    if ($('#btnCreateWgTag:disabled').length == 0)
                        lastElement = 'btnCreateWgTag';
                    if (document.activeElement.id == lastElement) {
                        /* alert(document.activeElement.id);*/
                        document.getElementById("newWGTagModel").focus();
                        event.preventDefault();
                    }
                }
            });


            $('#tagComparableTechModel').on('keydown', function (event) {
                if ((event.keyCode || event.which) == 27) {
                    let isError = $('#tagComparableTechModel').attr('error');
                    if ($('#btnCompTechApplyTag:disabled').length == 0 && isError == '0') {
                        $("#unsavedChanges").modal('show');
                    }
                    else
                        window.parent.postMessage(JSON.stringify('close'), '*');
                }
                else if ((event.keyCode || event.which) == 9) {
                    let lastElement = 'btncancelCompTechtag';
                    if ($('#btnCompTechApplyTag:disabled').length == 0)
                        lastElement = 'btnCompTechApplyTag';
                    if (document.activeElement.id == lastElement) {
                        /* alert(document.activeElement.id);*/
                        document.getElementById("tagComparableTechModel").focus();
                        event.preventDefault();
                    }
                }
            });

            $("#viewTRMModel").on('keydown', function (event) {
                if ((event.keyCode || event.which) == 27) {
                    // catch escape
                    if ($('#tagdefinition').is(':visible')) {
                        $('#tagdefinition').hide();
                    }
                    else if ($('#viewTRMModel').is(':visible')) {
                        $("#viewTRMModel").removeClass('fade');
                        $("#viewTRMModel").modal('hide');
                        let isError = $('#viewTRMModel').attr('error');
                        if ($('#btnOkTaggedEntires:disabled').length == 0 && isError == '0') {
                            $("#unsavedChanges").modal('show');
                        }
                        else {
                            $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                            window.parent.postMessage(JSON.stringify('close'), '*');
                        }
                    }
                }
                else if ((event.keyCode || event.which) == 9) {
                    // capture Tab
                    let lastElement = 'btnTaggedEntires';
                    if ($('#btnOkTaggedEntires:disabled') == false)
                        lastElement = 'btnOkTaggedEntires';
                    if (document.activeElement.id == lastElement) {
                        $('#viewTRMModel :input:first').focus();                       
                        event.preventDefault();
                    } 
                }
            });

            $('#newToolTagModel').on('keydown', function (event) {
                if ((event.keyCode || event.which) == 27) {
                    let isError = $('#newToolTagModel').attr('error');
                    if ($('#btnSaveWorkGroup:disabled').length == 0 && isError == '0') {
                        $("#unsavedChanges").modal('show');
                    }
                    else
                        window.parent.postMessage(JSON.stringify('close'), '*');
                }
                else if ((event.keyCode || event.which) == 9) {
                    let lastElement = 'btncancelsaveworkgroup';
                    if ($('#btnSaveWorkGroup:disabled').length == 0)
                        lastElement = 'btnSaveWorkGroup';
                    if (document.activeElement.id == lastElement) {
                        /* alert(document.activeElement.id);*/
                        document.getElementById("newToolTagModel").focus();
                        event.preventDefault();
                    }
                }
            });

            $("#unsavedChanges").on("keydown", function (event) {
                if ((event.keyCode || event.which) == 27) {
                 //   window.parent.postMessage(JSON.stringify('close'), '*');
                    var caller = $("#hdnTriggerModal").val();
                    $("#unsavedChanges").attr("action", "escape");
                    $("#unsavedChanges").modal('hide');
                   /* if (caller == '-1' || caller == '0')
                        openWgTagModel(caller, true);
                    else if (caller == '1')
                        TagComparableTech(true);
                    else if (caller == '2')
                        viewTRMEntriesModel($('#hdnTagId').val(), true, true);
                    else if (caller == '3')
                        viewTRMEntriesModel($('#hdnTagId').val(), false, true);
                    else if (caller == '4')
                        viewTRMEntriesModel(undefined, undefined, true);*/
                }
                else if ((event.keyCode || event.which) == 9) {
                    if (document.activeElement.id == 'unsavedApply') {
                        /* alert(document.activeElement.id);*/
                        document.getElementById("unsavedChanges").focus();
                        event.preventDefault();
                    }
                }
            });

            $(window).resize(function () {
                $('#dvTagPopup').hide();
                $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
            });

            $('#tagFilter').change(function () {
                changefilter($(this).val());
            });
            const message = JSON.stringify({
                message: 'Hello from iframe',
                date: Date.now(),
            });
            getToolPersonalTags();
            document.querySelector("#btnaddNewWGTag").addEventListener('click', createRipple);
            document.querySelector("#btnSaveWorkGroup").addEventListener('click', createRipple);
            document.querySelector("#btncancelsaveworkgroup").addEventListener('click', createRipple);
            document.querySelector("#btncancelapplytag").addEventListener('click', createRipple);
            document.querySelector("#btnApplyTag").addEventListener('click', createRipple);
            document.querySelector("#btncancelremovetag").addEventListener('click', createRipple);
            document.querySelector("#btnDeleteTag").addEventListener('click', createRipple);
            document.querySelector("#btnAddTag").addEventListener('click', createRipple);
            document.querySelector("#btncanceladd").addEventListener('click', createRipple);
            document.querySelector("#btnCreateWgTag").addEventListener('click', createRipple);
            document.querySelector("#btnOkTaggedEntires").addEventListener('click', createRipple);
            document.querySelector("#btnCompTechApplyTag").addEventListener('click', createRipple);
            document.querySelector("#btncancelCompTechtag").addEventListener('click', createRipple);
            document.querySelector("#btnItOKTaggedEntires").addEventListener('click', createRipple);
            
            $("#txtToolEntry").on('keyup keydown change', function (e) {
                //$('#lblErrorMessage').text('');
                var value = $("#txtToolEntry").val();
                if (value == "") {
                    $('#btnApplyTag').removeClass('enabledbutton').addClass('disabledbutton');
                    $('#btnApplyTag').attr('disabled', 'disabled');
                }
                if ((e.keyCode || e.which) == 13) {
                    e.preventDefault();
                    return false;
                }
            });

            $(".grpellipsemenu").mouseover(function () {
                $(this).css("background-color", "lightgrey");
            });
            $(".grpellipsemenu").mouseout(function () {
                $(this).css("background-color", "white");
            });
            var selectedGroupName = $('#hdnGroupName').val().trimEnd();

            $('#spanselectedGroupName').text(selectedGroupName);

            if ($('#hdnRoleId').val() === "3") {
                $('#btnaddNewWGTag').css("display", "none");
            }
            else {
                $('#btnaddNewWGTag').css("display", "block");
            }

            $(document).add(parent.document).on("click", function (e) {

                if (e.target.className != undefined) {
                    if ((e.target.className != 'fas fa-ellipsis-v') && (e.target.className != 'tagellipsisbuttonpt') && (e.target.className != 'tagellipsisbutton')) {
                        if ($('#dvTagPopup').is(':visible')) {
                            $('#dvTagPopup').hide();
                            $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                        }
                    }
                    if ((e.target.className != 'fa fa-info-circle tagDef') && e.target.className != 'fa fa-info-circle tagDef' && (e.target.className).search('tagDefPopup') == -1) {
                        if ($('#tagdefinition').is(':visible')) {
                            $('#tagdefinition').hide();
                        }
                    }
                }
            });

            var lstWgs = JSON.parse($('#hdnlstWgs').val());

            localStorage.removeItem('INAPPROWORDS');
            localStorage.setItem('INAPPROWORDS', $('#hdnInApprWords').val());
            var lstTags = JSON.parse($('#hdnlstTags').val());
            var lstAllWgMembers = JSON.parse($('#hdnlstAllWgMembers').val());
            var parentDiv = ''; var grpId = ''; var groupTagCounter = 0; groupCounter = 0; totalgroupcounter = 0;

            $.each(lstWgs, function (key, val) {
                grpId = 'grp' + val.WG_ID;
                groupTagCounter = 0
                $.each(lstTags, function (key, valtag) {
                    if (val.WG_ID == valtag.WG_ID) {
                        groupTagCounter++;
                    }
                });
                groupCounter += groupTagCounter;
                $('#dvMrGroups').append('<li style="cursor:pointer;white-space: pre-wrap;" class="list-group-item list-group-item-action" id="' + grpId + '" onclick="loadTagforSelectedWg(' + val.WG_ID + ');">' + val.WG_LABEL + ' (' + groupTagCounter + ')' + '</li>');
                totalgroupcounter++;
            });
            parentDiv = '';
            if (totalgroupcounter == 0) {
                /* parentDiv = '';
                 parentDiv += '<div style="display: inline-block;padding-right:10px;font-size:11px;font-family: Roboto, sans-serif;"><p> You are not a member of any groups</p></div>';
                 $('#dvTagGroups').append(parentDiv);*/
                $('#dvTagGroups').hide();
            }
            var gtagcounter = 0;

            var filteredTags = lstTags;

            var filtertype = $('#hdnSelectedFilterType').val();

            filteredTags = _.filter(filteredTags, function (item, i) {
                return item.WG_ID.toString() === $('#hdnWgId').val()
            });

            if (filtertype == "PopularHighest") {
                templstAllTags = _.sortBy(filteredTags, [{ 'EntryCount': 'desc' }, { 'LOWER_TAG_LABEL': 'asc' }]);
            }
            else if (filtertype == "PopularLowest") {
                templstAllTags = _.sortBy(filteredTags, 'EntryCount');
            }
            else if (filtertype == "NameAtoZ") {
                templstAllTags = _.sortBy(filteredTags, 'TAG_LABEL');
            }
            else if (filtertype == "NameZtoA") {
                templstAllTags = _.sortBy(filteredTags, 'TAG_LABEL').reverse();
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
                btnId = "btn" + val.TAG_ID;
                var u = lstAllWgMembers.find(m => m.WG_ID == val.WG_ID && m.UserId == $('#hdnUserId').val());
                if (val.WG_ID.toString() === $('#hdnWgId').val()) {
                    parentDiv = '';
                    var dvid = 'dv' + val.TAG_ID
                    parentDiv += '<div style="display:inline-block;padding:4px 4px 4px 4px;"><div Id=' + dvid + ' style="display:flex;height:28px;background-color:rgb(220, 230, 250);border-radius:2px;"><div style="font-size:12px;display:inline-block;border-radius:6px;text-align:center;">';
                    parentDiv += '<div RoleId=' + u.Role + ' id = ' + btnId + ' tagid = "' + val.TAG_ID + '" tagname = "' + val.TAG_LABEL + '" tagdef="' + val.TAG_DEFINITION + '" tagtype="' + val.TAG_TYPE + '" class="tagellipsisbutton" style = "height:100%;width:7px;float:left;cursor:pointer;padding-left:6px;padding-right:10px;padding-top:5px;"><i class="fas fa-ellipsis-v" style="color: #757575;"></i></div>';
                    parentDiv += '<div style="height:100%;float:left;padding-right:10px;padding-top:6px;font-size:11px;font-family: Roboto, sans-serif;border-radius: 3px;white-space: pre-wrap;cursor:pointer" onclick = "javascript:viewTRMEntriesModel(' + val.TAG_ID + ',false);return false;"><i ';
                    if (val.TAG_TYPE == "GLOBAL") {
                        parentDiv += 'class="fas fa-globe"'
                    }
                    else {
                        parentDiv += 'class="fas fa-user-friends"'
                    }
                    parentDiv +=' style = "padding-top:3px;float:left;padding-right:2px;" ></i > ' + val.TAG_LABEL + ' (' + val.EntryCount + ')' + '</div ></div ></div ></div > ';
                    $('#dvTags').append(parentDiv);
                    gtagcounter++;
                }
                //RoleId=' + u.Role +'
            });
            if (gtagcounter == 0) {
                parentDiv = '';
                //var groupName = $('#hdnGroupName').val();
                //if (groupName.indexOf('(') > 0) {
                //    groupName = groupName.substr(groupName, groupName.indexOf('(')-1);
                //}
                parentDiv += '<div style="display: inline-block;padding-right:10px;padding-left: 5px;font-size:11px;font-family: Roboto, sans-serif;"><p> No group tags for the selected group have been applied to this entry.</p></div>';
                $('#dvTags').append(parentDiv);
            }

            $('#groupTagsCounter').text(groupCounter);

            //if (val.IsChecked === 1) {
            //parentDiv = '';
            //parentDiv += '<div style="display:inline-block;padding:4px 4px 4px 4px;"><div style="display:inline-block;background-color:#c4dcef;border-radius:2px;padding-bottom:3px;"><div style="font-size:12px;display:inline-block;border-radius:6px;text-align:center;">';
            //parentDiv += '<div id = ' + btnId + ' tagid = "' + val.TAG_ID + '" tagname = "' + val.TAG_LABEL + '" class="tagellipsisbutton" style = "width:3px;display:inline-block;padding-left:3px;cursor:pointer;"> <a class="tagellipsisbutton" style="cursor:pointer;"><i class="fas fa-ellipsis-v" style="color: #757575;"></i></a></div>';
            //parentDiv += '<div style="display: inline-block;padding-right:5px;font-size:11px;font-family: Roboto, sans-serif;border-radius: 3px">&nbsp;&nbsp;&nbsp;' + val.TAG_LABEL + '</div></div></div></div>';
            //$('#dvTags').append(parentDiv);
            //}

            tagpopupclick();

            //$('.tagellipsisbutton').mousedown(function (event) {
            //    switch (event.which) {
            //        case 1:
            //            tagPopUp($(this).attr('tagid'), event.pageX, event.pageY);
            //            break;
            //        //case 2:
            //        //    tagPopUp($(this).attr('tagid'), event.pageX, event.pageY);
            //        //    break;
            //        //case 3:

            //        //    $('#hdnTagId').val($(this).attr('tagid'));
            //        //    $('#hdnTagName').val($(this).attr('tagname'));

            //        //    //$('#ContentPlaceHolder1_Text1').val($('#ContentPlaceHolder1_hdnToolName').val());
            //        //    // $('#ContentPlaceHolder1_txtModifyTag').val($(this).attr('tagName'));

            //        //    tagPopUp($(this).attr('tagid'), event.pageX, event.pageY);
            //        //    break;
            //        default:
            //            break;
            //    }
            //});

            var wgid1 = $('#hdnWgId').val();
            $('#grp' + wgid1).addClass('active');
        });

        function loadTagforSelectedWg(wgId) {

            $('.list-group-item').each(function () {
                $(this).removeClass('active');
            });
            $('#grp' + wgId).addClass('active');
            $('#hdnWgId').val(wgId);
            $('#dvTags').empty();
            $('#hdnGroupName').val($('#grp' + wgId).text());

            var selectedGroupName = $('#grp' + wgId).text().trimEnd();

            $('#spanselectedGroupName').text(selectedGroupName.substr(selectedGroupName, selectedGroupName.lastIndexOf('(') - 1));

            //$('#spanselectedGroupName').text($('#grp' + wgId).text());

            getToolWorkGroupTags();
            tagpopupclick();
        }
        function pttagpopupclick() {
            $('.tagellipsisbuttonpt').click(function () {
                $('#tagentryGroupName').hide();
                $('#dvTaggedGroupName').hide();
                // tagPopUp($(this).attr('tagid'), event.pageX, event.pageY);
                $('#hdnSelectedWgId').val(-1);
                var btnid = $(this).attr('tagid');
                $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                let show = true;
                //Selected the already selected tag
                if (btnid == $('#hdnTagId').val()) {
                    if ($('#dvTagPopup').is(':visible')) {
                        $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                        $('#dvTagPopup').hide();
                        show = false; //We just closed the already visible pop up so don't show again
                    }
                }
                if (btnid != $('#hdnTagId').val() ||
                    (btnid == $('#hdnTagId').val() && show)) {
                    var tagid = $('#btn' + btnid).attr('tagid');
                    $('#hdnTagId').val(tagid);
                    $('#hdnTagName').val($('#btn' + btnid).attr('tagname'));
                    $('#dv' + tagid).css('background-color', 'rgb(205, 207, 215)');
                    var btn1 = $(this);
                    $('.tagpop').css('position', 'absolute');
                    var top = btn1.offset().top + btn1.outerHeight() + 5;
                    var left = btn1.offset().left - 3;
                    var maxwidth = left + 225;
                    if (maxwidth > $('#dvNewTag').width()) {
                        var diff = (maxwidth - $('#dvNewTag').width());
                        left = left - diff;
                    }
                    $('.tagpop').css('top', (top - 5));
                    $('.tagpop').css('left', left);

                    $('#dvTagPopup').show();
                    $('#dvViewTRMEntriesmenu').show();
                    $('#dvtagTRMEntry').show();
                    $('#dvRemoveTag').show();
                    $('#dvTagCompTech').show();                }
            });
        }
        function tagpopupclick() {
            $('.tagellipsisbutton').click(function () {

                $('#tagentryGroupName').show();
                $('#dvTaggedGroupName').show();
                $('#hdnSelectedWgId').val(0);
                // tagPopUp($(this).attr('tagid'), event.pageX, event.pageY);
                var btnid = $(this).attr('tagid');
                $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                let show = true;
                //Selected the already selected tag
                if (btnid == $('#hdnTagId').val()) {
                    if ($('#dvTagPopup').is(':visible')) {
                        $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                        $('#dvTagPopup').hide();
                        show = false; //We just closed the already visible pop up so don't show again
                    }
                }
                if (btnid != $('#hdnTagId').val() ||
                    (btnid == $('#hdnTagId').val() && show)) {
                    var tagid = $('#btn' + btnid).attr('tagid');
                    $('#hdnTagId').val(tagid);
                    $('#hdnTagName').val($('#btn' + btnid).attr('tagname'));
                    var RoleId = $('#btn' + btnid).attr('RoleId');
                    $('#dv' + tagid).css('background-color', 'rgb(205, 207, 215)');
                    if (RoleId == 3) {
                        $('#dvViewTRMEntriesmenu').show();
                        $('#dvtagTRMEntry').hide();
                        $('#dvRemoveTag').hide();
                        $('#dvTagCompTech').hide();
                    }
                    else {
                        $('#dvViewTRMEntriesmenu').show();
                        $('#dvtagTRMEntry').show();
                        $('#dvRemoveTag').show();
                        $('#dvTagCompTech').show();
                    }

                    var btn1 = $(this);
                    $('.tagpop').css('position', 'absolute');
                    var top = btn1.offset().top + btn1.outerHeight() + 5;
                    var left = btn1.offset().left - 3;
                    var maxwidth = left + 225;
                    if (maxwidth > $('#dvNewTag').width()) {
                        var diff = (maxwidth - $('#dvNewTag').width());
                        left = left - diff;
                    }
                    $('.tagpop').css('top', (top - 5));
                    $('.tagpop').css('left', left);
                    $('#dvTagPopup').show();

                    //$('.tagpop').css('top', (pageY));

                    ////pageX = pageX - 100;
                    //console.log('pageX-' + pageX);
                    //console.log('pageY-' + pageY);

                    //var left = pageX - 3;
                    //var maxwidth = left + 100;
                    //if (maxwidth > $('#dvNewTag').width()) {
                    //    var diff = maxwidth - $('#dvNewTag').width();
                    //    left = left - diff;
                    //}

                    //$('.tagpop').css('left', (left));

                    //if ($('#dvTagPopup').is(':visible')) {
                    //    $('#dvTagPopup').hide();
                    //    $('#dv' + $('#hdnTagId').val()).css('background-color', '#c4dcef');
                    //}
                    //else
                    //    $('.tagpop').slideFadeToggle();
                }
            });
        }
        function tagPopUp(btnid, pageX, pageY) {
            $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
            var tagid = $('#btn' + btnid).attr('tagid');
            $('#hdnTagId').val(tagid);
            $('#hdnTagName').val($('#btn' + btnid).attr('tagname'));
            var RoleId = $('#btn' + btnid).attr('RoleId');
            $('#dv' + tagid).css('background-color', 'rgb(205, 207, 215)');

            if (RoleId == "3") {
                $('#dvViewTRMEntriesmenu').show();
                $('#dvtagTRMEntry').hide();
                $('#dvRemoveTag').hide();
                $('dvTagCompTech').hide();
            }
            else {
                $('#dvViewTRMEntriesmenu').show();
                $('#dvtagTRMEntry').show();
                $('#dvRemoveTag').show();
                $('dvTagCompTech').show();
            }

            //$('.tagpop').css('top', (pageY ));
            //$('.tagpop').css('left', (pageX - 10));
            $('.tagpop').css('top', (pageY));

            //pageX = pageX - 100;

            var left = pageX - 3;
            var maxwidth = left + 100;
            if (maxwidth > $('#dvNewTag').width()) {
                var diff = maxwidth - $('#dvNewTag').width();
                left = left - diff;
            }

            $('.tagpop').css('left', (left));

            if ($('#dvTagPopup').is(':visible')) {
                $('#dvTagPopup').hide();
                $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
            }
            else
                $('.tagpop').slideFadeToggle();
        }

        $.fn.slideFadeToggle = function (easing, callback) {
            return this.animate({ opacity: 'toggle', height: 'toggle' }, 'fast', easing, callback);
        };
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

    </script>
    <style>
        #dvnewWgTagModel .container,
        #dvnewToolTagModel .container,
        #dvToolEntry .container {
            font-family: 'Roboto';
            display: block;
            background: #FFF;
        }

        #dvnewWgTagModel .group,
        #dvnewToolTagModel .group,
        #dvToolEntry .group {
            position: relative;
        }

        #dvnewWgTagModel input,
        #dvToolEntry input {
            font-size: 18px;
            padding: 10px 10px 10px 5px ;
            display: block;
            width: 300px;
            border: none;
            border-bottom: 1px solid #757575;
        }
         #dvnewToolTagModel input {
            font-size: 18px;
            padding: 10px 10px 10px;
            display: block;
            width: 275px;
            border: none;
            border-bottom: 1px solid #757575;
        }
        #dvnewWgTagModel input:focus,
        #dvnewToolTagModel input:focus,
        #dvToolEntry input:focus {
            outline: none;
        }
         #dvnewWgTagModel label{
            color: #999;
            font-size: 18px;
            font-weight: normal;
            position: absolute;
            pointer-events: none;
            left: 10px;
            top: 10px;
            transition: 0.2s ease all;
            -moz-transition: 0.2s ease all;
            -webkit-transition: 0.2s ease all;
         }
       
        #dvnewToolTagModel label,
        #dvToolEntry label {
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

        #dvnewWgTagModel input:focus ~ label,
        #dvnewWgTagModel input:valid ~ label,
        #dvnewToolTagModel input:focus ~ label,
        #dvnewToolTagModel input:valid ~ label,
        #dvToolEntry input:focus ~ label,
        #dvToolEntry input:valid ~ label {
            top: -20px;
            font-size: 14px;
            color: grey;
        }

        #dvnewWgTagModel .bar,
        #dvnewToolTagModel .bar,
        #dvToolEntry .bar {
            position: relative;
            display: block;
        }

        #dvnewWgTagModel .bar:before,
        #dvnewWgTagModel .bar:after,
        #dvnewToolTagModel .bar:before,
        #dvnewToolTagModel .bar:after,
        #dvToolEntry .bar:before,
        #dvToolEntry .bar:after {
            content: '';
            height: 2px;
            width: 0;
            bottom: 1px;
            position: absolute;
            transition: 0.2s ease all;
            -moz-transition: 0.2s ease all;
            -webkit-transition: 0.2s ease all;
        }

        #dvnewWgTagModel .bar:before,
        #dvnewToolTagModel .bar:before,
        #dvToolEntry .bar:before {
            left: 50%;
        }

        #dvnewWgTagModel .bar:after,
        #dvnewToolTagModel .bar:after,
        #dvToolEntry .bar:after {
            right: 50%;
        }

        #dvnewWgTagModel input:focus ~ .bar:before,
        #dvnewWgTagModel input:focus ~ .bar:after,
        #dvnewToolTagModel input:focus ~ .bar:before,
        #dvnewToolTagModel input:focus ~ .bar:after,
        #dvToolEntry input:focus ~ .bar:before,
        #dvToolEntry input:focus ~ .bar:after {
            width: 50%;
        }

        #dvnewWgTagModel .highlight,
        #dvnewToolTagModel .highlight,
        #dvToolEntry .highlight {
            position: absolute;
            height: 60%;
            width: 100px;
            top: 25%;
            left: 0;
            pointer-events: none;
            opacity: 0.5;
        }

        #dvnewWgTagModel input:focus ~ .highlight,
        #dvnewToolTagModel input:focus ~ .highlight,
        #dvToolEntry input:focus ~ .highlight {
            -webkit-animation: inputHighlighter 0.3s ease;
            -moz-animation: inputHighlighter 0.3s ease;
            animation: inputHighlighter 0.3s ease;
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

        @keyframes ripple {
            to {
                width: 15rem;
                height: 15rem;
                opacity: 0;
            }
        }
    </style>
</body>
</html>
<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="NewTag.aspx.vb" Inherits="VA.TRM.Authoring.NewTag" %>

<%@ Import Namespace="VA.TRM.Authoring.incNet.TRMCodeLib" %>
<%@ Import Namespace="VA.TRM.Authoring.incNet.TRMCodeLib.TRMCodeLib" %>
<%@ Import Namespace="VA.TRM.Authoring.TRMConfig" %>
<%@ Import Namespace="VA.TRM.Authoring.Authoring.incNet.TRMGlobals.Globals" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
    <body>
        <style>
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

            .groupDv {
                width: fit-content;
                padding: 0px 0px 0px 0px;
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
                border-top: solid 1px lightgrey;
                padding: 25px 15px 15px 15px;
            }

            .chkTool:focus,.chkTool:active,
            #tagFilter:focus,#tagFilter:active{
               border-color: lightgrey !important;
               box-shadow: none !important;
            } 

            .list-group-item.active {
                z-index: 2;
                color: black;
                background-color: lightgray;
                border-color: lightgray;
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

            .messagepop {
                font-family: "Roboto, sans-serif";
                cursor: default;
                display: none;
                background-color: white;
                margin-top: 15px;
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

            
            #dvToolEntry .container,
            #dvnewToolTagModel .container,
            #dvnewGgTagModel .container{
                font-family: 'Roboto';
                display: block;
                background: #FFF;
            }

            #dvToolEntry .group,
            #dvnewToolTagModel .group,
            #dvnewGgTagModel .group{
                position: relative;
            }

            #dvToolEntry input,
            #dvnewGgTagModel input{
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
            #dvToolEntry input:focus,
            #dvnewToolTagModel input:focus,
            #dvnewGgTagModel input:focus{
                outline: none;
            }

            #dvToolEntry label,
            #dvnewToolTagModel label,
            #dvnewGgTagModel label{
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

            #dvToolEntry input:focus ~ label,
            #dvToolEntry input:valid ~ label,
            #dvnewToolTagModel input:focus ~ label,
            #dvnewToolTagModel input:valid ~ label,
            #dvnewGgTagModel input:focus ~ label,
            #dvnewGgTagModel input:valid ~ label{
                top: -20px;
                font-size: 14px;
                color: grey;
            }
            .entryNameStyle{
            top: -20px !important;
            font-size: 14px;
            color: grey;
        }
            #dvToolEntry .bar,
            #dvnewToolTagModel .bar,
            #dvnewGgTagModel .bar{
                position: relative;
                display: block;
            }

            #dvToolEntry .bar:before,
            #dvToolEntry .bar:after,
            #dvnewToolTagModel .bar:before,
            #dvnewToolTagModel .bar:after,
            #dvnewGgTagModel .bar:before,
            #dvnewGgTagModel .bar:after{
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
            #dvnewToolTagModel .bar:before,
            #dvnewGgTagModel .bar:before{
                left: 50%;
            }

            #dvToolEntry .bar:after,
            #dvnewToolTagModel .bar:after,
            #dvnewGgTagModel .bar:after{
                right: 50%;
            }

            #dvToolEntry input:focus ~ .bar:before,
            #dvToolEntry input:focus ~ .bar:after,
            #dvnewToolTagModel input:focus ~ .bar:before,
            #dvnewToolTagModel input:focus ~ .bar:after,
            #dvnewGgTagModel input:focus ~ .bar:before,
            #dvnewGgTagModel input:focus ~ .bar:after{
                width: 50%;
            }

            #dvToolEntry .highlight,
            #dvnewToolTagModel .highlight,
            #dvnewGgTagModel .highlight{
                position: absolute;
                height: 60%;
                width: 100px;
                top: 25%;
                left: 0;
                pointer-events: none;
                opacity: 0.5;
            }

            #dvToolEntry input:focus ~ .highlight,
            #dvnewToolTagModel input:focus ~ .highlight,
            #dvnewGgTagModel input:focus ~ .highlight{
                -webkit-animation: inputHighlighter 0.3s ease;
                -moz-animation: inputHighlighter 0.3s ease;
                animation: inputHighlighter 0.3s ease;
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

            .form-check-input {
               margin-left: 0px;
               width: 15px;
               height: 15px;
            }

            .form-check-input[type=checkbox] {
                border-radius: .15em; 
            }

            .UncheckTool{
                background-color: white;
            }

            .CheckTool{
                background-color: #F7F7F7;
            }

            .saveButton {
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

            .saveButton:hover {
                background-color: red;
                box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 10%);
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
           }

            .unSavedChangesButton:hover {
                background-color: #f5f5f5;
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

            .daLink:hover {
                text-decoration: underline !important;
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

        .textcss {
            font-family: Roboto, sans-serif;
            font-size: 12px
        }
        </style>

        <form id="form1" runat="server" style="width: 100%">
            <div class="col" style="width:850px;margin-top:10px;margin-left:-5px;font-size:8.5pt;font-family:roboto">
                Disclaimer: All tags created on this page are global tags and will immediately show up on the Presentation and Authoring entry pages when an entry is tagged.            
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
            <div class="" id="dvNewTag">
                <div class="row" style="height: 10px;">
                    <div class="col-12">
                        <div id="dvErrorMessage"></div>
                        <span id="lblGroupSuccessMessage" style="font-family: 'Roboto', sans-serif; color: green; font-size: 14px;"></span>
                    </div>
                </div>
                <div id="dvTagGroups">
                    <div class="row">                                      
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
                            <span style="font-family: 'Roboto', sans-serif; font-size: 14px; font-weight: 400">Global Groups</span>
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
                                    <button id="btnaddNewGGTag" onclick="javascript:openGgTagModel(0,);return false;" class="addgrouptagsButton">
                                        <i class="fas fa-tag" style="color: black"></i>&nbsp;&nbsp;&nbsp;GROUP TAGS
                                    </button>
                                </div>
                            </div>
    <%--                        <div class="row">
                                <br />
                            </div>--%>
                            <div class="row" style="padding-top:15px">
                                <div class="col-12" id="dvTags"></div>
                            </div>
                        </div>

                    </div>
                    <div class="row" style="height: 10px;"></div>
                </div>
            </div>

            <div id="dvTagPopup" class="messagepop tagpop shadow-sm  bg-white rounded" style="margin-top: 1px; display: none; width: 220px; border: 1px solid #dee2e6; border-radius: 5px;">
                <div style="padding-top: 5px; padding-bottom: 5px; background-color: white; cursor: pointer" class="grpellipsemenu" id="dvtagTRMEntry" onclick="javascript:createTagEntryModel();return false;">
                    <div style="padding-left: 10px; display: inline-block; color: rgb(80,80,80)">
                        <i class="fas fa-tag"></i>
                    </div>
                    <div style="display: inline-block;">
                        <a href="#" style="text-decoration: none; color: rgb(100,100,100); font-size: 12px; font-family: Roboto, sans-serif;">&nbsp;&nbsp;Tag TRM Entries</a>
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

             <div class="modal fade modalClose" id="tagTRMModel" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="tagTRMModalLabel" aria-hidden="true">
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
                                    <span style="color: red; font-family: Roboto, sans-serif; font-size: 11px;height:100%;vertical-align:middle;" id="lbltagEntryErrorMessage"></span>
                                </div>
                            </div>
                            <div class="row" style="width: 100%;">
                                <div class="col-12">
                                    <i class="fas fa-user-friends" style="color: black; font-size: 12px; padding-left: 3px;" id="tagEntryGroupIcon"></i>
                                    <span style="color: black; font-family: Roboto, sans-serif; font-size: 12px; font-weight: bold; white-space: pre-wrap;" id="tagentryGroupName"></span>
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
                                        APPLY
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="applyTRMTagEntries" role="dialog" data-backdrop="static" aria-labelledby="applyTRMTagEntrieLabel" aria-hidden="true" tabindex="-1">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="padding-top: 5px; padding-left: 10px; padding-right: 10px; width: 450px;height:auto;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="javascript:closeapplyTRMEntries();return false;">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body" style="padding-top: 0px; padding-bottom: 20px;">
                            <p style="text-decoration: none; font-family: Roboto, sans-serif; font-size: 24px; font-weight: bold">
                                <i class='fas fa-exclamation-triangle' style="font-size: 24px; color: #FF8C00"></i>
                                <span id="confirmtagEntryTitle" style="font-family: Roboto, sans-serif; font-size: 16px; color: black"></span>
                            </p>
                            <span id="confirmtagEntryText" style="text-align: left; font-family: Roboto, sans-serif; font-size: 14px; color: black"></span>
                            <br />
                            <div id="dvTRMTaggedEntries" style="height: 270px; overflow-y: auto; overflow-x: hidden;"></div>
                            <div id="entryDescription" class="messagepop shadow-sm mb-5 bg-white entryDescPopup" style="border-radius: 5px; display: none; width: 335px">
                                <div class="row entryDescPopup"> 
                                    <div class="col-10 entryDescPopup" style="font-family: Roboto,sans-serif;font-size:14px;font-weight:bold;padding-top:0px;padding-left:25px;padding-bottom:5px;">Entry Description</div>
                                    <div class="col-2 entryDescPopup" style="float:right">
                                        <button type="button" class="close" aria-label="Close" onclick="javascript:closeEntryDescription();">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                               </div> 
                               <div class="entryDescPopup" style="padding-left:10px;font-family: Roboto,sans-serif;font-size:12px;font-weight:normal;overflow-y:auto;overflow-x:hidden;" id="description"></div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button id="applyCancel" class="cancelButton" data-dismiss="modal" onclick="javascript:cancelTRMTagEntries();return false;">BACK</button>
                            <button id="applyConfirm" class="enabledbutton" onclick="javascript:ConfirmapplyTag();return false;">CONFIRM</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="unsavedChanges" data-backdrop="static" aria-labelledby="unsavedChangesLabel" aria-hidden="true" tabindex="-1">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="padding-top: 5px; padding-left: 10px; padding-right: 10px; width: 450px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="javascript:closeUnsavedChanges();">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body" style="padding-top: 0px; padding-bottom: 20px;">
                            <p style="text-decoration: none; font-family: Roboto, sans-serif; font-size: 24px; font-weight: bold">
                                <i class='fas fa-exclamation-triangle' style="font-size: 24px; color: #EB5757"></i>
                                <span style="font-family: Roboto, sans-serif; font-size: 16px; color: black">UNSAVED CHANGES</span>
                            </p>
                            <span id="unsavedText" style="text-align: left; font-family: Roboto, sans-serif; font-size: 14px; color: black"></span>
                            <br />
                            <p></p>
                        </div>
                        <div class="modal-footer">
                            <button id="unsavedCancel" onclick="javascript:cancelUnsavedChanges();return false;">CANCEL</button>
                            <button id="unsavedDiscard" data-dismiss="modal" onclick="javascript:discardUnsavedChanges();return false;">DISCARD</button>
                            <button id="unsavedSave" class="saveButton" onclick="javascript:saveUnsavedChanges(); return false;">SAVE</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="viewTRMModel" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="ViewTRMModalLabel" aria-hidden="true" >
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
            <div class="modal fade" id="newToolTagModel" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="newGGTagModalLabel" aria-hidden="true">
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
                                <i class="fas fa-exclamation-triangle" id="InApprGgTagWarning" style="color: darkorange; display: none;"></i>
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
                                    <span id="spanGroupName" style="font-weight: bold; font-size: 10px; font-family: Roboto, sans-serif; white-space: pre-wrap">Global Group - <span id="lblGroupName"></span></span>
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
                                        <input type="text" id="txtNewGgTagName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 12px; background-color: #F6F6F6;" required="required" />
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
                            <div class="col-12" id="dvGgTags" style="overflow-y: auto; height: 200px;">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row">
                            <div class="col-12" style="text-align: center;">
                                <button type="button" id="btncancelsaveworkgroup" onclick="javascript:cancelnewToolTagModel();" class="cancelButton">CANCEL</button>
                                <button type="button" id="btnSaveGlobalGroup" class="disabledbutton" onclick="javascript:saveGlobalgroupTags();return false;">
                                    <%--<span class="spinner-border spinner-border-sm d-none" id="spinnerWGTag" role="status" aria-hidden="true"></span>--%>
                                    APPLY
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

            <div class="modal fade" id="newGGTagModel" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="newGGTagModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document" style="width: 400px">
                <div class="modal-content" style="width: 400px">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="javascript:closenewGGTagModel();">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row" style="width: 100%">
                            <div class="col-8">
                                <i class="fas fa-exclamation-triangle" id="InApprGgTagWarning" style="color: orangered; display: none;"></i><span class="textcss" style="color: black; font-weight: bold; font-size: 14px;">&nbsp;&nbsp;NEW TAG</span>
                            </div>
                            <%--<div class="col-sm-4" style="text-align: right">
                            <i class="fas fa-times" style="color: black; cursor: pointer;" onclick="javascript:closeNewGGTagModel();"></i>
                        </div>--%>
                        </div>
                        <div class="row">
                            <br />
                        </div>
                        <div id="dvnewGgTagModel">
                            
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
                                <label id="lblCreateGgTagErrorMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal;font-size: 12px;display:block;padding-top:5px;"></label>
                                <label id="lblCreateGgTagWarningMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal"></label>
                            </div>
                            <div class="col-2" style="text-align: right; padding-right: 0px;height:30px;">
                                <span id="charGgTagcounter" class="textcss">0/30</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12" style="padding-left: 15px;padding-top:20px;">
                                <span id="lblInApporipateGgTagWarningMessage" style="font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal"></span>
                            </div>
                        </div>
                        <%--<div class="row" style="padding-top: 15px;">
                            <div class="col-sm-12">
                                <span id="lblInApporipateGgTagWarningMessage1" style="font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal"></span>
                            </div>
                        </div>--%>
                    </div>
                    <div class="modal-footer">
                        <div class="row">
                            <div class="col-12" style="text-align: center;">
                                <button type="button" id="btncanceladd" class="cancelButton" data-dismiss="modal" onclick="javascript:closenewGGTagModel();">CANCEL</button>
                                <button type="button" id="btnCreateGgTag" class="enabledbutton" onclick="javascript:addinapprTag();return false;">
                                    ADD
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

            <%--<input type="hidden" runat="server" id="hdnIsUserHasBusinessAdminRole" />--%>
            <asp:HiddenField ID="hdnlstGgs" runat="server" />
            <asp:HiddenField ID="hdnlstTags" runat="server" />
            <asp:HiddenField ID="hdnToolId" runat="server" />       
            <asp:HiddenField ID="hdnGgId" runat="server" />
            <asp:HiddenField ID="hdnTagId" runat="server" />
            <asp:HiddenField ID="hdnGroupName" runat="server" />
            <asp:HiddenField ID="hdnToolName" runat="server" />
            <asp:HiddenField ID="hdnInApprWords" runat="server" />
            <asp:HiddenField ID="hdnSelectedTags" runat="server" />
            <asp:HiddenField ID="hdnSelectedToolId" runat="server" />
            <asp:HiddenField ID="hdnlstAllGgMembers" runat="server" />
            <asp:HiddenField ID="hdnUserId" runat="server" />
            <asp:HiddenField ID="hdnRoleId" runat="server" />
            <asp:HiddenField ID="hdnSelectedFilterType" runat="server" Value="PopularHighest" />
            <asp:HiddenField ID="hdnSelectedGgId" runat="server" />
            <asp:HiddenField ID="hdnTagName" runat="server" />
            <asp:HiddenField ID="hdnLoggedInUserOrgName" runat="server" />
            <asp:HiddenField ID="hdnSelectedTools" runat="server" />
            <asp:HiddenField ID="hdnTriggerModal" runat="server" />
            <asp:HiddenField ID="hdnSelectedToolTags" runat="server" />
            <asp:HiddenField ID="hdnOriginalSelections" runat="server" />
            <asp:HiddenField ID="hdnTagsByGgId" runat="server" />
        </form>

        <script>
            $(document).ready(function () {

                $("#txtTagName").on('keydown keyup change', function (e) {
                    var k = e.keyCode || e.which;
                    let errorText = $('#lblCreateGgTagErrorMessage').html();
                    if (errorText == "Duplicate Tag Name") {
                        errorText = "";
                    }
                    $('#lblCreateGgTagErrorMessage').html('');
                    $('#lblCreateGgTagWarningMessage').text('');
                    $('#InApprGgTagWarning').hide();
                    $('#lblInApporipateGgTagWarningMessage').html('');
                    $('#hdnIsInAppropriateFlagged').val('False');
                    var maxLength = 30;
                    var charLength = $('#txtTagName').val().length;
                    var trimLength = $('#txtTagName').val().trim().length
                    var e1 = 'Name must include visible characters';
                    var e2 = 'Valid characters are alphanumeric and _-()';
                    var e3 = 'Inappropriate word detected';

                    if (charLength > maxLength) {
                        $('#charGgTagcounter').css('color', 'red');
                        $('#btnCreateGgTag').attr('disabled', 'disabled');
                        $('#btnCreateGgTag').removeClass('enabledbutton').addClass('disabledbutton');
                        $('#charGgTagcounter').text(charLength + '/' + maxLength);
                        //   return;
                    }
                    else {
                        $('#charGgTagcounter').css('color', 'black');
                    }

                    if (charLength > 0 && trimLength == 0 && charLength <= maxLength) {
                        $('#btnCreateGgTag').attr('disabled', 'disabled');
                        $('#btnCreateGgTag').removeClass('enabledbutton').addClass('disabledbutton');
                        /* if (errorText.length != 0) {
                             if(errorText.search(e1) == -1)
                                 errorText += "<br>Name must include visible characters";
                         }                     
                         else*/
                        errorText = "Name must include visible characters";
                        $('#lblCreateGgTagErrorMessage').html(errorText);
                        //  $('#lblCreateGgTagErrorMessage').text('Name must include visible characters');
                        $('#charGgTagcounter').text(charLength + '/' + maxLength);
                        return;
                    }
                    else if (charLength == 0) {
                        $('#btnCreateGgTag').attr('disabled', 'disabled');
                        $('#btnCreateGgTag').removeClass('enabledbutton').addClass('disabledbutton');
                        $('#charGgTagcounter').text(charLength + '/' + maxLength);
                        errorText = '';
                        $('#lblCreateGgTagErrorMessage').html(errorText);
                        return;

                    }
                    else {
                        if (charLength <= maxLength) {
                            $('#btnCreateGgTag').removeAttr('disabled');
                            $('#btnCreateGgTag').removeClass('disabledbutton').addClass('enabledbutton');
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
                            $('#lblCreateGgTagErrorMessage').html('');
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
                        $('#lblCreateGgTagErrorMessage').html(errorText);
                        //  $('#lblCreateGgTagErrorMessage').text('Valid characters are alphanumeric and _-()');
                        // $('#lblCreateGgTagErrorMessage').css('font-size', '15px');
                        $('#btnCreateGgTag').attr('disabled', 'disabled');
                        $('#btnCreateGgTag').removeClass('enabledbutton').addClass('disabledbutton');
                    }
                    else {
                        if (charLength <= maxLength) {
                            $('#lblCreateGgTagErrorMessage').html('');
                            $('#btnCreateGgTag').removeAttr('disabled');
                            $('#btnCreateGgTag').removeClass('disabledbutton').addClass('enabledbutton');
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
                        $('#lblCreateGgTagErrorMessage').html(errorText);
                    }
                    var splittext = enteredtext.split(' ');
                    var InApprWords = localStorage.getItem('INAPPROWORDS');
                    var test = JSON.parse(InApprWords)
                    var isinapprworddetected = false;
                    var noOfInApproWordDetected = 0;
                    var inapprotext = '';
                    for (var i = 0; i <= splittext.length; i++) {
                        //InApprWords.find()
                        var tempstring = splittext[i];
                        if (tempstring != '' && tempstring != undefined) {
                            var s = test.find((s) => s.TEXT.toLowerCase() === tempstring.toString().toLocaleLowerCase());
                            if (s != undefined) {
                                if (inapprotext != '') {
                                    inapprotext += ', ';
                                }
                                inapprotext += '"' + tempstring + '"';

                                isinapprworddetected = true;
                                noOfInApproWordDetected += 1;
                            }
                        }
                    }
                    if (isinapprworddetected) {
                        $('#InApprGgTagWarning').show();
                        var txtMsg = '';
                        if (noOfInApproWordDetected == 1) {
                            txtMsg = '<p>The word ' + inapprotext + ' have been flagged as inappropriate. TRM admins monitor all site activity.</p><p>You may change the name or continue adding the tag/group name if you received this message in error.</p>';

                        }
                        else {
                            txtMsg = '<p>The words ' + inapprotext + ' have been flagged as inappropriate. TRM admins monitor all site activity.</p><p>You may change the name or continue adding the tag/group name if you received this message in error.</p>';

                        }
                        $('#lblInApporipateGgTagWarningMessage').html(txtMsg);
                        //var txtMsg1 = 'You may change the name or continue adding the group name if you received this message in error.';
                        //$('#lblInApporipateGgTagWarningMessage1').html(txtMsg1);
                        // let errorText = $('#lblCreateGgTagErrorMessage').text();
                        if (errorText.length != 0) {
                            if (errorText.search(e3) == -1)
                                errorText += "<br>Inappropriate word detected";
                        }
                        else
                            errorText = "Inappropriate word detected";
                        $('#lblCreateGgTagErrorMessage').html(errorText);
                        $('#charGgTagcounter').text(charLength + '/' + maxLength);
                        $('#txtTagName').val(enteredtext);
                        // $('#lblCreateGgTagErrorMessage').css('font-size', '15px');
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
                        $('#lblCreateGgTagErrorMessage').html(errorText);
                    }
                    $('#charGgTagcounter').text(charLength + '/' + maxLength);
                });

                //$('#btnaddNewGGTag').hide();
                //if ($('#hdnIsUserHasBusinessAdminRole').val() == 'True') {
                //    $('#btnaddNewGGTag').show();
                //}
                $(".grpellipsemenu").mouseover(function () {
                    $(this).css("background-color", "lightgrey");
                });
                $(".grpellipsemenu").mouseout(function () {
                    $(this).css("background-color", "white");
                });

                document.querySelector("#btnApplyTag").addEventListener('click', createRipple);
                document.querySelector("#btncancelapplytag").addEventListener('click', createRipple);
                document.querySelector("#applyConfirm").addEventListener('click', createRipple);
                document.querySelector("#applyCancel").addEventListener('click', createRipple);
                $(document).add(parent.document).on("click", function (e) {

                    if (e.target.className != undefined) {

                        if ((e.target.className != 'fa fa-info-circle entryDesc') && e.target.className != 'fa fa-info-circle entryDesc' && (e.target.className).search('entryDescPopup') == -1) {
                            if ($('#entryDescription').is(':visible')) {
                                $('#entryDescription').hide();
                            }
                        }

                        if ((e.target.className != 'fas fa-ellipsis-v') && (e.target.className != 'tagellipsisbutton')) {
                            if ($('#dvTagPopup').is(':visible')) {
                                $('#dvTagPopup').hide();
                                $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                            }
                        }
                    }
                });

                $(window).resize(function () {
                    $('#dvTagPopup').hide();
                    $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                });

                var selectedGroupName = $('#hdnGroupName').val().trimEnd();

                $('#spanselectedGroupName').text(selectedGroupName);
                getToolGlobalGroups();

                var lstGgs = JSON.parse($('#hdnlstGgs').val());
                var lstTags = JSON.parse($('#hdnlstTags').val());
                var lstAllGgMembers = JSON.parse($('#hdnlstAllGgMembers').val());
                var parentDiv = ''; var grpId = ''; var groupTagCounter = 0; groupCounter = 0; totalgroupcounter = 0;

                $.each(lstGgs, function (key, val) {
                    grpId = 'grp' + val.GlblGrp_ID;
                    groupTagCounter = 0
                    $.each(lstTags, function (key, valtag) {
                        if (val.GlblGrp_ID == valtag.GlblGrp_ID) {
                            groupTagCounter++;
                        }
                    });
                    groupCounter += groupTagCounter;
                    $('#dvMrGroups').append('<li style="cursor:pointer;white-space: pre-wrap;" class="list-group-item list-group-item-action" id="' + grpId + '" onclick="loadTagforSelectedGg(' + val.GlblGrp_ID + ');">' + val.GlblGrp_LABEL + ' (' + groupTagCounter + ')' + '</li>');
                    totalgroupcounter++;
                });
                parentDiv = '';
                if (totalgroupcounter == 0) {
                    $('#dvTagGroups').hide();
                }
                var gtagcounter = 0;
                var filteredTags = lstTags;

                var filtertype = $('#hdnSelectedFilterType').val();

                filteredTags = _.filter(filteredTags, function (item, i) {
                    return item.GlblGrp_ID.toString() === $('#hdnGgId').val()
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
                    var u = lstAllGgMembers.find(m => m.GG_ID == val.GG_ID && m.UserId == $('#hdnUserId').val());
                    if (val.GlblGrp_ID.toString() === $('#hdnGgId').val()) {
                        parentDiv = '';
                        var dvid = 'dv' + val.TAG_ID
                        parentDiv += '<div style="display:inline-block;padding:4px 4px 4px 4px;"><div Id=' + dvid + ' style="display:flex;height:28px;background-color:rgb(220, 230, 250);border-radius:2px;"><div style="font-size:12px;display:inline-block;border-radius:6px;text-align:center;">';
                        parentDiv += '<div id = ' + btnId + ' tagid = "' + val.TAG_ID + '" tagname = "' + val.TAG_LABEL + '" class="tagellipsisbutton" style = "height:100%;width:7px;float:left;cursor:pointer;padding-left:6px;padding-right:10px;padding-top:5px;"><i class="fas fa-ellipsis-v" style="color: #757575;"></i></div>';
                        parentDiv += '<div style="height:100%;float:left;padding-right:10px;padding-top:7px;font-size:11px;font-family: Roboto, sans-serif;border-radius: 3px;white-space: pre-wrap;cursor:pointer" onclick = "javascript:viewTRMEntriesModel(' + val.TAG_ID + ');return false;">&nbsp;&nbsp;<i class="fas fa-globe" style="padding-top:3px;float:left;padding-right:2px;"></i>' + val.TAG_LABEL + ' (' + val.EntryCount + ')' + '</div></div></div></div>';
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
                    parentDiv += '<div style="display: inline-block;padding-right:10px;padding-left: 5px;font-size:11px;font-family: Roboto, sans-serif;"><p> No global tags for the selected group have been applied to this entry.</p></div>';
                    $('#dvTags').append(parentDiv);
                }

                $('#groupTagsCounter').text(groupCounter);
                tagpopupclick();
                var wgid1 = $('#hdnGgId').val();
                $('#grp' + wgid1).addClass('active');

                $('#tagFilter').change(function () {
                    changefilter($(this).val());
                });

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

                $("#applyTRMTagEntries").on('keydown', function (e) {
                    // ESCAPE key pressed
                    if ((e.keyCode || e.which) == 27) {
                        //if ($('#entryDescription').is(':visible')) {
                        //    $('#entryDescription').hide();
                        //}
                        //else if ($('#applyTRMTagEntries').is(':visible')) {
                        $('#applyTRMTagEntries').modal('hide');
                            $("#tagTRMModel").modal('show');
                            $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                            event.preventDefault();
                        //}
                        
                    }
                });

                $('#tagTRMModel').on('keydown', function (event) {
                    if ((event.keyCode || event.which) == 27) {
                        $('#hdnTriggerModal').val(2);
                        if ($('#btnApplyTag:disabled').length == 0) {
                            $("#unsavedText").text("You have unsaved changes. Do you want to save or discard your changes?");
                            $('#unsavedSave').css('display', 'block');
                            $('#unsavedDiscard').css('margin-right', '13px');
                            $('#unsavedCancel').removeClass();
                            $('#unsavedDiscard').removeClass();
                            $('#unsavedCancel').addClass('unSavedChangesButton');
                            $('#unsavedDiscard').addClass('unSavedChangesButton');
                            $("#unsavedChanges").addClass('fade');
                            $("#unsavedChanges").modal('show');
                        }
                        else {
                            $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                            window.parent.postMessage(JSON.stringify('close'), '*');
                        }
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

                $('#unsavedCancel').on('click', function () {
                    $("#unsavedChanges").modal('hide');
                    $("#unsavedChanges").attr("action", "cancel");
                });

                
                $('#unsavedSave').on('click', function () {
                    $("#unsavedChanges").modal('hide');
                    $("#unsavedChanges").attr("action", "save");
                });

                $("#unsavedChanges").on('keydown keyup change', function (e) {
                    // ESCAPE key pressed                
                    if ((e.keyCode || e.which) == 27) {
                        $("#unsavedChanges").attr("action", "escape");
                        $("#unsavedChanges").removeClass('fade');
                        $('#unsavedChanges').modal('hide');
                        cancelUnsavedChanges();
                        event.preventDefault();
                    }
                });

                $('#unsavedChanges').on('hidden.bs.modal', function (e) {
                    var action = $("#unsavedChanges").attr("action");

                    var caller = $('#hdnTriggerModal').val();
                    if (action == "close" || action == "escape") {
                        if (caller == 1) {
                            viewTRMEntriesModel($('#hdnTagId').val(), true);
                        }
                        else if (caller == 2) {
                            $("#tagTRMModel").modal('show');
                            event.preventDefault();
                        }
                        else if (caller == 3) {
                            openGgTagModel(caller, true);
                        }
                    }
                    else if (action == "save") {
                        $("#tagTRMModel").modal('hide');
                    }
                });

                $("#viewTRMModel").on('keydown', function (event) {
                    if ((event.keyCode || event.which) == 27) {
                        // catch escape
                        $('#hdnTriggerModal').val(1);
                        let isError = $('#viewTRMModel').attr('error');
                        if ($('#btnOkTaggedEntires:disabled').length == 0 && isError == '0') {
                            $("#unsavedText").text("You have unsaved changes. Do you want to save or discard your changes?");
                            $('#unsavedSave').css('display', 'block');
                            $('#unsavedDiscard').css('margin-right', '13px');
                            $('#unsavedCancel').removeClass();
                            $('#unsavedDiscard').removeClass();
                            $('#unsavedCancel').addClass('unSavedChangesButton');
                            $('#unsavedDiscard').addClass('unSavedChangesButton');
                            $("#unsavedChanges").addClass('fade');
                            $("#unsavedChanges").modal('show');
                        }
                        else {
                            $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                            window.parent.postMessage(JSON.stringify('close'), '*');
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

                $("#txtNewGgTagName").on('keyup keydown', function (e) {
                    if ((e.keyCode || e.which) == 13) {
                        e.preventDefault();
                        return false;
                    }
                    rePopulateTagsList();

                });

                $("#txtNewGgTagName").on('keydown keyup change', function (e) {
                    var maxLength = 30;
                    var k = e.keyCode || e.which;
                    $('#lblCreateGgTagErrorMessage').text('');
                    $('#lblCreateGgTagWarningMessage').text('');
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
                    var lstTags = JSON.parse($('#hdnTagsByGgId').val());
                    var enteredText = $("#txtNewGgTagName").val();
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

                $('#newToolTagModel').on('keydown', function (event) {
                    if ((event.keyCode || event.which) == 27) {
                        let isError = $('#newToolTagModel').attr('error');
                        if ($('#btnSaveGlobalGroup:disabled').length == 0 && isError == '0') {
                            $("#unsavedText").text("You have unsaved changes. Do you want to save or discard your changes?");
                            $('#unsavedSave').css('display', 'block');
                            $('#unsavedDiscard').css('margin-right', '13px');
                            $('#unsavedCancel').removeClass();
                            $('#unsavedDiscard').removeClass();
                            $('#unsavedCancel').addClass('unSavedChangesButton');
                            $('#unsavedDiscard').addClass('unSavedChangesButton');
                            $("#unsavedChanges").addClass('fade');
                            $("#unsavedChanges").modal('show');
                        }
                        else
                            window.parent.postMessage(JSON.stringify('close'), '*');
                    }
                    else if ((event.keyCode || event.which) == 9) {
                        let lastElement = 'btncancelsaveworkgroup';
                        if ($('#btnSaveGlobalGroup:disabled').length == 0)
                            lastElement = 'btnSaveGlobalGroup';
                        if (document.activeElement.id == lastElement) {
                            /* alert(document.activeElement.id);*/
                            document.getElementById("newToolTagModel").focus();
                            event.preventDefault();
                        }
                    }
                });
                
            });

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

            window.addEventListener('message', function (e) {
                const data = JSON.parse(e.data);
                const channel = data.channel;
                $("#backgroundfadediv").css('display', 'none');

            });

            function changefilter(filtertype) {

                $('#hdnSelectedFilterType').val(filtertype);
                getToolGlobalGroupTags();                
            }

            function getGGMember() {
                $.ajax({
                    url: 'NewTag.aspx/getGGMember',
                    type: 'GET',
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function (data, status, jqXHR) {
                        if (data != null) {
                        
                            if (data.d != null) {
                                $('#hdnlstAllGgMembers').val(JSON.stringify(data.d));
                          
                            }
                        }
                    },
                    error: function (jqXHR, status, error) {
                        //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                        //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                    }
                });
            }

            function getToolGlobalGroups() {
           
                $.ajax({
                    url: 'NewTag.aspx/getToolGlobalGroups?toolId=' + $('#hdnToolId').val(),
                    type: 'GET',
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function (data, status, jqXHR) {
                        if (data != null) {
                            var parentDiv = '';
                      
                            $('#dvMrGroups').empty();
                            $('#dvTags').empty();
                            if (data.d != null) {
                                                     
                                var lstGgs = data.d;
                                var lstTags = JSON.parse($('#hdnlstTags').val());
                                var parentDiv = ''; var grpId = ''; var groupTagCounter = 0; groupCounter = 0; totalgroupcounter = 0;
                                var tagCounter = 0;

                                $.each(lstGgs, function (key, val) {
                                    grpId = 'grp' + val.GlblGrp_ID;
                                    groupTagCounter = 0
                                    $.each(lstTags, function (key, valtag) {
                                        if (val.GlblGrp_ID == valtag.GlblGrp_ID) {
                                            groupTagCounter++;
                                        }
                                    });
                                    groupCounter += groupTagCounter;
                                    $('#dvMrGroups').append('<li style="cursor:pointer;white-space: pre-wrap;" class="list-group-item list-group-item-action" id="' + grpId + '" onclick="loadTagforSelectedGg(' + val.GlblGrp_ID + ');">' + val.GlblGrp_LABEL + ' (' + groupTagCounter + ')' + '</li>');
                                    totalgroupcounter++;
                                });
                                parentDiv = '';
                                if (totalgroupcounter == 0) {
                                    $('#dvTagGroups').hide();
                                }
                           
                                var ggId = $('#hdnGgId').val();
                                var lstfiltered = lstGgs.filter(m => m.GlblGrp_ID == ggId);
                           
                                if (lstfiltered != null) {
                                    if (lstfiltered.length == 0) {
                                        $('#hdnGgId').val(lstGgs[0].GlblGrp_ID);
                                        $('#spanselectedGroupName').text(lstGgs[0].GlblGrp_LABEL);
                                        $('#grp' + lstGgs[0].GlblGrp_ID).addClass('active');
                                    }
                                    else {
                                        $('#grp' + ggId).addClass('active');
                                    }
                                }
                                else {
                                    $('#hdnGgId').val(lstGgs[0].GlblGrp_ID);
                                    $('#spanselectedGroupName').text(lstGgs[0].GlblGrp_LABEL);
                                    $('#grp' + lstGgs[0].GlblGrp_ID).addClass('active');
                                }
                           
                                getGGMember();
                                getToolGlobalGroupTags();

                            }
                        }
                    },
                    error: function (jqXHR, status, error) {
                        //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                        //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                    }
                });
            }

            function createTagEntryModel() {
                $('#btnApplyTag').children('.ripple').remove();
                $('#btnApplyTag').removeClass('ripple');
                $('#btncancelapplytag').children('.ripple').remove();
                $('#btncancelapplytag').removeClass('ripple');
                $("#tagTRMModel").modal('show');
                $('#lbltagEntryErrorMessage').text('');
                var wgId = $('#hdnSelectedGgId').val();
                window.parent.postMessage(JSON.stringify('open'), '*');
                $('#dvViewTRMToolEntries').empty();
                $('#tagentryTitle').text('TAG TRM ENTRIES');
                var groupName = $('#hdnGroupName').val();
                if (groupName.lastIndexOf('(') > 0) {
                    groupName = groupName.substr(groupName, groupName.lastIndexOf('(') - 1);
                }
                $('#dvGroupEntry').show();
                $('#tagEntryGroupIcon').show();
                $('#tagentryGroupName').text('Global Group - ' + groupName);
                $('#tagentryTagName').text('Global Tag - ' + $('#hdnTagName').val());
                $('#txtToolEntry').val('');
                $('#dvTagPopup').hide();
                $('#selectedToolTagtoApply').text('');
                $('#btnApplyTag').removeClass('enabledbutton').addClass('disabledbutton');
                $('#btnApplyTag').attr('disabled', 'disabled');
            }

            function closetagTRMModel() {
                $('#hdnTriggerModal').val(2);
                if ($('#btnApplyTag:disabled').length == 0) {
                    $("#unsavedText").text("You have unsaved changes. Do you want to save or discard your changes?");
                    $('#unsavedSave').css('display', 'block');
                    $('#unsavedDiscard').css('margin-right', '13px');
                    $('#unsavedCancel').removeClass();
                    $('#unsavedDiscard').removeClass();
                    $('#unsavedCancel').addClass('unSavedChangesButton');
                    $('#unsavedDiscard').addClass('unSavedChangesButton');
                    $("#unsavedChanges").addClass('fade');
                    $("#unsavedChanges").modal('show');
                }
                else {
                    $("#tagTRMModel").modal('hide');
                    $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                    window.parent.postMessage(JSON.stringify('close'), '*');
                }
            }

            function canceltagTRMModel() {
                $('#hdnTriggerModal').val(2);
                if ($('#btnApplyTag:disabled').length == 0) {
                    $("#unsavedText").text("You have unsaved changes. Do you want to save or discard your changes?");
                    $('#unsavedSave').css('display', 'block');
                    $('#unsavedDiscard').css('margin-right', '13px');
                    $('#unsavedCancel').removeClass();
                    $('#unsavedDiscard').removeClass();
                    $('#unsavedCancel').addClass('unSavedChangesButton');
                    $('#unsavedDiscard').addClass('unSavedChangesButton');
                    $("#unsavedChanges").addClass('fade');
                    $("#unsavedChanges").modal('show');
                }
                else {
                    $("#tagTRMModel").modal('hide');
                    $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                    window.parent.postMessage(JSON.stringify('close'), '*');
                }
            }

            //function closeEntryDescription() {
            //    if ($('#entryDescription').is(':visible'))
            //        $('#entryDescription').hide();
            //}

            //$("#applyTRMTagEntries").on('keydown', function (event) {
            //    if ((event.keyCode || event.which) == 27) {
            ////        alert("esc key");
            //        if ($('#entryDescription').is(':visible')) {
            //            $('#entryDescription').hide();
            ////            ConfirmapplyTag;
            //        }
            //    }
            //});

            function discardUnsavedChanges() {
                $("#unsavedChanges").modal('hide');
                $("#unsavedChanges").attr("action", "discard");
                $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                window.parent.postMessage(JSON.stringify('close'), '*');
           }

            function closeUnsavedChanges() {
                //$('#dv' + $('#selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                $("#unsavedChanges").attr("action", "close");
                $("#unsavedChanges").modal('hide');
            }

            function saveUnsavedChanges() {
                window.parent.postMessage(JSON.stringify('close'), '*');
                $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                var caller = $('#hdnTriggerModal').val();
                $("#unsavedChanges").modal('hide');
                if (caller == '1') {
                    removeTool();
                }
                else if (caller == '2') {
                    applyTag();
                    $("#tagTRMModel").modal('hide');
                }
                else if (caller == '3') {
                    saveGlobalgroupTags();
                }
            }            

            function getToolEntries() {
                $('#hdnSelectedToolId').val('');
                $('#selectedToolTagtoApply').text('');
                $('#btnApplyTag').removeClass('enabledbutton').addClass('disabledbutton');
                $('#btnApplyTag').attr('disabled', 'disabled');
                $('#hdnSelectedTools').val('');
                if ($('#txtToolEntry').val().trim() != "") {
                    $('#spinnersearch').removeClass('d-none');
                    $('#btnSearch').attr('disabled', 'disabled');
                    $('#txtToolEntry').attr('disabled', 'disabled');
                    $('#entryNameLbl').addClass('entryNameStyle');
                    $.ajax({
                        url: 'NewTag.aspx/getToolEntries?toolText=' + JSON.stringify($('#txtToolEntry').val().trim()) + '&tagId=' + JSON.stringify($('#hdnTagId').val()),
                        type: 'GET',
                        contentType: 'application/json',
                        dataType: 'json',
                        success: function (data, status, jqXHR) {
                            $('#spinnersearch').addClass('d-none');
                            if (data != null) {
                                $('#dvViewTRMToolEntries').empty();
                                var parentDiv = '';
                                parentDiv = '';
                                if (data.d.lstgTools != null) {
                                    parentDiv += '<div class="row" style="font-family: Roboto;padding-top:10px;padding-bottom:10px;font-size:11px;color:black;"><div class="col-12 style="font-family: Roboto;font-size:11px;color:black;"> Found ' + data.d.lstgTools.length + ' entries in the TRM </div></div>';
                                    parentDiv += '<div class="container"><div class="row" id="dvheader" style="border-style:solid;border-width:1px;border-color:lightgrey;"> <div class="col-sm-1"></div> <div class="col-sm-8" style="padding-top:5px"> <label style="font-size:12px;font-weight:bold">Entry Name</label></div><div class="col-sm-3" style="padding-top:5px"><label style="font-size:12px;font-weight:bold">Owner</label></div></div>';

                                    $.each(data.d.lstgTools, function (key, val) {
                                        var aid = 'a' + val.Tool_Id;
                                        var dvid = 'dv' + val.Tool_Id;
                                        var hdnId = 'hdn' + val.Tool_Id;
                                        var hdnToolDesc = 'hdnToolDesc' + val.Tool_Id;
                                        var chk = 'chk' + val.Tool_Id;
                                        parentDiv += ' <div class="row  "';

                                        parentDiv += 'id="' + dvid + '" toolId="' + val.Tool_Id + '" style="border-style:solid;border-width:1px;border-color:lightgrey;';
                                        parentDiv += '"><div toolId="' + val.Tool_Id + '" class="col-sm-1 ';
                                        if ($('#hdnLoggedInUserOrgName').val() != val.toolOwner || val.isToolAssigned == true) {
                                            parentDiv += ' "';
                                        }
                                        else {
                                            parentDiv += ' selectedTool "';
                                        }
                                        parentDiv += 'style="padding-top: 5px">';
                                        parentDiv += ' <input type="hidden" id="' + hdnId + '" name="' + hdnId + '" value="' + val.Tool_Name + '">'
                                        parentDiv += ' <input type="hidden" id="' + hdnToolDesc + '" name="' + hdnToolDesc + '" value="' + val.toolDescription + '">'
                                        parentDiv += ' <input type="checkbox" class="';
                                        if ($('#hdnLoggedInUserOrgName').val() == val.toolOwner && val.isToolAssigned == false) {
                                            parentDiv += ' form-check-input ';
                                        }
                                        else {

                                        }
                                        parentDiv += ' chkTool active" data-toggle="toggle" name="' + val.Tool_Id + '"  id="' + chk + '"';
                                        if ($('#hdnLoggedInUserOrgName').val() != val.toolOwner || val.isToolAssigned == true) {
                                            //parentDiv += ' disabled="disabled" style="width:1em;height:0.9em;backgroud-color:grey;border-color:grey;border-radius:.25em;"';
                                            parentDiv += ' disabled="disabled" style="width: 15px;height: 15px;backgroud-color: grey;border-color: grey;margin-top: 5px;margin-left: 0px;"';
                                        }

                                        if (val.isToolAssigned == true) {
                                            parentDiv += ' checked="checked"';
                                        }
                                        parentDiv += '';
                                        parentDiv += ' onClick="selectedTool(' + val.Tool_Id + ');event.stopPropagation();"';
                                        //parentDiv +=' onclick="javascript:selectedTool(' + val.Tool_Id + ');"/>';
                                        parentDiv += '"/>';
                                        parentDiv += '  </div><div toolId="' + val.Tool_Id + '" class="col-sm-8 ';
                                        if ($('#hdnLoggedInUserOrgName').val() != val.toolOwner || val.isToolAssigned == true) {
                                            parentDiv += ' "';
                                        }
                                        else {
                                            parentDiv += ' selectedTool "';
                                        }
                                        parentDiv += ' ><div style="text-decoration: none;font-family: Roboto;font-size: 12px;padding-top:9px;padding-bottom:9px;';
                                        if ($('#hdnLoggedInUserOrgName').val() != val.toolOwner) {
                                            parentDiv += 'color:lightgrey"';
                                        }
                                        else {
                                            parentDiv += '"';
                                        }
                                        parentDiv += '> ' + val.Tool_Name + '</div ></></div > <div toolId="' + val.Tool_Id + '" class="col-sm-3 ';
                                        if ($('#hdnLoggedInUserOrgName').val() != val.toolOwner || val.isToolAssigned == true) {
                                            parentDiv += ' "';
                                        }
                                        else {
                                            parentDiv += ' selectedTool "';
                                        }
                                        parentDiv += '><label style="font-weight: normal;font-size:12px; padding-top: 9px; ';
                                        if ($('#hdnLoggedInUserOrgName').val() != val.toolOwner) {
                                            parentDiv += 'color:lightgrey"';
                                        }
                                        else {
                                            parentDiv += '"';
                                        }
                                        parentDiv += '>' + val.toolOwner + '</label></div></div > ';
                                    });

                                    parentDiv += '</div>';
                                    $('#dvViewTRMToolEntries').append(parentDiv);                                   
                                }
                                $('.selectedTool').bind('click', function () {
                                    var toolId = $(this).attr('toolId');

                                    var isChecked = $('#chk' + toolId).is(':checked');
                                    if (!isChecked) {
                                        $('#chk' + toolId).prop("checked", true);
                                        $('#dv' + toolId).removeClass('UncheckTool').addClass('CheckTool');
                                    }

                                    else {
                                        $('#chk' + toolId).prop("checked", false);
                                        $('#dv' + toolId).removeClass('CheckTool').addClass('UncheckTool');
                                    }

                                    selectedTool(parseInt(toolId));
                                })
                                $('#dvViewTRMToolEntries').scrollTop(0);
                                $('#btnApplyTag').removeClass('enabledbutton').addClass('disabledbutton');
                                $('#btnApplyTag').attr('disabled', 'disabled');
                                $('#btnSearch').removeAttr('disabled');
                                $('#txtToolEntry').removeAttr('disabled');
                                $('#entryNameLbl').removeClass('entryNameStyle');
                            }
                        },
                        error: function (jqXHR, status, error) {
                            $('#spinnersearch').addClass('d-none');
                            $('#toastError').text('Internal Server Error occured.');
                            $('#burntToast').toast('show'); $('#btnSearch').removeAttr('disabled');
                            $('#txtToolEntry').removeAttr('disabled');
                            $('#entryNameLbl').removeClass('entryNameStyle');
                        }
                    });
                }
            }

            function selectedTool(toolId) {
                var isChecked = $('#chk' + toolId).prop('checked');
                if (!isChecked) {
                    //$('#chk' + toolId).prop("checked", true);
                    $('#dv' + toolId).removeClass('CheckTool').addClass('UncheckTool');
                }

                else {
                    //$('#chk' + toolId).prop("checked", false);
                    $('#dv' + toolId).removeClass('UncheckTool').addClass('CheckTool');
                }
                $('#hdnSelectedToolId').val(toolId);
                var toolName = $('#hdn' + toolId).val();

                var toolDescription = $('#hdnToolDesc' + toolId).val();
                var gselectedTools;
                if ($('#hdnSelectedTools').val() != '') {
                    gselectedTools = JSON.parse($('#hdnSelectedTools').val())
                }
                else
                    gselectedTools = [];
                if (isChecked == true) {
                    gselectedTools.push({ "ToolId": toolId, "ToolName": toolName, "ToolDescription": toolDescription });
                }
                else {

                    //remove the item from the list
                    gselectedTools = $.grep(gselectedTools, function (a) {
                        return a.ToolId !== toolId;
                    });

                }

                $('#hdnSelectedTools').val(JSON.stringify(gselectedTools));

                $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(205, 207, 215)')
                $('#lbltagEntryErrorMessage').text('');
                $('#lblconfirmtagEntryErrorMessage').text('');

                if (gselectedTools.length == 0) {
                    $('#selectedToolTagtoApply').text('');
                    $('#btnApplyTag').removeClass('enabledbutton').addClass('disabledbutton');
                    $('#btnApplyTag').attr('disabled', 'disabled');
                }
                else if (gselectedTools.length == 1) {
                    toolName = gselectedTools[0].ToolName;
                    $('#selectedToolTagtoApply').text('Add tag "' + $('#hdnTagName').val() + '" to TRM entry "' + toolName + '"');
                    $('#btnApplyTag').removeClass('disabledbutton').addClass('enabledbutton');
                    $('#btnApplyTag').removeAttr('disabled');
                }
                else if (gselectedTools.length > 1) {
                    $('#selectedToolTagtoApply').text('Add tag "' + $('#hdnTagName').val() + '" to ' + gselectedTools.length + ' TRM entries.');
                    $('#btnApplyTag').removeClass('disabledbutton').addClass('enabledbutton');
                    $('#btnApplyTag').removeAttr('disabled');
                }
            }

            function applyTag() {
                $('#tagTRMModel').modal('hide');
                $('#dvTRMTaggedEntries').empty();
                var gselectedTools = [];
                if ($('#hdnSelectedTools').val() != '') {
                    gselectedTools = JSON.parse($('#hdnSelectedTools').val())
                }
                else
                    gselectedTools = [];

                var parentDiv = '';
                parentDiv += '<div class="row" style="font-family: Roboto;padding-top:10px;padding-bottom:10px;font-size:11px;font-weight:bold;">';
                parentDiv += '<div class="col-12" style="padding-top:20px">Entries Selected (' + gselectedTools.length + ')</div >';
                parentDiv += '</div > ';
		        $.each(gselectedTools, function (key, val) {
                    var ttip = val.ToolDescription;
                    ttip = ttip.replace(/<br><br>/g, '\r');
                    ttip = ttip.replace(/<BR><BR>/g, '\r');
                    ttip = ttip.replace(/<b>/g, '');
                    ttip = ttip.replace(/<\/b>/g, '');
                    ttip = ttip.replace(/<br> <br>/g, '\r');
                    ttip = ttip.replace(/<br>/g, '\r');
                    ttip = ttip.replace(/<\/br>/g, '');
                    ttip = "ENTRY DESCRIPTION:\r" + ttip;
                   //parentDiv += '<div style="text-decoration: none; font-family: Roboto;font-size:11px;padding-left:30px;" class="list-group-item"><div>' + val.ToolName +'</div></div>'
                    parentDiv += '<div style="font-family: Roboto;font-size:11px;padding-left:10px;" class="list-group-item" >';
                    //parentDiv += '<a href="ToolPage.aspx?tid=' + val.ToolId + '" onclick = "javascript:openToolPage(' + val.ToolId + ')" class="daLink" style="color:#4169e1;font-family: Roboto;font-size:12px;">' + val.ToolName + '</a>';
                    parentDiv += '<a href="ToolPage.aspx?tid=' + val.ToolId + '" target=_blank class="daLink" style="color:#4169e1;font-family: Roboto;font-size:12px;">' + val.ToolName + '</a>';
                    parentDiv += '<i id = "' + val.ToolId + '" description = "' + val.ToolDescription + '" class="fa fa-info-circle entryDesc" title="' + ttip + '" style="padding-left:7px;cursor:pointer;font-size:12px;"></i></div>';
                });
                $('#dvTRMTaggedEntries').append(parentDiv);
                //$('.fa-info-circle').click(function () {
                    //if ($('#entryDescription').is(':visible')) {
                    //    $('#entryDescription').hide();
                    //}
                    //else {
                    //    var btn1 = $('#dvAffectedEntries');
                    //    $('#description').empty();
                    //    let desc = $(this).attr('description');
                    //    desc = desc.replace(/<br>/g, '<br class="entryDescPopup">');
                    //    desc = desc.replace(/<b>/g, '<b class="entryDescPopup">');
                    //    $('#description').append(desc);
                    //    $('#entryDescription').css('position', 'absolute');
                    //    var top = $('#entryDescription').offset().top + 270;
                    //    var left = $('#entryDescription').offset().left + 75;
                    //    if (left > $('#content-main').width()) {
                    //        var diff = (left - $('#content-main').width()) - 10;
                    //        left = left - diff;
                    //    }
                    //    $('#description').css("max-height", 150 + 'px');
                    //    $('#entryDescription').css("height", 195 + 'px');
                    //    $('#entryDescription').css("width", 350 + 'px');
                    //    $('#entryDescription').css('top', (top - 100));
                    //    $('#entryDescription').css('left', left);
                    //
                    //    $('#entryDescription').show();
                    //    $('#description').scrollTop(0);
                    //
                    //}
                //});
                if (gselectedTools.length > 1) {
                    $("#applyTRMTagEntries").modal('show');
                    applyTRMTagEntries();
                }
                else if (gselectedTools.length == 1) {
                    ConfirmapplyTag();
                }
            }

            function openToolPage(tid) {
                $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                $("#tagTRMModel").modal('hide');
                if ($('#applyTRMTagEntries').is(':visible'))
                    $("#applyTRMTagEntries").modal('hide');
                // var pageUrl = '\ToolPage.aspx?tid=' + tid;
                // window.open(pageUrl, "_top");
            }

            function cancelTRMTagEntries() {
                $('#btnApplyTag').children('.ripple').remove();
                $('#btnApplyTag').removeClass('ripple');
                $('#tagTRMModel').modal('show');
                $("#applyTRMTagEntries").modal('hide');
            }

            function cancelUnsavedChanges() {               
                var caller = $('#hdnTriggerModal').val();
                if (caller == 1) {
                    viewTRMEntriesModel($('#hdnTagId').val(), true);
                    $("#unsavedChanges").modal('hide');
                }
                else if (caller == 2) {
                    $('#tagTRMModel').modal('show');
                    $("#applyTRMTagEntries").modal('hide');
                    $("#unsavedChanges").modal('hide');
                }
                else if (caller == 3) {
                    openGgTagModel(caller, true);
                }
            }

            function closeapplyTRMEntries() {
                $('#applyTRMTagEntries').modal('hide');
                $("#tagTRMModel").modal('show');
                $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                //refreshWorkGroupMembers($('#hdnSelectedWgId').val(), 0);
            }

            function applyTRMTagEntries() {
                //if ($('#entryDescription').is(':visible')) {
                //    $('#entryDescription').hide();
                //}
                $('#confirmtagEntryTitle').text("TAG TRM ENTRIES");
                $('#confirmtagEntryText').html("The tag <b>" + $('#hdnTagName').val() + "</b> will be applied to the following entries.");
            }

            function ConfirmapplyTag() {
                $('#hdnTriggerModal').val(2);
                var tagId = $('#hdnTagId').val();
                var wgId = $('#hdnGgId').val();
                var selectedTools = '';// JSON.stringify($('#hdnSelectedTools').val());
                var gselectedTools = [];
                if ($('#hdnSelectedTools').val() != '') {
                    gselectedTools = JSON.parse($('#hdnSelectedTools').val())
                }
                else
                    gselectedTools = [];
                $.each(gselectedTools, function (key, val) {
                    selectedTools += val.ToolId + ','
                });
                $.ajax({
                    url: 'NewTag.aspx/applyTag?tagId=' + JSON.stringify(tagId) + '&wgId=' + JSON.stringify(wgId) + '&selectedTools=' + JSON.stringify(selectedTools),
                    type: 'GET',
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function (data, status, jqXHR) {
                        if (data.d.IsValid) {
                            $('#toastSuccess').text('Tag(s) applied successfully.');
                            $('#goodToast').toast('show').show().delay(3000).fadeOut();
                            $("#tagTRMModel").modal('hide');
                            $("#applyTRMTagEntries").modal('hide');
                            $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                            window.parent.postMessage(JSON.stringify('close'), '*');
                            getToolGlobalGroupTags();
                        }
                        else {
                            $('#toastError').text(data.d.Message);
                            $("#burntToast").show().delay(5000).fadeOut();
                            if (data.d.Message == "You are not authorized to perform this action") {
                                $('#toastError').text('You are not authorized to perform this action');
                                $('#burntToast').toast('show').show().delay(3000).fadeOut();
                                closetagTRMModel();
                                getToolGlobalGroups();
                            }
                        }
                    },
                    error: function (jqXHR, status, error) {
                        if (status == 'error') {
                            $('#toastError').text('Internal Server Error occured');
                            $("#burntToast").show().delay(5000).fadeOut();
                        }
                    }
                });
            }

            function loadTagforSelectedGg(ggId) {
                $('.list-group-item').each(function () {
                     $(this).removeClass('active');
                });
                $('#grp' + ggId).addClass('active');
                $('#hdnGgId').val(ggId);
                //('#dvTags').empty();
                $('#hdnGroupName').val($('#grp' + ggId).text());

                var selectedGroupName = $('#grp' + ggId).text().trimEnd();
                $('#spanselectedGroupName').text(selectedGroupName.substr(selectedGroupName, selectedGroupName.lastIndexOf('(') - 1));
                getToolGlobalGroupTags();
                tagpopupclick();
            }

            function getToolGlobalGroupTags() {

                $.ajax({
                    url: 'NewTag.aspx/getToolGlobalGroupTags?toolId=' + $('#hdnToolId').val() + '&groupId=' + $('#hdnGgId').val(),
                    type: 'GET',
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function (data, status, jqXHR) {
                        if (data != null) {
                            var parentDiv = '';
                            if (data.d != null) {

                                $('#dvTags').empty();

                                var lstAllGgMembers = JSON.parse($('#hdnlstAllGgMembers').val());
                                var member = lstAllGgMembers.find(m => m.GG_ID == $('#hdnGgId').val());
                                var tagCounter = 0;
                               
                                
                                

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
                                    if (member != undefined) {
                                        console.log(member.Role);
                                        if ((member.Role == "1" || member.Role == "2") && $('#hdnLoggedInUserOrgName').val() == val.toolOwner) {
                                            $('#btnaddNewGGTag').css("display", "block");
                                        }
                                        else {
                                            $('#btnaddNewGGTag').css("display", "none");
                                        }
                                    }
                                    else {
                                        $('#btnaddNewGGTag').css("display", "none");
                                    }
                                    btnId = "btn" + val.TAG_ID;
                                    var dvid = "dv" + val.TAG_ID;
                                    var u = lstAllGgMembers.find(m => m.GG_ID == val.GG_ID && m.UserId == $('#hdnUserId').val());
                                    if (val.IsChecked === 1) {
                                        parentDiv = '';
                                        parentDiv += '<div style="display:inline-block;padding:4px 4px 4px 4px;"><div id=' + dvid + ' style="display:flex;height:28px;background-color:rgb(220, 230, 250);border-radius:2px;"><div style="font-size:12px;display:inline-block;border-radius:6px;text-align:center;">';
                                        parentDiv += '<div id = ' + btnId + ' tagid = "' + val.TAG_ID + '" tagname = "' + val.TAG_LABEL + '" class="tagellipsisbutton" style = "height:100%;width:7px;float:left;cursor:pointer;padding-left:6px;padding-right:10px;padding-top:5px;"><i class="fas fa-ellipsis-v" style="color: #757575;"></i></div>';
                                        parentDiv += '<div style="height:100%;padding-right:10px;float:left;padding-top:7px;font-size:11px;font-family: Roboto, sans-serif;border-radius: 3px;white-space: pre-wrap;cursor:pointer" onclick = "javascript:viewTRMEntriesModel(' + val.TAG_ID + ');return false;">&nbsp;&nbsp;<i class="fas fa-globe" style="padding-top:3px;float:left;padding-right:2px;"></i>' + val.TAG_LABEL + ' (' + val.EntryCount + ')' + '</div></div></div></div>';
                                        $('#dvTags').append(parentDiv);
                                        tagCounter++;
                                    }
                                });

                                var ligroupName = $('#grp' + $('#hdnGgId').val()).text();
                                var groupName = ligroupName.substr(0, ligroupName.lastIndexOf('('));
                                groupName = groupName + '(' + tagCounter + ')';
                                $('#grp' + $('#hdnGgId').val()).text(groupName)

                                if (tagCounter == 0) {
                                    parentDiv = '';
                                    parentDiv += '<div style="display: inline-block;padding-right:10px;padding-left: 5px;font-size:11px;font-family: Roboto, sans-serif;"><p>No global tags for the selected group have been applied to this entry.</p></div>';
                                    $('#dvTags').append(parentDiv);
                                }

                                tagpopupclick();
                                //$('#hdnSelectedGgId').val(0);
                            }
                        }
                    },
                    error: function (jqXHR, status, error) {
                        //trmUtil.showSpinner(false, $('#' + config.spinnerElId)[0]);
                        //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                    }
                });
            }

            function tagpopupclick() {
                $('.tagellipsisbutton').click(function () {

                    $('#tagentryGroupName').show();
                    $('#dvTaggedGroupName').show();
                    //$('#hdnSelectedGgId').val(0);
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
                        var left = btn1.offset().left - 2;
                        var maxwidth = left + 225;
                        if (maxwidth > $('#dvNewTag').width()) {
                            var diff = (maxwidth - $('#dvNewTag').width());
                            left = left - diff;
                        }
                        $('.tagpop').css('top', (top - 6));
                        $('.tagpop').css('left', left);
                        $('#dvTagPopup').show();
                    }
                });
            }

            function viewTRMEntriesModel(aTagID, isReopen) {
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
                //if (isPersonal == undefined) {
                //    if ($('#hdnSelectedWgId').val() != "-1")
                //        isPersonal = false;
                //    else
                //        isPersonal = true;
                //}
                
                var RoleId = 0;
                /*if (!isPersonal) {*/
                    //RoleId = $('#btn' + aTagID).attr('RoleId');
                    //if (typeof RoleId == 'undefined') {
                var lstAllGgMembers = JSON.parse($('#hdnlstAllGgMembers').val());
                var member = lstAllGgMembers.find(m => m.GG_ID == $('#hdnGgId').val());
                RoleId = member.Role;
                    //}
                //}
                if (aTagID != null) {
                    $('#hdnTagId').val(aTagID);
                    $('#hdnTagName').val($('#btn' + aTagID).attr('tagname'));
                }
                //if (isPersonal != undefined) {
                //    if (isPersonal) {
                //        // personal tag
                //        $('#dvTaggedGroupName').hide();
                //        $('#hdnSelectedWgId').val(-1);
                //        $("#hdnTriggerModal").val(2);
                //    }
                //    else {
                //        $('#dvTaggedGroupName').show();
                //        $('#hdnSelectedWgId').val(0);
                //        $("#hdnTriggerModal").val(3);
                //    }
                //}
                //else {
                    // ellipses selected
                if (RoleId < 3) {
                    $('#dvTaggedGroupName').show();
                    $('#hdnSelectedGgId').val(0);
                    $("#hdnTriggerModal").val(1);
                }
                    //} else {
                    //    $('#dvTaggedGroupName').hide();
                    //    $('#hdnSelectedWgId').val(-1)
                    //    $("#hdnTriggerModal").val(4);
                    //}
                //}
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
                    if (RoleId < 3) {
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
                                //if ($('#hdnSelectedWgId').val() != "-1") {
                                    $('#spanTaggedGroupName').text('Global Group - ' + groupName);
                                    $('#dvTaggedGroupName').show();
                                    $('#spanTaggedGroupName').show();
                                    $('#hdnTriggerModal').val(1);
                                //} else {
                                //    $('#spanTaggedGroupName').text('');
                                //    $('#dvTaggedGroupName').hide();
                                //    $('#spanTaggedGroupName').hide();
                                //    $('#hdnTriggerModal').val(2);
                                //}
                                //$('#spanTaggedGroupName').text('Group - ' + groupName);
                                //if ($('#hdnSelectedWgId').val() != "-1") {
                                    $('#spanTaggedTagName').text(' Global Tag - ' + $('#hdnTagName').val());
                                //}
                                //else {
                                //    $('#spanTaggedTagName').text(' Personal Tag - ' + $('#hdnTagName').val());
                                //}
                                parentDiv += '<div class="row" style="font-family: Roboto;padding-top:10px;padding-bottom:10px;font-size:11px;font-weight:bold;">';
                                parentDiv += '<div class="col-sm-10">Entries (' + data.d.lstTools.length + ')</div >';
                                parentDiv += '<div class="col-sm-2">Owner</div >';
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
                                parentDiv += '<div class="container">';
                                $.each(data.d.lstTools, function (key, val) {
                                    toolArray[numElements] = val.Tool_Id;
                                    numElements++;
                                    parentDiv += '<div class="row" style="border:solid;border-width:1px;border-color:lightgrey;padding-top:10px;padding-right:3px"><div class="col-sm-1" style="text-decoration: none;font-family: Roboto;font-size:11px;padding-left:15px;padding-bottom:5px;white-space: pre-wrap;" class="list-group-item" id="' + val.TAG_ID + '" >';
                                    if (RoleId < 3) {
                                        parentDiv += '<input type="checkbox" class="';
                                        if ($('#hdnLoggedInUserOrgName').val() == val.toolOwner) {
                                            parentDiv += ' form-check-input ';
                                        }
                                        parentDiv += 'chkTool active" data-toggle="toggle" id="' + val.Tool_Id + '" ';
                                        if ($('#hdnLoggedInUserOrgName').val() != val.toolOwner) {
                                            parentDiv += ' checked="checked" disabled="disabled" style="width: 15px;height: 15px;backgroud-color: grey;border-color: grey;margin-top: 5px;margin-left: 0px;"';
                                        }
                                        if (val.IsChecked == null || val.IsChecked) {
                                            parentDiv += ' checked="checked" ';
                                        }
                                        parentDiv += '  onclick = "trmEntryChange(this);"/>';
                                        parentDiv += '</div><div class="col-sm-8" style="text-decoration: none;font-family: Roboto;font-size:11px;padding-left:15px;padding-bottom:4px;padding-top:4px;" class="list-group-item"><label>'
                                    }
                                    parentDiv += '<a href="ToolPage.aspx?tid=' + val.Tool_Id + '" target="_top" onclick = "javascript:openToolPage(' + val.Tool_Id + ')" class="daLink" style="text-decoration:none;color:#4169e1;font-family: Roboto;font-size:12px;padding-top:20px;">' + val.Tool_Name + '</a>';
                                    if (RoleId < 3) {
                                        parentDiv += '</label>'
                                    }
                                    parentDiv += '</div>';
                                    parentDiv += '<div style="text-decoration: none; font-family: Roboto;font-size:11px;padding-left:15px;padding-top:5px;text-align:right;" class="col-sm-3">' + val.toolOwner + '';
                                    parentDiv += '</div></div>';
                                });
                                parentDiv += '</div></div>';

                                $('#dvViewTRMEntries').append(parentDiv);
                            }
                        }
                    },
                    error: function (jqXHR, status, error) {
                        $('#dvViewTRMEntries').text(error + " ---- " + status);
                    }
                });
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
                            if (check == null)
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

            function closeviewTRMModel() {
                $("#viewTRMModel").modal('hide');
                $('#hdnTriggerModal').val(1);
                if ($('#btnOkTaggedEntires:disabled').length == 0) {
                    $("#unsavedText").text("You have unsaved changes. Do you want to save or discard your changes?");
                    $('#unsavedSave').css('display', 'block');
                    $('#unsavedDiscard').css('margin-right', '13px');
                    $('#unsavedCancel').removeClass();
                    $('#unsavedDiscard').removeClass();
                    $('#unsavedCancel').addClass('unSavedChangesButton');
                    $('#unsavedDiscard').addClass('unSavedChangesButton');
                    $("#unsavedChanges").addClass('fade');
                    $("#unsavedChanges").modal('show');
                }
                else {
                    $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                    window.parent.postMessage(JSON.stringify('close'), '*');
                }
            }

            function cancelviewTRMModel() {
                $("#viewTRMModel").modal('hide');
                $('#hdnTriggerModal').val(1);
                let isError = $('#viewTRMModel').attr('error');
                if ($('#btnOkTaggedEntires:disabled').length == 0 && isError == '0') {
                    $("#unsavedText").text("You have unsaved changes. Do you want to save or discard your changes?");
                    $('#unsavedSave').css('display', 'block');
                    $('#unsavedDiscard').css('margin-right', '13px');
                    $('#unsavedCancel').removeClass();
                    $('#unsavedDiscard').removeClass();
                    $('#unsavedCancel').addClass('unSavedChangesButton');
                    $('#unsavedDiscard').addClass('unSavedChangesButton');
                    $("#unsavedChanges").addClass('fade');
                    $("#unsavedChanges").modal('show');
                }
                else {
                    $('#dv' + $('#hdnTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                    window.parent.postMessage(JSON.stringify('close'), '*');
                }
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
                    //if ($('#hdnSelectedWgId').val() == "-1")
                    //    grpId = $('#hdnSelectedGgId').val()
                    //else
                        grpId = $('#hdnGgId').val();
                    var lstTags = JSON.parse($('#hdnSelectedToolTags').val());

                    $.each(lstTags, function (index, value) {

                        if (value.IsChecked == 0) {

                            $.ajax({
                                url: 'NewTag.aspx/removeToolFromTag?tgId=' + $('#hdnTagId').val() + '&toolId=' + value.Tool_Id + '&tagName=' + JSON.stringify($('#hdnTagName').val()) + '&wgId=' + grpId,
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
                                                getToolGlobalGroups();
                                                $("#viewTRMModel").modal('hide');
                                            }
                                        } else {
                                            //$('#lblRemoveTagSuccessMessage').text('Tool removed from entry successfully.');
                                            //$('#lblRemoveTagSuccessMessage').text(data.d.Message);
                                            //$("#lblRemoveTagSuccessMessage").show().delay(5000).fadeOut();
                                            //getAllUserWorkGroups();
                                            //getPersonalTags();
                                            $('#toastSuccess').text('Tag(s) removed from entry successfully.');
                                            $('#goodToast').toast('show').show().delay(3000).fadeOut();
                                            getToolGlobalGroupTags();
                                            $("#viewTRMModel").modal('hide');
                                            window.parent.postMessage(JSON.stringify('close'), '*');
                                        }
                                    }
                                    //canceltagTRMModel();
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
                    });
                }
            }

            let numElements = 0;
            const toolArray = [];

            function openGgTagModel(ggId, isReopen) {
                $('#newToolTagModel').modal('show');
                window.parent.postMessage(JSON.stringify('open'), '*');
                $("#dvGgTags").animate({ scrollTop: 0 }, "slow");
                $('#hdnTriggerModal').val(3);
                if (ggId == 0) {
                    ggId = $('#hdnGgId').val();
                    $('#hdnSelectedGgId').val(ggId);
                    $('#groupNameDiv').show();
                }
                else {
                    $('#hdnSelectedGgId').val(-1);
                    $('#groupNameDiv').hide();
                }

                // $('#hdnGgId').val(ggId);
                //$('#lblGroupName').text($('#hdnGroupName').val());

                var selectedGroupName = $('#hdnGroupName').val().trimEnd();

                if (selectedGroupName.lastIndexOf('(') > 0) {
                    $('#lblGroupName').text(selectedGroupName.substr(selectedGroupName, selectedGroupName.lastIndexOf('(') - 1));
                }
                else {
                    $('#lblGroupName').text(selectedGroupName);
                }

                $('#lblToolName').text($('#hdnToolName').val());
                $('#txtNewGgTagName').val('');
                $('#lblInApporipateGgTagWarningMessage').html('');
                $('#lblInApporipateGgTagWarningMessage1').html('');
                $('#lblCreateGgTagErrorMessage').text('');
                $('#lblCreateGgTagSuccessMessage').text('');
                $('#lblCreateGgTagWarningMessage').text('');
                $('#InApprGgTagWarning').hide();
                // $('#btnCreateGgTag').attr('disabled', 'disabled');
                // $('#btnCreateGgTag').css('background-color', 'grey');
                $('#charcounter').text('0/30');
                $('#charcounter').css('color', 'black');
                $('#spanaddEntryErrorMessage').text('');
                $('#btnAddTag').attr('disabled', 'disabled');
                $('#btnAddTag').removeClass('addTagtoListButton').addClass('disabledaddTagtoListButton');
                $('#newToolTagModel').attr('error', 0);
                if (isReopen != undefined && isReopen) {
                    $('#btnSaveGlobalGroup').removeAttr('disabled');
                    $('#btnSaveGlobalGroup').removeClass('disabledbutton').addClass('enabledbutton');
                }
                else {
                    $('#btnSaveGlobalGroup').attr('disabled', 'disabled');
                    $('#btnSaveGlobalGroup').removeClass('enabledbutton').addClass('disabledbutton');
                }
                $('#lblCreateGgTagWarningMessage').text('');
                $('#hdnIsInAppropriateFlagged').val('False');

                //get Selected GG Tags
                $.ajax({
                    url: 'NewTag.aspx/getTagsByGgIdAddRemove?ggId=' + ggId + '&toolId=' + $('#hdnToolId').val(),
                    type: 'GET',
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function (data, status, jqXHR) {
                        // $('#spinnersearch').addClass('d-none');
                        if (data != null) {
                            var tagData = null;
                            if (isReopen != undefined) {
                                if (isReopen) {
                                    data.d = JSON.parse($('#hdnTagsByGgId').val());
                                }
                                else if (!isReopen) {
                                    $('#hdnTagsByGgId').val(JSON.stringify(data.d));
                                }
                            }
                            else {
                                $('#hdnOriginalSelections').val();
                                $('#hdnTagsByGgId').val(JSON.stringify(data.d));
                                $('#hdnOriginalSelections').val(JSON.stringify(data.d));
                            }

                            $('#dvGgTags').empty();
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
                                    parentDiv += 'class="form-check-input chkTool" id="' + cid + '"/><label style="padding-top:4px;padding-left:25px;white-space: pre-wrap;" for="' + cid + '">&nbsp;&nbsp;' + val.TAG_LABEL + '</label></div>';

                                });

                                $('#dvGgTags').append(parentDiv);
                                //$('#newToolTagModel').modal('show');

                                //window.parent.postMessage(JSON.stringify('open'), '*');
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
                if ($('#btnSaveGlobalGroup:disabled').length == 0 && isError == '0') {
                    $("#unsavedText").text("You have unsaved changes. Do you want to save or discard your changes?");
                    $('#unsavedSave').css('display', 'block');
                    $('#unsavedDiscard').css('margin-right', '13px');
                    $('#unsavedCancel').removeClass();
                    $('#unsavedDiscard').removeClass();
                    $('#unsavedCancel').addClass('unSavedChangesButton');
                    $('#unsavedDiscard').addClass('unSavedChangesButton');
                    $("#unsavedChanges").addClass('fade');
                    $("#unsavedChanges").modal('show');
                }
                else
                    window.parent.postMessage(JSON.stringify('close'), '*');
            }

            function cancelnewToolTagModel() {
                $('#newToolTagModel').modal('hide');
                let isError = $('#newToolTagModel').attr('error');
                if ($('#btnSaveGlobalGroup:disabled').length == 0 && isError == '0') {
                    $("#unsavedText").text("You have unsaved changes. Do you want to save or discard your changes?");
                    $('#unsavedSave').css('display', 'block');
                    $('#unsavedDiscard').css('margin-right', '13px');
                    $('#unsavedCancel').removeClass();
                    $('#unsavedDiscard').removeClass();
                    $('#unsavedCancel').addClass('unSavedChangesButton');
                    $('#unsavedDiscard').addClass('unSavedChangesButton');
                    $("#unsavedChanges").addClass('fade');
                    $("#unsavedChanges").modal('show');
                }
                else
                    window.parent.postMessage(JSON.stringify('close'), '*');
            }

            function rePopulateTagsList() {
                $('#dvGgTags').empty();
                var lstTags = JSON.parse($('#hdnTagsByGgId').val());
                var enteredText = $("#txtNewGgTagName").val();
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
                    parentDiv += 'class="form-check-input chkTool" id="' + cid + '"/><label style="padding-top:4px;padding-left:25px;white-space: pre-wrap;" for="' + cid + '">&nbsp;&nbsp;' + val.TAG_LABEL + '</label></div>';
                });

                $('#dvGgTags').append(parentDiv);
            }

            function tagChange(element) {

                //  $('#btnSaveGlobalGroup').removeAttr('disabled');
                //  $('#btnSaveGlobalGroup').removeClass('disabledbutton').addClass('enabledbutton');
                var tagId = $('#' + element.id).attr('tagid')
                var lstTags = JSON.parse($('#hdnTagsByGgId').val());

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
                    $('#btnSaveGlobalGroup').removeAttr('disabled');
                    $('#btnSaveGlobalGroup').removeClass('disabledbutton').addClass('enabledbutton');
                } else {
                    $('#btnSaveGlobalGroup').attr('disabled', 'disabled');
                    $('#btnSaveGlobalGroup').removeClass('enabledbutton').addClass('disabledbutton');
                }
                $('#hdnTagsByGgId').val(JSON.stringify(lstTags))
            }
            function tagSort(a, b) {
                var x = a.TAG_LABEL;
                var y = b.TAG_LABEL;
                return ((x < y) ? -1 : ((x > y) ? 1 : 0));
            }
            function addTag() {
                $('#txtTagName').val('');
                var lstTags = JSON.parse($('#hdnTagsByGgId').val());
                var enteredtext = $("#txtNewGgTagName").val().trim();
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
                    var isinapprworddetected = false;
                    var maxLength = 30;
                    var charLength = $('#txtNewGgTagName').val().length;
                    var trimLength = $('#txtNewGgTagName').val().trim().length;
                   
                    var noOfInApproWordDetected = 0;
                    var inapprotext = '';
                    for (var i = 0; i <= splittext.length; i++) {
                        //InApprWords.find()
                        var tempstring = splittext[i];
                        if (tempstring != '' && tempstring != undefined) {

                            var s = test.find((s) => s.TEXT.toLowerCase() === tempstring.toString().toLocaleLowerCase());
                            if (s != undefined) {
                                if (inapprotext != '') {
                                    inapprotext+=', '
                                }
                                inapprotext += '"' + tempstring + '"';
                                isinapprworddetected = true;
                                noOfInApproWordDetected += 1;
                            }
                        }
                    }
                   
                    if (isinapprworddetected) {
                        logInapproriate();
                        $('#InApprGgTagWarning').show();
                        var txtMsg = '';
                        if (noOfInApproWordDetected == 1) {
                            txtMsg = '<p>The word ' + inapprotext + ' have been flagged as inappropriate. TRM admins monitor all site activity.</p><p>You may change the name or continue adding the tag/group name if you received this message in error.</p>';
                        }
                        else {
                            txtMsg = '<p>The words ' + inapproxText + ' have been flagged as inappropriate. TRM admins monitor all site activity. You may change the name or continue adding the tag/group name if you received this message in error.</p>';
                        }
                        $('#lblInApporipateGgTagWarningMessage').html(txtMsg);
                        //var txtMsg1 = 'You may change the name or continue adding the group name if you received this message in error.';
                        //$('#lblInApporipateGgTagWarningMessage1').html(txtMsg1);
                        $('#lblCreateGgTagErrorMessage').text('Inappropriate word detected');
                        $('#charGgTagcounter').text(charLength + '/' + maxLength);
                        $('#txtTagName').val(enteredtext);
                        // $('#lblCreateGgTagErrorMessage').css('font-size', '15px');
                        $('#newGGTagModel').modal('show');
                        $('#btnCreateGgTag').removeAttr('disabled');
                        $('#btnCreateGgTag').removeClass('disabledbutton').addClass('enabledbutton');
                        window.parent.postMessage(JSON.stringify('open'), '*');
                    }
                    else {
                        if (lstTags.filter(x => x.TAG_LABEL.trim().toLowerCase() === $('#txtNewGgTagName').val().trim().toLowerCase()).length > 0) {
                            //if ($('#hdnSelectedGgId').val() == -1)
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
                                TAG_LABEL: $('#txtNewGgTagName').val(),
                                GlblGrp_ID: $('#hdnGgId').val(),
                                IS_NEW: true
                            }
                            lstTags.push(newrow);
                            lstTags = lstTags.sort(tagSort);

                           
                            $('#hdnTagsByGgId').val(JSON.stringify(lstTags));

                            $("#txtNewGgTagName").val('');
                            $('#dvGgTags').empty();

                            var lstTags = JSON.parse($('#hdnTagsByGgId').val());
                            var enteredText = $("#txtNewGgTagName").val();

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
                                parentDiv += 'class="form-check-input chkTool" id="' + cid + '"/><label style="padding-top:4px;padding-left:25px;white-space: pre-wrap;" for="' + cid + '">&nbsp;&nbsp;' + val.TAG_LABEL + '</label></div>';
                            });
                            $('#dvGgTags').append(parentDiv);
                            //Add Here
                            $('#charcounter').text('0/30');
                            $('#btnAddTag').attr('disabled', 'disabled');
                            $('#btnAddTag').removeClass('addTagtoListButton').addClass('disabledaddTagtoListButton');
                            $('#btnSaveGlobalGroup').removeAttr('disabled');
                            $('#btnSaveGlobalGroup').removeClass('disabledbutton').addClass('enabledbutton');
                            $('#newToolTagModel').focus();
                        }
                    }
                }
                else {
                    $('#spanaddEntryErrorMessage').text('Name must include visible characters');
                }
            }

            function saveGlobalgroupTags() {
                $('#btnSaveGlobalGroup').attr('disabled', 'disabled');
                $('#btnSaveGlobalGroup').removeClass('enabledbutton').addClass('disabledbutton');
                var selectedTags = '';
                let isError = false;
                var selectedTagitems = [];
                var lstGgs = JSON.parse($('#hdnTagsByGgId').val());
                var tempItem;
                $.each(lstGgs, function (key, val) {
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
                //confirm(tempItem + "==" + $('#hdnToolId').val()+"=="+$('#hdnSelectedGgId').val())
                $.ajax({
                    url: 'NewTag.aspx/saveToolTags?selectedTags=' + JSON.stringify(selectedTagitems) + '&toolId=' + $('#hdnToolId').val() + "&ggId=" + $('#hdnSelectedGgId').val(),
                    type: 'GET',
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function (data, status, jqXHR) {
                        // $('#spinnersearch').addClass('d-none');
                        //getToolWorkGroupTags();
                        //$('#newToolTagModel').modal('hide');
                        if (data != null) {
                            if (!data.d.IsValid) {
                                window.parent.postMessage(JSON.stringify('close'), '*');
                                isError = 1;
                                $('#newToolTagModel').attr('error', isError);
                                if (data.d.Message == "You are not authorized to perform this action") {
                                    $('#toastError').text('You are not authorized to perform this action');
                                    $('#burntToast').toast('show').show().delay(3000).fadeOut();

                                    getToolGlobalGroups();
                                    $('#newToolTagModel').modal('hide');
                                }
                            }
                            else {
                                $('#toastSuccess').text('Tag(s) applied successfully.');
                                $('#goodToast').toast('show').show().delay(3000).fadeOut();
                                $('#newToolTagModel').modal('hide');
                                window.parent.postMessage(JSON.stringify('close'), '*');
                                getToolGlobalGroupTags();
                            }
                        }
                        //getToolGlobalGroupTags();
                        //$('#newToolTagModel').modal('hide');
                    },
                    error: function (jqXHR, status, error) {
                        //alert(status+" --saveworhgrouptags-- "+error)
                        isError = 1;
                        $('#newToolTagModel').attr('error', isError);
                    }
                });
                               
            }

            function closenewGGTagModel() {
                $('#newGGTagModel').modal('hide');
                $("#txtNewGgTagName").val('');
                $('#charcounter').text('0/30');
                $('#btnAddTag').attr('disabled', 'disabled');
                $('#btnAddTag').removeClass('addTagtoListButton').addClass('disabledaddTagtoListButton');
                rePopulateTagsList();
                $('#newToolTagModel').focus();
            }

            function addinapprTag() {
                //Check if the list already exits in the list
                var tagId = Math.ceil(Math.random() * 100);
                var lstTags = JSON.parse($('#hdnTagsByGgId').val());
                if (lstTags.filter(x => x.TAG_LABEL.trim() === $('#txtTagName').val().trim()).length > 0) {
                    // if ($('#hdnSelectedWgId').val() == -1)
                    $('#spanaddEntryErrorMessage').text('Duplicate Tag Name');
                    //else
                    //  $('#spanaddEntryErrorMessage').text('Tag already exists in the group');
                    $('#newGGTagModel').modal('hide');
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
                        GlblGrp_ID: $('#hdnGgId').val(),
                        IS_NEW: true
                    }
                    lstTags.push(newrow);
                    lstTags = lstTags.sort(tagSort)
                    
                    /*  var aid = 'a' + tagId;
                      var cid = 'chk' + tagId;
                      var parentDiv = '<div style="text-decoration: none;font-family: Roboto;font-size:11px;padding-left:30px;padding-bottom:5px;" class="list-group-item list-group-item-action" id="' + aid + '" ><input type="checkbox" onchange="tagChange(this)" tagid="' + tagId + '"';
                      parentDiv += ' checked="checked" ';
                      parentDiv += ' class="form-check-input chkTool" id="' + cid + '"/><label style="padding-top:2px;" for="' + cid + '">&nbsp;&nbsp;' + $('#txtTagName').val() + '</label></div>';
      */
                    $('#hdnTagsByGgId').val(JSON.stringify(lstTags));
                    //  $('#dvWgTags').append(parentDiv);
                    $('#newGGTagModel').modal('hide');
                    $("#txtNewGgTagName").val('');
                    $('#charcounter').text('0/30');
                    rePopulateTagsList();
                    $('#btnAddTag').attr('disabled', 'disabled');
                    $('#btnAddTag').removeClass('addTagtoListButton').addClass('disabledaddTagtoListButton');
                    $('#newToolTagModel').focus();
                    $('#btnSaveGlobalGroup').removeAttr('disabled');
                    $('#btnSaveGlobalGroup').removeClass('disabledbutton').addClass('enabledbutton');
                }
            }

            function logInapproriate() {
                var grpId = 0;
                if ($('#hdnSelectedGgId').val() == "-1")
                    grpId = $('#hdnSelectedGgId').val()
                else
                    grpId = $('#hdnGgId').val();
                $.ajax({
                    url: 'NewTag.aspx/logInAppropriate?tagName=' + JSON.stringify($('#txtNewGgTagName').val()) + '&ggId=' + grpId,
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
        </script>
    </body>
</html>
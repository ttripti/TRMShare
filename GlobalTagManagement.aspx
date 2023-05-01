<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="GlobalTagManagement.aspx.vb" Inherits="VA.TRM.Authoring.GlobalTagManagement" %>
<%@ Import Namespace="VA.TRM.Authoring" %>
<%@ Import Namespace = "System.Text.RegularExpressions" %>
<%@ Import Namespace="VA.TRM.Authoring.incNet.TRMCodeLib" %>
<%@ Import Namespace="VA.TRM.Authoring.incNet.TRMCodeLib.TRMCodeLib" %>
<%@ Import Namespace="System.Text.RegularExpressions" %>
<%@ Import Namespace="VA.TRM.BusinessService" %>
<%@ Import Namespace="VA.TRM.Authoring.Authoring.incNet.TRMGlobals.Globals" %>
<%@ Import Namespace="VA.TRM.Authoring.TRMConfig" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
     <!--#include file="MasterHeader.aspx"-->
<head runat="server">    
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
     <script src="https://cdnjs.cloudflare.com/ajax/libs/corejs-typeahead/1.2.1/typeahead.jquery.min.js"></script>
    <title><%= trmPrefix %></title>
</head>
   
<body>
   <style>
       .ptnewtagbutton {
           border-width: 1px;
           border-radius: 3px;
           padding: 6px 15px 5px 15px;
           color: #283154;
           background-color: white;
           font-family: Roboto;
           font-size: 9px;
           display: inline-block;
           border: 1.4px solid;
           margin-left: 10px;
           overflow: hidden;
           transition: .3s;
           position: relative;
       }

           .ptnewtagbutton:hover {
               box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 10%);
           }

       #GrpCollapse {
           position: absolute;
           right: 30px;
           text-align: right;
       }

       a.collapseClass {
           color: black;
       }

       #tagManagementTable {
           border: solid 0.5px;
           border-color: lightgrey;
           width: 100%;
           margin-top: 15px;
       }

       #dvTagGroups {
           margin-left: 15px;
           margin-right: 15px;
           margin-bottom: 20px;
       }

       div[aria-expanded=true] .fa-chevron-down {
           display: none;
       }

       div[aria-expanded=false] .fa-chevron-up {
           display: none;
       }

       #main-content-table {
           width: 100%;
       }

       #tblcontentmain {
           width: 100%;
       }

       .ripple {
           /*position: relative;*/
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

       .chkTool:focus, .chkTool:active,
       #tagFilter:focus, #tagFilter:active,
       .roleoption:focus, .roleoption:active{
           border-color: lightgrey !important;
           box-shadow: none !important;
       }

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
       }

       .horizontalline {
           border-top: 0.2px solid rgb(0 0 0 / 10%);
       }

       .horizontallinecardbody {
           display: inline-block;
           border-top: 0.5px solid lightgrey;
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
           font-family: "Roboto, sans-serif"
       }

       .modal-open {
           overflow-y: auto;
           padding-right: 0px !important;
       }

           .modal-open .modal {
               overflow-x: auto;
           }

       .modal-header {
           padding: 16px 16px;
           color: #FFF;
       }

       #dvemailaddressModel .container,
       #dvToolEntry .container,
       #dvrenamegrpModel .container,
       #dvdeletegrpModel .container,
       #dvnewgrpModel .container {
           font-family: 'Roboto';
           display: block;
           background: #FFF;
       }

       /* form starting stylings ------------------------------- */
       #dvemailaddressModel .group,
       #dvToolEntry .group,
       #dvrenamegrpModel .group,
       #dvdeletegrpModel .group,
       #dvnewWgTagModel .group,
       #dvnewgrpModel .group {
           position: relative;
       }

       #dvnewWgTagModel input,
       #dvToolEntry input,
       #dvrenamegrpModel input,
       #dvdeletegrpModel input,
       #dvemailaddressModel input,
       #dvnewgrpModel input {
           font-size: 18px;
           padding: 10px 10px 10px 5px;
           display: block;
           width: 300px;
           border: none;
           border-bottom: 1px solid #757575;
       }

       #dvemailaddressModel input {
           font-size: 18px;
           padding: 10px 10px 10px 8px;
           display: block;
           width: 300px;
           border: none;
           border-bottom: 1px solid #757575;
       }

           #dvnewWgTagModel input:focus,
           #dvToolEntry input:focus,
           #dvrenamegrpModel input:focus,
           #dvdeletegrpModel input:focus,
           #dvemailaddressModel input:focus,
           #dvnewgrpModel input:focus {
               outline: none;
           }

       /* LABEL ======================================= */
       #dvnewWgTagModel label,
       #dvToolEntry label,
       #dvrenamegrpModel label,
       #dvdeletegrpModel label,
       #dvemailaddressModel label,
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

       #dvemailaddressModel label {
           color: #999;
           font-size: 18px;
           font-weight: normal;
           position: absolute;
           pointer-events: none;
           left: 8px;
           top: 10px;
           transition: 0.2s ease all;
           -moz-transition: 0.2s ease all;
           -webkit-transition: 0.2s ease all;
       }

       /* active state */
       #dvnewWgTagModel input:focus ~ label,
       #dvnewWgTagModel input:valid ~ label,
       #dvToolEntry input:valid ~ label,
       #dvToolEntry input:focus ~ label,
       #dvrenamegrpModel input:valid ~ label,
       #dvrenamegrpModel input:focus ~ label,
       #dvdeletegrpModel input:valid ~ label,
       #dvdeletegrpModel input:focus ~ label,
       #dvemailaddressModel input:focus ~ label,
       #dvemailaddressModel input:valid ~ label,
       #dvnewgrpModel input:focus ~ label,
       #dvnewgrpModel input:valid ~ label {
           top: -20px;
           font-size: 14px;
           color: grey;
       }

       .moveLabel {
           top: -20px !important;
           font-size: 11px !important;
           color: grey !important;
       }
       .entryNameStyle{
            top: -20px !important;
            font-size: 14px;
            color: grey;
        }
       /* BOTTOM BARS ================================= */
       #dvnewWgTagModel .bar,
       #dvToolEntry .bar,
       #dvrenamegrpModel .bar,
       #dvdeletegrpModel .bar,
       #dvemailaddressModel .bar,
       #dvnewgrpModel .bar {
           position: relative;
           display: block;
       }

           #dvnewWgTagModel .bar:before,
           #dvnewWgTagModel .bar:after,
           #dvToolEntry .bar:before,
           #dvToolEntry .bar:after,
           #dvrenamegrpModel .bar:before,
           #dvrenamegrpModel .bar:after,
           #dvdeletegrpModel .bar:before,
           #dvdeletegrpModel .bar:after,
           #dvemailaddressModel .bar:before,
           #dvemailaddressModel .bar:after,
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

           #dvnewWgTagModel .bar:before,
           #dvToolEntry .bar:before,
           #dvrenamegrpModel .bar:before,
           #dvdeletegrpModel .bar:before,
           #dvemailaddressModel .bar:before,
           #dvnewgrpModel .bar:before {
               left: 50%;
           }

           #dvnewWgTagModel .bar:after,
           #dvToolEntry .bar:after,
           #dvrenamegrpModel .bar:after,
           #dvdeletegrpModel .bar:after,
           #dvemailaddressModel .bar:after,
           #dvnewgrpModel .bar:after {
               right: 50%;
           }

           /* active state */
           #dvnewWgTagModel .bar:before,
           #dvnewWgTagModel .bar:after,
           #dvemailaddressModel input:focus ~ .bar:before,
           #dvemailaddressModel input:focus ~ .bar:after,
           #dvToolEntry input:focus ~ .bar:before,
           #dvToolEntry input:focus ~ .bar:after,
           #dvrenamegrpModel input:focus ~ .bar:before,
           #dvrenamegrpModel input:focus ~ .bar:after,
           #dvdeletegrpModel input:focus ~ .bar:before,
           #dvdeletegrpModel input:focus ~ .bar:after,
           #dvnewgrpModel input:focus ~ .bar:before,
           #dvnewgrpModel input:focus ~ .bar:after {
               width: 50%;
           }

       /* HIGHLIGHTER ================================== */
       #dvnewWgTagModel .highlight,
       #dvemailaddressModel .highlight,
       #dvToolEntry .highlight,
       #dvrenamegrpModel .highlight,
       #dvdeletegrpModel .highlight,
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
       #dvnewWgTagModel input:focus ~ .highlight,
       #dvemailaddressModel input:focus ~ .highlight,
       #dvToolEntry input:focus ~ .highlight,
       #dvrenamegrpModel input:focus ~ .highlight,
       #dvdeletegrpModel input:focus ~ .highlight,
       #dvnewgrpModel input:focus ~ .highlight {
           -webkit-animation: inputHighlighter 0.3s ease;
           -moz-animation: inputHighlighter 0.3s ease;
           animation: inputHighlighter 0.3s ease;
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

           .enabledbutton:hover, .daOKButton:hover, .continueButton:hover {
               background-color: #0c56d0;
               box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 10%);
           }

       .textcss {
           font-family: Roboto, sans-serif;
           font-size: 12px
       }

       .modal-dialog {
           position: absolute;
           top: 50px;
           right: 0px;
           bottom: 0;
           left: 0;
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

       .modal-footer {
           text-align: center;
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

       .donebutton {
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

       #dvEmailIdInfo {
           font-family: "Roboto, sans-serif";
           cursor: default;
           display: none;
           background-color: white;
           margin-top: 15px;
           position: absolute;
           text-align: left;
           z-index: 50;
           padding: 5px 5px 5px;
           border-radius: 5px;
           font-size: 10px;
           width: 380px;
           height: 130px;
       }

       .disabledmembersDialogButton {
           border-width: 1px;
           border-radius: 3px;
           border: 1.5px solid;
           border-color: darkgray;
           color: darkgray;
           padding: 8px 35px 6px 35px;
           background-color: white;
           font-family: Roboto;
           font-size: 11px;
       }

       .membersDialogButton {
           border-width: 1px;
           border-radius: 3px;
           border: 2px solid;
           border-color: #2196f3;
           padding: 8px 35px 6px 35px;
           color: #2196f3;
           background-color: white;
           font-family: Roboto;
           font-size: 11px;
           display: inline-block;
           overflow: hidden;
           transition: .3s;
           position: relative;
           font-weight: bold;
       }

       #clickableDisabledAddMember {
           position: absolute;
           width: 170px;
           height: 35px;
       }

       #clickableDisabledTrash {
           position: absolute;
           width: 0px;
           height: 0px;
       }

       .typeahead, .tt-query, .tt-hint {
           font-size: 18px;
           padding: 10px 10px 10px 8px;
           display: block;
           width: 300px;
           border: none;
           border-bottom: 1px solid #757575;
       }

       .tt-hint {
           color: #999999;
       }

       .tt-menu {
           background-color: #FFFFFF;
           border: 1px solid rgba(0, 0, 0, 0.2);
           box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 10%);
           margin-top: 0px;
           padding: 0px 0;
           width: 300px;
           /*max-height : 385px;*/
           overflow-y: auto;
       }

       .tt-suggestion {
           font-family: Roboto;
           font-weight: normal;
           padding-left: 8px;
       }

           .tt-suggestion:hover,
           .noResults:hover {
               cursor: pointer;
               background-color: #F5F5F5;
           }

       .names {
           font-family: Roboto;
           font-weight: normal;
           font-size: 16px;
           opacity: 0.87;
           color: black;
       }

       .email {
           font-family: Roboto;
           font-weight: normal;
           font-size: 14px;
           opacity: 0.54;
       }

       .noResults {
           font-family: Roboto;
           font-weight: normal;
           font-size: 16px;
           opacity: 0.87;
           padding-left: 10px;
           padding-bottom: 11px;
           padding-top: 11px;
       }

       .form-check-input {
           margin-left: 0px;
           width: 15px;
           height: 15px;
       }

       .form-check-input[type=checkbox] {
            border-radius: .15em; 
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

       #confrmMembrDiv .button:hover {
           background-color: #ddd;
       }

       #confrmMembrDiv .showdiv {
           display: block;
       }

       #confrmMembrDiv .hidediv {
           display: none;
       }

       .addMemberRipple {
           position: absolute;
           transform: translate(-50%, -50%);
           width: 0;
           height: 0;
           border-radius: 50%;
           background-color: #2196F3;
           pointer-events: none;
           opacity: .5;
           animation: addMemberRipple .5s linear;
       }

       @keyframes addMemberRipple {
           to {
               width: 5rem;
               height: 5rem;
               opacity: 0;
           }
       }

       #unsavedChanges .modal-dialog {
           margin-top: 102px;
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

           .groupellipsismessagepop {
           font-family: "Roboto, sans-serif";
           cursor: default;
           display: none;
           background-color: white;
           margin-top: 6px;
           position: absolute;
           text-align: left;
           /* width: 394px; */
           z-index: 50;
           padding: 5px 5px 5px;
           width: 220px;
           /*height: 150px;*/
       }

           .groupellipsismessagepop p, .groupellipsismessagepop.div {
               border-bottom: 1px solid #EFEFEF;
               margin: 8px 0;
               padding-bottom: 8px;
           }

       .shadow-sm {
           box-shadow: 0 .125rem .25rem darkgray !important;
       }

       .mb-5, .my-5 {
           margin-bottom: 3rem !important;
       }

       .bg-white {
           background-color: #fff !important;
       }

       .infoButton {
           cursor: pointer;
           margin-left: 5px;
       }

       .fa-check {
           color: green;
           font-size: 15px;
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

        .UncheckTool{
            background-color: white;
        }
        .CheckTool{
            background-color: #F7F7F7;
        }

        .continueButton {
            font-family: Roboto, sans-serif;
            font-size: 12px;
            Color: white;
            font-weight: normal;
            border-radius: .25rem;
            padding: .625rem 1.5rem .5rem;
            background-color: #2196F3;
            border-width: 0px;
            display: inline-block;
            overflow: hidden;
            transition: .3s;
            position: relative;
        }
   </style>
    <form id="form1" runat="server" style="width: 100%">
    <div class="row">
        <div class="col-12" style="font-family: Roboto; font-size: 14pt; margin-top: 5px;">
            <b>Global Tag Management</b>
        </div>
    </div>
   <div class="toast text-success text-center" style="position: fixed; top: 10rem; left: 50%; z-index: 9998; background-color: honeydew; width: fit-content;" id="goodToast" data-autohide="false">
        <div style="display:inline;">
            <span style="padding-left: 10px; padding-right: 5px; font-family: Roboto, sans-serif; font-size: 11px;" id="toastSuccess"></span>
        </div>
        <div style="display:inline;">
            <button style="display:flex;height:25px;color:#23903c;font-weight:bold;font-family: Roboto, sans-serif; font-size: 11px;" type="button" class="ml-2 mb-1 m-auto close" data-dismiss="toast" aria-label="Close">
                <span style="margin-top:4px;padding-right:5px;font-family: Roboto, sans-serif; font-size: 16px;" aria-hidden="true">&times;</span>
            </button>
        </div>
    </div>
    <div class="toast text-danger text-center" style="position: fixed; top: 10rem; left: 50%; z-index: 9998; background-color: #FFCCCB; width: fit-content;" id="burntToast" data-autohide="false">
        <%--<span style="padding-left: 10px; padding-right: 5px; font-family: Roboto, sans-serif; font-size: 11px;" id="toastError"></span>--%>
        <div style="display:inline;">
            <button style="display:flex;height:25px;color:#DC3545;" type="button" class="ml-2 mb-1 m-auto close" data-dismiss="toast" aria-label="Close">
                <span style="margin-top:4px;padding-right:5px;font-family: Roboto, sans-serif; font-size: 16px;" aria-hidden="true">&times;</span>
            </button>
        </div>
        <div style="display:inline;">
            <span style="padding-left: 10px; padding-right: 5px; font-family: Roboto, sans-serif; font-size: 11px;" id="toastError"></span>
        </div>
    </div>
    <div class="row" style="padding-top: 10px;"></div>
    <div style="max-width: 826px; min-width: 400px">
        <p style="font-size: 11px; font-family: Roboto; text-align: left;">
            Disclaimer: All tags created on this page are global tags and will immediately show up on the Presentation and Authoring entry pages when an entry is tagged.
        </p>
    </div>
    <div style="padding-bottom:20px">
        <select id="tagFilter" class="form-select" style="width: 145px; font-family: Roboto; font-size: 12px; float: right">
            <option value="PopularHighest">Popular - Highest</option>
            <option value="PopularLowest">Popular - Lowest</option>
            <option value="NameAtoZ">Name - A to Z</option>
            <option value="NameZtoA">Name - Z to A</option>
            <option value="CreatedNewest">Created - Newest</option>
            <option value="CreatedOldest">Created - Oldest</option>
        </select>
    </div>
    <div id="dvTags">
        <table id="tagManagementTable">
            <tr style="border-bottom: 0.5pt solid lightgrey;">
                <td>
                    <div id="dvTagGroups">
                        <div class="row" style="padding-top: 20px">
                            <div class="col-11" style="font-weight: 400; font-family: 'Roboto', sans-serif; font-size: 17px">
                                Global Groups (<span id="spanGroupCount"></span>)                
                                    <button id="btnnewgroup" class="ptnewtagbutton" onclick="javascript:OpenNewGroupDialog();return false;">
                                        <i class="fas fa-plus"></i>&nbsp;&nbsp;&nbsp;NEW GROUP
                                    </button>
                            </div>                            
                            <div class="col-1" id="GrpCollapse">
                                <div aria-expanded="true" class="collapseClass" data-toggle="collapse" href="#dvGlobalTagsContainer" style="cursor:pointer">
                                    <i class="fa fa-chevron-up"></i>
                                    <i class="fa fa-chevron-down"></i>
                                </div>
                            </div>
                        </div>                       
                        <div class="row">
                            <br />
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class=" collapse show row row-cols-1 row-cols-md-3 g-4" id="dvGlobalTagsContainer"></div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>

    <div id="dvGroupPopup" class="groupellipsismessagepop grouppop shadow-sm mb-5 bg-white rounded" style="display: none; width: 170px; border: 1px solid #dee2e6; border-radius: 5px;">

        <div style="padding-top: 5px; padding-bottom: 5px; background-color: white; cursor: pointer;" class="grpellipsemenu" id="dvRenameGroup" onclick="javascript:renameGroup();return false;">
            <div style="padding-left: 10px; display: inline-block; color: rgb(80,80,80)">
                <i class="fas fa-pen"></i>
            </div>
            <div style="display: inline-block;">
                <a href="#" style="text-decoration: none; color: rgb(100,100,100); font-size: 12px; font-family: Roboto, sans-serif;">&nbsp;&nbsp;Rename Group</a>
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
    </div>

    <div id="dvTagPopup" class="messagepop tagpop shadow-sm mb-5 bg-white rounded" style="margin-top: 1px; display: none; width: 170px; border: 1px solid #dee2e6; border-radius: 5px">
        <div style="padding-top: 0px; padding-bottom: 5px; background-color: white; cursor: pointer" class="grpellipsemenu" id="dvtagTRMEntry" onclick="javascript:createTagEntryModel();return false;">
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
        <div style="padding-top: 5px; padding-bottom: 5px; background-color: white; cursor: pointer" class="grpellipsemenu" id="dvRenameTag" onclick="javascript:checkIfAffectedEntries(1);return false;">
            <div style="padding-left: 10px; display: inline-block; color: rgb(80,80,80)">
                <i class="fas fa-pen"></i>
            </div>
            <div style="display: inline-block;">
                <a href="#" style="text-decoration: none; color: rgb(100,100,100); font-size: 12px; font-family: Roboto, sans-serif;">&nbsp;&nbsp;Rename Tag</a>
            </div>
        </div>
        <div class="horizontalline" id="dvTagshorzline"></div>
        <div style="padding-top: 5px; padding-bottom: 5px; background-color: white; cursor: pointer" class="grpellipsemenu" id="dvDeleteTag" onclick="javascript:checkIfAffectedEntries(2);return false;">
            <div style="padding-left: 10px; display: inline-block; color: rgb(80,80,80)">
                <i class="fas fa-trash"></i>
            </div>
            <div style="display: inline-block;">
                <a href="#" style="text-decoration: none; color: rgb(100,100,100); font-size: 12px; font-family: Roboto, sans-serif;">&nbsp;&nbsp;&nbsp;Delete Tag</a>
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

    <div class="modal fade" id="newGroupModel" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="newGroupModalLabel" aria-hidden="true">
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
                            <i class="fas fa-exclamation-triangle" id="InApprWarning" style="color: darkorange; display: none;"></i><span class="textcss" style="color: black; font-weight: bold; font-size: 14px;padding-left:12px;">&nbsp;CREATE NEW GROUP</span>
                        </div>
                    </div>
                    <div class="row">
                        <br />
                    </div>
                    <div id="dvnewgrpModel">
                        <div class="container">
                            <div class="group">
                                <input type="text" id="txtNewGroupName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 12px; width: 100%; background-color: #F6F6F6;" required="required" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label style="font-family: Roboto, sans-serif; font-size: 11px; color: grey; text-align: center; padding-top: 2px">Group Name</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-9" style="padding-left: 30px;height:25px;">
                            <label id="lblCreateGroupErrorMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal;padding-top:4px;padding-left:5px;display:block"></label>
                            <label id="lblCreateGroupWarningMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal;"></label>
                        </div>
                        <div class="col-2" style="text-align: right; padding-right: 0px;height:25px;font-family: Roboto">
                            <span id="charcounter" class="textcss">0/30</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12" style="padding-left: 30px;">
                            <span id="lblInApporipateWarningMessage" style="font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal"></span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-12" style="text-align: center;">
                            <button type="button" id="btncancelcreategroup" class="cancelButton" data-dismiss="modal">CANCEL</button>
                            <button type="button" id="btnCreateGlobalGroup" class="disabledbutton" onclick="javascript:createNewGroup();return false;">                               
                                    CREATE
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

        <div class="modal fade" id="newGlobalTagModel" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="newWGTagModalLabel" aria-hidden="true">
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
                                <i class="fas fa-exclamation-triangle" id="InApprWgTagWarning" style="color: darkorange; display: none;"></i><span class="textcss" style="color: black; font-weight: bold; font-size: 14px;;padding-left: 12px">&nbsp;CREATE GLOBAL TAG</span>
                            </div>
                        </div>
                        <div class="row">
                            <br />
                        </div>
                        <div id="dvnewWgTagModel">
                            <div class="container">
                                <div class="group">
                                    <input type="text" id="txtNewWgTagName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 12px; width: 100%; background-color: #F6F6F6;" required="required" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label style="font-family: Roboto, sans-serif; font-size: 11px; color: grey; text-align: center; padding-top: 2px">Tag Name</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-9" style="padding-left: 30px;height:25px;">
                                <label id="lblCreateWgTagErrorMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal; margin-left: 1px;padding-top:4px; padding-left: 4px; display: block"></label>
                                <label id="lblCreateWgTagWarningMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal;margin-left:1px"></label>
                            </div>
                            <div class="col-2" style="text-align: right; padding-right: 0px;height:25px;">
                                <span id="charWgTagcounter" class="textcss">0/30</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12" style="padding-left: 30px;">
                                <span id="lblInApporipateWgTagWarningMessage" style="font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal"></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12" style="font-family: Roboto, sans-serif; font-size:12px; font-weight: normal; margin-top:15px;margin-bottom:-10px; margin-left:20px">This tag will be visible by all TRM users upon tagging an entry.</div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row">
                            <div class="col-12" style="text-align: center;">
                                <button type="button" id="btncancelcreatetag" class="cancelButton" data-dismiss="modal">CANCEL</button>
                                <button type="button" id="btnCreateWgTag" class="disabledbutton" onclick="javascript:createWgTag();return false;">
                                    CREATE
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <div class="modal fade" id="MembersModel" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" aria-labelledby="membersModalLabel" aria-hidden="true">
        <div id="dvRolePopup" class="messagepop shadow-sm mb-5 bg-white roleInfoPopup infoPopUp" style="border-radius: 5px; font-family: 'Roboto', sans-serif; font-size: 10px; display: none; width: 450px; height: 375px;">
            <div class="infoPopUp" style="padding-bottom: 15px;">
                <button type="button" class="close infoPopUp" aria-label="Close" style="font-family: 'Roboto', sans-serif; font-size: 14px; margin-right: 5px;" onclick="javascript:closeRoleInfoPopup();">
                    <span aria-hidden="true"class="infoPopUp">&times;</span>
                </button>
            </div>
            <div class="infoPopUp" style="font-family: 'Roboto', sans-serif; font-size: 10px; width: 450px; padding-left: 20px; padding-right: 30px; padding-bottom: -10px;">
                <table class="table table-borderless infoPopUp" >
                    <thead class="infoPopUp">
                        <tr class="border-bottom infoPopUp" style="width: 13%;">
                            <th scope="col" style="width: 15%;" class="infoPopUp"></th>
                            <th class="text-center infoPopUp" style="width: 5%;" scope="col">Owner</th>
                            <th class="text-center infoPopUp" style="width: 11%;" scope="col">Global Tag Manager</th>
                            <th class="text-center infoPopUp" style="width: 4%;" scope="col">All Users</th>
                        </tr>
                    </thead>
                    <tbody class="infoPopUp">
                        <tr class="border-bottom infoPopUp">
                            <th scope="row" class="font-weight-normal infoPopUp">Add Members</th>
                            <td class="text-center infoPopUp"><i class="fas fa-check infoPopUp"></i></td>
                            <td class="text-center infoPopUp"><i class="fas fa-minus infoPopUp"></i></td>
                            <td class="text-center infoPopUp"><i class="fas fa-minus infoPopUp"></i></td>
                        </tr>
                        <tr class="border-bottom infoPopUp">
                            <th scope="row" class="font-weight-normal infoPopUp">Edit Roles</th>
                            <td class="text-center infoPopUp"><i class="fas fa-check infoPopUp"></i></td>
                            <td class="text-center infoPopUp"><i class="fas fa-minus infoPopUp"></i></td>
                            <td class="text-center infoPopUp"><i class="fas fa-minus infoPopUp"></i></td>
                        </tr>
                        <tr class="border-bottom infoPopUp">
                            <th scope="row" class="font-weight-normal infoPopUp">Create Global Tags</th>
                            <td class="text-center infoPopUp"><i class="fas fa-check infoPopUp"></i></td>
                            <td class="text-center infoPopUp"><i class="fas fa-check infoPopUp"></i></td>
                            <td class="text-center infoPopUp"><i class="fas fa-minus infoPopUp"></i></td>
                        </tr>
                        <tr class="border-bottom infoPopUp">
                            <th scope="row" class="font-weight-normal infoPopUp">Rename Global Tags</th>
                            <td class="text-center infoPopUp"><i class="fas fa-check infoPopUp"></i></td>
                            <td class="text-center infoPopUp"><i class="fas fa-check infoPopUp"></i></td>
                            <td class="text-center infoPopUp"><i class="fas fa-minus infoPopUp"></i></td>
                        </tr>
                        <tr class="border-bottom infoPopUp">
                            <th scope="row" class="font-weight-normal infoPopUp">Delete Global Tags</th>
                            <td class="text-center infoPopUp"><i class="fas fa-check infoPopUp"></i></td>
                            <td class="text-center infoPopUp"><i class="fas fa-check infoPopUp"></i></td>
                            <td class="text-center infoPopUp"><i class="fas fa-minus infoPopUp"></i></td>
                        </tr>
                        <tr class="border-bottom infoPopUp">
                            <th scope="row" class="font-weight-normal infoPopUp">Tag TRM Entries</th>
                            <td class="text-center infoPopUp"><i class="fas fa-check infoPopUp"></i></td>
                            <td class="text-center infoPopUp"><i class="fas fa-check infoPopUp"></i></td>
                            <td class="text-center infoPopUp"><i class="fas fa-minus infoPopUp"></i></td>
                        </tr>
                        <tr>
                            <th scope="row" class="font-weight-normal infoPopUp">View Tagged Entries</th>
                            <td class="text-center infoPopUp"><i class="fas fa-check infoPopUp"></i></td>
                            <td class="text-center infoPopUp"><i class="fas fa-check infoPopUp"></i></td>
                            <td class="text-center infoPopUp"><i class="fas fa-check infoPopUp"></i></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="modal-dialog membersDialog " role="document" style="width: 825px; min-width: 825px !important; padding-right: 15px !important; padding-left: 15px !important;">
            <div class="modal-content" style="width: 800px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="javascript:closeMemberModel();">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div style="margin-top: -12px;">
                        <span style="color: black; font-family: Roboto, sans-serif; font-size: 14px; font-weight: bold;">Add a Group Member</span>
                        <span style="color: black; font-family: Roboto, sans-serif; font-size: 14px; font-weight: normal;padding-left:18px;">All users on the Authoring site are viewers. Add Owners and Global Tag Managers here.</span>
                    </div>
                    <div class="row" style="width: 100%; padding-top: 20px;">
                        <div class="col-6">
                            <div id="dvemailaddressModel">
                                <div class="">
                                    <div class="group" style="display: inline-block">
                                        <input type="text" id="txtMemberName" autocomplete="off" class="typeahead tt-query" style="font-family: Roboto, sans-serif; font-size: 12px; background-color: #F6F6F6;" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label id="txtMemberNameLabel" style="font-family: Roboto, sans-serif; font-size: 11px; color: grey; text-align: center; padding-top: 2px;">First Name or Last Name</label>
                                    </div>
                                    <div style="display: inline-block; vertical-align: middle;"><i class="fa fa-info-circle emailIdInfo" style="padding-left: 0px; padding-right: 0px; float: left" onclick="javascript:displayEmailIdInfo();return false;"></i></div>
                                    <div id="dvEmailIdInfo" class=" shadow-sm mb-5 bg-white infoPopUp">
                                        <div style="padding-bottom: 15px;" class="infoPopUp">
                                            <button type="button" class="close infoPopUp" aria-label="Close" style="font-family: 'Roboto', sans-serif; font-size: 14px; margin-right: 5px; padding-top: 5px;" onclick="javascript:closeEmailIdInfo();">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="infoPopUp" style="font-family: 'Roboto', sans-serif; font-size: 12px; overflow-wrap: normal; padding-right: 16px; padding-left: 14px; padding-top: 5px;">
                                            <p class="infoPopUp" style="text-align: left;">
                                                All active accounts on the Authoring site are listed in the dropdown. Scroll through the list or begin typing
                                                a first name or last name. Once an account is selected, the user information will be displayed. You may add the
                                                member by selected the Add Member button or you may search for a different member.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6" style="text-align: left; height: 45px; padding-left: 0px;">
                            <div style="padding-left: 0px; display: inline-block; padding-top: 5px; position: relative; vertical-align: middle;">
                                <span class="d-none spinner-border spinner-border-sm" id="spinnerValidateUser" role="status" aria-hidden="true"></span>
                            </div>
                            <div style="display: inline-block; vertical-align: middle">
                                <label id="DisplayEmailText" style="color: black; font-family: Roboto; font-size: 10px; font-weight: normal;line-height:1.3"></label>
                            </div>
                        </div>
                    </div>

                    <div class="row" style="padding-top: 10px; padding-bottom: 20px; width: 100%; height: 65px;">
                        <div class="col-6" style="padding-right: 0px; padding-left: 5px;">
                           <div style="display: inline-block; padding-left: 10px;">
                                <div id='clickableDisabledAddMember'></div>
                                    <button type="button" class="disabledmembersDialogButton" onclick="addMember();return false;" id="btnAddMember">
                                       <i class="fas fa-plus"></i>&nbsp;&nbsp;ADD MEMBER
                                    </button>
                                </div>
                            </div>
                        <div class="col-6" style="display: inline-block; vertical-align: middle; padding-left: 4px;">
                            <label id="lblErrorMessage" style="color: red; font-family: Roboto; font-size: 10px; font-weight: normal;"></label>
                            <label id="lblSuccessMessage" style="color: green; font-family: Roboto; font-size: 10px; font-weight: normal;"></label>
                        </div>
                    </div>
                    <div class="row" style="font-family: Roboto; font-size: 14px; font-weight: bold; padding-top: 12px;">
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
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="checkDowngradeMember" data-backdrop="static" aria-labelledby="checkDowngradeMemberLabel" aria-hidden="true" tabindex="0">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="width: 400px;">
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
                    </span>
                    <br />
                    <p></p>
                </div>
                <div class="modal-footer">
                    <button id="Dwnfalsebtn" class="cancelButton" data-dismiss="modal">CANCEL</button>
                    <button id="Dwntruebtn" class="deleteenabledbutton">APPLY</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" data-spy="affix" data-offset-top="10" data-backdrop="static" id="confrmMembrDiv" aria-labelledby="confrmMembrDivLabel" aria-hidden="true" tabindex="0">
        <div class="modal-dialog" role="document" style="width: 400px">
            <div class="modal-content" style="width: 400px;">
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
                    <button id="unsavedCancel">CANCEL</button>
                    <button id="unsavedDiscard" data-dismiss="modal" onclick="javascript:discardUnsavedChanges();">DISCARD</button>
                    <button id="unsavedSave" class="saveButton" onclick="javascript:saveUnsavedChanges();">SAVE</button>
                </div>
            </div>
        </div>
    </div>


         <div class="modal fade" id="applyTRMTagEntries" data-backdrop="static" aria-labelledby="applyTRMTagEntrieLabel" aria-hidden="true" tabindex="-1">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="padding-top: 5px; padding-left: 10px; padding-right: 10px; width: 450px;height:auto;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="javascript:closeapplyTRMEntries();">
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
                    <div id="entryDescription" class="messagepop shadow-sm mb-5 bg-white entryDescPopup" style="border-radius: 5px; display: none; width: 335px;">
                       <div class="row entryDescPopup"> 
                           <div class="col-10 entryDescPopup" style="font-family: Roboto,sans-serif;font-size:14px;font-weight:bold;padding-top:5px;padding-left:25px;padding-bottom:10px;">Entry Description</div>
                            <div class="col-2 entryDescPopup" style="float:right"><button type="button" class="close" aria-label="Close" onclick="javascript:closeEntryDescription();">
                                    <span aria-hidden="true">&times;</span>
                                  </button>
                            </div>
                       </div> 
                       <div class="entryDescPopup" style="padding-left:10px;font-family: Roboto,sans-serif;font-size:12px;font-weight:normal;overflow-y:auto;overflow-x:hidden;" id="description"></div>
                    </div>
                    <div id="dvTRMTaggedEntries" style="height: 250px; overflow-y: auto; overflow-x: hidden;"></div>
                </div>
                <div class="modal-footer">
                    
                    <button id="applyCancel" class="cancelButton" data-dismiss="modal" onclick="javascript:cancelTRMTagEntries();">BACK</button>
                    <button id="applyConfirm" class="enabledbutton" onclick="javascript:ConfirmapplyTag();">CONFIRM</button>
                    
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
                    <div class="row" style="font-family: Roboto; font-size: 11px; padding-top: 10px; padding-bottom: 10px; font-weight: bold;">
                        <div class="col-12" id="taggedEntriesDeselectedMessage">
                            Deselected entries will be removed from the current tag.
                        </div>
                    </div>
                    <div id="dvViewTRMEntries" style="height: 250px; overflow-y: auto; overflow-x: hidden;"></div>
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
                            <i class="fas fa-exclamation-triangle" id="InRenameApprWarning" style="color: darkorange; display: none;"></i><span class="textcss" style="color: black; font-weight: bold; font-size: 14px;padding-left:12px;">RENAME GROUP</span>
                        </div>

                    </div>
                    <div class="row">
                        <br />
                        <br />
                    </div>
                    <div id="dvrenamegrpModel">
                        <div class="container">
                            <div class="group">
                                <input type="text" id="txtRenameGroupName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 12px; width: 100%; background-color: #F6F6F6;" required="required" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label style="font-family: Roboto, sans-serif; font-size: 11px; color: grey; text-align: center;">Group Name</label>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-9" style="padding-left: 30px;height:30px;">
                            <label id="lblRenameGroupErrorMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal;display:block;padding-top:4px;padding-left:5px;"></label>
                            <label id="lblRenameGroupWarningMessage" style="color: red; font-family: Roboto, sans-serif; font-weight: normal;"></label>
                        </div>
                        <div class="col-2" style="text-align: right; padding-right: 0px;height:30px">
                            <span id="renamecharcounter" class="textcss">0/30</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12" style="padding-left: 30px;padding-right:30px">
                            <span id="lblRenameInApporipateWarningMessage" style="font-family: Roboto, sans-serif; font-size: 12px; font-weight: normal;"></span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-12" style="text-align: center;">
                            <button type="button" id="btncancelrenamegroup" class="cancelButton" data-dismiss="modal">CANCEL</button>
                            <button type="button" id="btnRenameWorkGroup" class="enabledbutton" onclick="javascript:renameWorkGroup();return false;">
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
                    <div class="row" style="width: 100%;padding-left:25px">
                        <div class="col-6">
                            <i class="fas fa-exclamation-triangle" id="DeleteWarning" style="color: #EB5757;"></i><span class="textcss" style="color: black; font-weight: bold; font-size: 14px;">&nbsp; DELETE GROUP</span>
                        </div>
                        <%--<div class="col-sm-6" style="text-align: right">
                            <i class="fas fa-times" style="color: black; cursor: pointer;" onclick="javascript:closeDeleteGroupModel();"></i>
                        </div>--%>
                    </div>
                    <div class="row">
                        <br />
                    </div>
                    <div class="row" style="padding-bottom: 10px;padding-right:20px;padding-left:25px">
                        <div class="col-12">
                            <span class="textcss" id="spandeletetext" style="color: black; font-weight: bold; font-size: 14px; white-space: pre-wrap;"></span>
                        </div>
                    </div>
                    <div class="row" style="padding-bottom: 10px;padding-left:25px;padding-right:25px;">
                        <div class="col-12">
                            <span id="deletegrouppopuptext" style="white-space: pre-wrap; font-family: Roboto, sans-serif; font-size: 12px;">Deleteing the group named <b>group name here</b> will remove the group from your view
                                as well as all group member's view. All <b>group name here</b> tags will be removed from any TRM entry tagged with a <b>group name here</b> tag.
                                Type the name "<b>group name here</b>" below to confirm you want to delete the <b>group name here</b> group and any associated group tags.
                            </span>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <div id="dvdeletegrpModel">
                                <div class="container">
                                    <div class="group">
                                        <input type="text" id="txtDeleteGroupName" autocomplete="off" style="font-family: Roboto, sans-serif; font-size: 15px; width: 100%; background-color: #F6F6F6;" required="required" />
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
                    <div class="row" style="padding-right:10px">
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

        
        
        <asp:HiddenField ID="selectedTagId" runat="server" />
        <asp:HiddenField ID="selectedTagName" runat="server" />
        <asp:HiddenField ID="hdnSelectedWGName" runat="server" />
        <asp:HiddenField ID="hdnlstWgs" runat="server" />
        <asp:HiddenField ID="hdnlstTags" runat="server" />
        <asp:HiddenField ID="hdnToolId" runat="server" />
        <asp:HiddenField ID="hdnSelectedWgId" runat="server" />
        <asp:HiddenField ID="hdnselectedWgIdNew" runat="server" />
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
        <asp:HiddenField ID="hdnTRMUsers" runat="server" />
        <asp:HiddenField ID="hdnSelectedEmailId" runat="server" />
        <asp:HiddenField ID="hdnSelectedTools" runat="server" />
        <input type="hidden" runat="server" id="hdnLoggedInUserId" />
        <asp:HiddenField ID="hdnLoggedInUserOrgName" runat="server" />
         <!--<input type="hidden" runat="server" id="hdnIsUserHasBusinessAdminRole" />-->
    </form>
    <script>
        $(document).ready(function () {

            
            $(function () {
                var results = emailMatcher(getMatchedEmail());
                $('#txtMemberName').typeahead({
                    minLength: 0,
                    highlight: true,
                    hint: false //background hint
                }, {
                    name: 'TRMUsers',
                    limit: 200,
                    display: function (data) {
                        return data.FirstName + ' ' + data.LastName;
                    },
                    source: results,
                    templates: {
                        empty: [
                            '<div class="noResults">',
                            'No results found',
                            '</div>'
                        ].join('\n'),
                        suggestion: function (data) {
                            return '<div><div class="names">' + data.FirstName + ' ' + data.LastName + '</div><div class="email">' + data.EmailAddress + '</div><div class="horizontalline" style="margin-top:1px;width:265px;"></div></div>';
                        },
                    }
                });
            });

            $('.typeahead').on('typeahead:selected', function (evt, item) {
                $('#hdnSelectedEmailId').val(item.EmailAddress);
                $('#DisplayEmailText').html('');
                $('#lblErrorMessage').text('');
                $('#lblSuccessMessage').text('');
                let displayText = item.FirstName + "  " + item.LastName + "<br/>";
                let strSeparator = "";
                if ((item.EmailAddress != "") && (item.PhoneNo != ""))
                    strSeparator = " | ";

                displayText = displayText + item.EmailAddress + strSeparator + item.PhoneNo + "<br/>";

                strSeparator = ""
                if (item.name != "")
                    strSeparator = " | ";
                displayText = displayText + item.name;

                $("#MembersModel").focus();
                $('#DisplayEmailText').html(displayText);
                $('#DisplayEmailText').show();
                $('#btnAddMember').removeAttr('disabled');
                $('#btnAddMember').removeClass('disabledmembersDialogButton').addClass('membersDialogButton');
                enableClickonDisabled(true);
            })
            $('.typeahead').on('typeahead:active', function (evt, item) {
                // alert(evt.target.className);
                $('#txtMemberNameLabel').addClass('moveLabel');
                var modalDialogHeight = $('#MembersModel').find('#dvMembersList').outerHeight(true);
                var maxheight = parseFloat(modalDialogHeight + 150);
                $('.tt-menu').css('max-height', maxheight + 'px');
            });

            $('.typeahead').on('typeahead:close', function (evt, item) {
                if ($('#txtMemberName').val() == '')
                    $('#txtMemberNameLabel').removeClass('moveLabel');
                // $('#txtMemberNameLabel').addClass('moveLabel');
            })

            //$('#btnnewgroup').hide();
            //if ($('#hdnIsUserHasBusinessAdminRole').val() == 'True') {
            //    $('#btnnewgroup').show();
            //}

            getAllGlobalGroups();

            localStorage.removeItem('INAPPROWORDS');
            localStorage.setItem('INAPPROWORDS', $('#hdnInApprWords').val());

            $('#hdnInApprWords').val('');

            $(window).resize(function () {
                $('#dvRolePopup').hide();
                $('#dvEmailIdInfo').hide();
                if ($('#MembersModel').is(':visible')) {
                    $('#MembersModel .modal-dialog').css('padding-right', '10px');
                    $('#MembersModel .modal-dialog').css('padding-left', '10px');
                    refreshWorkGroupMembers($('#hdnSelectedWgId').val(), 0);
                }
            });

            $('#MembersModel').on('keydown', function (event) {
                if ((event.keyCode || event.which) == 27) {
                    if ($('#dvRolePopup').is(':visible') || $('#dvEmailIdInfo').is(':visible')) {
                        $('#dvRolePopup').hide();
                        $('#dvEmailIdInfo').hide();

                        $('#clickableDisabledTrash').css({ 'width': '0px', 'height': '0px' });
                        $('.LockButton').each(function () {
                            $(this).removeAttr('disabled');
                        });
                        var enabled = false;
                        var enteredText = $("#txtMemberName").val().trim();
                        if ($('#hdnSelectedEmailId').val().trim() == '') {
                            $('#DisplayEmailText').text('');
                            $('#btnAddMember').attr('disabled', 'disabled');
                            $('#btnAddMember').removeClass('membersDialogButton').addClass('disabledmembersDialogButton');
                        }
                        else {
                            enabled = true;
                            $('#btnAddMember').removeAttr('disabled');
                            $('#btnAddMember').removeClass('disabledmembersDialogButton').addClass('membersDialogButton');
                        }
                        enableClickonDisabled(enabled);
                        event.preventDefault();
                        event.stopImmediatePropagation();
                        return false;
                    }
                    else if ((event.target.className).search('tt-input') != -1) {
                        //typeahead is open so close only  that and not memberdialog
                        if ($('#txtMemberName').val().length != 0) {
                            event.preventDefault();
                            event.stopImmediatePropagation();
                            $('#txtMemberName').val('');
                            $('.typeahead').typeahead('val', '');
                            $('.typeahead').typeahead('open');
                            return false;
                        }
                        else {
                            event.stopImmediatePropagation();
                            $("#MembersModel").focus();
                        }
                    }
                    else if ($('#MembersModel').is(':visible')) {
                        $("#MembersModel").removeClass('fade');
                        $("#MembersModel").modal('hide');
                        /*  if ($('#hdnSelectedEmailId').val().trim() != '') {
                              $("#unsavedText").text("You have validated an email address without adding the user as a member. Select CANCEL to go back and make changes or DISCARD to leave without adding the member.");
                              $('#unsavedCancel').removeClass();
                              $('#unsavedDiscard').removeClass();
                              $('#unsavedDiscard').addClass('deleteenabledbutton');
                              $('#unsavedCancel').addClass('cancelButton');
                              $("#unsavedSave").css('display', 'none');
                              $("#unsavedChanges").addClass('fade');
                              $("#unsavedChanges").modal('show');
                          } else {*/
                        $('#txtMemberName').val('');
                        $('.typeahead').typeahead('val', '');
                        $('#txtMemberNameLabel').removeClass('moveLabel');
                        $('#DisplayEmailText').text('');
                        // }
                        return false;
                    }
                }
            });

            $(document).on("click", function (e) {
                if ((e.target.className != 'fa fa-info-circle infoButton') && e.target.className != 'fa fa-info-circle emailIdInfo' && (e.target.className).search('infoPopUp') == -1) {
                    closePopUps();
                }

                if ((e.target.className != 'fa fa-info-circle entryDesc') && e.target.className != 'fa fa-info-circle entryDesc' && (e.target.className).search('entryDescPopup') == -1) {
                    if ($('#entryDescription').is(':visible')) {
                        $('#entryDescription').hide();
                    }
                }

                if ((e.target.className != 'fas fa-ellipsis-v tag') && (e.target.className != 'tagellipsisbutton')) {
                    if ($('#dvTagPopup').is(':visible')) {
                        $('#dv' + $('#selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                        $('#dvTagPopup').hide();
                    }
                }
                if ((e.target.className != 'fas fa-ellipsis-v grp') && (e.target.className != 'CustomButtons')) {
                    if ($('#dvGroupPopup').is(':visible')) {
                        $('#dvGroupPopup').hide();
                    }

                }
            });

            $('#clickableDisabledTrash').on('click', function () {
                if ($('#LockButton:disabled').length > 0) {
                    if ($('#dvRolePopup').is(':visible') || $('#dvEmailIdInfo').is(':visible')) {
                        $('#dvRolePopup').hide();
                        $('#dvEmailIdInfo').hide();
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
                    if ($('#dvRolePopup').is(':visible') || $('#dvEmailIdInfo').is(':visible')) {
                        $('#dvRolePopup').hide();
                        $('#dvEmailIdInfo').hide();
                        $('#clickableDisabledTrash').css({ 'width': '0px', 'height': '0px' });
                        $('.LockButton').each(function () {
                            $(this).removeAttr('disabled');
                        });
                        var enteredText = $("#txtMemberName").val().trim();

                        enabled = true;
                        $('#btnAddMember').attr('disabled', 'disabled');
                        $('#btnAddMember').removeClass('membersDialogButton').addClass('disabledmembersDialogButton');
                    }
                }
                enableClickonDisabled(enabled);
            });

            $("#txtMemberName").on('keydown keyup change', function (e) {
                $('#DisplayEmailText').text('');
                $('#lblErrorMessage').hide();
                $('#lblSuccessMessage').hide();
                var enabled = false;
                $('#btnAddMember').attr('disabled', 'disabled');
                $('#btnAddMember').removeClass('membersDialogButton').addClass('disabledmembersDialogButton');
                enableClickonDisabled(enabled);
                if (e.keyCode == 32 || e.keyCode == 46) {//space - 32 , delete - 46
                    $('#hdnSelectedEmailId').val('');
                }

            });

            $('#txtMemberName').keypress(function (event) {
                $('#lblErrorMessage').text('');
                $('#DisplayEmailText').text('');
                $('#hdnSelectedEmailId').val('');
                if ((event.keyCode || event.which) == 13) {
                    event.preventDefault();
                    return false;
                }
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

            $("#txtNewGroupName").on('keydown keyup change', function (e) {
                var k = e.keyCode || e.which;
                if ((e.keyCode || e.which) == 13) {
                    e.preventDefault();
                    return false;
                }
                let errorText = $('#lblCreateGroupErrorMessage').html();
                if (errorText == "Duplicate Group Name") {
                    errorText = "";
                }
                $('#lblCreateGroupErrorMessage').text('');
                $('#InApprWarning').hide();
                $('#lblInApporipateWarningMessage').html('');
                $('#lblCreateGroupWarningMessage').text('');
                $('#hdnIsInAppropriateFlagged').val('False');
                var maxLength = 30;
                var charLength = $('#txtNewGroupName').val().length;
                var trimLength = $('#txtNewGroupName').val().trim().length
                var e1 = 'Name must include visible characters';
                var e2 = 'Valid characters are alphanumeric and _-()';
                var e3 = 'Inappropriate word detected';

                if (charLength > maxLength) {
                    $('#charcounter').css('color', 'red');
                    $('#btnCreateGlobalGroup').attr('disabled', 'disabled');
                    $('#btnCreateGlobalGroup').removeClass('enabledbutton').addClass('disabledbutton');
                    $('#charcounter').text(charLength + '/' + maxLength);
                }
                else {
                    $('#charcounter').css('color', 'black');
                }

                if (charLength > 0 && trimLength == 0 && charLength <= maxLength) {
                    $('#btnCreateGlobalGroup').attr('disabled', 'disabled');
                    $('#btnCreateGlobalGroup').removeClass('enabledbutton').addClass('disabledbutton');
                    errorText = "Name must include visible characters";
                    $('#lblCreateGroupErrorMessage').text(errorText);
                    $('#charcounter').text(charLength + '/' + maxLength);
                    return;
                }
                else if (charLength == 0) {
                    $('#btnCreateGlobalGroup').attr('disabled', 'disabled');
                    $('#btnCreateGlobalGroup').removeClass('enabledbutton').addClass('disabledbutton');
                    $('#charcounter').text(charLength + '/' + maxLength);
                    errorText = '';
                    $('#lblCreateGroupErrorMessage').html(errorText);
                    return;
                }
                else {
                    if (charLength <= maxLength) {
                        $('#btnCreateGlobalGroup').removeAttr('disabled');
                        $('#btnCreateGlobalGroup').removeClass('disabledbutton').addClass('enabledbutton');
                        var splitError = errorText.split('<br>');
                        errorText = '';
                        for (var i = 0; i <= splitError.length; i++) {
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
                        $('#lblCreateGroupErrorMessage').html('');
                    }
                }

                var enteredtext = $("#txtNewGroupName").val();
                var regex = /^[ A-Za-z0-9_()-]*$/
                if (charLength > 0 && regex.test(enteredtext) == false) {
                    $('#btnCreateGlobalGroup').attr('disabled', 'disabled');
                    $('#btnCreateGlobalGroup').removeClass('enabledbutton').addClass('disabledbutton');
                    if (errorText.length != 0) {
                        if (errorText.search(e2) == -1) {
                            errorText += "<br>Valid characters are alphanumeric and _-()";
                        }
                    }
                    else {
                        errorText = "Valid characters are alphanumeric and _-()";
                    }
                    $('#lblCreateGroupErrorMessage').text(errorText);
                }

                else {
                    if (charLength <= maxLength) {
                        $('#lblCreateGroupErrorMessage').html('');
                        $('#btnCreateGlobalGroup').removeAttr('disabled');
                        $('#btnCreateGlobalGroup').removeClass('disabledbutton').addClass('enabledbutton');
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
                    $('#lblCreateGroupErrorMessage').html(errorText);
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
                    if (errorText.length != 0) {
                        if (errorText.search(e3) == -1)
                            errorText += "<br>Inappropriate word detected";
                    }
                    else
                        errorText = "Inappropriate word detected";
                    $('#lblCreateGroupErrorMessage').html(errorText);
                }
                else {
                    var splitError = errorText.split('<br>');
                    errorText = '';
                    for (var i = 0; i <= splitError.length; i++) {
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
                    $('#lblCreateGroupErrorMessage').html(errorText);
                }
                $('#charcounter').text(charLength + '/' + maxLength);
            });

            $("#txtNewWgTagName").on('keydown keyup change', function (e) {
                var k = e.keyCode || e.which;
                if ((e.keyCode || e.which) == 13) {
                    e.preventDefault();
                    return false;
                }
                let errorText = $('#lblCreateWgTagErrorMessage').html();
                if (errorText == "Duplicate Tag Name") {
                    errorText = "";
                }
                $('#lblCreateWgTagErrorMessage').text('');
                $('#InApprWgTagWarning').hide();
                $('#lblInApporipateWgTagWarningMessage').html('');
                $('#lblCreateWgTagWarningMessage').text('');
                $('#hdnIsInAppropriateFlagged').val('False');
                var maxLength = 30;
                var charLength = $('#txtNewWgTagName').val().length;
                var trimLength = $('#txtNewWgTagName').val().trim().length
                var e1 = 'Name must include visible characters';
                var e2 = 'Valid characters are alphanumeric and _-()';
                var e3 = 'Inappropriate word detected';

                if (charLength > maxLength) {
                    $('#charWgTagcounter').css('color', 'red');
                    $('#btnCreateWgTag').attr('disabled', 'disabled');
                    $('#btnCreateWgTag').removeClass('enabledbutton').addClass('disabledbutton');
                    $('#charWgTagcounter').text(charLength + '/' + maxLength);
                }
                else {
                    $('#charWgTagcounter').css('color', 'black');
                }

                if (charLength > 0 && trimLength == 0 && charLength <= maxLength) {
                    $('#btnCreateWgTag').attr('disabled', 'disabled');
                    $('#btnCreateWgTag').removeClass('enabledbutton').addClass('disabledbutton');
                    errorText = "Name must include visible characters";
                    $('#lblCreateWgTagErrorMessage').text(errorText);
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

                var enteredtext = $("#txtNewWgTagName").val();
                var regex = /^[ A-Za-z0-9_()-]*$/
                if (charLength > 0 && regex.test(enteredtext) == false) {
                    $('#btnCreateWgTag').attr('disabled', 'disabled');
                    $('#btnCreateWgTag').removeClass('enabledbutton').addClass('disabledbutton');
                    if (errorText.length != 0) {
                        if (errorText.search(e2) == -1) {
                            errorText += "<br>Valid characters are alphanumeric and _-()";
                        }
                    }
                    else {
                        errorText = "Valid characters are alphanumeric and _-()";
                    }
                    $('#lblCreateWgTagErrorMessage').text(errorText);
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
                    if (errorText.length != 0) {
                        if (errorText.search(e3) == -1)
                            errorText += "<br>Inappropriate word detected";
                    }
                    else
                        errorText = "Inappropriate word detected";
                    $('#lblCreateWgTagErrorMessage').html(errorText);
                }
                else {
                    var splitError = errorText.split('<br>');
                    errorText = '';
                    for (var i = 0; i <= splitError.length; i++) {
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

            $("#checkDowngradeMember").on('keydown keyup change', function (e) {
                // ESCAPE key pressed
                if ((e.keyCode || e.which) == 27) {
                    $('#checkDowngradeMember').modal('hide');
                    $("#MembersModel").modal('show');
                    refreshWorkGroupMembers($('#hdnSelectedWgId').val(), 0);
                    event.preventDefault();
                }
            });

            $("#confrmMembrDiv").on('keydown keyup change', function (e) {
                // ESCAPE key pressed
                if ((e.keyCode || e.which) == 27) {
                    $('#confrmMembrDiv').modal('hide');
                    $("#MembersModel").modal('show');
                    refreshWorkGroupMembers($('#hdnSelectedWgId').val(), 0);
                    event.preventDefault();
                }
            });

            $("#applyTRMTagEntries").on('keydown keyup change', function (e) {
                // ESCAPE key pressed
                if ((e.keyCode || e.which) == 27) {
                    $('#applyTRMTagEntries').modal('hide');
                    $("#tagTRMModel").modal('show');
                    $('#dv' + $('#selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                    event.preventDefault();
                }
            });

            $("#tagTRMModel").on('keydown keyup change', function (e) {
                // ESCAPE key pressed
                if ((e.keyCode || e.which) == 27) {
                    $('#hdnTriggerModal').val(2);
                    //$('#applyTRMTagEntries').modal('hide');
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
                        $('#dv' + $('#selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
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
                    event.preventDefault();
                }
            });

            $('#unsavedChanges').on('hidden.bs.modal', function (e) {
                var action = $("#unsavedChanges").attr("action");

                var caller = $('#hdnTriggerModal').val();
                if (action == "close" || action == "escape") {
                    if (caller == 1) {
                        refreshWorkGroupMembers($('#hdnSelectedWgId').val(), 0);
                    }
                    else if (caller == 2) {
                        $("#tagTRMModel").modal('show');
                    }
                    else if (caller == 3) {
                          viewTRMEntriesModel(undefined, undefined, undefined, true);
                    }
                }
                else if (action == "cancel") {
                    if (caller == 1) {
                        $("#MembersModel").modal('show');
                        $('#btnAddMember').removeAttr('disabled');
                        $('#btnAddMember').removeClass('disabledmembersDialogButton').addClass('membersDialogButton');
                        refreshWorkGroupMembers($('#hdnSelectedWgId').val(), 0);
                    }
                    else if (caller == 2) {
                        $("#tagTRMModel").modal('show');
                    }
                    else if (caller == 3) {
                        viewTRMEntriesModel(undefined, undefined, undefined, true);
                    }
                }
                else if (action == "save") {
                    $("#tagTRMModel").modal('hide');
                }
            });

            document.querySelector("#btnnewgroup").addEventListener('click', createRipple);
            document.querySelector("#btnCreateGlobalGroup").addEventListener('click', createRipple);
            document.querySelector("#btncancelcreategroup").addEventListener('click', createRipple);
            document.querySelector("#btnAddMember").addEventListener('click', createBlueRipple);
            document.querySelector("#btnDone").addEventListener('click', createRippleDifColor);

            $(".grpellipsemenu").mouseover(function () {
                $(this).css("background-color", "lightgrey");
            });
            $(".grpellipsemenu").mouseout(function () {
                $(this).css("background-color", "white");
            });

            $("#viewTRMModel").on('keydown', function (event) {
                if ((event.keyCode || event.which) == 27) {
                    $('#hdnTriggerModal').val(3);
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
                    else
                        $('#dv' + $('#selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                }
            });

            $("#txtRenameGroupName").on('keydown keyup change', function (e) {
                var k = e.keyCode || e.which;
                let errorText = $('#lblRenameGroupErrorMessage').html();
                if (errorText == "Duplicate Group Name") {
                    errorText = "";
                }
                $('#lblErrorMessage').text('');
                if ((e.keyCode || e.which) == 13) {
                    e.preventDefault();
                    return false;
                }

                $('#lblRenameGroupErrorMessage').html('');
                $('#lblRenameGroupWarningMessage').text('');
                $('#InRenameApprWarning').hide();
                $('#lblRenameInApporipateWarningMessage').html('');
                $('#hdnIsInAppropriateFlagged').val('False');
                var maxLength = 30;
                var charLength = $('#txtRenameGroupName').val().length;
                var trimLength = $('#txtRenameGroupName').val().trim().length
                var e1 = 'Name must include visible characters';
                var e2 = 'Valid characters are alphanumeric and _-()';
                var e3 = 'Inappropriate word detected';

                if (charLength > maxLength) {
                    $('#renamecharcounter').css('color', 'red');
                    $('#btnRenameWorkGroup').attr('disabled', 'disabled');
                    $('#btnRenameWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
                    $('#renamecharcounter').text(charLength + '/' + maxLength);
                }
                else {
                    $('#renamecharcounter').css('color', 'black');
                }

                if ($('#txtRenameGroupName').val().trim() == $('#hdnSelectedWGName').val().trim() ||
                    (k == 13 && $('#txtRenameGroupName').val().trim() == $('#hdnSelectedWGName').val().trim())
                ) {
                    $('#btnRenameWorkGroup').attr('disabled', 'disabled');
                    $('#btnRenameWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
                    $('#renamecharcounter').text(charLength + '/' + maxLength);
                    return;
                }

                if (charLength > 0 && trimLength == 0 && charLength <= maxLength) {
                    $('#btnRenameWorkGroup').attr('disabled', 'disabled');
                    $('#btnRenameWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
                    //$('#lblRenameGroupErrorMessage').text('Name must include visible characters');
                    errorText = "Name must include visible characters";
                    $('#lblRenameGroupErrorMessage').html(errorText);
                    $('#renamecharcounter').text(charLength + '/' + maxLength);
                    return;
                }
                else if (charLength == 0) {
                    $('#btnRenameWorkGroup').attr('disabled', 'disabled');
                    $('#btnRenameWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
                    $('#renamecharcounter').text(charLength + '/' + maxLength);
                    errorText = '';
                    $('#lblRenameGroupErrorMessage').html(errorText);
                    return;
                }
                else {
                    if (charLength <= maxLength) {
                        $('#btnRenameWorkGroup').removeAttr('disabled');
                        $('#btnRenameWorkGroup').removeClass('disabledbutton').addClass('enabledbutton');
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
                        $('#lblRenameGroupErrorMessage').html('');
                    }
                }

                var enteredtext = $("#txtRenameGroupName").val();
                var regex = /^[ A-Za-z0-9_()-]*$/
                if (charLength > 0 && regex.test(enteredtext) == false) {
                    //$('#lblRenameGroupErrorMessage').text('Valid characters are alphanumeric and _-()');
                    if (errorText.length != 0) {
                        if (errorText.search(e2) == -1) {
                            errorText += "<br>Valid characters are alphanumeric and _-()";
                        }
                    }
                    else {
                        errorText = "Valid characters are alphanumeric and _-()";
                    }
                    $('#lblRenameGroupErrorMessage').html(errorText);
                    $('#btnRenameWorkGroup').attr('disabled', 'disabled');
                    $('#btnRenameWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
                }
                else {
                    if (charLength <= maxLength) {
                        $('#lblRenameGroupErrorMessage').html('');
                        $('#btnRenameWorkGroup').removeAttr('disabled');
                        $('#btnRenameWorkGroup').removeClass('disabledbutton').addClass('enabledbutton');
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
                    $('#lblRenameGroupErrorMessage').html(errorText);
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
                    // $('#lblRenameGroupWarningMessage').text('Inappropriate word detected');
                    if (errorText.length != 0) {
                        if (errorText.search(e3) == -1)
                            errorText += "<br>Inappropriate word detected";
                    }
                    else
                        errorText = "Inappropriate word detected";
                    $('#lblRenameGroupErrorMessage').html(errorText);
                }
                else {
                    var splitError = errorText.split('<br>');
                    errorText = '';
                    for (var i = 0; i <= splitError.length; i++) {
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
                    $('#lblRenameGroupErrorMessage').html(errorText);
                }

                $('#renamecharcounter').text(charLength + '/' + maxLength)

            });

            $("#txtDeleteGroupName").on('keydown keyup change', function (e) {

                var _value = $(this).val();
                var selectedGroupName = $('#hdnSelectedWGName').val();
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

        });

        function createBlueRipple(e) {
            let btn = e.target;
            let id = e.target.id;
            // alert();
            let boundingBox = btn.getBoundingClientRect();
            let x = e.clientX - boundingBox.left;
            let y = e.clientY - boundingBox.top;
            let ripple = document.createElement('span');
            ripple.classList.add('addMemberRipple');
            y = $('#' + id).outerHeight() / 2;
            x = $('#' + id).outerWidth() / 2;
            ripple.style.left = `${x}px`;
            ripple.style.top = `${y}px`;
            btn.appendChild(ripple);
            ripple.addEventListener('animationend', () => { ripple.remove() });
        }

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

        function createTagEntryModel() {
            $("#tagTRMModel").modal('show');

            $('#hdnSelectedTools').val('');
            $('#lbltagEntryErrorMessage').text('');
            $('#lblconfirmtagEntryErrorMessage').text('');
            $('#dvViewTRMToolEntries').empty();
            var wgId = $('#hdnselectedWgIdNew').val();
            $('#tagentryTitle').text('TAG TRM ENTRIES');
            $('#dvGroupEntry').show();
            $('#tagEntryGroupIcon').show();
            $('#tagentryGroupName').text('Global Group - ' + $('#hdnSelectedWGName').val());
            $('#tagentryTagName').text('Global Tag - ' + $('#selectedTagName').val());
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
                $('#dv' + $('#selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
            }

        }

        function OpenNewGroupDialog() {
            $('#txtNewGroupName').val('');
            $('#lblCreateGroupWarningMessage').text('');
            $('#lblCreateGroupErrorMessage').text('');
            $('#btnCreateGlobalGroup').attr('disabled', 'disabled');
            $('#btnCreateGlobalGroup').removeClass('enabledbutton').addClass('disabledbutton');
            $("#newGroupModel").modal('show');
            $('#InApprWarning').hide();
            $('#hdnIsInAppropriateFlagged').val('False');
            $('#lblInApporipateWarningMessage').html('');
            $('#lblInApporipateWarningMessage1').html('');
            $('#charcounter').text('0/30');
            $('#charcounter').css('color', 'black');
            return false;
        }

        function createNewGroup() {
            //$('#InApprWarning').hide();
            //$('#lblInApporipateWarningMessage').html('');
            //$('#lblInApporipateWarningMessage1').html('');
            //$('#lblCreateGroupWarningMessage').text('');
            var enteredtext = $("#txtNewGroupName").val().trim();

            if (enteredtext.length > 0) {
                $.ajax({
                    url: 'GlobalTagManagement.aspx/createGroup?groupName=' + JSON.stringify($('#txtNewGroupName').val()) + '&IsInAppropriateFlagged=' + JSON.stringify($('#hdnIsInAppropriateFlagged').val()) + '&doDup=0',
                    type: 'GET',
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function (data, status, jqXHR) {
                        if (data != null) {
                            if (data.d.IsAppropriate == true) {
                                $('#InApprWarning').show();
                                var txtMsg = '<p style="text-align:left;">The word(s) "' + $('#txtNewGroupName').val() + '" have been flagged as inappropriate. TRM Admins monitor all site activity.</p><p style="text-align:left;">You may change the name or continue adding the group name if you received this message in error.</p>';
                                $('#lblInApporipateWarningMessage').html(txtMsg);
                                $('#hdnIsInAppropriateFlagged').val('True');
                                $('#lblCreateGroupErrorMessage').text('Inappropriate word detected');
                                $('#lblCreateGroupErrorMessage').show();
                                $('#lblCreateGroupWarningMessage').text('');
                            }
                            else if (!data.d.IsValid) {
                                $('#lblCreateGroupErrorMessage').text(data.d.Message);
                                $('#lblCreateGroupErrorMessage').show();
                                $('#spanDupGroup').text($('#txtNewGroupName').val());
                                if (data.d.Message == "You are already a member of this group") {
                                    $('#dvDupGroupPopup').modal('show');
                                    $('#lblCreateGroupErrorMessage').hide();
                                }
                            }
                            else {
                                $("#newGroupModel").modal('hide');
                                $('#toastSuccess').text('Group created successfully.');
                                $('#goodToast').toast('show').show().delay(3000).fadeOut();
                                getAllGlobalGroups();
                            }
                        }
                    },
                    error: function (jqXHR, status, error) {
                        if (status == 'error') {
                            $('#lblCreateGroupErrorMessage').text('Internal Server Error occured');
                            $('#lblCreateGroupErrorMessage').show();
                        }
                    }
                });
            }
            else {
                $('#lblCreateGroupErrorMessage').text("Name must include visible characters");
                $('#lblCreateGroupErrorMessage').show();
            }
        }

        function getAllGlobalGroups() {

            //var parentDiv = '';
            //parentDiv = '';
            //parentDiv += '<div style="display: inline-block;padding-right:10px;font-size:11px;font-family: Roboto, sans-serif;"><p> You are not a member of any groups.</p></div>';
            //$('#dvGlobalTagsContainer').append(parentDiv);
            $.ajax({
                url: 'GlobalTagManagement.aspx/getAllUserWorkGroups',
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    if (data != null) {
                        if (data.d.IsValid) {
                            var lstWgs = data.d.lstWgs;
                            var lstAllWgTags = data.d.lstAllTags;
                            var lstAllWgMembers = data.d.lstAllWgMembers;
                            //var lstAllWgMembers = JSON.parse($('#ContentPlaceHolder1_hdnlstAllWgMembers').val());
                            $('#dvGlobalTagsContainer').empty();
                            var userId = $('#hdnLoggedInUserId').val();

                            $('#hdnlstWgs').val('');
                            $('hdnlstAllWgTags').val('');
                            $('#hdnlstAllWgMembers').val('');
                            var Counter = 0;
                            var WorkGroupCounter = 0;
                            //spanGroupCount
                            var tagEntryCount = 0;
                            $.each(lstWgs, function (key, val) {
                                WorkGroupCounter++;
                                var wgId = val.GlblGrp_ID;
                                var wgLabel = val.GlblGrp_LABEL;
                                var divId = 'div' + Counter;
                                var groupId = 'Group' + wgId;
                                var u = lstAllWgMembers.find(m => m.GG_ID == wgId && m.UserId == $('#hdnLoggedInUserId').val());

                                var parentDiv = '<div class="col" style="min-width:450px;"><div class="card shadow">';
                                parentDiv += '<div class="card-body">';
                                parentDiv += '<div class="card-title"> ';
                                parentDiv += '<div class="row"><div class="col-1" style="display:inline-block;vertical-align: middle;"> ';
                                //var aRole = 0;
                                if (u != undefined) {
                                    if (u.Role == '1') {
                                        parentDiv += '<div class="CustomButtons" RoleId=' + u.Role + ' Id=' + groupId + '  groupId="' + wgId + '" groupName="' + val.GlblGrp_LABEL + '" style="width:7px;display: inline-block;cursor:pointer;"><i class="fas fa-ellipsis-v grp" style="color: #757575;cursor:pointer;"></i></div>'
                                    }
                                }
                                //parentDiv += '<div class="CustomButtons" RoleId=' + aRole + ' Id=' + groupId + '  groupId="' + wgId + '" groupName="' + val.GlblGrp_LABEL + '" style="width:7px;display: inline-block;cursor:pointer;"><i class="fas fa-ellipsis-v grp" style="color: #757575;cursor:pointer;"></i></div>'
                                parentDiv += '</div>';
                                parentDiv += '<div class="col-10" style="padding-top:3px;display:inline-block;vertical-align: middle;font-family: Roboto, sans-serif;font-size:12px;color: #283154;font-weight:bold;padding-left:0px;white-space: pre-wrap;">' + val.GlblGrp_LABEL;

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
                                    parentDiv += '<span style="cursor: pointer;" title="' + val.Creator + '">...</span>';
                                }
                                parentDiv += '<span style="font-family: Roboto, sans-serif;font-size:9px;color: #283154;font-weight:500;"> on ' + new Date(parseInt(val.CREATED_DATE.substr(6))).toLocaleDateString() + '</span>';
                                parentDiv += '</div></div>'
                                parentDiv += '</div><hr style="border-top:0px;margin:0px"></div>';
                                var counter = 0;

                                var tagsdiv = '';
                                var groupName = "";
                                tagsdiv += '<div class="row" style="padding-top:5px;"><div class="col-12">'

                                var filtertype = $('#ContentPlaceHolder1_hdnSelectedFilterType').val();

                                var filteredTags = _.filter(lstAllWgTags, function (item, i) {
                                    return item.GlblGrp_ID.toString() === wgId.toString()
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
                                    var dbbuttonstemp = 'dvButtonsTag' + val.GlblGrp_ID;
                                    btnId = "btn" + val.TAG_ID;
                                    var dvId = "dv" + val.TAG_ID;
                                    //alert("tagid= " + val.TAG.ID + "ggID= " + val.GlblGrp_ID);
                                    if (wgId == val.GlblGrp_ID) {
                                        var record = _.find(lstAllWgMembers, function (item) { return item.GG_ID === val.GlblGrp_ID });
                                        var wrecord = _.find(lstWgs, function (item) { return item.GlblGrp_ID === val.GlblGrp_ID });
                                        if (wrecord != null) {
                                            groupName = wrecord.GlblGrp_LABEL;
                                        }

                                        if (record != undefined) {
                                            tagsdiv += '<div style="display:inline-block;padding:4px 4px 4px 4px;"><div Id=' + dvId + ' style="display:flex;height:28px;background-color:rgb(220, 230, 250);border-radius:2px;" ><div style="font-size:12px;display:inline-block;border-radius:6px;">'
                                            tagsdiv += '&nbsp;<div RoleId=' + u.Role + ' Id=' + btnId + ' wgId=' + val.GlblGrp_ID + ' tagId=' + val.TAG_ID + ' tagName="' + val.TAG_LABEL + '" groupName="' + groupName + '" entryCount="' + val.EntryCount + '" class="tagellipsisbutton"  style="height:100%;width:7px;float:left;cursor:pointer;padding-left:6px;padding-right:10px;padding-top:5px;"><i class="fas fa-ellipsis-v tag" style="color: #757575;cursor:pointer;"></i></div>'
                                            tagsdiv += '<div id="daTagName"' + val.TAG_ID + ' style="height:100%;float:left;padding-right:10px;padding-top:5px;padding-left:0px;font-size:11px;font-family: Roboto, sans-serif;font-weight:border-radius: 3px;white-space: pre-wrap;cursor:pointer" onclick="javascript:viewTRMEntriesModel(' + val.TAG_ID + ',' + wgId + ',\'' + groupName + '\');return false;">&nbsp;&nbsp;'
                                            tagsdiv += '<i class="fas fa-globe" style="padding-top:3px;padding-right:2px;float:left;"></i >' + val.TAG_LABEL + ' (' + val.EntryCount + ')' + '</div ></div ></div ></div > ';

                                            //tagsdiv += '<div style="display:inline-block;padding:4px 4px 4px 4px;"><div Id=' + dvId + ' style="display:flex;height:28px;background-color:rgb(220, 230, 250);border-radius:2px;" ><div style="font-size:12px;display:inline-block;border-radius:6px;">'
                                            //tagsdiv += '&nbsp;<div RoleId=' + u.Role + ' Id=' + btnId + ' wgId=' + val.GlblGrp_ID + ' tagId=' + val.TAG_ID + ' tagName="' + val.TAG_LABEL + '" groupName="' + groupName + '" entryCount="' + val.EntryCount + '" class="tagellipsisbutton"  style="height:100%;width:7px;float:left;cursor:pointer;padding-left:6px;padding-right:10px;padding-top:5px;"><i class="fas fa-ellipsis-v tag" style="color: #757575;cursor:pointer;"></i></div>'
                                            //tagsdiv += '<div id="daTagName"' + val.TAG_ID + ' style="height:100%;float:left;padding-right:10px;padding-top:5px;padding-left:0px;font-size:11px;font-family: Roboto, sans-serif;font-weight:border-radius: 3px;white-space: pre-wrap;cursor:pointer" onclick="javascript:viewTRMEntriesModel(' + true + ',' + val.TAG_ID + ',' + val.GlblGrp_ID + ',\'' + groupName + '\');return false;">&nbsp;&nbsp;'
                                            //tagsdiv += '<i class="fa-solid fa-globe" style="padding-top:3px;padding-right:2px;float:left;"></i >' + val.TAG_LABEL + ' (' + val.EntryCount + ')' + '</div></div></div></div> ';
                                            counter++;
                                        }
                                    }
                                });


                                tagsdiv += '</div>';
                                tagsdiv += '</div>';

                                parentDiv += '<div class="card-text showdiv" id="' + divId + '"  >'
                                parentDiv += '<div class="row"><div class="col-7"><span style="font-family: Roboto;font-size:10px;font-weight:bold">&nbsp;&nbsp;GLOBAL TAGS&nbsp;(' + counter + ')</span></div><div class="col-5" style="padding-left:30px;">';

                                u1 = lstAllWgMembers.find(m => m.GG_ID == wgId && m.UserId == $('#hdnLoggedInUserId').val());
                                if (u1 != undefined) {
                                    var btnId = 'btnaddNewWGTag' + wgId;
                                    if (u1.Role == '1' || u1.Role == '2') {
                                        parentDiv += '<button id="' + btnId + '" onclick="javascript:openGlobalTagModel(' + wgId + ');return false;" class="newtagbutton"><i class="fas fa-plus" style="color:#283154"></i> &nbsp;&nbsp;NEW TAG</button>';
                                    }                                    
                                }
                                //if (aRole == '1' || aRole == '2') {
                                //    parentDiv += '<button id="' + btnId + '" onclick="javascript:openGlobalTagModel(' + wgId + ');return false;" class="newtagbutton"><i class="fas fa-plus" style="color:#283154"></i> &nbsp;&nbsp;NEW TAG</button>';
                                //}
                                parentDiv += '</div></div>'
                                parentDiv += tagsdiv;
                                parentDiv += '</div>';
                                parentDiv += '</div><span class="horizontallinecardbody" style="margin-left:10px;margin-right:10px;"></span>';
                                parentDiv += '<div class="card-body"><div class="row"> <div class="col-7"></div><div class="col-5" style="padding-right:0px;padding-left:30px">'
                                u = lstAllWgMembers.find(m => m.GG_ID == wgId && m.UserId == $('#hdnLoggedInUserId').val());
                                var btnId = "btnMembers" + val.GlblGrp_ID;
                                if (u != undefined) {
                                    if (u.Role == '1') {
                                        parentDiv += '<button id="' + btnId + '" wgLabel="' + wgLabel + '" onclick="getWGMembersById(' + val.GlblGrp_ID + ');return false;" class="membersbutton" ><i class="fas fa-users"></i>&nbsp;&nbsp;MEMBERS</button>';
                                    }
                                }
                                //if (aRole == '1') {
                                //    parentDiv += '<button id="' + btnId + '" wgLabel="' + wgLabel + '" onclick="getWGMembersById(' + val.GlblGrp_ID + ');return false;" class="membersbutton" ><i class="fas fa-users"></i>&nbsp;&nbsp;MEMBERS</button>';
                                //}
                                parentDiv += '</div> </div> </div></div>';
                                Counter++;
                                $('#dvGlobalTagsContainer').append(parentDiv);
                            });
                            $('#spanGroupCount').text(WorkGroupCounter);
                            if (WorkGroupCounter == 0) {
                                parentDiv = '';
                                parentDiv += '<div style="display: inline-block;padding-right:10px;font-size:11px;font-family: Roboto, sans-serif;"><p> You are not a member of any groups.</p></div>';
                                $('#dvGlobalTagsContainer').append(parentDiv);
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

                                    $('#hdnSelectedWgId').val(groupId);
                                    $('#hdnSelectedWGName').val(groupName);

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
                                    var top = btn1.offset().top + btn1.outerHeight()-5;
                                    var left = btn1.offset().left;
                                    var topcalc;
                                    if ($('#UpdateBanner').is(':visible')) {
                                        topcalc = top - 120;
                                    }
                                    else {
                                        topcalc = top - 100;
                                    }
                                    $('.grouppop').css('top', topcalc);
                                    $('.grouppop').css('left', left);
                                    $('#dvGroupPopup').show();
                                }
                            });

                            $('.tagellipsisbutton').click(function () {
                                $('#tagentryGroupName').show();
                                $('#spanTaggedGroupName').show();
                                $('#dvTaggedGroupName').show();
                                $('#hdnSelectedWGId').val(0);
                                var btnid = $(this).attr('tagId');
                                $('#dv' + $('#selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                                let show = true;
                                //Selected the already selected tag
                                if (btnid == $('#selectedTagId').val()) {
                                    if ($('#dvTagPopup').is(':visible')) {
                                        $('#dv' + $('#selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                                        $('#dvTagPopup').hide();
                                        show = false; //We just closed the already visible pop up so don't show again
                                    }
                                }
                                if (btnid != $('#selectedTagId').val() ||
                                    (btnid == $('#selectedTagId').val() && show)) {
                                    var tagId = $('#btn' + btnid).attr('tagId');
                                    var tagName = $('#btn' + btnid).attr('tagName');
                                    var wgId = $('#btn' + btnid).attr('wgId');
                                    var RoleId = $('#btn' + btnid).attr('RoleId');
                                    var groupName = $('#btn' + btnid).attr('groupName');

                                    $('#selectedTagId').val(tagId);
                                    $('#selectedTagName').val(tagName);
                                    $('#hdnSelectedWgId').val(wgId);
                                    $('#hdnselectedWgIdNew').val(wgId);

                                    $('#hdnSelectedWGName').val(groupName);

                                    $('#dv' + tagId).css('background-color', 'rgb(205, 207, 215)');

                                    //$('#hdnSelectedWGName').val($('#Group' + wgId).attr('groupname'));
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
                                    var left = btn1.offset().left - 2;

                                    if (left > $('#content-main').width()) {
                                        var diff = (left - $('#content-main').width()) - 10;
                                        left = left - diff;
                                    }
                                    var topcalc;
                                    if ($('#UpdateBanner').is(':visible')) {
                                        topcalc = top - 120;
                                    }
                                    else {
                                        topcalc = top - 100;
                                    }
                                    $('.tagpop').css('top', topcalc);
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
                    //trmUtil.sh00000000000owSpinner(false, $('#' + config.spinnerElId)[0]);
                    //trmUtil.showHandledResponseErrors(config.containerId, jqXHR, status, error);
                }
            });

        }

        function createWgTag() {
            $('#InApprWgTagWarning').hide();
            $('#lblInApporipateWgTagWarningMessage').html('');
            $('#lblInApporipateWgTagWarningMessage1').html('');
            $('#lblCreateWgTagWarningMessage').text('');
            $('#lblCreateWgTagErrorMessage').text('');
            var wgId = $('#hdnWgId').val();
            var charlength = $('#txtNewWgTagName').val().trim().length;

            if (charlength > 0) {
                $.ajax({
                    url: 'GlobalTagManagement.aspx/createWgTag?tagName=' + JSON.stringify($('#txtNewWgTagName').val()) + '&WgId=' + $('#hdnWgId').val() + '&IsInAppropriateFlagged=' + JSON.stringify($('#hdnIsInAppropriateFlagged').val()),
                    type: 'GET',
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function (data, status, jqXHR) {
                        if (data != null) {
                            if (data.d.IsAppropriate == true) {
                                $('#InApprWgTagWarning').show();
                                var txtMsg = '<p style="text-align:left;">The word(s) "' + $('#txtNewWgTagName').val() + '" have been flagged as inappropriate. TRM Admins monitor all site activity.</p><p style="text-align:left;">You may change the name or continue adding the tag if you received this message in error.</p>';
                                $('#lblInApporipateWgTagWarningMessage').html(txtMsg);
                                $('#hdnIsInAppropriateFlagged').val('True');
                                $('#lblCreateWgTagErrorMessage').text('Inappropriate word detected');
                                $('#lblCreateWgTagWarningMessage').text('');
                            }
                            else if (!data.d.IsValid) {
                                $('#lblCreateWgTagErrorMessage').text(data.d.Message)
                                if (data.d.Message == "You are not authorized to perform this action") {
                                    $('#toastError').text('You are not authorized to perform this action');
                                    $('#burntToast').toast('show').show().delay(3000).fadeOut();
                                    closeNewWGTagModel();
                                    //getAllUserWorkGroups();
                                }
                            }
                            else {
                                if ($('#hdnSelectedWGId').val() == '-1') {
                                    $('#toastSuccess').text('Tag created successfully.');
                                    $('#goodToast').toast('show').show().delay(3000).fadeOut();
                                }
                                else {
                                    $('#toastSuccess').text('Tag created successfully.');
                                    $('#goodToast').toast('show').show().delay(3000).fadeOut();
                                }
                                //getPersonalTags();
                                getAllGlobalGroups();
                                closeNewWGTagModel();
                            }
                        }
                    },
                    error: function (jqXHR, status, error) {
                        if (status == 'error') {
                            $('#toastError').text('Internal Server Error occured');
                            $('#burntToast').toast('show');
                        }
                    }
                });
            }
            else {
                $('#lblCreateWgTagErrorMessage').text('Name must include visible characters');
                $('#lblCreateWgTagErrorMessage').show();
            }
        }

        function openGlobalTagModel(wgId) {
            $('#hdnSelectedWGId').val(wgId);
            $('#hdnWgId').val(wgId);
            var wgId2 = $('#hdnWgId').val();
            $('#txtNewWgTagName').val('');
            $('#lblInApporipateWgTagWarningMessage').html('');
            $('#lblInApporipateWgTagWarningMessage1').html('');
            $('#lblCreateWgTagErrorMessage').text('');
            $('#lblCreateWgTagWarningMessage').text('');
            $('#InApprWgTagWarning').hide();
            $('#btnCreateWgTag').attr('disabled', 'disabled');
            $('#btnCreateWgTag').removeClass('enabledbutton').addClass('disabledbutton');
            $('#charWgTagcounter').text('0/30');
            $('#charWgTagcounter').css('color', 'black');
            $('#lblCreateWgTagWarningMessage').text('');
            $('#ContentPlaceHolder1_hdnIsInAppropriateFlagged').val('False');
            $('#newGlobalTagModel').modal('show');
        }
        function closeNewWGTagModel() {
            $('#newGlobalTagModel').modal('hide');
        }

        function createGlobalTagEntryModel(wgId) {
            $('#tagTRMModal').modal("show");
            $('#lbltagEntryErrorMessage').text('');
            $('#lblconfirmtagEntryErrorMessage').text('');
            $('#dvViewTRMToolEntries').empty();

            $('#hdnTagsByWgId').val(wgId);
            $('#hdnWgId').val(wgId);

            $('#tagentryTitle').text('TAG A GLOBAL TRM ENTRY');
            $('#dvGroupEntry').show();
            $('#tagEntryGroupIcon').show();
            $('#tagentryGroupName').text('Global Group - ' + $('#Group' + wgId).attr('groupName'));

            $('#txtToolEntry').val('');
            $('#dvTagPopup').hide();
            $('#selectedToolTagtoApply').text('');
            $('#btnApplyTag').removeClass('enabledbutton').addClass('disabledbutton');
            $('#btnApplyTag').attr('disabled', 'disabled');
            $('#btnCreateWgTag').attr('enabled', 'enabled');
            $('#btnCreateWgTag').removeClass('disabledbutton').addClass('enabledbutton');
        }

        function closeGlobalTagModel() {
            $('#dv' + $('#selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
            $("#txtDeleteTagName2nd").val("");
            $('#btnDeleteWorkTag2nd').attr('disabled', 'disabled');
            $('#btnDeleteWorkTag2nd').removeClass('deleteenabledbutton').addClass('disabledbutton');
            $("#deleteTagModel2nd").hide();
        }

        function getToolEntries() {

            $('#hdnSelectedToolId').val('');
            $('#selectedToolTagtoApply').text('');

            $('#btnApplyTag').removeClass('enabledbutton').addClass('disabledbutton');
            $('#btnApplyTag').attr('disabled', 'disabled');

            if ($('#txtToolEntry').val().trim() != "") {
                $('#spinnersearch').removeClass('d-none');
                $('#btnSearch').attr('disabled', 'disabled');
                $('#txtToolEntry').attr('disabled', 'disabled');
                $('#entryNameLbl').addClass('entryNameStyle');
                $.ajax({
                    url: 'GlobalTagManagement.aspx/getToolEntries?toolText=' + JSON.stringify($('#txtToolEntry').val().trim()) + '&tagId=' + JSON.stringify($('#selectedTagId').val()),
                    type: 'GET',
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function (data, status, jqXHR) {
                        $('#spinnersearch').addClass('d-none');
                        if (data != null) {
                            $('#dvViewTRMToolEntries').empty();
                            var parentDiv = '';
                            //parentDiv = '<div class="row" style="font-family: Roboto;padding-top:10px;padding-bottom:10px;font-size:11px;color:black;"><div class="col-12 style="font-family: Roboto;font-size:11px;color:black;">This is Test </div></div>';
                            //$('#dvViewTRMToolEntries').append(parentDiv);
                            parentDiv = '';

                            if (data.d.lstgTools != null) {
                                parentDiv += '<div class="row" style="font-family: Roboto;padding-top:10px;padding-bottom:10px;font-size:11px;color:black;"><div class="col-12 style="font-family: Roboto;font-size:11px;color:black;"> Found ' + data.d.lstgTools.length + ' entries in the TRM </div></div>';

                                //parentDiv += '<table class="table" style="font-family: Roboto;padding-top:10px;padding-bottom:10px;font-size:11px;color:black;"><thead><tr><th scope="col">#</th><th scope="col">Entry Name</th><th scope="col">Owner</th></tr></thead><tbody>';

                                //$.each(data.d.lstTools, function (key, val) {

                                //    var aid = 'a' + val.Tool_Id;
                                //    var hdnId = 'hdn' + val.Tool_Id;
                                //    var alink = '<a href="#">' + val.Tool_Name + '</a>';
                                //    parentDiv += '<tr><th scope="row"><input type="checkbox" id="' + aid + '" toolName="' + val.Tool_Name + '" onclick="javascript:selectedTool(' + val.Tool_Id + ');return false;"/></th><td>' + val.Tool_Name + '</td><td><input type="hidden" id="' + hdnId + '" name="' + hdnId + '" value="' + val.Tool_Name+'">' + val.toolOwner+'</td>';
                                //});

                                //parentDiv += '</tr></tbody></table>';

                                parentDiv += '<div class="container"><div class="row" id="dvheader" style="border-style:solid;border-width:1px;border-color:lightgrey;"> <div class="col-sm-1"></div> <div class="col-sm-8" style="padding-top:5px"> <label>Entry Name</label></div><div class="col-sm-3" style="padding-top:5px"><label>Owner</label></div></div>';


                                $.each(data.d.lstgTools, function (key, val) {
                                    var aid = 'a' + val.Tool_Id;
                                    var dvid = 'dv' + val.Tool_Id;
                                    var hdnId = 'hdn' + val.Tool_Id;
                                    var hdnToolDesc = 'hdnToolDesc' + val.Tool_Id;
                                    var chk = 'chk' + val.Tool_Id;
                                    parentDiv += ' <div class="row  "';

                                    parentDiv += 'id="' + dvid + '" toolId="' + val.Tool_Id + '" style="border-style:solid;border-width:1px;border-color:lightgrey;';
                                    //if ($('#hdnLoggedInUserOrgName').val() != val.toolOwner) {
                                    //    parentDiv += 'background-color:#f5f5f5';
                                    //}

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
                                    parentDiv += '><label style="font-weight: normal; padding-top: 9px; ';
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
                        $('#burntToast').toast('show');
                        $('#btnSearch').removeAttr('disabled');
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
            //$('#hdnSelectedTools').val(toolName.trim());
            // $('#selectedTagId').val('a' + toolId);
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

            $('#dv' + $('#selectedTagId').val()).css('background-color', 'rgb(205, 207, 215)')
            $('#lbltagEntryErrorMessage').text('');
            $('#lblconfirmtagEntryErrorMessage').text('');

            if (gselectedTools.length == 0) {
                $('#selectedToolTagtoApply').text('');
                $('#btnApplyTag').removeClass('enabledbutton').addClass('disabledbutton');
                $('#btnApplyTag').attr('disabled', 'disabled');
            }
            else if (gselectedTools.length == 1) {
                toolName = gselectedTools[0].ToolName;
                $('#selectedToolTagtoApply').text('Add tag "' + $('#selectedTagName').val() + '" to TRM entry "' + toolName + '"');
                $('#btnApplyTag').removeClass('disabledbutton').addClass('enabledbutton');
                $('#btnApplyTag').removeAttr('disabled');
            }
            else if (gselectedTools.length > 1) {
                $('#selectedToolTagtoApply').text('Add tag "' + $('#selectedTagName').val() + '" to ' + gselectedTools.length + ' TRM entries.');
                $('#btnApplyTag').removeClass('disabledbutton').addClass('enabledbutton');
                $('#btnApplyTag').removeAttr('disabled');
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
                $('#dv' + $('#selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
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
                //parentDiv += '<div style="text-decoration: none; font-family: Roboto;font-size:11px;padding-left:30px;" class="list-group-item"><div>' + val.ToolName +'</div></div>'
                parentDiv += '<div style="font-family: Roboto;font-size:11px;padding-left:10px;" class="list-group-item" >';
                parentDiv += '<a href="ToolPage.aspx?tid=' + val.ToolId + '" onclick = "javascript:openToolPage(' + val.ToolId + ')" class="daLink" style="color:#4169e1;font-family: Roboto;font-size:12px;">' + val.ToolName + '</a>';
                parentDiv += '<i id = "' + val.ToolId + '" description = "' + val.ToolDescription + '" class="fa fa-info-circle entryDesc" style="padding-left:7px;cursor:pointer;font-size:12px;"></i></div>';
            });

            $('#dvTRMTaggedEntries').append(parentDiv);
            $('.fa-info-circle').click(function () {
                if ($('#entryDescription').is(':visible')) {
                    $('#entryDescription').hide();
                }
                else {
                    var btn1 = $('#dvAffectedEntries');
                    $('#description').empty();
                    let desc = $(this).attr('description');
                    desc = desc.replace(/<br>/g, '<br class="entryDescPopup">');
                    desc = desc.replace(/<b>/g, '<b class="entryDescPopup">');
                    $('#description').append(desc);
                    $('#entryDescription').css('position', 'absolute');
                    var top = $('#entryDescription').offset().top + 270;
                    var left = $('#entryDescription').offset().left + 75;
                    if (left > $('#content-main').width()) {
                        var diff = (left - $('#content-main').width()) - 10;
                        left = left - diff;
                    }
                    $('#description').css("max-height", 150 + 'px');
                    $('#entryDescription').css("height", 195 + 'px');
                    $('#entryDescription').css("width", 350 + 'px');
                    $('#entryDescription').css('top', (top - 100));
                    $('#entryDescription').css('left', left);

                    $('#entryDescription').show();
                    $('#description').scrollTop(0);

                }
            });
            if (gselectedTools.length > 1) {
                $("#applyTRMTagEntries").modal('show');
                applyTRMTagEntries();
            }
            else if (gselectedTools.length == 1){
                ConfirmapplyTag();
            }
        }

        function openToolPage(tid) {
            $('#dv' + $('#selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
            $("#tagTRMModel").modal('hide');
            $("#viewTRMModel").modal('hide');
            if ($('#applyTRMTagEntries').is(':visible'))
                $("#applyTRMTagEntries").modal('hide');
            // var pageUrl = '\ToolPage.aspx?tid=' + tid;
            // window.open(pageUrl, "_top");
        }

        function cancelTRMTagEntries() {
            $('#tagTRMModel').modal('show');
            $("#applyTRMTagEntries").modal('hide');
        }

        function applyTRMTagEntries() {
            $('#confirmtagEntryTitle').text("TAG TRM ENTRIES");
            $('#confirmtagEntryText').html("The tag <b>" + $('#selectedTagName').val() + "</b> will be applied to the following entries.");
        }
        function ConfirmapplyTag() {
            $('#hdnTriggerModal').val(2);
            var tagId = $('#selectedTagId').val();
            var wgId = $('#hdnselectedWgIdNew').val();
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
                url: 'GlobalTagManagement.aspx/applyTag?tagId=' + JSON.stringify(tagId) + '&wgId=' + JSON.stringify(wgId) + '&selectedTools=' + JSON.stringify(selectedTools),
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    if (data.d.IsValid) {
                        $('#toastSuccess').text('Tag(s) applied successfully.');
                        $('#goodToast').toast('show').show().delay(3000).fadeOut();
                        $("#tagTRMModel").modal('hide');
                        $("#applyTRMTagEntries").modal('hide');
                        $('#dv' + $('#selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
                        getAllGlobalGroups();
                    }
                    else {
                        $('#toastError').text(data.d.Message);
                        $("#burntToast").show().delay(5000).fadeOut();
                        if (data.d.Message == "You are not authorized to perform this action") {
                            $('#toastError').text('You are not authorized to perform this action');
                            $('#burntToast').toast('show').show().delay(3000).fadeOut();
                            closetagTRMModel();
                            getAllGlobalGroups();
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
        /*
            Key Pressed functions
        */

        function getWGMembersById(wgId) {
            $('#btnDone').children('.anotherripple').remove();
            $('#btnDone').removeClass('anotherripple');
            $('#hdnSelectedWgId').val(wgId);
            $('#spanselectedGroupName').text($('#Group' + wgId).attr('GroupName'));
            $('#lblErrorMessage').text('');
            $('#lblSuccessMessage').text('');
            $('#lblErrorMessage').hide();
            $('#lblSuccessMessage').hide();
            refreshWorkGroupMembers(wgId, 0);
            return false;
        }


        function refreshWorkGroupMembers(wgId, scrollPosition) {
            $('#hdnTriggerModal').val(1);
            $.ajax({
                url: 'GlobalTagManagement.aspx/getMemberList?WgId=' + wgId,
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    var winHeight = parseFloat($(window).height());
                    var maxheight = parseFloat(winHeight - 525);
                    if (maxheight < 100) {
                        maxheight = 100;
                    }
                    var results = data;
                    results = results.d ? results.d : results;
                    var tblmember = '<div id="tabhead"><table style="width:100%;font-family: Roboto;font-size: 12px;"><tr> <td style="padding-bottom:10px;width:38%;padding-left:8px;">NAME</td>  <td style="padding-bottom:10px;width:30%;padding-left:8px;">EMAIL</td> <td style="padding-bottom:10px;width:28%;padding-left:8px;">ROLE<i class="fa fa-info-circle infoButton" onClick="javascript:displayRoleInfo()"></i></td> <td style="padding-bottom:10px;width:4%"></td> </tr><tr style="border-bottom-width: thin;border-color:lightgrey;"></table></div> ';
                    tblmember += ' <div id="tabbody" style="width:100%;max-height:' + maxheight + 'px;overflow-y:auto;overflow-x:hidden"><table> ';
                    var selectId = '';
                    for (var i = 0; i < results.length; i++) {
                        var rec = results[i];
                        selectId = "ddlRole" + rec.TAG_MEMBER_ID;
                        tblmember += '<tr style="border-bottom-width: thin;border-color:lightgrey;">';
                        tblmember += '<td class="" style="font-family: Roboto;font-size:12px;width:290px;font-color:grey;padding-left:8px;">' + rec.FullName + '</td>';
                        tblmember += '<td class="" style="font-family: Roboto;font-size:12px;width:230px;font-color:grey;padding-left:8px;">' + rec.Email + '</td>';
                        tblmember += '<td class="" style="font-family: Roboto;font-size:12px;width:175px;font-color:grey;padding-left:8px;"><input type="hidden" id="" value=""><select style="font-family: Roboto;font-size:12px;border-bottom-width:3px;border-bottom-color:darkgrey;" UserId="' + rec.UserId + '" onchange="javascript:roleChange(' + rec.TAG_MEMBER_ID + ',' + rec.Role + ')" class="form-select form-select roleoption" id="' + selectId + '">';
                        if (rec.Role == 1) { tblmember += '<option value ="1" selected >Owner</option >' } else { tblmember += '<option value ="1">Owner</option >' };
                        if (rec.Role == 2) { tblmember += '<option value ="2" selected >Global Tag Manager</option >' } else { tblmember += '<option value ="2">Global Tag Manager</option >' };
                        tblmember += '</select>'
                        tblmember += '<td class="" style="font-family: Roboto;font-size:12px;width:50px;padding-left:28px;"><div id="clickableDisabledTrash"></div><button style="border-width:0px;background-color:white;" UserId="' + rec.UserId + '" onclick="javascript:deleteTagMember(' + rec.TAG_MEMBER_ID + ',' + wgId + ');return false;" id="LockButton" class="fas fa-trash LockButton"> </button></td>';
                        tblmember += '</tr>'
                    }
                    //New Tag - Owner and Contributor
                    //Member - Owner
                    tblmember += '</table></div>';
                    $('#dvMembersList').empty();
                    $('#dvMembersList').append(tblmember);
                    $('#tabbody').scrollTop(scrollPosition);
                    $("#MembersModel").modal('show');
                    $("#MembersModel").css('overflow-y', 'auto');
                    $("#MembersModel").focus();
                    var enteredText = $("#txtMemberName").val().trim();
                    if (enteredText.length == 0) {
                        $('#btnAddMember').attr('disabled', 'disabled');
                        $('#btnAddMember').removeClass('membersDialogButton').addClass('disabledmembersDialogButton');
                        $('#DisplayEmailText').text('');
                    }
                    $('.roleoption').click(function () {
                        $('#lblErrorMessage').val('');
                        $('#lblSuccessMessage').val('');
                        $('#lblErrorMessage').hide();
                    });
                },
                error: function (jqXHR, status, error) {
                    if (status == 'error') {
                        $('#lblErrorMessage').text('Internal Server Error occured');
                        $('#lblErrorMessage').show().delay(5000).hide("slow");
                    }
                }
            });

        }

        function btnDoneChange() {
            getAllGlobalGroups();
            closePopUps();
            $("#MembersModel").modal('hide');
            /* if ($('#hdnSelectedEmailId').val().trim() != '') {
                 $("#unsavedText").text("You have validated an email address without adding the user as a member. Select CANCEL to go back and make changes or DISCARD to leave without adding the member.");
                 $('#unsavedCancel').removeClass();
                 $('#unsavedDiscard').removeClass();
                 $('#unsavedDiscard').addClass('deleteenabledbutton');
                 $('#unsavedCancel').addClass('cancelButton');
                 $("#unsavedSave").css('display', 'none');
                 $("#unsavedChanges").addClass('fade');
                 $("#unsavedChanges").modal('show');
             } else {*/
            $('#txtMemberName').val('');
            $('.typeahead').typeahead('val', '');
            $('#DisplayEmailText').text('');
            $('#txtMemberNameLabel').removeClass('moveLabel');
            // }
        }

        function displayEmailIdInfo() {
            var enabled = false;
            if ($('#dvEmailIdInfo').is(':visible')) {
                $('#dvEmailIdInfo').hide();
                $('#clickableDisabledTrash').css({ 'width': '0px', 'height': '0px' });
                $('.LockButton').each(function () {
                    $(this).removeAttr('disabled');
                });
                var enteredText = $("#txtMemberName").val().trim();
                if ($('#hdnSelectedEmailId').val().trim() == '') {
                    $('#btnAddMember').attr('disabled', 'disabled');
                    $('#btnAddMember').removeClass('membersDialogButton').addClass('disabledmembersDialogButton');
                }
                else {
                    enabled = true;
                    $('#btnAddMember').removeAttr('disabled');
                    $('#btnAddMember').removeClass('disabledmembersDialogButton').addClass('membersDialogButton');
                }
            }
            else {
                enabled = false;
                $('#clickableDisabledTrash').css({ 'width': '20px', 'height': '20px' });
                $('.LockButton').each(function () {
                    $(this).attr('disabled', 'disabled');
                });
                $('#btnAddMember').attr('disabled', 'disabled');
                $('#btnAddMember').removeClass('membersDialogButton').addClass('disabledmembersDialogButton');

                $('#dvEmailIdInfo').css('position', 'absolute');
                var btn1 = $('#MembersModel');
                var modalTopScroll = $('#MembersModel').scrollTop();
                var modalLeftScroll = $('#MembersModel').scrollLeft();
                var top = (btn1.offset().top - (window.scrollY - modalTopScroll)) + 114;
                var left = (btn1.offset().left - (window.scrollX)) + 325;

                if (left > $('#content-main').width()) {
                    var diff = (left - $('#content-main').width()) - 10;
                    left = left - diff;
                }
                $('#dvEmailIdInfo').css('top', (top - 100));
                $('#dvEmailIdInfo').css('left', left);
                $('#dvRolePopup').hide();
                $('#dvEmailIdInfo').show();
            }
            enableClickonDisabled(enabled);
        }

        function enableClickonDisabled(enabled) {
            if (enabled == true) {
                $('#clickableDisabledAddMember').css({ 'width': '0px', 'height': '0px' });
            } else {
                $('#clickableDisabledAddMember').css({ 'width': '170px', 'height': '35px' });
            }
        }

        function closeEmailIdInfo() {
            $("#dvEmailIdInfo").hide();
            var enteredText = $("#txtMemberName").val().trim();
            var enabled = false;
            if ($('#hdnSelectedEmailId').val().trim() == '') {
                $('#btnAddMember').attr('disabled', 'disabled');
                $('#btnAddMember').removeClass('membersDialogButton').addClass('disabledmembersDialogButton');
            }
            else {
                enabled = true;
                $('#btnAddMember').removeAttr('disabled');
                $('#btnAddMember').removeClass('disabledmembersDialogButton').addClass('membersDialogButton');
            }
            $('#clickableDisabledTrash').css({ 'width': '0px', 'height': '0px' });
            $('.LockButton').each(function () {
                $(this).removeAttr('disabled');
            });
            enableClickonDisabled(enabled);
        }

        function addMember() {
            var wgId = $('#hdnSelectedWgId').val();
            var email = $('#hdnSelectedEmailId').val().trim();
            $('#lblErrorMessage').text('');
            $('#lblSuccessMessage').text('');
            $('#DisplayEmailText').text('');
            $('#lblErrorMessage').hide();
            $('#lblSuccessMessage').hide();
            $('#DisplayEmailText').hide();
            $('#txtMemberName').val('');
            $('.typeahead').typeahead('val', '');
            $('#txtMemberNameLabel').removeClass('moveLabel');
            $('#spinnerValidateUser').removeClass('d-none');
            $('#btnAddMember').attr('disabled', 'disabled');
            $('#btnAddMember').removeClass('membersDialogButton').addClass('disabledmembersDialogButton');

            $.ajax({
                url: 'GlobalTagManagement.aspx/addNewMember?wgId=' + JSON.stringify(wgId) + "&email=" + JSON.stringify(email),
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    $('#spinnerValidateUser').addClass('d-none');
                    $('#txtMemberName').val('');
                    $('.typeahead').typeahead('val', '');
                    $('#txtMemberNameLabel').removeClass('moveLabel');
                    $('#hdnSelectedEmailId').val('');
                    if (data != null) {
                        if (!data.d.IsValid) {
                            $('#lblSuccessMessage').hide();
                            $('#DisplayEmailText').hide();
                            $('#lblErrorMessage').text(data.d.Message);
                            $('#lblErrorMessage').show().delay(5000).fadeOut();
                        }
                        else {
                            getWGMembersById(wgId);
                            $('#txtMemberName').val('');
                            $('.typeahead').typeahead('val', '');
                            $('#txtMemberNameLabel').removeClass('moveLabel');
                            $('#lblSuccessMessage').text(' Member added successfully.');
                            $('#lblSuccessMessage').show().delay(3000).fadeOut();
                        }
                    }
                },
                error: function (jqXHR, status, error) {
                    $('#spinnerValidateUser').addClass('d-none');
                    if (status == 'error') {
                        $('#lblErrorMessage').text("Internal data error");
                        $('#lblErrorMessage').show().delay(5000).fadeOut();
                    }
                }
            });
            $("#MembersModel").focus();
            return false;
        }
        function getMatchedEmail() {
            var emailList = $('#hdnTRMUsers').val();
            return emailList;
        }
        var emailMatcher = function (strs) {
            return function findMatches(q, cb) {
                var matchedEmails;
                matchedEmails = [];
                var enteredText = $('#txtMemberName').val().trim();
                substrRegex = new RegExp(enteredText, 'i');
                let jsonEmailList = JSON.parse(strs);
                $.each(jsonEmailList, function (i, str) {
                    let checkAgainst = str.FirstName + ' ' + str.LastName;
                    if (substrRegex.test(checkAgainst)) {
                        matchedEmails.push(str);
                    }
                });
                cb(matchedEmails);
            };
        };
        function closeMemberModel() {
            closePopUps();
            $("#MembersModel").modal('hide');
            /* if ($('#hdnSelectedEmailId').val().trim() != '') {
                 $("#unsavedText").text("You have validated an email address without adding the user as a member. Select CANCEL to go back and make changes or DISCARD to leave without adding the member.");
                 $('#unsavedCancel').removeClass();
                 $('#unsavedDiscard').removeClass();
                 $('#unsavedDiscard').addClass('deleteenabledbutton');
                 $('#unsavedCancel').addClass('cancelButton');
                 $("#unsavedSave").css('display', 'none');
                 $("#unsavedChanges").addClass('fade');
                 $("#unsavedChanges").modal('show');
             } else {*/
            $('#txtMemberName').val('');
            $('.typeahead').typeahead('val', '');
            $('#txtMemberNameLabel').removeClass('moveLabel');
            $('#DisplayEmailText').text('');
            // }
        }

        function roleChange(wgMemberId, origRole) {
            var id = 'ddlRole' + wgMemberId;
            var selectedRole = $('select#' + id + ' option:selected').val();
            var userId = $('#' + id).attr('UserId');
            var loggedInUser = $('#hdnLoggedInUserId').val();
            const daRoles = ["Owner", "Global Tag Manager"];
            $('#lblRole').text(daRoles[selectedRole - 1]);
            $('#lblErrorMessage').text('');
            $('#lblSuccessMessage').text('');
            $('#lblErrorMessage').hide();
            $('#lblSuccessMessage').hide();
            $('#Dwntruebtn').unbind('click');

            if (origRole == selectedRole) {
                // do nothing
            } else if (origRole > selectedRole) {
                changeRole(wgMemberId, selectedRole, userId, origRole);
            } else {
                // Owner to tag manager or viewer
                if (origRole == 1 && userId == loggedInUser) {
                    $('#checkDowngradeMember').modal('show');
                    $('#checkDowngradeMember').focus();
                    $("#MembersModel").modal('hide');
                    $('#Dwntruebtn').on('click', function () {
                        $("#checkDowngradeMember").modal('hide');
                        changeRole(wgMemberId, selectedRole, userId, origRole);
                        $("#MembersModel").modal('hide');
                    });
                    // actually closed on the button
                    $('#Dwnfalsebtn').on('click', function () {
                        $("#checkDowngradeMember").modal('hide');
                        $("#MembersModel").modal('show');
                        refreshWorkGroupMembers($('#hdnSelectedWgId').val(), 0);
                    });
                } else {
                    // Tag manager to viewer
                    changeRole(wgMemberId, selectedRole, userId, origRole);
                };
            }
            return false;
        }
        function changeRole(wgMemberId, selectedRole, member, origRole) {
            $.ajax({
                url: 'GlobalTagManagement.aspx/UpdateRoleChange?&wgMemberId=' + JSON.stringify(wgMemberId) + '&WgId=' + $('#hdnSelectedWgId').val() + '&roleId=' + selectedRole + '&origRole=' + origRole + '&member=' + JSON.stringify(member),
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    if (data != null) {
                        if (!data.d.IsValid) {
                            //data.d.Message
                            if (data.d.IsOwnerChanged) {
                                $("#MembersModel").modal('hide');
                                getAllGlobalGroups();
                            }
                            else {
                                $('#lblErrorMessage').text(data.d.Message);
                                $('#lblErrorMessage').show().delay(3000).fadeOut();
                                $('#lblSuccessMessage').hide();
                                refreshWorkGroupMembers($('#hdnSelectedWgId').val(), 0);
                            }
                        }
                        else {
                            $('#lblSuccessMessage').text(data.d.Message)
                            $("#lblSuccessMessage").show().delay(3000).fadeOut();
                            var prePos = $('#tabbody').scrollTop();
                            refreshWorkGroupMembers($('#hdnSelectedWgId').val(), prePos);
                        }
                    }
                },
                error: function (jqXHR, status, error) {
                    if (status == 'error') {
                        $('#lblErrorMessage').show();
                        $('#lblErrorMessage').text('Internal Server Error occured');
                        // $('#toastError').text('Internal Server Error occured');
                        //$('#burntToast').toast('show');
                    }
                }
            });

            return false;
        }

        function deleteTagMember(WgMemberId, wgId) {
            var id = 'ddlRole' + WgMemberId;
            var userId = $('#' + id).attr('UserId');
            var loggedInUser = $('#hdnLoggedInUserId').val();
            $('#lblErrorMessage').text('');
            $('#lblSuccessMessage').text('');
            $('#lblErrorMessage').hide();
            $('#lblSuccessMessage').hide();
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
                        url: 'GlobalTagManagement.aspx/deleteMember?wgId=' + wgId + '&WgMemberId=' + WgMemberId + '&member=' + JSON.stringify(userId),
                        type: 'GET',
                        contentType: 'application/json',
                        dataType: 'json',
                        success: function (data, status, jqXHR) {
                            if (data != null) {
                                if (!data.d.IsValid) {
                                    //data.d.Message
                                    $("#MembersModel").modal('show');
                                    $('#lblErrorMessage').text(data.d.Message);
                                    $('#lblErrorMessage').show().delay(5000).fadeOut();
                                    $('#lblSuccessMessage').hide();
                                    //  $('#DisplayEmailText').hide();
                                }
                                else {
                                    if (data.d.IsPageRefresh) {
                                        $("#MembersModel").modal('hide');
                                        $('#lblErrorMessage').hide();
                                        $('#lblSuccessMessage').text('Member removed');
                                        $('#lblSuccessMessage').show().delay(3000).fadeOut();
                                        getAllGlobalGroups();
                                    }
                                    else {
                                        $('#lblErrorMessage').hide();
                                        $('#lblSuccessMessage').text('Member removed ' + data.d.Message);
                                        $('#lblSuccessMessage').show().delay(3000).fadeOut();
                                        // $('#DisplayEmailText').hide();
                                        getWGMembersById(wgId);
                                        //window.location.reload();
                                    }
                                }
                            }
                        },
                        error: function (jqXHR, status, error) {
                            if (status == 'error') {
                                $('#lblErrorMessage').text('Internal Server Error occured');
                                $('#lblErrorMessage').show().delay(5000).fadeOut();
                            }
                        }
                    });

                    $("#confrmMembrDiv").modal('hide');
                })

                $('#falsebtn').on('click', function () {
                    $("#confrmMembrDiv").modal('hide');
                    $("#MembersModel").modal('show');
                });
            }
            else {
                $.ajax({
                    url: 'GlobalTagManagement.aspx/deleteMember?wgId=' + wgId + '&WgMemberId=' + WgMemberId + '&member=' + JSON.stringify(userId),
                    type: 'GET',
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function (data, status, jqXHR) {
                        if (data != null) {
                            if (!data.d.IsValid) {
                                //data.d.Message
                                $("#MembersModel").modal('show');
                                $('#lblErrorMessage').text(data.d.Message);
                                $('#lblErrorMessage').show().delay(5000).hide("slow");
                                $('#lblSuccessMessage').hide();
                                // $('#DisplayEmailText').hide();
                            }
                            else {
                                if (data.d.IsPageRefresh) {
                                    $("#MembersModel").modal('hide');
                                    $('#lblSuccessMessage').text(data.d.Message);
                                    $('#lblSuccessMessage').show().delay(3000).fadeOut();
                                    getAllGlobalGroups();
                                }
                                else {
                                    $('#lblErrorMessage').hide();
                                    // $('#DisplayEmailText').hide();
                                    $('#lblSuccessMessage').text(data.d.Message);
                                    $('#lblSuccessMessage').show().delay(3000).fadeOut();
                                    getWGMembersById(wgId);
                                }
                            }
                        }
                        else {
                            $('#lblErrorMessage').hide();
                            //  $('#DisplayEmailText').hide();
                            $('#lblSuccessMessage').text(data.d.Message);
                            $('#lblSuccessMessage').show().delay(3000).fadeOut();
                            getWGMembersById(wgId);
                        }
                    },
                    error: function (jqXHR, status, error) {
                        if (status == 'error') {
                            $('#lblErrorMessage').text('Internal Server Error occured');
                            $('#lblErrorMessage').show().delay(5000).fadeOut();
                        }
                    }
                });
            }
            return false;
        }

        function closeDowngradeMember() {
            $('#checkDowngradeMember').modal('hide');
            $("#MembersModel").modal('show');
            refreshWorkGroupMembers($('#hdnSelectedWgId').val(), 0);
        }

        function closeconfrmMembrDiv() {
            $('#confrmMembrDiv').modal('hide');
            $("#MembersModel").modal('show');
            refreshWorkGroupMembers($('#hdnSelectedWgId').val(), 0);
        }

        function closeapplyTRMEntries() {           
            $('#applyTRMTagEntries').modal('hide');
            $("#tagTRMModel").modal('show');
            $('#dv' + $('#selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
            //refreshWorkGroupMembers($('#hdnSelectedWgId').val(), 0);
        }

        function saveUnsavedChanges() {
            $('#dv' + $('#selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
             var caller = $('#hdnTriggerModal').val();
             $("#unsavedChanges").modal('hide');
            if (caller == '2') {
                applyTag();
                $("#tagTRMModel").modal('hide');
            }
            else if (caller == '3') {
                removeTool();
                $("#viewTRMModel").modal('hide');
            }
         }

        function discardUnsavedChanges() {
            $("#unsavedChanges").modal('hide');
            $("#unsavedChanges").attr("action", "discard");
            $('#dv' + $('#selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
            $('#DisplayEmailText').text('');
            $('#DisplayEmailText').hide();
            $('#txtMemberName').val('');
            $('.typeahead').typeahead('val', '');
            $('#txtMemberNameLabel').removeClass('moveLabel');
            $('#hdnSelectedEmailId').val('');
        }

        function closeUnsavedChanges() {
            //$('#dv' + $('#selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
            $("#unsavedChanges").attr("action", "close");
            $("#unsavedChanges").modal('hide');
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
                if ($('#hdnSelectedEmailId').val().trim() == '') {
                    $('#btnAddMember').attr('disabled', 'disabled');
                    $('#btnAddMember').removeClass('membersDialogButton').addClass('disabledmembersDialogButton');
                }
                else {
                    enabled = true;
                    $('#btnAddMember').removeAttr('disabled');
                    $('#btnAddMember').removeClass('disabledmembersDialogButton').addClass('membersDialogButton');
                }
            }
            else {
                $('#dvEmailIdInfo').hide();
                enabled = false;
                $('#clickableDisabledTrash').css({ 'width': '20px', 'height': '20px' });
                //$('#LockButton').attr('disabled', 'disabled');
                $('.LockButton').each(function () {
                    $(this).attr('disabled', 'disabled');
                });
                $('#btnAddMember').attr('disabled', 'disabled');
                $('#btnAddMember').removeClass('membersDialogButton').addClass('disabledmembersDialogButton');
                $('.roleInfoPopup').css('position', 'absolute');
                var btn1 = $('#tabhead');
                var modalTopScroll = $('#MembersModel').scrollTop();
                var modalLeftScroll = $('#MembersModel').scrollLeft();
                var top = (btn1.offset().top - (window.scrollY - modalTopScroll)) + 110;
                var left = (btn1.offset().left - (window.scrollX - modalLeftScroll)) + 280;

                if (left > $('#content-main').width()) {
                    var diff = (left - $('#content-main').width()) - 10;
                    left = left - diff;
                }
                $('.roleInfoPopup').css('top', (top - 100));
                $('.roleInfoPopup').css('left', left);
                $('#dvRolePopup').show();
                $("#MembersModel").css('overflow-y', 'auto');
            }

            enableClickonDisabled(enabled);

        }

        function closeRoleInfoPopup() {
            $("#dvRolePopup").hide();
            var enteredText = $("#txtMemberName").val().trim();
            var enabled = false;
            if ($('#hdnSelectedEmailId').val().trim() == '') {
                $('#btnAddMember').attr('disabled', 'disabled');
                $('#btnAddMember').removeClass('membersDialogButton').addClass('disabledmembersDialogButton');
            }
            else {
                enabled = true;
                $('#btnAddMember').removeAttr('disabled');
                $('#btnAddMember').removeClass('disabledmembersDialogButton').addClass('membersDialogButton');
            }
            $('#clickableDisabledTrash').css({ 'width': '0px', 'height': '0px' });
            //$('#LockButton').removeAttr('disabled');

            $('.LockButton').each(function () {
                $(this).removeAttr('disabled');
            });
            enableClickonDisabled(enabled);
        }
        function closePopUps() {
            var enabled = false;
            if ($('#dvRolePopup').is(':visible') || $('#dvEmailIdInfo').is(':visible')) {
                $('#dvRolePopup').hide();
                $('#dvEmailIdInfo').hide();
                $('#clickableDisabledTrash').css({ 'width': '0px', 'height': '0px' });
                $('.LockButton').each(function () {
                    $(this).removeAttr('disabled');
                });

                if ($('#hdnSelectedEmailId').val().trim() == '') {
                    $('#btnAddMember').attr('disabled', 'disabled');
                    $('#btnAddMember').removeClass('membersDialogButton').addClass('disabledmembersDialogButton');
                }
                else {
                    enabled = true;
                    $('#btnAddMember').removeAttr('disabled');
                    $('#btnAddMember').removeClass('disabledmembersDialogButton').addClass('membersDialogButton');
                }
                enableClickonDisabled(enabled);
            }
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

        let numElements = 0;
        const toolArray = [];
        function viewTRMEntriesModel(aTagId, aWID, groupName, isReopen) {

            $('#btnItOKTaggedEntires').children('.ripple').remove();
            $('#btnItOKTaggedEntires').removeClass('ripple');
            $("#dvViewTRMEntries").animate({ scrollTop: 0 }, "slow");
            $("#viewTRMModel").modal('show');
            $('#dvTagPopup').hide();
            $('#dv' + $('#selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
            if (isReopen != undefined && isReopen) {
                $('#btnOkTaggedEntires').removeAttr('disabled', 'disabled');
                $('#btnOkTaggedEntires').removeClass('disabledbutton').addClass('enabledbutton');
            }
            else {
                $('#btnOkTaggedEntires').attr('disabled', 'disabled');
                $('#btnOkTaggedEntires').removeClass('enabledbutton').addClass('disabledbutton');
            }
            var RoleId = $('#btn' + aTagId).attr('RoleId');

            //confirm(showGrp+"--"+aTagId+"<<"+aWID+">>"+groupName)
            if (groupName != undefined) {
                $('#hdnSelectedWGName').val(groupName);
                $('#hdnSelectedWgId').val(aWID);
            }
            if (aTagId != null) {
                $('#selectedTagId').val($('#btn' + aTagId).attr('tagId'));
                $('#selectedTagName').val($('#btn' + aTagId).attr('tagName'));
            }
            var wgId = $('#hdnSelectedWgId').val();

            //if (showGrp == null) {
                //if (wgId == "-1") {
                //    showGrp = false;
                //    RoleId = 2; // personal tag                    
                //}
                //else {
                    //showGrp = true;
            //    }
            //}
            //if (!showGrp) {
            //    //$('#ContentPlaceHolder1_hdnSelectedWgId').val(0);
            //    //else
            //    $('#hdnSelectedWgId').val(-1)
            //}

            if (aWID != null) {
                var tagId = $('#btn' + aWID).attr('tagId');
                var tagName = $('#btn' + aWID).attr('tagName');
                //if (!showGrp) {
                //    $('#selectedTagId').val(tagId);
                //    $('#selectedTagName').val(tagName);
                //}
                //confirm(tagId + "<-tag->" + tagName)
            }
            $('#dv' + $('#selectedTagId').val()).css('background-color', 'rgb(205, 207, 215)');
            if (RoleId == undefined) {
                var btnid = $('#selectedTagId').val();
                RoleId = $('#btn' + btnid).attr('RoleId');
                //confirm(document.getElementsByTagName('roleid').innerHTML+" nobody named " + $('#ContentPlaceHolder1_hdnLoggedInUserId').val() + "with roleId="+RoleId+" allowed in")
            }
            //confirm("RoleId-->" + RoleId + " -showgroup->" + showGrp+" -wgid->"+wgId)
            if (RoleId < 3) {
                $('#btnOkTaggedEntires').text('APPLY');
                $('#btnOkTaggedEntires').show();
                $('#btnTaggedEntires').text('CANCEL');
                $('#btnTaggedEntires').show();
                $('#btnItOKTaggedEntires').hide();
                $('#taggedEntriesDeselectedMessage').show();
            } else {
                //if (showGrp == false) {
                //    $('#btnOkTaggedEntires').text('APPLY');
                //    $('#btnOkTaggedEntires').show();
                //    $('#btnTaggedEntires').text('CANCEL');
                //    $('#btnTaggedEntires').show();
                //    $('#btnItOKTaggedEntires').hide();
                //    $('#taggedEntriesDeselectedMessage').show();
                //} else {
                    $('#btnOkTaggedEntires').hide();
                    $('#btnTaggedEntires').hide();
                    $('#btnItOKTaggedEntires').text('OK');
                    $('#btnItOKTaggedEntires').show();
                    $('#taggedEntriesDeselectedMessage').hide();
                //}
            }
            //confirm($('#ContentPlaceHolder1_selectedTagId').val() + "--" + showGrp + ">>" + $('#ContentPlaceHolder1_hdnSelectedWGName').val() + "<<" + $('#ContentPlaceHolder1_selectedTagName').val() + "--" + $('#ContentPlaceHolder1_hdnLoggedInUserId').val())
            $.ajax({
                url: 'GlobalTagManagement.aspx/getviewTRMEntries?tgId=' + $('#selectedTagId').val(),
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    if (data != null) {
                        $('#dvViewTRMEntries').empty();
                        var parentDiv = '';
                        if (data.d.lstTools != null) {
                            //if (showGrp) {
                                $('#spanTaggedGroupName').text(' Global Group - ' + $('#hdnSelectedWGName').val())
                                $('#spanTaggedGroupName').show();
                                $('#dvTaggedGroupName').show();
                                $('#hdnTriggerModal').val(2);
                            //} else {
                            //    $('#spanTaggedGroupName').text('');
                            //    $('#dvTaggedGroupName').hide();
                            //    $('#spanTaggedGroupName').hide();
                            //    $('#ContentPlaceHolder1_hdnTriggerModal').val(3);
                            //}
                            //if (showGrp) {
                                $('#spanTaggedTagName').text('  Global Tag - ' + $('#selectedTagName').val());
                            //}
                            //else {
                                //$('#spanTaggedTagName').text(' Personal Tag - ' + $('#selectedTagName').val());
                            //}

                            parentDiv += '<div class="row" style="font-family: Roboto;padding-top:10px;padding-bottom:10px;font-size:11px;font-weight:bold;">';
                            parentDiv += '<div class="col-sm-10">Entries (' + data.d.lstTools.length + ')</div >';
                            parentDiv += '<div class="col-sm-2" style="padding-right:10px;">Owner</div >';
                            parentDiv += '</div > ';

                            numElements = 0;
                            if (isReopen != undefined) {
                                if (isReopen) {
                                    data.d.lstTools = JSON.parse($('#hdnSelectedToolTags').val());
                                }
                                else if (!isReopen) {
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
                                parentDiv += '<div class="row" style="border:solid;border-width:1px;border-color:lightgrey;padding-top:8px;padding-bottom:8px;padding-right:3px;"><div class="col-sm-1" style="text-decoration: none; font-family: Roboto;font-size:11px;padding-left:15px" class="list-group-item" id="' + val.TAG_ID + '" >';
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
                                    parentDiv += '</div><div class="col-sm-8" style="text-decoration: none;font-family: Roboto;font-size:11px;padding-left:10px;padding-bottom:3px;padding-top:4px;" class="list-group-item"><label class="form-check-label">'
                                }
                                parentDiv += '<a href="ToolPage.aspx?tid=' + val.Tool_Id + '" onclick = "javascript:openToolPage(' + val.Tool_Id + ')" class="daLink" style="text-decoration: none; color:#4169e1;font-family: Roboto;font-size:12px;padding-top:20px;">' + val.Tool_Name + '</a>';
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

        function removeTool() {
            $('#InRenameApprWarning').hide();
            //$('#lblRemoveTagErrorMessage').text('');
            //$('#lblRemoveTagSuccessMessage').text('');
            if ($('#btnOkTaggedEntires').val() == "OK") {
                $('#dvGroupPopup').hide();
            } else {

                var lstTags = JSON.parse($('#hdnSelectedToolTags').val());

                $.each(lstTags, function (index, value) {
                   
                    if (value.IsChecked == 0) {
                        $.ajax({
                            url: 'GlobalTagManagement.aspx/removeToolFromTag?tgId=' + $('#selectedTagId').val() + '&toolId=' + value.Tool_Id + '&ggId=' + $('#hdnSelectedWgId').val() + '&tagName=' + JSON.stringify($('#selectedTagName').val()),
                            type: 'GET',
                            contentType: 'application/json',
                            dataType: 'json',
                            success: function (data, status, jqXHR) {
                                if (data != null) {
                                    if (!data.d.IsValid) {
                                        $('#lblRemoveTagErrorMessage').text(data.d.Message);
                                        $('#lblRemoveTagErrorMessage').show().delay(5000).fadeOut();
                                        if (data.d.Message == "You are not authorized to perform this action") {
                                            $('#toastError').text('You are not authorized to perform this action');
                                            $('#burntToast').toast('show').show().delay(3000).fadeOut();
                                            $("#viewTRMModel").modal('hide');
                                            getAllGlobalGroups();
                                        }
                                    } else {
                                        $('#toastSuccess').text('Tag(s) removed from entry successfully.');
                                        $('#goodToast').toast('show').show().delay(3000).fadeOut();
                                        getAllGlobalGroups();
                                        $("#viewTRMModel").modal('hide');
                                    }
                                }
                            },
                            error: function (jqXHR, status, error) {
                                // uncomment for debug messages to be displayed
                                //$('#lblRemoveTagErrorMessage').text(data.d.Message);
                                $('#lblRemoveTagErrorMessage').show().delay(5000).fadeOut();
                                //$('#toastError').text(data.d.Message);
                                //$('#burntToast').toast('show')
                            }
                        });
                    }
                });

                        
                    }
        }


                /* iterate over the tools and remove those not selected */
                //for (var j = 0; j < toolArray.length; j++) {
                //    if (!document.getElementById(toolArray[j]).checked) {
                //        numElements = j;
                //        // confirm("removeToolfromTag tagid-->" + $('#ContentPlaceHolder1_selectedTagId').val() + " toolId-->" + toolArray[j] + 'wgId= ' + $('#ContentPlaceHolder1_hdnSelectedWGId').val() + ' tagName=' + $('#ContentPlaceHolder1_selectedTagName').val());

                //        $.ajax({
                //            url: 'GlobalTagManagement.aspx/removeToolFromTag?tgId=' + $('#selectedTagId').val() + '&toolId=' + toolArray[j] + '&ggId=' + $('#hdnSelectedWgId').val() + '&tagName=' + JSON.stringify($('#selectedTagName').val()),
                //            type: 'GET',
                //            contentType: 'application/json',
                //            dataType: 'json',
                //            success: function (data, status, jqXHR) {
                //                if (data != null) {
                //                    if (!data.d.IsValid) {
                //                        $('#lblRemoveTagErrorMessage').text(data.d.Message);
                //                        $('#lblRemoveTagErrorMessage').show().delay(5000).fadeOut();
                //                        if (data.d.Message == "You are not authorized to perform this action") {
                //                            $('#toastError').text('You are not authorized to perform this action');
                //                            $('#burntToast').toast('show').show().delay(3000).fadeOut();
                //                            $("#viewTRMModel").modal('hide');
                //                            getAllGlobalGroups();
                //                        }
                //                    } else {
                //                        $('#toastSuccess').text('Tag(s) removed from entry successfully.');
                //                        $('#goodToast').toast('show').show().delay(3000).fadeOut();
                //                        getAllGlobalGroups();                                        
                //                        $("#viewTRMModel").modal('hide');
                //                    }
                //                }
                //            },
                //            error: function (jqXHR, status, error) {
                //                // uncomment for debug messages to be displayed
                //                //$('#lblRemoveTagErrorMessage').text(data.d.Message);
                //                $('#lblRemoveTagErrorMessage').show().delay(5000).fadeOut();
                //                //$('#toastError').text(data.d.Message);
                //                //$('#burntToast').toast('show')
                //            }
                //        });
                //    }
                //}
        //    }
        //}

        function closeviewTRMModel() {
            $("#viewTRMModel").modal('hide');
            $('#hdnTriggerModal').val(3);
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
            else
                $('#dv' + $('#selectedTagId').val()).css('background-color', 'rgb(220, 230, 250)');
        }

        function renameWorkGroup() {
            $.ajax({
                url: 'GlobalTagManagement.aspx/renameGroup?groupName=' + JSON.stringify($('#txtRenameGroupName').val()) + '&IsInAppropriateFlagged=' + JSON.stringify($('#hdnIsInAppropriateFlagged').val()) + '&ggId=' + JSON.stringify($('#hdnSelectedWgId').val()) + '&oldValue=' + JSON.stringify($('#hdnSelectedWGName').val()),
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
                            $('#hdnIsInAppropriateFlagged').val('True');
                            $('#lblRenameGroupErrorMessage').text('Inappropriate word detected');
                            $('#lblRenameGroupWarningMessage').text('');
                        }
                        else if (!data.d.IsValid) {
                            //data.d.Message
                            $('#lblRenameGroupErrorMessage').text(data.d.Message)
                            //$('#toastError').text(data.d.Message);
                            //$('#burntToast').toast('show').show().delay(3000).fadeOut();
                        }
                        else {
                            $("#renameModel").modal('hide');
                            $('#toastSuccess').text('Group renamed successfully.');
                            $('#goodToast').toast('show').show().delay(3000).fadeOut();

                            getAllGlobalGroups();
                        }
                    }
                },
                error: function (jqXHR, status, error) {
                    if (status == 'error') {
                        $('#toastError').text('Internal Server Error occured');
                        $('#burntToast').toast('show').show().delay(3000).fadeOut();
                    }
                }
            });
        }


        function renameGroup() {
            //var temp1 = $('#hdnSelectedWGName').val();
           
            $('#txtRenameGroupName').val($('#hdnSelectedWGName').val());
            $('#renamecharcounter').text($('#txtRenameGroupName').val().length + '/30');
            $('#renamecharcounter').css('color', 'black');
            $("#renameModel").modal('show');
            $('#hdnIsInAppropriateFlagged').val('False');
            $('.grouppop').slideFadeToggle();
            $('#lblRenameGroupErrorMessage').text('');
            $('#lblRenameGroupWarningMessage').text('');
            $('#lblRenameInApporipateWarningMessage').html('');
            $('#txtRenameGroupName').focus();
            $('#btnRenameWorkGroup').attr('disabled', 'disabled');
            $('#btnRenameWorkGroup').removeClass('enabledbutton').addClass('disabledbutton');
            $('#InRenameApprWarning').hide();
        }

        $.fn.slideFadeToggle = function (easing, callback) {
            return this.animate({ opacity: 'toggle', height: 'toggle' }, 'fast', easing, callback);
        };

        function closeDeleteGroupModel() {
            $("#deleteModel").modal('hide');
        }

        function deleteGroup() {
            $('#txtDeleteGroupName').val('');
            $('#spandeletetext').text('Group Name - ' + $('#hdnSelectedWGName').val())
            $('#deletegrouppopuptext').html('<p style="text-align:left;">Deleting the group named <b>' + $('#hdnSelectedWGName').val() + '</b> will remove the group from your view as well as all group members view. All <b>' + $('#hdnSelectedWGName').val() + '</b> tags will be removed from any TRM entry tagged with a <b>' + $('#hdnSelectedWGName').val() + '</b> tag.</p><p style="text-align:left;">Type the name "' + $('#hdnSelectedWGName').val() + '" below to confirm you want to delete the <b>' + $('#hdnSelectedWGName').val() + '</b> group and any associated group tags. </p>')
            $('#btnDeleteWorkGroup').removeClass('deleteenabledbutton').addClass('disabledbutton');
            $('#btnDeleteWorkGroup').attr('disabled', 'disabled');
            $("#deleteModel").modal('show');
            $('.grouppop').slideFadeToggle();
        }

        function deleteWorkGroup() {
            $('#InRenameApprWarning').hide();
            $('#lblRenameInApporipateWarningMessage').html('');
            $('#lblRenameInApporipateWarningMessage1').html('');
            $('#lblRenameGroupWarningMessage').text('');
            //$('#spinnerDeleteGroup').removeClass('d-none');

            $.ajax({
                url: 'GlobalTagManagement.aspx/deleteGroup?GgId=' + JSON.stringify($('#hdnSelectedWgId').val()) + '&groupName=' + JSON.stringify($('#hdnSelectedWGName').val()),
                type: 'GET',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data, status, jqXHR) {
                    //$('#spinnerDeleteGroup').addClass('d-none');

                    if (data != null) {
                        if (!data.d.IsValid) {
                            $('#toastError').text(data.d.Message);
                            $('#burntToast').toast('show')
                        }
                        else {
                            $("#deleteModel").modal('hide');
                            $('#toastSuccess').text('Group deleted successfully.');
                            $('#goodToast').toast('show').show().delay(3000).fadeOut();
                            getAllGlobalGroups();
                        }
                    }
                },
                error: function (jqXHR, status, error) {
                    if (status == 'error') {
                        $('#toastError').text(' Internal Server Error occured');
                        $('#burntToast').toast('show')
                    }
                }
            });
        }
    </script>
</body>        
    <!--#include file="MasterFooter.aspx"--> 
</html>

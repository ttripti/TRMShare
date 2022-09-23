<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TagPromoVideo.aspx.vb" Inherits="VA.TRM.PresentationO.TagPromoVideo" %>

<%@ Import Namespace="VA.TRM.PresentationO.TRMPresentation.inc.TRMConfig.TRMConfig" %>
<%@ Import Namespace="VA.TRM.PresentationO.TRMPresentation.inc.TRMGlobals" %>
<%@ Import Namespace = "System.Text.RegularExpressions" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
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
</form>

    <div">
        <p><b>Welcome to TRM Tagging</b></p>
        <p style="font-size:small;font-family:Arial">Hello, the TRM introduced a new tagging functionality that is described in the video below.  Please click on the video player to view it. </p>
        <div>
            <iframe width="837" height="470" src="https://web.microsoftstream.com/embed/video/f935289c-9ab5-45c6-88c6-d8de3f1a47fb?autoplay=true&showinfo=true" allowfullscreen style="border:none;"></iframe>        
        </div>
        <div class="custom-control custom-checkbox" style="margin-left:530px;">
            <input type="checkbox" class="custom-control-input" id="dontshow" onclick="enableCloseButton()" style="margin-top:5px">
            <label class="custom-control-label"  for="dontshow">Don’t show this to me again
            <button type="button" id="closeButton" class="btn btn-primary btn-sm"  onclick="saveVideoChoice()" style="margin-left:40px;width:80px">SAVE</button>
        </div>   
    </div>
    <script>
        function saveVideoChoice() {
            var checkbox = document.getElementById("dontshow");
            if (checkbox.checked) {
                alert("Checkbox is checked");
            } else {
                alert("Checkbox is not checked");
            }
        }

        function enableCloseButton() {
            alert("here");
           var checkbox = document.getElementById("dontshow").checked;
            if (!checkbox) {
                alert("Checkbox is not checked");
                $('#closeButton').attr('disabled', 'disabled');
            }
            else {
                alert("Checkbox is checked");
            }
    </script>
</asp:Content>

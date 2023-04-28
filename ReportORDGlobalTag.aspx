<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ReportORDGlobalTag.aspx.vb" Inherits="VA.TRM.PresentationO.ReportORDGlobalTag" %>
<%@ Register Src="~/UserControls/ucToolLinkComponent.ascx" TagName="ucToolLinkComponent" TagPrefix="uc" %>

<%@ Import Namespace="System.Text.RegularExpressions" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="VA.TRM.PresentationO.TRMPresentation.inc.TRMConfig.TRMConfig" %>
<%@ Import Namespace="VA.TRM.PresentationO.TRMPresentation.inc.TRMCodeLib" %>
<%@ Import Namespace="VA.TRM.PresentationO.TRMPresentation.inc.TRMGlobals" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <% 
       trmGlobals.fileType = trmCodeLib.ProcessReqParam("fileType")
          
       Dim fileName As String
       Dim selectedDec as String  = trmCodeLib.ProcessReqParam("selectedDecision")
       fileName = "TRM_" & selectedDec & "_ORD_Global_Tag_Report"
       Dim selSortCol As String = trmCodeLib.ProcessReqParam("selectedSortColumn")
       Dim selSortOrder As String = trmCodeLib.ProcessReqParam("selectedSortOrder")
        
       If trmGlobals.fileType = "Excel" Or trmGlobals.fileType = "Word" Then
         trmCodeLib.CreateWordFile(fileName)
          Call generateWord(selectedDec,selSortCol,selSortOrder)
        Else
    %>
   <style type="text/css">
        .RowStyle {
          height: 100px;
        }
         .GridViewStandard {
            width:100% !important;
        }

        .GridViewStandard th{
            font-family: arial;
	        font-size: 95%;
	        font-weight: bold;
	        text-align: center;
	        padding-left: 5px;
	        padding-right: 5px;
	        padding-top: 1px;
	        padding-bottom: 1px;
	        color: black;
	        background-color:#BBBFFF;
	        border: 1px #999999 solid;
            white-space: nowrap;
        }

         .GridViewStandard td{
            font-family: arial;
	        font-size: 90%;
	        background-color: #E4E4E4;
	        color: #4A452A;
	        border: 1pt  #d9d9d9 solid;
	        text-align: left;
	        white-space:normal;
	        padding-top: 1px;
	        padding-bottom: 1px;
	        padding-left: 5px;
	        padding-right: 5px;
            text-wrap:normal;
            height : 30%;
        } 

        .TableCellCenter{
	        
	        text-align:center !important;  
	        padding-left: 5px;
	        padding-right: 5px;
        }

        .TableLargeText{
            width:70%;
            word-wrap:break-word;
        }
        .exportbutton {
            display: inline-block;
            height: 18px;
            padding: 0;
            margin: 0;
            vertical-align: top;
            width: 18px;
            border: 0px;
            cursor : pointer;
        }

        .exportbutton:hover {
            box-shadow: 0 4px 10px 0 rgb(0 0 0 / 20%), 0 4px 20px 0 rgb(0 0 0 / 10%);
        }
    </style>
      <script type="text/javascript">
        $(function () {
            $('[id*=submitSpinner]').hide();
            $('[id*=submitSpinner]').css("display", "none");
            $('[id*=btnDecisionType]').on("click", function () {
                setTimeout(function () {
                    $('[id*=btnDecisionType]').attr("disabled","disabled");
                    $('[id*=submitSpinner]').show();
                    $('[id*=submitSpinner]').css("display","inline-block");
                }, 200);
            });
        });
          function Base64ToBytes(base64) {
              var s = window.atob(base64);
              var bytes = new Uint8Array(s.length);
              for (var i = 0; i < s.length; i++) {
                  bytes[i] = s.charCodeAt(i);
              }
              return bytes;
          };
          function wordExport() {
              $('#exportSpinner').show();
              $('#exportSpinner').css("display", "inline-block");
              $('#exportDiv').hide();
              $('#hdnserverPath').val('<%= serverPath %>');
              var dtype = '';
               dtype = 'Word';
              var selectedSortColumn = document.getElementById('<%= selectedSortColumn.ClientID %>').value;
              if (selectedSortColumn == "")
                  selectedSortColumn = "tagName"
              var selectedSortOrder = document.getElementById('<%= selectedSortOrder.ClientID %>').value;
              if (selectedSortOrder == "")
                  selectedSortOrder = "0"
              //alert(selectedSortColumn);
              let selectedDecision = document.getElementById('<%= ddlDecisionType.ClientID %>').value;
              var url = $('#hdnserverPath').val() + 'ReportORDGlobalTag.aspx?fileType=' + dtype + '&selectedDecision=' + selectedDecision + '&selectedSortColumn=' + selectedSortColumn + '&selectedSortOrder=' + selectedSortOrder;
              window.location.href = url;
              $('#exportSpinner').hide();
              $('#exportSpinner').css("display", "none");
              $('#exportDiv').show();
          }
          function excelExport() {
              $('#exportSpinner').show();
              $('#exportSpinner').css("display", "inline-block");
              $('#exportDiv').hide();
              let selectedDecision = document.getElementById('<%= ddlDecisionType.ClientID %>').value;
              var selectedSortColumn = document.getElementById('<%= selectedSortColumn.ClientID %>').value ;
              if (selectedSortColumn == "")
                  selectedSortColumn = "tagName"
              var selectedSortOrder = document.getElementById('<%= selectedSortOrder.ClientID %>').value;
              if (selectedSortOrder == "")
                  selectedSortOrder = "0"
             // alert(selectedSortOrder);
              $.ajax({
                  url: 'ReportORDGlobalTag.aspx/generateExcel?selectedDecision=' + selectedDecision + '&selectedSortColumn=' + selectedSortColumn + '&selectedSortOrder=' + selectedSortOrder,
                  type: 'POST',
                  data: '{selectedDecision: "' + selectedDecision + '", selectedSortColumn : "' + selectedSortColumn + '", selectedSortOrder : "' + selectedSortOrder + '"}',
                  contentType: "application/json; charset=utf-8",
                  dataType: "json",
                  success: function (data, status, jqXHR) {
                      $('#exportSpinner').hide();
                      $('#exportSpinner').css("display", "none");
                      $('#exportDiv').show();
                      var fileName = "TRM_" + selectedDecision + "_ORD_Global_Tag_Report.xlsx";
                      //Convert Base64 string to Byte Array.
                      var bytes = Base64ToBytes(data.d);

                      //Convert Byte Array to BLOB.
                      var blob = new Blob([bytes], { type: "application/octetstream" });

                      //Check the Browser type and download the File.
                      var isIE = false || !!document.documentMode;
                      if (isIE) {
                          window.navigator.msSaveBlob(blob, fileName);
                      } else {
                          var url = window.URL || window.webkitURL;
                          link = url.createObjectURL(blob);
                          var a = $("<a />");
                          a.attr("download", fileName);
                          a.attr("href", link);
                          $("body").append(a);
                          a[0].click();
                          $("body").remove(a);
                      }
                     
                  },
                  error: function (jqXHR, status, error) {
                      alert('error' + status + '  ' + error);
                      $('#exportSpinner').hide();
                      $('#exportSpinner').css("display", "none");
                      $('#exportDiv').show();
                  }
              });

          }
      </script>
    <%
        trmCodeLib.displayPageTitle("ORD Global Tags", "")
     %>
        <br />
        The following table displays ORD global tags tagged to non-archived entries within the VA TRM. The ORD global tags are mananged by the Office of Research and Development.
        <br />
        <br />
    <input type="hidden" runat="server" id="selectedSortColumn" />
    <input type="hidden" runat="server" id="selectedSortOrder" />
    <input type="hidden" id="hdnserverPath" />
        <div style="width:100%; overflow: auto; overflow-y: hidden; ">

            <table>
                <tr>
                    <td scope="row" width="150px" style="font-weight: bold; color: blue; font-style: italic; text-align: left">Select a decision type:</td>
                    <td width="165px">
                        <asp:DropDownList runat="server" ID="ddlDecisionType">
                        <asp:ListItem Text="All" Value="All"> </asp:ListItem>
                        <asp:ListItem Text="Approved" Value="Approved"> </asp:ListItem>
                        <asp:ListItem Text="Approved w/Constraints" Value="Approved w/Constraints"> </asp:ListItem>
                        <asp:ListItem Text="Divest" Value="Divest"> </asp:ListItem>
                        <asp:ListItem Text="Prohibited" Value="Prohibited"> </asp:ListItem>
                        <asp:ListItem Text="Unapproved" Value="Unapproved"> </asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td width="100px">                
                        <asp:Button runat="server" ID="btnDecisionType" OnClick="btnDecisionType_Click" Text="Submit" ToolTip="Button to generate the report"/>
                        <div style="display: none; width:fit-content;vertical-align: middle;" id="submitSpinner">
                                <i class="fa-solid fa-circle-notch fa-spin"></i>
                     </div>
                   </td>
                   <td style="padding-left:100px">
	               
                           <div id="exportDiv">
                           Export To:
                            </div>
                            <div style="display: none; width:fit-content;vertical-align: middle;" id="exportSpinner">
                                    <i class="fa-solid fa-circle-notch fa-spin"></i>
                         </div>
                       <div>
                           <button class="exportbutton" Id=exportexcel onclick="javascript:excelExport();return false;">
                               <img align="right" src="/images/excel.png" width="32" height="32" alt="generate excel file"/>
                           </button>

                           <button style="padding-left:30px;" class="exportbutton" Id=exportword onclick="javascript:wordExport();return false;">
                               <img align="right" src="/images/word.png" width="32" height="32" alt="generate word file"/>
                           </button>
                       </div>
			        
                   </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <center><b>List of Entries Mapped to ORD Global Tags</b></center>
                    </td>
                </tr>      
                <tr>
                    <td colspan="4">
                    <%
                        If (True) Then
                    %>
                            <asp:GridView runat="server" ID="gvDecisionType" AutoGenerateColumns="false" EnableViewState="false"
                                OnSorting="gvDecisionType_Sorting" OnSorted="gvDecisionType_Sorted"  AllowPaging="false" 
                                OnRowDataBound="gvDecisionType_RowDataBound" GridLines="Horizontal" AllowSorting="true" ShowFooter="true"
                                OnPageIndexChanging="gvDecisionType_PageIndexChanging" RowStyle-CssClass="RowStyle" CssClass="GridViewStandard"  OnDataBound="gvDecisionType_DataBound">
                    
                                <Columns>
                                    
                                    <asp:BoundField SortExpression="tagName" HeaderText="Tag Name" DataField="tagName" ItemStyle-Width="15%" ItemStyle-CssClass="TableCellCenter"/>
                                    <asp:BoundField SortExpression="tagDefinition" HeaderText="Tag Definition" DataField="tagDefinition" ItemStyle-Width="40%" ItemStyle-CssClass="TableCellCenter"/>
                                    <asp:TemplateField SortExpression="toolName" HeaderText="Software" ItemStyle-Width="12%">
                                        <ItemStyle/> 
                                        <ItemTemplate>
                                           <uc:ucToolLinkComponent runat="server" ID="ucToolLinkComponent" />                   
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Version" DataField="toolVersionNo" SortExpression="toolVersionNo" ItemStyle-Width="8%"/>
                                    <asp:BoundField HeaderText="Decision" DataField="toolDecision" SortExpression="toolDecision" ItemStyle-Width="13%"/>
						            <asp:BoundField HeaderText="Date Tagged" SortExpression="tagDate" DataField="tagDate" ItemStyle-Width="20%" ItemStyle-CssClass="TableCellCenter" DataFormatString="{0:G}" />
                                </Columns>                   
                            </asp:GridView>
                    <%
                        End If
                    %>
                    </td>
                </tr>       
            </table>
        </div>
   <%
        End If
    %>
    
</asp:Content>

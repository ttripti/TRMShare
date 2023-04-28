<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ReportORDGlobalTag.aspx.vb" Inherits="VA.TRM.PresentationO.ReportORDGlobalTag" %>
<%@ Register Src="~/UserControls/ucToolLinkComponent.ascx" TagName="ucToolLinkComponent" TagPrefix="uc" %>

<%@ Import Namespace="System.Text.RegularExpressions" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="VA.TRM.PresentationO.TRMPresentation.inc.TRMConfig.TRMConfig" %>
<%@ Import Namespace="VA.TRM.PresentationO.TRMPresentation.inc.TRMCodeLib" %>
<%@ Import Namespace="VA.TRM.PresentationO.TRMPresentation.inc.TRMGlobals" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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

    </style>
      <script type="text/javascript">
        $(function () {
            $('[id*=submitSpinner]').hide();
            $('[id*=submitSpinner]').css("display", "none");
            $('[id*=btnDecisionType]').on("click", function () {
                setTimeout(function () {
                    $('[id*=btnDecisionType]').attr("diabled","disabled");
                    $('[id*=submitSpinner]').show();
                    $('[id*=submitSpinner]').css("display","inline-block");
                }, 200);
            });
        });
      </script>
    <%
        trmCodeLib.displayPageTitle("ORD Global Tags", "")
     %>
        <br />
        The following table displays ORD global tags tagged to non-archived entries within the VA TRM. The ORD global tags are mananged by the Office of Research and Development.
        <br />
        <br />
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
	               
                           <div runat="server" id="exportDiv" visible="false">
                           Export To:
                           <asp:ImageButton runat="server" ID="imgExcel" AlternateText="Generate Excel File" 
                               Width="32" Height="32" OnClick="imgExcel_Click" ImageUrl="~/images/excel.png" />
                           <asp:ImageButton runat="server" ID="imgWord" AlternateText="Generate Word File" 
                               Width="32" Height="32" ImageUrl="~/images/word.png" OnClick="imgWord_Click"/>
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
   
    
</asp:Content>

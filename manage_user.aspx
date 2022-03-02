<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="manage_user.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="clearfix"></div>
	
  <div class="content-wrapper">
    <asp:GridView class="text-center" ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
        CellPadding="4" CellSpacing="2" ForeColor="Black" Width="805px">
        <Columns>
            <asp:TemplateField HeaderText="Id">
                <ItemTemplate>
                    <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("id") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Literal ID="Literal2" runat="server" Text='<%# Eval("name") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Password">
                <ItemTemplate>
                    <asp:Literal ID="Literal3" runat="server" Text='<%# Eval("password") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("id") %>' 
                        onclick="Button2_Click" Text="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="Gray" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    </div></div>
</asp:Content>


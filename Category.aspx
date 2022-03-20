<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="clearfix"></div>
	
  <div class="content-wrapper">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Category Name</label>
   
      <asp:TextBox ID="TextBox1" class="form-control" runat="server"></asp:TextBox><br />
      <label for="exampleInputEmail1" class="form-label">Category Status</label>
      <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="20px" 
          RepeatDirection="Horizontal" Width="274px" TextAlign="Right">
          <asp:ListItem Value="1">Active</asp:ListItem> 
          <asp:ListItem Value="0">Deactive</asp:ListItem>
      </asp:RadioButtonList>
  </div>
 
   <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Insert" 
          onclick="Button1_Click" />
          <br /><br />
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
          Width="679px">
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
              <asp:TemplateField HeaderText="Status">
                  <ItemTemplate>
                      <asp:Literal ID="Literal3" runat="server" Text='<%# Eval("status") %>'></asp:Literal>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Delete">
                  <ItemTemplate>
                      <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("id") %>' 
                          onclick="Button2_Click" Text="Delete" Width="94px" Font-Size="Medium" BackColor="Aqua" BorderColor="Yellow"  Font-Bold="True" Font-Italic="True" />
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Edit">
                  <ItemTemplate>
                      <asp:Button ID="Button4" runat="server" CommandArgument='<%# Eval("id") %>' 
                          onclick="Button4_Click" Text="Edit" Width="94px" BackColor="Aqua" BorderColor="Yellow"  Font-Bold="True" Font-Italic="True" />
                  </ItemTemplate>
              </asp:TemplateField>
          </Columns>
          <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
          <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
          <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
      </asp:GridView>
</div>
</asp:Content>


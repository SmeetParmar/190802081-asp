<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="manage_user.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="clearfix"></div>
	
  <div class="content-wrapper">

  <h1 class="center">Users</h1>
  <div class="form-group">
    <label for="exampleInputEmail1">User Name</label>
    
      <asp:TextBox ID="TextBox1"  class="form-control" runat="server"></asp:TextBox>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    
      <asp:TextBox type="text" class="form-control" ID="TextBox2" runat="server"></asp:TextBox>
  </div>
  <asp:Button ID="Button1" class=" btn btn-info" runat="server" Text="Update" onclick="Button1_Click" 
      />


<br /><br />
    <asp:GridView class="text-center" ID="GridView1" runat="server" 
          AutoGenerateColumns="False" Width="843px" BorderStyle="Inset">
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
                        onclick="Button2_Click" Text="Delete" BackColor="Aqua" 
                        BorderColor="#FFFF66" Font-Bold="True" Font-Italic="True" 
                        Font-Size="Medium" Width="102px" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:Button ID="Button3" runat="server" BackColor="Aqua" BorderColor="Yellow" 
                        CommandArgument='<%# Eval("id") %>' Font-Bold="True" Font-Italic="True" 
                        Font-Size="Medium" Text="Edit" Width="94px" onclick="Button3_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </div></div>
</asp:Content>


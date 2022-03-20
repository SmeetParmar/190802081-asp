<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" enableEventValidation="false" AutoEventWireup="true" CodeFile="product.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-wrapper">

<h1 class="center">Prducts</h1>
  <div class="form-group">
    <label for="exampleInputEmail1">Product Name</label> 
      <asp:TextBox ID="TextBox1"  class="form-control" runat="server"></asp:TextBox>
  </div>
   <div class="form-group">
    <label for="exampleInputPassword1">Category</label>
       <font color="white"><asp:DropDownList ID="DropDownList1" runat="server" 
           ForeColor="Aqua">
       </asp:DropDownList> </font>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Product Description</label>
      <asp:TextBox type="text" class="form-control" ID="TextBox2" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
  </div>
    <div class="form-group">
    <label>Product Price</label>
      <asp:TextBox type="text" class="form-control" ID="TextBox3" runat="server"></asp:TextBox>
  </div>
    <div class="form-group">
    <label>Product Image</label>      
            <asp:FileUpload ID="FileUpload1" runat="server" />
  </div>
   <div class="form-group">
    <label>Status</label> 
       <asp:RadioButtonList ID="RadioButtonList2" runat="server" Height="16px" 
           RepeatDirection="Horizontal" Width="267px">
           <asp:ListItem Value="1">Active</asp:ListItem>
           <asp:ListItem Value="0">Deactive</asp:ListItem>
       </asp:RadioButtonList>  
  
  </div>
  <asp:Button ID="Button1"  runat="server" class="btn btn-info" Text="Insert" onclick="Button1_Click" />
<br /><br />
    <asp:GridView ID="GridView1"  class="text-center" runat="server" AutoGenerateColumns="False" 
        Width="1100px">
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
            <asp:TemplateField HeaderText="Category">
                <ItemTemplate>
                    <asp:Literal ID="Literal6" runat="server" Text='<%# Eval("category") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description">
                <ItemTemplate>
                    <asp:Literal ID="Literal3" runat="server" Text='<%# Eval("description") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("image","~/uploads/{0}") %>' Width="100px"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price">
                <ItemTemplate>
                    <asp:Literal ID="Literal5" runat="server" Text='<%# Eval("price") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:Literal ID="Literal7" runat="server" Text='<%# Eval("status") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("id") %>' 
                        Text="Delete" onclick="Button2_Click" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Update">
                <ItemTemplate>
                    <asp:Button ID="Button3" runat="server" CommandArgument='<%# Eval("id") %>' 
                        Text="Edit" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>
</asp:Content>


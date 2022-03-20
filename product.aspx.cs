using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

  //DeleteCommand="DELETE FROM [products] WHERE [id] = @id" 
  //InsertCommand="INSERT INTO [products] ([name], [category], [description], [price], [image], [status]) VALUES (@name, @category, @description, @price, @image, @status)" 
  //ProviderName="<%$ ConnectionStrings:DatabaseConnectionString1.ProviderName %>" 
  //SelectCommand="SELECT [id], [name], [category], [description], [price], [image], [status] FROM [products]" 
  //UpdateCommand="UPDATE [products] SET [name] = @name, [category] = @category, [description] = @description, [price] = @price, [image] = @image, [status] = @status WHERE [id] = @id">
public partial class _Default : System.Web.UI.Page
{
    SqlConnection c = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            print();
            databind();
        }
    }
    public void databind()
    {
        SqlDataAdapter s = new SqlDataAdapter("SELECT * FROM categories WHERE [status]=1", c);
        DataTable dt = new DataTable();
        s.Fill(dt);
        DropDownList1.DataSource = dt;
        DropDownList1.DataValueField = "id";
        DropDownList1.DataTextField = "name";
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, new ListItem("Please select category", ""));
        DropDownList1.Items[0].Selected = true;
        DropDownList1.Items[0].Attributes["disabled"] = "disabled";
    }
    public void clear()
    {
        TextBox1.Text = string.Empty;
        TextBox2.Text = string.Empty;
        TextBox3.Text = string.Empty;
        RadioButtonList2.ClearSelection();
        DropDownList1.ClearSelection();
    }
    public void print()
    {
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT * FROM [products]", c);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(Server.MapPath("~/uploads/" + FileUpload1.FileName));
            SqlCommand s = new SqlCommand("INSERT INTO [products] ([name], [category], [description], [price], [image], [status]) VALUES (@nm, @cat, @desc, @price, @img, @status)", c);
            s.Parameters.AddWithValue("@nm", TextBox1.Text.Trim());
            s.Parameters.AddWithValue("@cat",DropDownList1.SelectedValue);
            s.Parameters.AddWithValue("@desc", TextBox2.Text.Trim());
            s.Parameters.AddWithValue("@price", TextBox3.Text.Trim());
            s.Parameters.AddWithValue("@img", FileUpload1.FileName);
            s.Parameters.AddWithValue("@status", RadioButtonList2.SelectedValue);
            c.Open();
            int a = s.ExecuteNonQuery();
            if (a == 1)
            {
                Response.Write("<script>alert('Data Inserted Successfully')</script>");
                print();
                clear();
            }
            else
            {
                Response.Write("<script>alert('Error')</script>");
                print();
                clear();
            }
            c.Close();
        }
        else
        {
            Response.Write("<script>alert('Please Select A Picture')</script>");
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Button b = (Button)sender;
        SqlCommand s = new SqlCommand("DELETE FROM [products] WHERE [id]=" + b.CommandArgument, c);
        c.Open();
        int a = s.ExecuteNonQuery();
        if (a == 1)
        {
            Response.Write("<script>alert('Successfully Deleted')</script>");
            print();
        }
        else
        {
            Response.Write("<script>alert('Error.......')</script>");
            print();
        }
    }
}
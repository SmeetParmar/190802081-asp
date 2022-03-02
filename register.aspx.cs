using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class register_user : System.Web.UI.Page
{
    SqlConnection c = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void demo(object sender, EventArgs e)
    {
        SqlCommand s = new SqlCommand("INSERT INTO [user] ([name],[password]) VALUES (@nm,@pw)", c);
        s.Parameters.AddWithValue("@nm", TextBox1.Text.Trim());
        s.Parameters.AddWithValue("@pw", TextBox2.Text.Trim());
        c.Open();
        int a = s.ExecuteNonQuery();
        if (a == 1)
        {
            Session["name"] = TextBox1.Text;
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            Response.Redirect("Login.aspx");
        }
        else
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            Response.Write("<script>alert('Error............')</script>");
        }
        c.Close();
    }
}
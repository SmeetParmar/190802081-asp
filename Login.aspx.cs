using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    SqlConnection c;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["name"]!=null)
        {
            Response.Redirect("~/Admin_Index.aspx");
        }
        c = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
    }
    protected void demo(object sender, EventArgs e)
    {

        try
        {
            SqlCommand s = new SqlCommand("SELECT COUNT(*) FROM [user] WHERE [name]=@n AND [password]=@p", c);
            s.Parameters.AddWithValue("@n", TextBox1.Text.Trim());
            s.Parameters.AddWithValue("@p", TextBox2.Text.Trim());
            c.Open();
            int a = (int)s.ExecuteScalar();
            if (a == 1)
            {
                Session["name"] = TextBox1.Text;
                TextBox1.Text = "";
                TextBox2.Text = "";
                Response.Redirect("~/Admin_Index.aspx");
            }
            else
            {
                TextBox1.Text = "";
                TextBox2.Text = "";
                Response.Write("<script>alert('Invalid Credentials............')</script>");
            }
            c.Close();
        }
        catch (SqlException ex)
        {
            Response.Write("<script>alert('" + ex.ToString() + "')</script>");
        }
    }
}
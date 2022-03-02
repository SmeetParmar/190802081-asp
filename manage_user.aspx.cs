using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Default2 : System.Web.UI.Page
{
    SqlConnection c = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        print();
    }

    public void print()
    {
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT * FROM [user]", c);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Button b=(Button)sender;
        SqlCommand s = new SqlCommand("DELETE FROM [user] WHERE [id]="+b.CommandArgument, c);
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
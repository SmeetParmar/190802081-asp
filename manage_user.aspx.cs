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
        //ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
        //  DeleteCommand="DELETE FROM [user] WHERE [id] = @id" 
        //  InsertCommand="INSERT INTO [user] ([name], [password]) VALUES (@name, @password)" 
        //  ProviderName="<%$ ConnectionStrings:DatabaseConnectionString1.ProviderName %>" 
        //  SelectCommand="SELECT [id], [name], [password] FROM [user]" 
        //  UpdateCommand="UPDATE [user] SET [name] = @name, [password] = @password WHERE [id] = @id">
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

    protected void Button3_Click(object sender, EventArgs e)
    {
        Button b = (Button)sender; 
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT * FROM [user] WHERE [id]="+b.CommandArgument, c);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        TextBox1.Text = dt.Rows[0][1].ToString();
        TextBox2.Text = dt.Rows[0][2].ToString();
        ViewState["id"] = b.CommandArgument;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand s = new SqlCommand("UPDATE [user] SET [name] = @name, [password] = @password WHERE [id] =" + ViewState["id"].ToString(), c);
        s.Parameters.AddWithValue("@name", TextBox1.Text);
        s.Parameters.AddWithValue("@password", TextBox2.Text);
        c.Open();
        int a = s.ExecuteNonQuery();
        c.Close();
        if (a > 0)
        {
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
            Response.Write("<script>alert('Updated Successfully....')</script>");
            print();
        }
        else
        {
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
            Response.Write("<script>alert('Error In Updateing....')</script>");
            print();
        }
    }
}
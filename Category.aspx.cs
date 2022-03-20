using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection c = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        print();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Button b = (Button)sender;
        SqlCommand s = new SqlCommand("DELETE FROM [categories] WHERE [id]=" + b.CommandArgument, c);
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
    protected void Button4_Click(object sender, EventArgs e)
    {
        Button b = (Button)sender;
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT * FROM [categories] WHERE [id]=" + b.CommandArgument, c);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        TextBox1.Text = dt.Rows[0][1].ToString();
        RadioButtonList1.SelectedValue = dt.Rows[0][2].ToString();
        ViewState["id"] = b.CommandArgument;
        Button1.Text = "Update";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Button1.Text == "Update")
        {
            SqlCommand s = new SqlCommand("UPDATE [categories] SET [name] = @name, [status] = @s WHERE [id] =" + ViewState["id"].ToString(), c);
            s.Parameters.AddWithValue("@name", TextBox1.Text);
            s.Parameters.AddWithValue("@s", RadioButtonList1.SelectedValue);
            c.Open();
            int a = s.ExecuteNonQuery();
            c.Close();
            if (a > 0)
            {
                TextBox1.Text = string.Empty;
                RadioButtonList1.ClearSelection();
                Response.Write("<script>alert('Updated Successfully....')</script>");
                print();
            }
            else
            {
                TextBox1.Text = string.Empty;
                RadioButtonList1.ClearSelection();
                Response.Write("<script>alert('Error....')</script>");
                print();
            }
            Button1.Text = "Insert";
        }
        else
        {
            SqlCommand s = new SqlCommand("INSERT INTO [categories] ([name],[status]) VALUES (@nm,@s)", c);
            s.Parameters.AddWithValue("@nm", TextBox1.Text.Trim());
            s.Parameters.AddWithValue("@s", RadioButtonList1.SelectedValue);
            c.Open();
            int a = s.ExecuteNonQuery();
            c.Close();
            if (a == 1)
            {
                TextBox1.Text = "";
                RadioButtonList1.ClearSelection();
                Response.Write("<script>alert('Inserted Successfully')</script>");
                print();
            }
            else
            {
                TextBox1.Text = "";
                RadioButtonList1.ClearSelection();
                Response.Write("<sript>alert('Error')</script>");
                print();
            }
        }
    }

    public void print()
    {
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT * FROM [categories]", c);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
}
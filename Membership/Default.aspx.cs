using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Membership
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string creds = "Server=10.48.38.5; Database=Members;UID=ITUser;PWD=CentraliaIT;";
            SqlConnection conn = new SqlConnection(creds);
            SqlCommand cmd = new SqlCommand("LogIn", conn);
            cmd.CommandType= System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text); 
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows) 
            { 
                dr.Read();
                string Last = dr[0].ToString();
                string First = dr[1].ToString();
                Session["Name"] = First + " " + Last;   
                conn.Close();
                Response.Redirect("members.aspx");
            }
            else
            {
                conn.Close();
                lblMessage.Text = "Hacker!!";
            }
          
           

        }
    }
}
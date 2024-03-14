using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Membership.Models;
using System.ComponentModel;

namespace Membership
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
           
            SqlConnection conn = new SqlConnection(db.getconnection());
            SqlCommand cmd = new SqlCommand("LogIn", conn);
            cmd.CommandType= System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            
            //output param 1
            SqlParameter visits = new SqlParameter();
            visits.ParameterName = "@Visits";
            visits.DbType = System.Data.DbType.Int32;
            visits.Direction = System.Data.ParameterDirection.Output;
            
            // output param 2
            SqlParameter LastVisit = new SqlParameter();
            LastVisit.ParameterName = "@LastVisit";
            LastVisit.DbType = System.Data.DbType.Date;
            LastVisit.Direction = System.Data.ParameterDirection.Output;
            // add both to the colleciton
            cmd.Parameters.Add(LastVisit);
            cmd.Parameters.Add(visits);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows) 
            { 
                dr.Read();
                string Last = dr[0].ToString();
                string First = dr[1].ToString();
                Session["Name"] = First + " " + Last;   
                conn.Close();

                int Visitcount = (int) visits.Value;
                DateTime LastVisited = (DateTime)LastVisit.Value;

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
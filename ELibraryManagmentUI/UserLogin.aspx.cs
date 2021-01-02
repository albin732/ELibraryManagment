using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibraryManagmentUI
{
    public partial class UserLogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            UserLogInAuth();
        }

        private void UserLogInAuth()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "Select * from member_master_tbl where member_id='" + tbxUserId.Text.Trim() + "'and password='"+tbxPassword.Text.Trim()+"'";

                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {
                        Response.Write("<script>alert('Login Successful')</script>");
                        Session["username"] = sdr.GetValue(8);
                        Session["fullname"] = sdr.GetValue(0);
                        Session["role"] = "user";
                        Session["status"] = sdr.GetValue(10);
                    }
                    Response.Redirect("HomePage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Credential')</script>");
                }


               
            }
            catch (Exception )
            {
            }
        }
    }
}
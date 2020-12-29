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
    public partial class AdminLogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            LogInAdmin();
        }

        private void LogInAdmin()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "Select * from admin_login_tbl where user_name='" + tbxUserId.Text.Trim() + "'and password='" + tbxPassword.Text.Trim() + "'";

                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {
                        Response.Write("<script>alert('Login Successful')</script>");
                        Session["username"] = sdr.GetValue(0);
                        Session["fullname"] = sdr.GetValue(2);
                        Session["role"] = "admin";
                    }
                    Response.Redirect("HomePage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Credential')</script>");
                }



            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}
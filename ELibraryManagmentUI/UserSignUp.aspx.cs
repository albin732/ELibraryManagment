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
    public partial class UserSignUp : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //sign up click event
        protected void SignUp_Click(object sender, EventArgs e)
        {
            if (CheckUserExists())
            {
                Response.Write("<script>alert('User Id Already Exists');</script>");
            }
            else
            { 
                SignUpNewUser();
            }
        }

        private bool CheckUserExists()
        {
            bool result = false;
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "Select * from member_master_tbl where member_id='"+tbxUserId.Text.Trim()+"'";

                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                con.Close();
                if (dt.Rows.Count >= 1)
                {
                    result = true;
                }
                else
                {
                    result = false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            return (result);
        }

        private void SignUpNewUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "Insert into member_master_tbl(full_name,dob,contact_no,email,state,city,pincode,full_address,member_id,password,account_status) values(@full_name,@dob,@contact_no,@email,@state,@city,@pincode,@full_address,@member_id,@password,@account_status)";

                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                cmd.Parameters.AddWithValue("@full_name", tbxFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", tbxDOB.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", tbxContactNumber.Text.Trim());
                cmd.Parameters.AddWithValue("@email", tbxEmailId.Text.Trim());
                cmd.Parameters.AddWithValue("@state", ddlState.Text.Trim());
                cmd.Parameters.AddWithValue("@city", tbxCity.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", tbxPinCode.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", tbxFullAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@member_id", tbxUserId.Text.Trim());
                cmd.Parameters.AddWithValue("@password", tbxPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "Pending");

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Sign Up Successful.Please LogIn');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}
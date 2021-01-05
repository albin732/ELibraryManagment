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
    public partial class UserProfile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"].ToString() == "" || Session["username"].ToString() == null)
                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("UserLogin.aspx");
                }
                else
                {
                    GetUserBookDataOnGrid();
                    if (!IsPostBack)
                    {
                        GetUserPersonalDetails();
                    }
                }
            }
            catch (Exception)
            {
            }
        }

        private void GetUserPersonalDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "select * from member_master_tbl where member_id = '" + Session["username"] + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    tbxFullName.Text = dt.Rows[0][0].ToString();
                    tbxDOB.Text = dt.Rows[0][1].ToString();
                    tbxContactNumber.Text = dt.Rows[0][2].ToString();
                    tbxEmailId.Text = dt.Rows[0][3].ToString();
                    ddlState.Text = dt.Rows[0][4].ToString();
                    tbxCity.Text = dt.Rows[0][5].ToString();
                    tbxPinCode.Text = dt.Rows[0][6].ToString();
                    tbxFullAddress.Text = dt.Rows[0][7].ToString();
                    tbxUserId.Text = dt.Rows[0][8].ToString();
                    tbxOldPassword.Text = dt.Rows[0][9].ToString();
                    lblAccountStatus.Text = dt.Rows[0][10].ToString();

                    if (dt.Rows[0][10].ToString().Trim() == "active")
                    {
                        lblAccountStatus.Attributes.Add("class", "badge badge-pill badge-success");
                    }
                    else if (dt.Rows[0][10].ToString().Trim() == "pending")
                    {
                        lblAccountStatus.Attributes.Add("class", "badge badge-pill badge-warning");
                    }
                    else if (dt.Rows[0][10].ToString().Trim() == "deactive")
                    {
                        lblAccountStatus.Attributes.Add("class", "badge badge-pill badge-danger");
                    }
                    else
                    {
                        lblAccountStatus.Attributes.Add("class", "badge badge-pill badge-info");
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void GetUserBookDataOnGrid()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "select * from book_issue_tbl where member_id = '"+Session["username"] +"'";
                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind(); 
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DateTime dueDate = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > dueDate)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Session["username"].ToString() == "" || Session["username"].ToString() == null)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("UserLogin.aspx");
            }
            else
            {
                UpdateUserProfile();
            }
        }

        private void UpdateUserProfile()
        {
            string password = "";
            if (tbxNewPassword.Text.Trim() != "")
            {
                password = tbxNewPassword.Text.Trim();
            }
            else
            {
                password = tbxOldPassword.Text.Trim();
            }

            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "Update member_master_tbl set full_name=@full_name, dob=@dob, contact_no=@contact_no, email=@email, state=@state, city=@city, pincode=@pincode, full_address=@full_address, password=@password, account_status=@account_status where member_id=@member_id";
                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                cmd.Parameters.AddWithValue("@full_name", tbxFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", tbxDOB.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", tbxContactNumber.Text.Trim());
                cmd.Parameters.AddWithValue("@email", tbxEmailId.Text.Trim());
                cmd.Parameters.AddWithValue("@state", ddlState.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", tbxCity.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", tbxPinCode.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", tbxFullAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@member_id", tbxUserId.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@account_status", "pending");
                int result = cmd.ExecuteNonQuery();
                con.Close();

                if (result > 0)
                {
                    Response.Write("<script>alert('Profile Updated successfully');</script>");
                    GetUserPersonalDetails();
                    GetUserBookDataOnGrid();
                }
                else
                {
                    Response.Write("<script>alert('Error occured while Updating');</script>");
                }
            }
            catch (Exception)
            {

                throw;
            }
        }



    }
}
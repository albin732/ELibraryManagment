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
    public partial class AdminMemberManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            if (tbxMemberId.Text.Trim().Equals(""))
            {
                Response.Write("<script>alert('Member Id is not Valid');</script>");
            }
            else
            {
                getMemeberById();
            }
        }

        private void getMemeberById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "Select * from member_master_tbl where member_Id='" + tbxMemberId.Text.Trim() + "'";

                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                con.Close();
                if (dt.Rows.Count >= 1)
                {
                    tbxFullName.Text = dt.Rows[0][0].ToString();
                    tbxDOB.Text = dt.Rows[0][1].ToString();
                    tbxContactNo.Text = dt.Rows[0][2].ToString();
                    tbxEmailId.Text = dt.Rows[0][3].ToString();
                    tbxState.Text = dt.Rows[0][4].ToString();
                    tbxCity.Text = dt.Rows[0][5].ToString();
                    tbxPinCode.Text = dt.Rows[0][6].ToString();
                    tbxFullAddress.Text = dt.Rows[0][7].ToString();
                    tbxAccountStatus.Text = dt.Rows[0][8].ToString();
                    tbxAccountStatus.Text = dt.Rows[0][10].ToString();

                }
                else
                {
                    Response.Write("<script>alert('Member doesn't exist');</script>");
                }



            }
            catch (Exception)
            {
            }
        }

        protected void lbtnStatusActive_Click(object sender, EventArgs e)
        {
            if (tbxMemberId.Text.Trim().Equals(""))
            {
                Response.Write("<script>alert('Member Id is not Valid');</script>");
            }
            else
            {
                UpdateMemberStatusById("active");
            }
        }

        protected void lbtnStatusPending_Click(object sender, EventArgs e)
        {
            if (tbxMemberId.Text.Trim().Equals(""))
            {
                Response.Write("<script>alert('Member Id is not Valid');</script>");
            }
            else
            {
                UpdateMemberStatusById("pending");
            }
        }

        protected void lbtnStatusDeactive_Click(object sender, EventArgs e)
        {
            if (tbxMemberId.Text.Trim().Equals(""))
            {
                Response.Write("<script>alert('Member Id is not Valid');</script>");
            }
            else
            {
                UpdateMemberStatusById("deactive");
            }
        }

        private void UpdateMemberStatusById(string status)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "Update member_master_tbl set account_status='" + status + "' where member_Id='" + tbxMemberId.Text.Trim() + "'";

                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Member Status Updated');</script>");
                GridView1.DataBind();
            }
            catch (Exception)
            {
            }
        }

        protected void btnDeletePermanently_Click(object sender, EventArgs e)
        {
            if (tbxMemberId.Text.Trim().Equals(""))
            {
                Response.Write("<script>alert('Member Id is not Valid');</script>");
            }
            else
            {
                DeleteMemberById();
            }
        }

        private void DeleteMemberById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "Delete from member_master_tbl where member_Id=@member_id";

                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                cmd.Parameters.AddWithValue("@member_id", tbxMemberId.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Member Deleted Successfully.');</script>");
                clearall();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }



        private void clearall()
        {
            tbxMemberId.Text = "";
            tbxFullName.Text = "";
            tbxDOB.Text = "";
            tbxContactNo.Text = "";
            tbxEmailId.Text = "";
            tbxState.Text = "";
            tbxCity.Text = "";
            tbxPinCode.Text = "";
            tbxFullAddress.Text = "";
            tbxAccountStatus.Text = "";
        }
    }
}
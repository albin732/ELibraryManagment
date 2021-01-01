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
    public partial class AdminPublisherManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            getPublisherById();
        }

        private void getPublisherById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "Select * from publisher_master_tbl where publisher_Id='" + tbxPublisherId.Text.Trim() + "'";

                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                con.Close();
                if (dt.Rows.Count >= 1)
                {
                    tbxPublisherName.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Publisher not found');</script>");
                }



            }
            catch (Exception)
            {
            }
        }

        private bool CheckIfPublisherExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "Select * from publisher_master_tbl where publisher_Id='"+ tbxPublisherId.Text.Trim() + "'";

                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                con.Close();
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }



            }
            catch (Exception)
            {
                return false;
            }
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (CheckIfPublisherExists())
            {
                Response.Write("<script>alert('Publisher Id already exists');</script>");
            }
            else
            {
                AddNewPublisher();
            }
        }

        private void AddNewPublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "Insert into publisher_master_tbl(publisher_id,publisher_name) values(@publisher_id,@publisher_name)";

                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                cmd.Parameters.AddWithValue("@publisher_id", tbxPublisherId.Text.Trim());
                cmd.Parameters.AddWithValue("@publisher_name", tbxPublisherName.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher Successfully Created.');</script>");
                clearall();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (CheckIfPublisherExists())
            {
                UpdatePublisher();
            }
            else
            {
                Response.Write("<script>alert('Publisher Id not found');</script>");
            }
        }

        private void UpdatePublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "Update publisher_master_tbl set publisher_name = @publisher_name where publisher_Id=@publisher_id";

                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                cmd.Parameters.AddWithValue("@publisher_id", tbxPublisherId.Text.Trim());
                cmd.Parameters.AddWithValue("@publisher_name", tbxPublisherName.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher Updated Successfully.');</script>");
                clearall();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

            if (CheckIfPublisherExists())
            {
                DeletePublisher();
            }
            else
            {
                Response.Write("<script>alert('Publisher Id not found');</script>");
            }
        }

        private void DeletePublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "Delete from publisher_master_tbl where publisher_Id=@publisher_id";

                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                cmd.Parameters.AddWithValue("@publisher_id", tbxPublisherId.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher Deleted Successfully.');</script>");
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
            tbxPublisherId.Text = "";
            tbxPublisherName.Text = "";
        }


    }
}
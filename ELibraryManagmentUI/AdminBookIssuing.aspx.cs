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
    public partial class AdminBookIssuing : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGO_Click(object sender, EventArgs e)
        {
            GetBookNameAndMemberName();
        }

        private void GetBookNameAndMemberName()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "Select book_name from book_master_tbl where book_Id='" + tbxBookId.Text.Trim() + "'";

                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                con.Close();
                if (dt.Rows.Count >= 1)
                {
                    tbxBookName.Text = dt.Rows[0]["book_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Book Id Not found');</script>");
                }



                sqlQuery = "Select full_name from member_master_tbl where member_Id='" + tbxMemberId.Text.Trim() + "'";

                cmd = new SqlCommand(sqlQuery, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);

                con.Close();
                if (dt.Rows.Count >= 1)
                {
                    tbxMemberName.Text = dt.Rows[0][0].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Member Id Not found');</script>");
                }



            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnIssue_Click(object sender, EventArgs e)
        {
            if (CheckIfBookExists() && CheckIfMemberExists())
            {
                if (CheckIfBookIssueExists())
                {
                    Response.Write("<script>alert('Book Already Issued');</script>");
                }
                else
                {
                    IssueBook();
                }
            }
        }

        private bool CheckIfBookIssueExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "Select book_name from book_issue_tbl where book_Id='" + tbxBookId.Text.Trim() + "' and member_id='"+tbxMemberId.Text.Trim()+"'";

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

        private void IssueBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "Insert into book_issue_tbl (member_id,member_name,book_id,book_name,issue_date,due_date) values (@member_id,@member_name,@book_id,@book_name,@issue_date,@due_date)";

                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                cmd.Parameters.AddWithValue("@member_id", tbxMemberId.Text.Trim());
                cmd.Parameters.AddWithValue("@member_name", tbxMemberName.Text.Trim());
                cmd.Parameters.AddWithValue("@book_id", tbxBookId.Text);
                cmd.Parameters.AddWithValue("@book_name", tbxBookName.Text);
                cmd.Parameters.AddWithValue("@issue_date", tbxStartDate.Text);
                cmd.Parameters.AddWithValue("@due_date", tbxEndDate.Text);
                cmd.ExecuteNonQuery();

                sqlQuery = "Update book_master_tbl set current_stock=current_stock-1 where book_id='" + tbxBookId.Text.Trim()+"'";
                cmd = new SqlCommand(sqlQuery, con);
                cmd.ExecuteNonQuery();

                con.Close();

                Response.Write("<script>alert('Book Issued successfully');</script>");
                GridView1.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

        private bool CheckIfBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "Select book_name from book_master_tbl where book_Id='" + tbxBookId.Text.Trim() + "' and current_stock > 0";

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

        private bool CheckIfMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "Select full_name from member_master_tbl where member_Id='" + tbxMemberId.Text.Trim() + "'";

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

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            if (CheckIfBookExists() && CheckIfMemberExists())
            {
                if (CheckIfBookIssueExists())
                {
                    ReturnBook();
                }
                else
                {
                    Response.Write("<script>alert('Book is not Issued');</script>");
                }
            }
        }

        private void ReturnBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "Delete from book_issue_tbl where member_id='"+tbxMemberId.Text.Trim()+"' and book_id='"+tbxBookId.Text.Trim()+"'";
                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    sqlQuery = "Update book_master_tbl set current_stock=current_stock+1 where book_id='" + tbxBookId.Text.Trim() + "'";
                    cmd = new SqlCommand(sqlQuery, con);
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Book Returned successfully');</script>");
                    GridView1.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Error occured');</script>");
                }
                con.Close();

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
    }
}
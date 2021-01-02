using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibraryManagmentUI
{
    public partial class AdminBookInventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            FillAuthorPublisherValues();
            GridView1.DataBind();
        }

        private void FillAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "select author_name from author_master_tbl";
                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                ddlAuthorName.DataSource = dt;
                ddlAuthorName.DataValueField = "author_name";
                ddlAuthorName.DataBind();


                sqlQuery = "select publisher_name from publisher_master_tbl";
                cmd = new SqlCommand(sqlQuery, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                ddlPublisherName.DataSource = dt;
                ddlPublisherName.DataValueField = "publisher_name";
                ddlPublisherName.DataBind();
            }
            catch (Exception)
            {
            }
        }


        protected void btnGo_Click(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (CheckIfBookExists())
            {
                Response.Write("<script>alert('Book already exists');</script>");
            }
            else
            {
                AddNewBook();
            }
        }

        private void AddNewBook()
        {
            try
            {
                string genres = "";
                foreach (int i in lbxGenere.GetSelectedIndices())
                {
                    genres = genres + lbxGenere.Items[i] + ",";
                }


                string filepath = "~/Book_Inventory/books1.png";
                string filename = Path.GetFileName(fupImageUrl.PostedFile.FileName);
                fupImageUrl.SaveAs(Server.MapPath("Book_Inventory/" + filename));
                filepath = "~/Book_Inventory/" + filename;


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "Insert into book_master_tbl (book_id,book_name,genre,author_name,publisher_name,publish_date,language,edition,book_cost,no_of_pages,book_description,current_stock,actual_stock,book_image_link) values (@book_id,@book_name,@genre,@author_name,@publisher_name,@publish_date,@language,@edition,@book_cost,@no_of_pages,@book_description,@current_stock,@actual_stock,@book_image_link)";

                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                cmd.Parameters.AddWithValue("@book_id", tbxBookId.Text);
                cmd.Parameters.AddWithValue("@book_name", tbxBookName.Text);
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@author_name", ddlAuthorName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", ddlPublisherName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", tbxPublishDate.Text);
                cmd.Parameters.AddWithValue("@language",ddlLanguage.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", tbxEdition.Text);
                cmd.Parameters.AddWithValue("@book_cost", tbxBookCost.Text);
                cmd.Parameters.AddWithValue("@no_of_pages", tbxPages.Text);
                cmd.Parameters.AddWithValue("@book_description", tbxBookDescription.Text);
                cmd.Parameters.AddWithValue("@current_stock", tbxCurrentStock.Text);
                cmd.Parameters.AddWithValue("@actual_stock", tbxActualStock.Text);
                cmd.Parameters.AddWithValue("@book_image_link", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('New Book added successfully');</script>");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
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
                string sqlQuery = "Select * from book_master_tbl where book_Id='" + tbxBookId.Text.Trim() + "'";

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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }
    }
}
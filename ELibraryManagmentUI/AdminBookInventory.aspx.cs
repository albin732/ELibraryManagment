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
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillAuthorPublisherValues();
            }
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
            if (CheckIfBookExists())
            {
                getBookById();
            }
            else
            {
                Response.Write("<script>alert('Book doesn't exists');</script>");
            }
        }

        private void getBookById()
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
                    tbxBookName.Text = dt.Rows[0][1].ToString();

                    lbxGenere.ClearSelection();
                    string[] genres = dt.Rows[0][2].ToString().Trim().Split(',');
                    for (int i = 0; i < genres.Length; i++)
                    {
                        for (int j = 0; j < lbxGenere.Items.Count; j++)
                        {
                            if (lbxGenere.Items[j].ToString() == genres[i])
                            {
                                lbxGenere.Items[j].Selected = true;
                            }
                        }
                    }

                    ddlAuthorName.Text = dt.Rows[0][3].ToString().Trim();
                    ddlPublisherName.Text = dt.Rows[0][4].ToString().Trim();
                    tbxPublishDate.Text = dt.Rows[0][5].ToString();
                    ddlLanguage.Text = dt.Rows[0][6].ToString().Trim();
                    tbxEdition.Text = dt.Rows[0][7].ToString();
                    tbxBookCost.Text = dt.Rows[0][8].ToString().Trim();
                    tbxPages.Text = dt.Rows[0][9].ToString().Trim();
                    tbxBookDescription.Text = dt.Rows[0][10].ToString();
                    tbxActualStock.Text = dt.Rows[0][11].ToString().Trim();
                    tbxCurrentStock.Text = dt.Rows[0][12].ToString().Trim();
                    tbxIssuedBooks.Text = (Convert.ToInt32(dt.Rows[0][11].ToString().Trim()) - Convert.ToInt32(dt.Rows[0][12].ToString().Trim())).ToString();

                    global_actual_stock = Convert.ToInt32(dt.Rows[0][11].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0][12].ToString().Trim());
                    global_issued_books = global_actual_stock - global_current_stock;
                    global_filepath = dt.Rows[0][13].ToString().Trim();
                }
            }
            catch (Exception)
            {
            }
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
                    if (genres != "")
                        genres = genres + "," + lbxGenere.Items[i];
                    else
                        genres = lbxGenere.Items[i].ToString();

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
                cmd.Parameters.AddWithValue("@language", ddlLanguage.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", tbxEdition.Text);
                cmd.Parameters.AddWithValue("@book_cost", tbxBookCost.Text);
                cmd.Parameters.AddWithValue("@no_of_pages", tbxPages.Text);
                cmd.Parameters.AddWithValue("@book_description", tbxBookDescription.Text);
                cmd.Parameters.AddWithValue("@current_stock", tbxActualStock.Text);
                cmd.Parameters.AddWithValue("@actual_stock", tbxActualStock.Text);
                cmd.Parameters.AddWithValue("@book_image_link", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('New Book added successfully');</script>");
                GridView1.DataBind();
            }
            catch (Exception )
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
            if (CheckIfBookExists())
            {
                UpdateBookById();
            }
            else
            {
                Response.Write("<script>alert('Book Not Found');</script>");
            }
        }

        private void UpdateBookById()
        {
            try
            {
                //current changes in book count
                int actual_stock = Convert.ToInt32(tbxActualStock.Text.Trim());
                int current_stock = Convert.ToInt32(tbxCurrentStock.Text.Trim());
                if (global_actual_stock == actual_stock)
                {

                }
                else
                {
                    if (actual_stock < global_issued_books)
                    {
                        Response.Write("<script>alert('actual stock value cannot be lessthan issued books');</script>");
                    }
                    else
                    {
                        current_stock = actual_stock - global_issued_books;
                        tbxCurrentStock.Text = current_stock.ToString();
                    }
                }


                //listbox multi selected items,second simplified
                string genres = "";
                foreach (int i in lbxGenere.GetSelectedIndices())
                {
                    genres = genres + lbxGenere.Items[i] + ",";
                }
                genres = genres.Remove(genres.Length - 1);


                //file upload
                string filepath = "~/Book_Inventory/books1.png";
                string filename = Path.GetFileName(fupImageUrl.PostedFile.FileName);
                if (filename == "" || filename == null)
                {
                    filepath = global_filepath;
                }
                else
                {
                    fupImageUrl.SaveAs(Server.MapPath("Book_Inventory/" + filename));
                    filepath = "~/Book_Inventory/" + filename;
                }


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "Update book_master_tbl set book_name=@book_name, genre=@genre, author_name=@author_name, publisher_name=@publisher_name, publish_date=@publish_date, language=@language, edition=@edition, book_cost=@book_cost, no_of_pages=@no_of_pages, book_description=@book_description, actual_stock=@actual_stock, current_stock=@current_stock, book_image_link=@book_image_link where book_Id='" + tbxBookId.Text.Trim() + "'";

                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                cmd.Parameters.AddWithValue("@book_name", tbxBookName.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@author_name", ddlAuthorName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", ddlPublisherName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", tbxPublishDate.Text.Trim());
                cmd.Parameters.AddWithValue("@language", ddlLanguage.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", tbxEdition.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", tbxBookCost.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", tbxPages.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", tbxBookDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", actual_stock.ToString());
                cmd.Parameters.AddWithValue("@current_stock", current_stock.ToString());
                cmd.Parameters.AddWithValue("@book_image_link", filepath);

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Member Status Updated');</script>");
                GridView1.DataBind();
            }
            catch (Exception )
            {
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (CheckIfBookExists())
            {
                DeleteBookById();
            }
            else
            {
                Response.Write("<script>alert('Book Not Found');</script>");
            }
        }

        private void DeleteBookById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string sqlQuery = "Delete from book_master_tbl where book_Id=@book_id";

                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                cmd.Parameters.AddWithValue("@book_id", tbxBookId.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book Deleted Successfully.');</script>");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}
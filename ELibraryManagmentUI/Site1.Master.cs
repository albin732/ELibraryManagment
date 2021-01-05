using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ELibraryManagmentUI
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals(""))
                {
                    lbtnUserLogIn.Visible = true;
                    lbtnSignUp.Visible = true;

                    lbtnLogOut.Visible = false;
                    lbtnUserProfile.Visible = false;

                    lbtnAdminLogin.Visible = true;
                    lbtnAuthorManagement.Visible = false;
                    lbtnPublisherManagement.Visible = false;
                    lbtnBookInventory.Visible = false;
                    lbtnBookIssuing.Visible = false;
                    lbtnMemberManagement.Visible = false;
                }
                else if(Session["role"].Equals("user"))
                {
                    lbtnUserLogIn.Visible = false;
                    lbtnSignUp.Visible = false;

                    lbtnLogOut.Visible = true;
                    lbtnUserProfile.Visible = true;

                    lbtnAdminLogin.Visible = false;
                    lbtnAuthorManagement.Visible = false;
                    lbtnPublisherManagement.Visible = false;
                    lbtnBookInventory.Visible = false;
                    lbtnBookIssuing.Visible = false;
                    lbtnMemberManagement.Visible = false;

                    lbtnUserProfile.Text = "Hello "+ Session["username"].ToString();
                }
                else if (Session["role"].Equals("admin"))
                {
                    lbtnUserLogIn.Visible = false;
                    lbtnSignUp.Visible = false;

                    lbtnLogOut.Visible = true;
                    lbtnUserProfile.Visible = true;

                    lbtnAdminLogin.Visible = false;
                    lbtnAuthorManagement.Visible = true;
                    lbtnPublisherManagement.Visible = true;
                    lbtnBookInventory.Visible = true;
                    lbtnBookIssuing.Visible = true;
                    lbtnMemberManagement.Visible = true;

                    lbtnUserProfile.Text = "Hello Admin";
                }
            }
            catch (Exception )
            {
                //Response.Write("<script>alert('"+ex.Message+"')</script>");
            }
        }






        protected void lbtnViewBooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewBooks.aspx");
        }
        protected void lbtnUserLogIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }

        protected void lbtnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserSignUp.aspx");
        }



        protected void lbtnAdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }

        protected void lbtnAuthorManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminAuthorManagement.aspx");
        }

        protected void lbtnPublisherManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPublisherManagement.aspx");
        }

        protected void lbtnBookInventory_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminBookInventory.aspx");
        }

        protected void lbtnBookIssuing_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminBookIssuing.aspx");
        }

        protected void lbtnMemberManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminMemberManagement.aspx");
        }

        protected void lbtnLogOut_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";
            Page_Load(null,null);
            Response.Redirect("HomePage.aspx");
        }

        protected void lbtnUserProfile_Click1(object sender, EventArgs e)
        {
            Response.Redirect("UserProfile.aspx");
        }
    }
}
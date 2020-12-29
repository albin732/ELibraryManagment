<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="ELibraryManagmentUI.UserLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col text-center">
                                <img width="150" src="Images/generaluser.png" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col text-center">
                                <h3>Member Login</h3>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col text-center">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">

                                <asp:Label Text="Member ID" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxUserId" CssClass="form-control" placeholder="Member ID" runat="server"></asp:TextBox>
                                </div>

                                
                                <asp:Label Text="Password" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxPassword" CssClass="form-control" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
                                </div>

                                
                                <div class="form-group">
                                    <asp:Button ID="btnLogIn" CssClass="btn btn-success btn-block" runat="server" Text="LogIn" OnClick="btnLogIn_Click" />
                                </div>

                                
                                <div class="form-group">
                                    <a href="UserSignUp.aspx">
                                    <input id="Button2" class="btn btn-info btn-block" type="button" value="Sign Up" />
                                    </a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <a href="HomePage.aspx"><< Back to Home</a>
                <br />
                <br />
            </div>
        </div>
    </div>
</asp:Content>

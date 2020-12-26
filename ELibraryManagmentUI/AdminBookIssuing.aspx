<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminBookIssuing.aspx.cs" Inherits="ELibraryManagmentUI.AdminBookIssuing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col text-center">
                                <h4>Book Issuing</h4>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col text-center">
                                <img width="100" src="Images/books.png" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col text-center">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label Text="Member ID" runat="server" />
                                <div class="form-group">
                                        <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="Member ID" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label Text="Book ID" runat="server" />
                                <div class="form-group">
                                    <div class="input-group">
                                    <asp:TextBox ID="TextBox3" CssClass="form-control" placeholder="Book ID" runat="server"></asp:TextBox>
                                        <asp:Button ID="Button1" CssClass="btn btn-secondary" runat="server" Text="GO" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label Text="Member Name" runat="server" />
                                <div class="form-group">
                                        <asp:TextBox ID="TextBox2" CssClass="form-control" placeholder="Member Name" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label Text="Book Name" runat="server" />
                                <div class="form-group">
                                        <asp:TextBox ID="TextBox4" CssClass="form-control" placeholder="Book Name" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label Text="Start Date" runat="server" />
                                <div class="form-group">
                                        <asp:TextBox ID="TextBox5" CssClass="form-control" placeholder="Start Date" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label Text="End Date" runat="server" />
                                <div class="form-group">
                                        <asp:TextBox ID="TextBox6" CssClass="form-control" placeholder="End Date" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col-6 mx-auto">
                                <div class="form-group text-center">
                                    <asp:Button ID="Button3" CssClass="btn btn-primary btn-block btn-lg" runat="server" Text="Issue" />
                                </div>
                            </div>
                            <div class="col-6 mx-auto">
                                <div class="form-group text-center">
                                    <asp:Button ID="Button2" CssClass="btn btn-success btn-block btn-lg" runat="server" Text="Return" />
                                </div>
                            </div>

                        </div>
                    </div>

                </div>

                <a href="HomePage.aspx"><< Back to Home</a>
                <br />
                <br />
            </div>


            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col text-center">
                                <h4>Issued Book  List</h4>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col text-center">
                                <asp:GridView ID="GridView1" class="table table-striped table-bordered" runat="server"></asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>

            </div>


        </div>
    </div>
</asp:Content>

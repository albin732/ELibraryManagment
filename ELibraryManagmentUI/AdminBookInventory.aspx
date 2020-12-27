<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminBookInventory.aspx.cs" Inherits="ELibraryManagmentUI.AdminBookInventory" %>
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
                                <h4>Book Details</h4>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col text-center">
                                <img width="100" src="Images/Books.png" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col text-center">
                                <hr />
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col text-center">
                                <asp:FileUpload ID="FileUpload1" class="form-control" runat="server" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label Text="Book ID" runat="server" />
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="TextBox3" CssClass="form-control" placeholder="ID" runat="server"></asp:TextBox>
                                        <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="GO" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-9">
                                <asp:Label Text="Book Name" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="Book Name" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <asp:Label Text="Language" runat="server" />
                                <div class="form-group">
                                    <asp:DropDownList ID="DropDownList1" class="form-control" runat="server">
                                        <asp:ListItem Text="English" Value="English" />
                                        <asp:ListItem Text="Malayalam" Value="Malayalam" />
                                        <asp:ListItem Text="Tamil" Value="Tamil" />
                                        <asp:ListItem Text="Hindi" Value="Hindi" />
                                    </asp:DropDownList>
                                </div>

                                <asp:Label Text="Publisher Name" runat="server" />
                                <div class="form-group">
                                    <asp:DropDownList ID="DropDownList2" class="form-control" runat="server">
                                        <asp:ListItem Text="Publisher 1" Value="Publisher 1" />
                                        <asp:ListItem Text="Publisher 2" Value="Publisher 2" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Label Text="Author Name" runat="server" />
                                <div class="form-group">
                                    <asp:DropDownList ID="DropDownList3" class="form-control" runat="server">
                                        <asp:ListItem Text="Author 1" Value="Author 1" />
                                        <asp:ListItem Text="Author 2" Value="Author 2" />
                                    </asp:DropDownList>
                                </div>

                                
                                <asp:Label Text="Publish Date" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox4" CssClass="form-control" placeholder="Publish Date" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Label Text="Genre" runat="server" />
                                <div class="form-group">
                                    <asp:ListBox ID="ListBox1" CssClass="form-control" runat="server" SelectionMode="Multiple">
                                        <asp:ListItem Text="Adventure" Value="Adventure" />
                                        <asp:ListItem Text="Comic" Value="Comic" />
                                        <asp:ListItem Text="Motivation" Value="Motivation" />
                                        <asp:ListItem Text="Health" Value="Health" />
                                        <asp:ListItem Text="Crime" Value="Crime" />
                                        <asp:ListItem Text="Drama" Value="Drama" />
                                        <asp:ListItem Text="Science" Value="Science" />
                                    </asp:ListBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <asp:Label Text="Edition" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox5" CssClass="form-control" placeholder="Edition" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <asp:Label Text="Book Cost(Per Unit)" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox8" CssClass="form-control" placeholder="Book Cost(Per Unit)" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Label Text="Pages" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox6" CssClass="form-control" placeholder="Pages" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-4">
                                <asp:Label Text="Actual Stock" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox2" CssClass="form-control" placeholder="Actual Stock" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <asp:Label Text="Current Stock" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox7" CssClass="form-control" placeholder="Current Stock" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Label Text="Issued Books" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox9" CssClass="form-control" placeholder="Issued Books" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <asp:Label Text="Book Description" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox12" CssClass="form-control" placeholder="Book Description" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                            
                        </div>


                        <div class="row">
                            <div class="col-4 mx-auto">
                                <div class="form-group text-center">
                                    <asp:Button ID="Button3" CssClass="btn btn-success btn-block btn-lg" runat="server" Text="Add" />
                                </div>
                            </div>
                            <div class="col-4 mx-auto">
                                <div class="form-group text-center">
                                    <asp:Button ID="Button2" CssClass="btn btn-primary btn-block btn-lg" runat="server" Text="Update" />
                                </div>
                            </div>
                            <div class="col-4 mx-auto">
                                <div class="form-group text-center">
                                    <asp:Button ID="Button4" CssClass="btn btn-danger btn-block btn-lg" runat="server" Text="Delete" />
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
                                <h4>Book Inventory List</h4>
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

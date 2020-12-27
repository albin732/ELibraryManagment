<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="ELibraryManagmentUI.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--Bootstrap css--%>
    <link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <%--DataTables css--%>
    <link href="DataTables/css/jquery.dataTables.min.css" rel="stylesheet" />
    <%--FontAwesome css--%>
    <link href="Fontawesome/css/all.css" rel="stylesheet" />
    <%--custom css--%>
    <link href="css/CustomStyleSheet.css" rel="stylesheet" />

    
    <%--Bootstrap js--%>
    <script src="Bootstrap/js/bootstrap.min.js"></script>
    <%--Popper js--%>
    <script src="Bootstrap/js/popper.min.js"></script>
    <%--DataTables js--%>
    <script src="DataTables/js/jquery.dataTables.min.js"></script>
    <%--FontAwesomes js--%>
    <script src="Fontawesome/js/all.js"></script>
</head>
<body>
    <form id="form1" runat="server">
         <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col text-center">
                                <h4>Member Details</h4>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col text-center">
                                <img width="100" src="Images/generaluser.png" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col text-center">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label Text="Member ID" runat="server" />
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="TextBox3" CssClass="form-control" placeholder="ID" runat="server"></asp:TextBox>
                                        <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="GO" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Label Text="Full Name" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="Full Name" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <asp:Label Text="Account Status" runat="server" />
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="TextBox7" CssClass="form-control mr-1" placeholder="Account Status" runat="server" ReadOnly="true"></asp:TextBox>
                                        <asp:LinkButton ID="LinkButton1" CssClass="btn btn-success mr-1" runat="server"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton2" CssClass="btn btn-warning mr-1" runat="server"><i class="far fa-pause-circle"></i></asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton3" CssClass="btn btn-danger mr-1" runat="server"><i class="fas fa-times-circle"></i></asp:LinkButton>
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
                            <div class="col-md-3">
                                <asp:Label Text="DOB" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox5" CssClass="form-control" placeholder="DOB" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <asp:Label Text="Contact No" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox8" CssClass="form-control" placeholder="Contact No" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <asp:Label Text="Email ID" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox6" CssClass="form-control" placeholder="Email ID" runat="server" ReadOnly="true" ></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-4">
                                <asp:Label Text="State" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox9" CssClass="form-control" placeholder="State" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <asp:Label Text="City" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox10" CssClass="form-control" placeholder="City" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Label Text="Pin Code" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox11" CssClass="form-control" placeholder="Pin Code" runat="server" ReadOnly="true" ></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <asp:Label Text="Full Postal Address" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox12" CssClass="form-control" placeholder="Full Postal Address" runat="server" ReadOnly="true" Rows="4" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                            
                        </div>


                        <div class="row">
                            <div class="col-8 mx-auto">
                                <div class="form-group text-center">
                                    <asp:Button ID="Button3" CssClass="btn btn-danger btn-block btn-lg" runat="server" Text="Delete User Permanently" />
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
                                <h4>Member List</h4>
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
    </form>
</body>
</html>

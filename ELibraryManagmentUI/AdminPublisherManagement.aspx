<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminPublisherManagement.aspx.cs" Inherits="ELibraryManagmentUI.AdminPublisherManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col text-center">
                                <h4>Publisher Details</h4>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col text-center">
                                <img width="100" src="Images/publisher.png" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col text-center">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <asp:Label Text="Publisher ID" runat="server" />
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="tbxPublisherId" CssClass="form-control" placeholder="ID" runat="server"></asp:TextBox>
                                        <asp:Button ID="btnGo" CssClass="btn btn-primary" runat="server" Text="GO" OnClick="btnGo_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <asp:Label Text="Publisher Name" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxPublisherName" CssClass="form-control" placeholder="Publisher Name" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col-4 mx-auto">
                                <div class="form-group text-center">
                                    <asp:Button ID="btnAdd" CssClass="btn btn-success btn-block btn-lg" runat="server" Text="Add" OnClick="btnAdd_Click" />
                                </div>
                            </div>
                            <div class="col-4 mx-auto">
                                <div class="form-group text-center">
                                    <asp:Button ID="btnUpdate" CssClass="btn btn-primary btn-block btn-lg" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                                </div>
                            </div>
                            <div class="col-4 mx-auto">
                                <div class="form-group text-center">
                                    <asp:Button ID="btnDelete" CssClass="btn btn-danger btn-block btn-lg" runat="server" Text="Delete" OnClick="btnDelete_Click" />
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
                                <h4>Publisher List</h4>
                            </div>
                        </div>


                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT * FROM [publisher_master_tbl]"></asp:SqlDataSource>
                            <div class="col text-center">
                                <asp:GridView ID="GridView1" class="table table-striped table-bordered" runat="server" DataSourceID="SqlDataSource1"></asp:GridView>
                            </div>
                        </div>


                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

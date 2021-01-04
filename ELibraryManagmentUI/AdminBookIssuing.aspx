<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminBookIssuing.aspx.cs" Inherits="ELibraryManagmentUI.AdminBookIssuing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        })

    </script>
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
                                        <asp:TextBox ID="tbxMemberId" CssClass="form-control" placeholder="Member ID" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label Text="Book ID" runat="server" />
                                <div class="form-group">
                                    <div class="input-group">
                                    <asp:TextBox ID="tbxBookId" CssClass="form-control" placeholder="Book ID" runat="server"></asp:TextBox>
                                        <asp:Button ID="btnGO" CssClass="btn btn-secondary" runat="server" Text="GO" OnClick="btnGO_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label Text="Member Name" runat="server" />
                                <div class="form-group">
                                        <asp:TextBox ID="tbxMemberName" CssClass="form-control" placeholder="Member Name" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label Text="Book Name" runat="server" />
                                <div class="form-group">
                                        <asp:TextBox ID="tbxBookName" CssClass="form-control" placeholder="Book Name" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label Text="Start Date" runat="server" />
                                <div class="form-group">
                                        <asp:TextBox ID="tbxStartDate" CssClass="form-control" placeholder="Start Date" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label Text="End Date" runat="server" />
                                <div class="form-group">
                                        <asp:TextBox ID="tbxEndDate" CssClass="form-control" placeholder="End Date" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col-6 mx-auto">
                                <div class="form-group text-center">
                                    <asp:Button ID="btnIssue" CssClass="btn btn-primary btn-block btn-lg" runat="server" Text="Issue" OnClick="btnIssue_Click" />
                                </div>
                            </div>
                            <div class="col-6 mx-auto">
                                <div class="form-group text-center">
                                    <asp:Button ID="btnReturn" CssClass="btn btn-success btn-block btn-lg" runat="server" Text="Return" OnClick="btnReturn_Click" />
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
                            <asp:sqldatasource id="SqlDataSource1" runat="server" connectionstring="<%$ ConnectionStrings:con %>" selectcommand="SELECT * FROM [book_issue_tbl]"></asp:sqldatasource>
                            <div class="col text-center">
                                <asp:GridView ID="GridView1" class="table table-striped table-bordered" runat="server" autogeneratecolumns="False" datasourceid="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="member_Id" HeaderText="Member ID" SortExpression="member_Id" />
                                        <asp:BoundField DataField="member_name" HeaderText="Member Name" SortExpression="member_name" />
                                        <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id" />
                                        <asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name" />
                                        <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date" />
                                        <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>

            </div>


        </div>
    </div>
</asp:Content>

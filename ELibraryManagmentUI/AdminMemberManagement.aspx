<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminMemberManagement.aspx.cs" Inherits="ELibraryManagmentUI.AdminMemberManagement" %>

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
                                        <asp:TextBox ID="tbxMemberId" CssClass="form-control" placeholder="ID" runat="server"></asp:TextBox>
                                        <asp:Button ID="btnGo" CssClass="btn btn-primary" runat="server" Text="GO" OnClick="btnGo_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Label Text="Full Name" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxFullName" CssClass="form-control" placeholder="Full Name" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <asp:Label Text="Account Status" runat="server" />
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="tbxAccountStatus" CssClass="form-control mr-1" placeholder="Account Status" runat="server" ReadOnly="true"></asp:TextBox>
                                        <asp:LinkButton ID="lbtnStatusActive" CssClass="btn btn-success mr-1" runat="server" OnClick="lbtnStatusActive_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        <asp:LinkButton ID="lbtnStatusPending" CssClass="btn btn-warning mr-1" runat="server" OnClick="lbtnStatusPending_Click"><i class="far fa-pause-circle"></i></asp:LinkButton>
                                        <asp:LinkButton ID="lbtnStatusDeactive" CssClass="btn btn-danger mr-1" runat="server" OnClick="lbtnStatusDeactive_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label Text="DOB" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxDOB" CssClass="form-control" placeholder="DOB" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <asp:Label Text="Contact No" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxContactNo" CssClass="form-control" placeholder="Contact No" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <asp:Label Text="Email ID" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxEmailId" CssClass="form-control" placeholder="Email ID" runat="server" ReadOnly="true" ></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-4">
                                <asp:Label Text="State" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxState" CssClass="form-control" placeholder="State" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <asp:Label Text="City" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxCity" CssClass="form-control" placeholder="City" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Label Text="Pin Code" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxPinCode" CssClass="form-control" placeholder="Pin Code" runat="server" ReadOnly="true" ></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <asp:Label Text="Full Postal Address" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxFullAddress" CssClass="form-control" placeholder="Full Postal Address" runat="server" ReadOnly="true" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                            
                        </div>


                        <div class="row">
                            <div class="col-8 mx-auto">
                                <div class="form-group text-center">
                                    <asp:Button ID="btnDeletePermanently" CssClass="btn btn-danger btn-block btn-lg" runat="server" Text="Delete User Permanently" OnClick="btnDeletePermanently_Click" />
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>
                            <div class="col text-center">
                                <asp:GridView ID="GridView1" class="table table-striped table-bordered" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="member_id">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="ID" ReadOnly="True" SortExpression="member_id" />
                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="account_status" HeaderText="Status" SortExpression="account_status" />
                                        <asp:BoundField DataField="contact_no" HeaderText="Contact" SortExpression="contact_no" />
                                        <asp:BoundField DataField="email" HeaderText="Email ID" SortExpression="email" />
                                        <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
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

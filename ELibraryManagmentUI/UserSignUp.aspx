<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserSignUp.aspx.cs" Inherits="ELibraryManagmentUI.UserSignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col text-center">
                                <img width="100" src="Images/generaluser.png" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col text-center">
                                <h4>Member Sign Up</h4>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col text-center">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label Text="Full Name" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxFullName" CssClass="form-control" placeholder="Full Name" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label Text="Date of Birth" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxDOB" CssClass="form-control" placeholder="Date of Birth" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label Text="Contact Number" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxContactNumber" CssClass="form-control" placeholder="Contact Number" TextMode="Number" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label Text="Email ID" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxEmailId" CssClass="form-control" placeholder="Email ID" runat="server" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-4">
                                <asp:Label Text="State" runat="server" />
                                <div class="form-group">
                                    <asp:DropDownList ID="ddlState" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Select" Value="select" />
                                        <asp:ListItem Value="Andhra Pradesh" Text="Andhra Pradesh" />
                                        <asp:ListItem Value="Andaman and Nicobar Islands" Text="Andaman and Nicobar Islands" />
                                        <asp:ListItem Value="Arunachal Pradesh" Text="Arunachal Pradesh" />
                                        <asp:ListItem Value="Assam" Text="Assam" />
                                        <asp:ListItem Value="Bihar" Text="Bihar" />
                                        <asp:ListItem Value="Chandigarh" Text="Chandigarh" />
                                        <asp:ListItem Value="Chhattisgarh" Text="Chhattisgarh" />
                                        <asp:ListItem Value="Dadar and Nagar Haveli" Text="Dadar and Nagar Haveli" />
                                        <asp:ListItem Value="Daman and Diu" Text="Daman and Diu" />
                                        <asp:ListItem Value="Delhi" Text="Delhi" />
                                        <asp:ListItem Value="Lakshadweep" Text="Lakshadweep" />
                                        <asp:ListItem Value="Puducherry" Text="Puducherry" />
                                        <asp:ListItem Value="Goa" Text="Goa" />
                                        <asp:ListItem Value="Gujarat" Text="Gujarat" />
                                        <asp:ListItem Value="Haryana" Text="Haryana" />
                                        <asp:ListItem Value="Himachal Pradesh" Text="Himachal Pradesh" />
                                        <asp:ListItem Value="Jammu and Kashmir" Text="Jammu and Kashmir" />
                                        <asp:ListItem Value="Jharkhand" Text="Jharkhand" />
                                        <asp:ListItem Value="Karnataka" Text="Karnataka" />
                                        <asp:ListItem Value="Kerala" Text="Kerala" />
                                        <asp:ListItem Value="Madhya Pradesh" Text="Madhya Pradesh" />
                                        <asp:ListItem Value="Maharashtra" Text="Maharashtra" />
                                        <asp:ListItem Value="Manipur" Text="Manipur" />
                                        <asp:ListItem Value="Meghalaya" Text="Meghalaya" />
                                        <asp:ListItem Value="Mizoram" Text="Mizoram" />
                                        <asp:ListItem Value="Nagaland" Text="Nagaland" />
                                        <asp:ListItem Value="Odisha" Text="Odisha" />
                                        <asp:ListItem Value="Punjab" Text="Punjab" />
                                        <asp:ListItem Value="Rajasthan" Text="Rajasthan" />
                                        <asp:ListItem Value="Sikkim" Text="Sikkim" />
                                        <asp:ListItem Value="Tamil Nadu" Text="Tamil Nadu" />
                                        <asp:ListItem Value="Telangana" Text="Telangana" />
                                        <asp:ListItem Value="Tripura" Text="Tripura" />
                                        <asp:ListItem Value="Uttar Pradesh" Text="Uttar Pradesh" />
                                        <asp:ListItem Value="Uttarakhand" Text="Uttarakhand" />
                                        <asp:ListItem Value="West Bengal" Text="West Bengal" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Label Text="City" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxCity" CssClass="form-control" placeholder="City" runat="server" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Label Text="Pin Code" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxPinCode" CssClass="form-control" placeholder="Pin Code" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <asp:Label Text="Full Address" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxFullAddress" CssClass="form-control" placeholder="Full Address" runat="server" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col">
                                <div class="form-group text-center">
                                    <span class="badge rounded-pill bg-info text-light">Login Credentials</span>
                                </div>

                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label Text="User ID" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxUserId" class="form-control" placeholder="User ID" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Label Text="Password" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxPassword" CssClass="form-control" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Button ID="btnSignUp" CssClass="btn btn-success btn-block" runat="server" Text="Sign Up" OnClick="SignUp_Click" />
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

<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminBookInventory.aspx.cs" Inherits="ELibraryManagmentUI.AdminBookInventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        })

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $("#imageView").attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

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
                                <h4>Book Details</h4>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col text-center">
                                <img id="imageView" height="150" width="100" src="Book_Inventory/books1.png" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col text-center">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col text-center">
                                <asp:FileUpload ID="fupImageUrl" onchange="readURL(this)" class="form-control" runat="server" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label Text="Book ID" runat="server" />
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="tbxBookId" CssClass="form-control" placeholder="ID" runat="server"></asp:TextBox>
                                        <asp:Button ID="btnGo" CssClass="btn btn-primary" runat="server" Text="GO" OnClick="btnGo_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-9">
                                <asp:Label Text="Book Name" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxBookName" CssClass="form-control" placeholder="Book Name" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <asp:Label Text="Language" runat="server" />
                                <div class="form-group">
                                    <asp:DropDownList ID="ddlLanguage" class="form-control" runat="server">
                                        <asp:ListItem Text="English" Value="English" />
                                        <asp:ListItem Text="Malayalam" Value="Malayalam" />
                                        <asp:ListItem Text="Tamil" Value="Tamil" />
                                        <asp:ListItem Text="Hindi" Value="Hindi" />
                                    </asp:DropDownList>
                                </div>

                                <asp:Label Text="Publisher Name" runat="server" />
                                <div class="form-group">
                                    <asp:DropDownList ID="ddlPublisherName" class="form-control" runat="server">
                                        <asp:ListItem Text="Publisher 1" Value="Publisher 1" />
                                        <asp:ListItem Text="Publisher 2" Value="Publisher 2" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Label Text="Author Name" runat="server" />
                                <div class="form-group">
                                    <asp:DropDownList ID="ddlAuthorName" class="form-control" runat="server">
                                        <asp:ListItem Text="Author 1" Value="Author 1" />
                                        <asp:ListItem Text="Author 2" Value="Author 2" />
                                    </asp:DropDownList>
                                </div>


                                <asp:Label Text="Publish Date" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxPublishDate" CssClass="form-control" placeholder="Publish Date" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Label Text="Genre" runat="server" />
                                <div class="form-group">
                                    <asp:ListBox ID="lbxGenere" CssClass="form-control" runat="server" SelectionMode="Multiple">
                                        <asp:ListItem Text="Adventure" Value="Adventure" />
                                        <asp:ListItem Text="Comic" Value="Comic" />
                                        <asp:ListItem Text="Motivation" Value="Motivation" />
                                        <asp:ListItem Text="Health" Value="Health" />
                                        <asp:ListItem Text="Crime" Value="Crime" />
                                        <asp:ListItem Text="Drama" Value="Drama" />
                                        <asp:ListItem Text="Science" Value="Science" />
                                        <asp:ListItem Text="History" Value="History" />
                                    </asp:ListBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <asp:Label Text="Edition" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxEdition" CssClass="form-control" placeholder="Edition" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <asp:Label Text="Book Cost(Per Unit)" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxBookCost" CssClass="form-control" placeholder="Book Cost(Per Unit)" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Label Text="Pages" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxPages" CssClass="form-control" placeholder="Pages" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <asp:Label Text="Actual Stock" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxActualStock" CssClass="form-control" placeholder="Actual Stock" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <asp:Label Text="Current Stock" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxCurrentStock" CssClass="form-control" placeholder="Current Stock" runat="server" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Label Text="Issued Books" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxIssuedBooks" CssClass="form-control" placeholder="Issued Books" runat="server" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <asp:Label Text="Book Description" runat="server" />
                                <div class="form-group">
                                    <asp:TextBox ID="tbxBookDescription" CssClass="form-control" placeholder="Book Description" runat="server" TextMode="MultiLine"></asp:TextBox>
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
                                <h4>Book Inventory List</h4>
                            </div>
                        </div>


                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView ID="GridView1" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="book_Id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="book_Id" HeaderText="ID" ReadOnly="True" SortExpression="book_Id" >
                                        <ItemStyle Font-Bold="True" />
                                        </asp:BoundField>
                                        <asp:TemplateField>

                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-10">
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    Author -
                                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("author_name") %>'></asp:Label>
                                                                    &nbsp;| Genre -
                                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>'></asp:Label>
                                                                    &nbsp;| Language -
                                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("language") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    Publisher -
                                                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                                    &nbsp;| Publish Date -
                                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("publish_date") %>'></asp:Label>
                                                                    &nbsp;| Pages -
                                                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("no_of_pages") %>'></asp:Label>
                                                                    &nbsp;| Edition -
                                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("edition") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    Cost -
                                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("book_cost") %>'></asp:Label>
                                                                    &nbsp;| Actual Stock -
                                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("actual_stock") %>'></asp:Label>
                                                                    &nbsp;| Available -
                                                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("current_stock") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    Description -
                                                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Text='<%# Eval("book_description") %>' Font-Italic="True" Font-Size="Large"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <asp:Image ID="Image1" CssClass="img-fluid" runat="server" ImageUrl='<%# Eval("book_image_link") %>' />
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>

                                        </asp:TemplateField>
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

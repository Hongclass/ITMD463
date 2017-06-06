<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderSummary.aspx.cs" Inherits="MyWebFormsProject.OrderSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-2">
            </div>
            <div class="col-lg-8">
                <h1>Order Summary</h1>
                <p>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="OrderDS" ForeColor="#333333" GridLines="None" Width="437px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="ProductId" HeaderText="ProductId" SortExpression="ProductId" />
                            <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                            <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="OrderDS" runat="server" ConnectionString="<%$ ConnectionStrings:MyWebFormsProject %>"
                        SelectCommand="SELECT CartItems.ProductId, Products.ProductName, Products.UnitPrice, CartItems.Quantity FROM CartItems INNER JOIN Products ON CartItems.ProductId = Products.ProductID WHERE (CartItems.CartId = @CartId)">
                        <SelectParameters>
                            <asp:SessionParameter Name="CartId" SessionField="UserName" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </p>
                <p></p>
                <strong>
                    <asp:Label ID="Label1" runat="server" Text="Order Total: $"></asp:Label>
                    <asp:Label ID="Label2" runat="server" EnableViewState="false"></asp:Label>
                </strong>
                <p></p>

                <p>
                    <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataSourceID="UserDS" ForeColor="#333333">
                        <EditItemTemplate>
                            UserName:
                            <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                            <br />
                            FirstName:
                            <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                            <br />
                            LastName:
                            <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                            <br />
                            Email:
                            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <InsertItemTemplate>
                            UserName:
                            <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                            <br />
                            FirstName:
                            <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                            <br />
                            LastName:
                            <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                            <br />
                            Email:
                            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            UserName:
                            <asp:Label ID="UserNameLabel" runat="server" Text='<%# Bind("UserName") %>' />
                            <br />
                            FirstName:
                            <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Bind("FirstName") %>' />
                            <br />
                            LastName:
                            <asp:Label ID="LastNameLabel" runat="server" Text='<%# Bind("LastName") %>' />
                            <br />
                            Email:
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                            <br />

                        </ItemTemplate>
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                    </asp:FormView>
                    <asp:SqlDataSource ID="UserDS" runat="server" ConnectionString="<%$ ConnectionStrings:MyWebFormsProject %>" SelectCommand="SELECT [UserName], [FirstName], [LastName], [Email] FROM [Users] WHERE ([UserName] = @UserName)">
                        <SelectParameters>
                            <asp:SessionParameter Name="UserName" SessionField="UserName" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </p>
            </div>
        </div>
    </div>

    <div class="col-lg-5">
        <h2>Select Shipping Address And Payment option</h2>

        <div class="form-group">

            <label>Address</label>
            <asp:TextBox ID="txt_address" runat="server"
                placeholder="1111 St Address" TextMode="MultiLine" Text="1111 St Address" CssClass="form-control"
                Columns="5" Rows="20" Height="145px" Width="452px"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_address" ErrorMessage="Address is Required"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">

            <label>Mobile no</label>
            <asp:TextBox ID="txt_mobile_no" placeholder="Enter Mobile No" runat="server" CssClass="form-control" TextMode="SingleLine" Text="1234567890"></asp:TextBox>


            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_mobile_no" ErrorMessage="Mobile no is Required"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                ControlToValidate="txt_mobile_no" ErrorMessage="Please enter valid mobile no"
                ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>

        </div>
        <label>Payment Option </label>
        <asp:DropDownList ID="ddl_payment_option" runat="server">
            <asp:ListItem Value="Cash">Cash on delivery</asp:ListItem>
        </asp:DropDownList>
    </div>
    <p>&nbsp;</p>
    <p>&nbsp;</p>

    <div class="col-lg-2">
        <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Confirm Order" OnClick="Button1_Click" />
        <p>&nbsp;</p>
        <p>&nbsp;</p>

        <asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" Text="Cancel Order" OnClick="Button2_Click" />
    </div>
    <div class="col-lg-5">
    </div>
</asp:Content>


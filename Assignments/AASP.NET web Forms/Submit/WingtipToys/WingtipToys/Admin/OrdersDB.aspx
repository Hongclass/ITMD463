<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrdersDB.aspx.cs" Inherits="WingtipToys.Admin.OrdersDB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
    </p>
             <br />
    <h2>Order Details</h2>

    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="OrderDetailId" DataSourceID="OderDetailDS">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="OrderDetailId" HeaderText="OrderDetailId" InsertVisible="False" ReadOnly="True" SortExpression="OrderDetailId" />
                <asp:BoundField DataField="OrderId" HeaderText="OrderId" SortExpression="OrderId" />
                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                <asp:BoundField DataField="ProductId" HeaderText="ProductId" SortExpression="ProductId" />
                <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Could not be empty" ForeColor="Red" ValidationGroup="insert">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="OderDetailDS" runat="server" ConnectionString="<%$ ConnectionStrings:WingtipToys %>" DeleteCommand="DELETE FROM [OrderDetails] WHERE [OrderDetailId] = @OrderDetailId" InsertCommand="INSERT INTO [OrderDetails] ([OrderId], [Username], [ProductId], [Quantity], [UnitPrice]) VALUES (@OrderId, @Username, @ProductId, @Quantity, @UnitPrice)" SelectCommand="SELECT * FROM [OrderDetails]" UpdateCommand="UPDATE [OrderDetails] SET [OrderId] = @OrderId, [Username] = @Username, [ProductId] = @ProductId, [Quantity] = @Quantity, [UnitPrice] = @UnitPrice WHERE [OrderDetailId] = @OrderDetailId">
            <DeleteParameters>
                <asp:Parameter Name="OrderDetailId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="OrderId" Type="Int32" />
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="ProductId" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="UnitPrice" Type="Double" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="OrderId" Type="Int32" />
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="ProductId" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="UnitPrice" Type="Double" />
                <asp:Parameter Name="OrderDetailId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
    </p>
        <h2>Order</h2>

    <p>
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="OrderId" DataSourceID="OrderDS">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="OrderId" HeaderText="OrderId" InsertVisible="False" ReadOnly="True" SortExpression="OrderId" />
                <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                <asp:TemplateField HeaderText="Address" SortExpression="Address">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                <asp:TemplateField HeaderText="Payment" SortExpression="Payment">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Payment") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Payment") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="HasBeenShipped" SortExpression="HasBeenShipped">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("HasBeenShipped") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("HasBeenShipped") %>' Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="OrderDS" runat="server" ConnectionString="<%$ ConnectionStrings:WingtipToys %>" DeleteCommand="DELETE FROM [Orders] WHERE [OrderId] = @OrderId" InsertCommand="INSERT INTO [Orders] ([OrderDate], [Username], [Address], [Phone], [Total], [Payment], [HasBeenShipped]) VALUES (@OrderDate, @Username, @Address, @Phone, @Total, @Payment, @HasBeenShipped)" SelectCommand="SELECT * FROM [Orders]" UpdateCommand="UPDATE [Orders] SET [OrderDate] = @OrderDate, [Username] = @Username, [Address] = @Address, [Phone] = @Phone, [Total] = @Total, [Payment] = @Payment, [HasBeenShipped] = @HasBeenShipped WHERE [OrderId] = @OrderId">
            <DeleteParameters>
                <asp:Parameter Name="OrderId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="OrderDate" Type="DateTime" />
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Total" Type="Decimal" />
                <asp:Parameter Name="Payment" Type="String" />
                <asp:Parameter Name="HasBeenShipped" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="OrderDate" Type="DateTime" />
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Total" Type="Decimal" />
                <asp:Parameter Name="Payment" Type="String" />
                <asp:Parameter Name="HasBeenShipped" Type="Boolean" />
                <asp:Parameter Name="OrderId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
    </p>
</asp:Content>

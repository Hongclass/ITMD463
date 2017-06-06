<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SR.aspx.cs" Inherits="DataBindingDemoIIT.SR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DropDownList ID="CustomerDropDown" runat="server" ItemType="DataBindingDemoIIT.Model.Customer" AutoPostBack="True" DataSourceID="EntityDataSource1" DataTextField="CompanyName" DataValueField="CustomerID" >

    </asp:DropDownList>
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=NorthwindEntities" DefaultContainerName="NorthwindEntities" EnableFlattening="False" EntitySetName="Customers" Select="it.[CustomerID], it.[CompanyName]">
    </asp:EntityDataSource>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="EntityDataSource2" DataTextField="OrderID" DataValueField="OrderID" AutoPostBack="true"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" >
    </asp:DropDownList>
    <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=NorthwindEntities" DefaultContainerName="NorthwindEntities" EnableFlattening="False" EntitySetName="Orders" Select="it.[OrderID], it.[CustomerID]" EntityTypeFilter="Order" Where="it.CustomerID ==@custID">
        <WhereParameters>
            <asp:ControlParameter ControlID="CustomerDropDown" Name="custID" PropertyName="SelectedValue" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>
    <br />
    <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
    <br />
    <br />
    <asp:EntityDataSource ID="EntityDataSource3" runat="server" ConnectionString="name=NorthwindEntities" DefaultContainerName="NorthwindEntities" EnableFlattening="False" EntitySetName="Order_Details" Where="it.OrderID=@ordid" Select="it.[OrderID], it.[ProductID], it.[UnitPrice], it.[Quantity], it.[Discount]">
        <WhereParameters>
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="10328" Name="ordid" PropertyName="SelectedValue" Type="Int32" ConvertEmptyStringToNull="False" />
        </WhereParameters>
    </asp:EntityDataSource>
    <br />
    <asp:ListView ID="ListView1" runat="server" DataSourceID="EntityDataSource3"  OnSelectedIndexChanged="ListView1_SelectedIndexChanged" DataKeyNames="OrderID,ProductID">
<%--        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="OrderIDLabel" runat="server" Text='<%# Eval("OrderID") %>' />
                </td>
                <td>
                    <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' />
                </td>
                <td>
                    <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("UnitPrice") %>' />
                </td>
                <td>
                    <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                </td>
                <td>
                    <asp:Label ID="DiscountLabel" runat="server" Text='<%# Eval("Discount") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>--%>
<%--        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:TextBox ID="OrderIDTextBox" runat="server" Text='<%# Bind("OrderID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ProductIDTextBox" runat="server" Text='<%# Bind("ProductID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="UnitPriceTextBox" runat="server" Text='<%# Bind("UnitPrice") %>' />
                </td>
                <td>
                    <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DiscountTextBox" runat="server" Text='<%# Bind("Discount") %>' />
                </td>
            </tr>
        </EditItemTemplate>--%>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
<%--        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="OrderIDTextBox" runat="server" Text='<%# Bind("OrderID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ProductIDTextBox" runat="server" Text='<%# Bind("ProductID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="UnitPriceTextBox" runat="server" Text='<%# Bind("UnitPrice") %>' />
                </td>
                <td>
                    <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DiscountTextBox" runat="server" Text='<%# Bind("Discount") %>' />
                </td>
            </tr>
        </InsertItemTemplate>--%>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="OrderIDLabel" runat="server" Text='<%# Eval("OrderID") %>' />
                </td>
                <td>
                    <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' />
                </td>
                <td>
                    <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("UnitPrice") %>' />
                </td>
                <td>
                    <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                </td>
                <td>
                    <asp:Label ID="DiscountLabel" runat="server" Text='<%# Eval("Discount") %>' />
                </td>
                    </span>
                                     <td style="width:40px">
              <asp:LinkButton runat="server" ID="SelectODButton" 
                Text="Select" CommandName="Select" />
            </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">OrderID</th>
                                <th runat="server">ProductID</th>
                                <th runat="server">UnitPrice</th>
                                <th runat="server">Quantity</th>
                                <th runat="server">Discount</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style=""></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="OrderIDLabel" runat="server" Text='<%# Eval("OrderID") %>' />
                </td>
                <td>
                    <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' />
                </td>
                <td>
                    <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("UnitPrice") %>' />
                </td>
                <td>
                    <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                </td>
                <td>
                    <asp:Label ID="DiscountLabel" runat="server" Text='<%# Eval("Discount") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <br />
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False"  Height="50px" Width="125px" DataKeyNames="OrderID,ProductID">
        <Fields>
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" SortExpression="ProductID" />
            <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount" />
        </Fields>
    </asp:DetailsView>
    <asp:EntityDataSource ID="EntityDataSource4" runat="server" ConnectionString="name=NorthwindEntities" DefaultContainerName="NorthwindEntities" EnableFlattening="False" EntitySetName="Order_Details">
    </asp:EntityDataSource>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DC.aspx.cs" Inherits="DataBindingDemoIIT.DC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <br />
<%--    <asp:Label runat="server" AssociatedControlID="ddlCustomer"
        Text="Select a Customer to show Orders for: " />
&nbsp;&nbsp;--%>
<asp:DropDownList runat="server" ID="ddlCustomer"
        SelectMethod="CustomerGrid_GetData" AppendDataBoundItems="true"
        DataTextField="CompanyName" DataValueField="CustomerID"
        AutoPostBack="true">
  <asp:ListItem Value="" Text="- select a Customer to see Orders -" />
</asp:DropDownList>
    <br />
<br />
    
     <asp:GridView ID="OrderGrid" runat="server" ItemType="DataBindingDemoIIT.Model.Order" 
        AutoGenerateColumns="False" SelectMethod="OrderGrid_GetData">
         <Columns>
             
             <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
             <asp:BoundField DataField="OrderDate" DataFormatString="{0:d}" HeaderText="Order Date" />
             <asp:BoundField DataField="ShipCity" HeaderText="City" />
             <asp:BoundField DataField="ShipCountry" HeaderText="Country" />
         </Columns>

    </asp:GridView>
    <br />
    <asp:GridView ID="GridView1" runat="server" SelectMethod="GridView1_GetData" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="CompanyName" />
            <asp:BoundField DataField="o.OrderID" />
        </Columns>
    </asp:GridView>
    <br />
</asp:Content>

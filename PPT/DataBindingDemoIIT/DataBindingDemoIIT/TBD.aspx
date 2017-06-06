<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TBD.aspx.cs" Inherits="DataBindingDemoIIT.TBD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" ItemType="DataBindingDemoIIT.Model.Customer" SelectMethod="GridView1_GetData" UpdateMethod="GridView1_UpdateItem" DeleteMethod="GridView1_DeleteItem" AutoGenerateColumns="False"  AutoGenerateEditButton="True">
        <Columns>
            <asp:DynamicField DataField="CompanyName" HeaderText="CompanyName" />
            <asp:DynamicField DataField="ContactName" HeaderText="ContactName" />
            <asp:DynamicField DataField="City" HeaderText="City" />
            <asp:DynamicField DataField="CustomerID" HeaderText="CustomerID" />
        </Columns>
    </asp:GridView>

</asp:Content>

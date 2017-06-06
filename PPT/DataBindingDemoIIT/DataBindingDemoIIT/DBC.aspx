<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DBC.aspx.cs" Inherits="DataBindingDemoIIT.DBC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="customerGrid" runat="server" ItemType="DataBindingDemoIIT.Model.Customer" SelectMethod="customerGrid_GetData">
    </asp:GridView>
</asp:Content>

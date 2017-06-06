<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LC.aspx.cs" Inherits="DataBindingDemoIIT.LC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView ID="CustomerList" runat="server" ItemType="DataBindingDemoIIT.Model.Customer" SelectMethod="CustomerList_GetData">
                        <ItemTemplate>
                    <b style="font-size: large; font-style: normal">
                        <a href="/OrderList.aspx?id=<%#:Item.CustomerID %>">
                          <%#: Item.CompanyName %>
                        </a>
                    </b>
                </ItemTemplate>
                <ItemSeparatorTemplate>  |  </ItemSeparatorTemplate>

    </asp:ListView>
</asp:Content>

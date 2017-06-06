<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageDb.aspx.cs" Inherits="WingtipToys.ManageDb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style type="text/css">
        .list {
        }

            .list ul {
                margin: 0px;
                padding: 0px;
            }

                .list ul li {
                    list-style-type: none;
                    float: left;
                    padding: 30px 60px 0px 0px;
                    margin: 0px;
                }
    </style>
    <link rel="stylesheet" type="text/css" href="../CSS/css_container.css" />
    <H2>Assume you are the administrator and have the privilege to do CRUD operation to the following databases.</H2>
    <div class="container">
        <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-lg-8">
                <div id="div1">
                    <div class="list">
                        <ul>
                            <li>
                                <asp:Button CssClass="btn btn-primary"  Height="48px" ID="Button1" runat="server" Text="Products" OnClick="btn_products_Click" />
                            </li>
                            <li>
                                <asp:Button CssClass="btn btn-primary" ID="Button2" Height="48px" runat="server" Text="Orders" OnClick="btn_orders_Click" />
                            </li>
                            <li>
                               <asp:Button CssClass="btn btn-primary" ID="Button3" Height="48px" runat="server" Text="Users" OnClick="btn_users_Click" />
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-2"></div>
    </div>


</asp:Content>

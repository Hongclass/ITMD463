<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="DataBindingDemoIIT.OrderList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <section>
        <div>
            <hgroup>
                <h2><%: Page.Title %></h2>
            </hgroup>

            <asp:ListView ID="orderList" runat="server" 
                DataKeyNames="OrderID" GroupItemCount="4"
                ItemType="DataBindingDemoIIT.Model.Order" SelectMethod="orderList_GetData"   OnSelectedIndexChanged="orderList_SelectedIndexChanged">
                <EmptyDataTemplate>
                    <table >
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td/>
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                    <td runat="server" >
                        <table>
                            <tr>
                                <td>
                                
                                        <span>
                                            <%#:Item.OrderID%>
                                        </span>
                                     <td style="width:40px">
              <asp:LinkButton runat="server" ID="SelectOrderButton" 
                Text="Select" CommandName="Select" />
            </td>

                                    <br />
                                    <span>
                                        <b>OrderDate: </b><%#:String.Format("{0:d}", Item.OrderDate)%>
                                    </span>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        </p>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table style="width:100%;">
                        <tbody>
                            <tr>
                                <td>
                                    <table id="groupPlaceholderContainer" runat="server" style="width:100%">
                                        <tr id="groupPlaceholder"></tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
       
            <br />
          <%--  <asp:Repeater ID="Repeater1" runat="server">
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" 
                ItemType="DataBindingDemoIIT.Model.Order_Detail" AutoGenerateRows="true" ></asp:DetailsView>
                </asp:Repeater>--%>
            <asp:Repeater ID="Repeater1" runat="server" ItemType="DataBindingDemoIIT.Model.Order_Detail">
                
                  <HeaderTemplate>
          <table>
            <tr>
              <th>
                Prod. ID</th>
              <th>
                Qty</th>
                <th>
                    Price
                </th>
            </tr>
        </HeaderTemplate>
                <ItemTemplate>
                              <tr>
            <td style="background-color:#CCFFCC">
              <asp:Label runat="server" ID="Label1" Text='<%# Item.ProductID %>' />
            </td>
            <td style="background-color:#CCFFCC">
              <asp:Label runat="server" ID="Label2" Text='<%# Item.Quantity %>' />
            </td>
            <td style="background-color:#CCFFCC">
              <asp:Label runat="server" ID="Label3" Text='<%# Item.UnitPrice %>' />
            </td>

          </tr>
                  


                </ItemTemplate>
                <SeparatorTemplate>
                    <hr />
                </SeparatorTemplate>
            </asp:Repeater> 

        </div>
    </section>

</asp:Content>

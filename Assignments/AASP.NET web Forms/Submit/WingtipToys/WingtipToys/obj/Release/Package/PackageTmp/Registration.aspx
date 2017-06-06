<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WingtipToys.Registration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="container">
        <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-lg-10">
                <h3>Registration From</h3>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-2">
            </div>
            <div class="col-lg-5">

                <div class="form-group">
                    <label>UserName</label>
                    <asp:TextBox CssClass="form-control" ID="txt_name" runat="server" placeholder="Enter Username"></asp:TextBox>
                    <asp:Label ID="lbl_error" runat="server"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_name" ErrorMessage="Username is Required"></asp:RequiredFieldValidator>
                </div>

               <div class="form-group">
                    <label>FirstName</label>
                    <asp:TextBox CssClass="form-control" ID="txt_first" runat="server" placeholder="Enter Frist Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_first" ErrorMessage="Frist Name is Required"></asp:RequiredFieldValidator>
                </div>

               <div class="form-group">
                    <label>LastName</label>
                    <asp:TextBox CssClass="form-control" ID="txt_last" runat="server" placeholder="Enter Last Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txt_last" ErrorMessage="Last Name is Required"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">

                    <label>
                        Password
                    </label>
                    <asp:TextBox ID="txt_password" CssClass="form-control" runat="server" TextMode="Password" placeholder="Enter Password"></asp:TextBox>

                    <asp:PasswordStrength ID="PasswordStrength1" runat="server" StrengthIndicatorType="Text" PrefixText="Strength:" TargetControlID="txt_password"></asp:PasswordStrength>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_password" ErrorMessage="Password is Required"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">

                    <label>Email Address</label>
                    <asp:TextBox ID="txt_Email_address" runat="server" placeholder="Enter Email Address" TextMode="Email" CssClass="form-control"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_Email_address" ErrorMessage="Email is Required"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                <asp:Button CssClass="btn btn-info" ID="btn_submit" runat="server" Text="Submit" OnClick="btn_submit_Click" />
            </div>
            <div class="col-lg-5">
            </div>
        </div>
    </div>
    </div>










</asp:Content>


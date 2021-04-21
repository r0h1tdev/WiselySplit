<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WiselySplit.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <style type="text/css">
        #form1 {
            height: 330px;
        }
    </style>
    
</head>
<body style="width: 722px; height: 396px; margin-right: 0px;">
    <form id="loginForm" runat="server" style="font-family: 'Segoe UI'; font-weight: normal; background-color: #FFFFFF">
        <div style="width: 100%; height: 31px; text-align:center; background-color: #000000;">
            <asp:Label ID="headerLabel" runat="server" ForeColor="White" Text="Welcome to WiselySplit" BackColor="Black"></asp:Label>
        </div>
        <br />
        <div style="height: 29px; width: 291px; margin-left: 3%">
            <asp:Label ID="signUpLbl" runat="server" ForeColor="Blue" Text="Sign In into your account"></asp:Label>
        </div>
        <br />
        <div class="formContainer">
            <div>
                <div style="float:left; width:40%">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="UsernameLbl" runat="server" Text="Username" ForeColor="Blue"></asp:Label>
                    &nbsp;
                    <asp:Label ID="unameAsterick" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </div>
                <div style="float:left;">
                    <asp:TextBox ID="unameTxtBox" runat="server"></asp:TextBox>
                </div>
                <div style="float:left; margin-left:2%;">
                    <asp:RequiredFieldValidator ID="unameValidator" runat="server" ControlToValidate="unameTxtBox" ErrorMessage="Username is a required field" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            </div>
            <br />
            <div>
                <div style="float:left; width:40%">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="PasswordLbl" runat="server" Text="Password" ForeColor="Blue"></asp:Label>
                    &nbsp;
                    <asp:Label ID="passAsterick" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </div>
                <div style="float:left;">
                    <asp:TextBox ID="upassTxtBox" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <div style="float:left; margin-left:2%;">
                    <asp:RequiredFieldValidator ID="passValidator" runat="server" ControlToValidate="upassTxtBox" ErrorMessage="Password is a required field" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            </div>
            <br />
        </div>
        <br />
        <div style="height: 39px; margin-left:3%;">
            <div">
                <asp:Button ID="loginBtn" runat="server" Text="Login" BackColor="#0033CC" BorderColor="White" BorderStyle="None" BorderWidth="5px" ForeColor="White" Height="38px" Width="120px" OnClick="loginBtn_Click" />
            </div>
        </div>
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="invalidCredLbl" runat="server" ForeColor="Red" Text="Username or Password is Incorrect, please try again." Visible="False"></asp:Label>
        <br />
        <div style="width: 517px; margin-left:3%">
            <asp:Label ID="loginErrorLbl" runat="server" Text="Something went wrong, please try again" ForeColor="Red" Visible="False"></asp:Label>
        </div>
        <br />
        <div style="height: 39px">
            <div style="float:left; margin-left:3%;">
                <asp:HyperLink ID="signUpLink" runat="server" NavigateUrl="~/SignUp.aspx">Click here for new user</asp:HyperLink>
            </div>
        </div>
        <br />
        </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="WiselySplit.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #signUpForm {
            height: 677px;
            width: 1232px;
        }
    </style>
</head>
<body>
    <form id="signUpForm" runat="server" style="font-family: 'Segoe UI'; font-weight: normal; background-color: #FFFFFF; margin-right: 5px;">
        <div style="width: 100%; height: 31px; text-align:center; background-color: #000000;">
            s<asp:Label ID="headerLabel" runat="server" ForeColor="White" Text="Welcome to WiselySplit" BackColor="Black"></asp:Label>
        </div>
        <br />
        <div style="height: 29px; width: 352px; margin-left: 3%">
            <asp:Label ID="signUpLbl" runat="server" ForeColor="Blue" Text="Sign Up to start using WiselySplit"></asp:Label>
        </div>
        <div style="margin-left:3%;"><asp:Label ID="existingUserLbl" runat="server" ForeColor="Blue" Text="It seems you are an existing user, please sign in with account associated with " Visible="False"></asp:Label></div>
        <br />
        <div class="formContainer">
            <div>
                <div style="float:left; width: 30%; padding-left:3%;">
                    <asp:Label ID="UsernameLbl" runat="server" Text="Username" ForeColor="Blue"></asp:Label>
                    &nbsp;
                    <asp:Label ID="unameAsterick" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </div>
                <div style="float:left;">
                    <asp:TextBox ID="unameTxtBox" runat="server"></asp:TextBox>
                </div>
            &nbsp;
                <asp:RequiredFieldValidator ID="unameValidator" runat="server" ControlToValidate="unameTxtBox" ErrorMessage="Username is a required field" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            &nbsp;
                <asp:Label ID="unameTakenLbl" runat="server" Text="Username is already taken, please choose a different one" ForeColor="Red" Visible="False"></asp:Label>
            </div>
            <br />
            <div>
                <div style="float:left; width: 30%; padding-left:3%;">
                    <asp:Label ID="PasswordLbl" runat="server" Text="Password" ForeColor="Blue"></asp:Label>
                    &nbsp;
                    <asp:Label ID="passAsterick" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </div>
                <div style="float:left;">
                    <asp:TextBox ID="upassTxtBox" runat="server" TextMode="Password"></asp:TextBox>
                </div>
        &nbsp;
                <asp:RequiredFieldValidator ID="passValidator" runat="server" ControlToValidate="upassTxtBox" ErrorMessage="Password is a required field" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
&nbsp;</div>
            <br />
            <div>
                <div style="float:left; width: 30%; padding-left:3%;">
                    <asp:Label ID="ConfirmPasswordLbl" runat="server" Text="Confirm Password" ForeColor="Blue"></asp:Label>
                    &nbsp;
                    <asp:Label ID="confirmPassAsterick" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </div>
                <div style="float:left;">
                    <asp:TextBox ID="confirmPassTxtBox" runat="server" TextMode="Password"></asp:TextBox>
                </div>
            &nbsp;
                <asp:RequiredFieldValidator ID="confirmpassValidator" runat="server" ControlToValidate="confirmPassTxtBox" ErrorMessage="Confirm Password is a required field" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <br />
            <div>
                <div style="float:left; width: 30%; padding-left:3%;">
                    <asp:Label ID="EmailLbl" runat="server" Text="Email" ForeColor="Blue"></asp:Label>
                    &nbsp;
                    <asp:Label ID="emailAsterick" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </div>
                <div style="float:left;">
                    <asp:TextBox ID="emailTxtBox" runat="server" TextMode="Email"></asp:TextBox>
                </div>
        &nbsp;
                <asp:RequiredFieldValidator ID="emailRequiredValidator" runat="server" ControlToValidate="emailTxtBox" ErrorMessage="Email is a required field" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <br />
            <div>
                <div style="float:left; width: 30%; padding-left:3%;">
                    <asp:Label ID="QuestionLbl" runat="server" Text="Security Question" ForeColor="Blue"></asp:Label>
                    &nbsp;
                    <asp:Label ID="quesAsterick" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </div>
                <div style="float:left;">
                    <asp:TextBox ID="questionTxtBox" runat="server"></asp:TextBox>
                </div>
            &nbsp;
                <asp:RequiredFieldValidator ID="questionValidator" runat="server" ControlToValidate="questionTxtBox" ErrorMessage="Security Question is a required field" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <br />
            <div>
                <div style="float:left; width: 30%; padding-left:3%;">
                    <asp:Label ID="AnswerLbl" runat="server" Text="Security Answer" ForeColor="Blue"></asp:Label>
                    &nbsp;
                    <asp:Label ID="ansAsterick" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </div>
                <div style="float:left;">
                    <asp:TextBox ID="answerTxtBox" runat="server"></asp:TextBox>
                </div>                
            &nbsp;
                <asp:RequiredFieldValidator ID="anserValidator" runat="server" ControlToValidate="answerTxtBox" ErrorMessage="Security Answer is a required field" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="passMatchErrorLbl" runat="server" Text="Password and Confirm Password must be same" ForeColor="Red" Visible="False"></asp:Label>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="emailValidator" runat="server" ControlToValidate="emailTxtBox" ErrorMessage="Please enter a valid email address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />
            <br />
            <div style="width: 517px; margin-left:3%">
                <asp:Label ID="errorLbl" runat="server" Text="Something went wrong, please try again" ForeColor="Red" Visible="False"></asp:Label>
            </div>
            <br />
        </div>
        <div style="height: 39px">
            <div style="float:left; margin-left:15%;">
                <asp:Button ID="signUpBtn" runat="server" Text="Sign Up" BackColor="#0033CC" BorderColor="White" BorderStyle="None" BorderWidth="5px" ForeColor="White" Height="38px" Width="120px" OnClick="signUpBtn_Click" />
            </div>
            <div style="float:left; margin-left:15%;">
                <asp:Button ID="cancelBtn" runat="server" Text="Cancel" BackColor="#0033CC" BorderColor="White" BorderStyle="None" BorderWidth="5px" ForeColor="White" Height="38px" Width="120px" OnClick="cancelBtn_Click" />
            </div>
        </div>
    </form>
    
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WiselySplit.Home1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            margin:0px;
        }
        #homepageForm {
            width:100%;
        }
        #header {
            height: 75px;
            width: 100%;
        }
        .mainContent {
            height:auto;
            margin-top:5%;
            margin-bottom:15%;
        }
        #footer {
            height: 35px;
        }
        #footerLabel {
            margin-left:2%;
        }
        #contentInfo {
            margin-left:27%;
            margin-right:27%;
            text-align:center;
        }
    </style>
</head>
<body>
    <form id="homepageForm" runat="server">
        <div id="header" style="background-color: #000000">
            <div style="width: 100%;font-family: 'Segoe UI';font-size: x-large;font-weight: 600;font-style: inherit;color: #FFFFFF;margin-left: 2%;position: relative;top: 27%;">
                <asp:Label ID="headerLabel" runat="server" ForeColor="White" Text="Welcome to WiselySplit" BackColor="Black"></asp:Label>
            </div>
        </div>
        <div class="mainContent">
            <div id="contentInfo">
                <asp:Label ID="homeInfoLbl" runat="server" Text="What would you like to do" ForeColor="Blue"></asp:Label>
            </div>
            <div style="margin-top:5%;">
                <div style="width:35%;float:left;margin-left:25%;">
                    <asp:Button ID="getFriendsList" runat="server" Text="Get Friends List" Height="160px" Width="207px" BackColor="Blue" BorderStyle="None" Font-Size="Medium" ForeColor="White" OnClick="getFriendsList_Click" />
                </div>
                <div>
                    <asp:Button ID="createADebt" runat="server" Text="Create a Debt" Height="163px" Width="186px" BackColor="Blue" BorderStyle="None" Font-Size="Medium" ForeColor="White" />
                </div>
            </div>
         </div>
        <div id="footer" style="background-color: #000000; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-size: large; font-weight: 600; font-style: oblique">
            <div>
                <asp:Label ID="footerLabel" runat="server" ForeColor="White" Text="Copyright @ 2021" BackColor="Black" Font-Size="Small"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>

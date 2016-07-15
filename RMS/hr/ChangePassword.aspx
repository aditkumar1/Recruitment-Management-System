<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="RMS.hr.ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="~/assets/css/font-awesome.css" rel="stylesheet" />
    <link href="~/assets/css/style.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.1.0.slim.min.js" integrity="sha256-cRpWjoSOw5KcyIOaZNo4i6fZ9tKPhYYb6i5T9RSVJG8=" crossorigin="anonymous"></script>
    <script src="~/assets/js/application.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div class="container-fluid well">
                <div class="row">
                    <div class="col-xs-6">
                        <asp:Label ID="Label1" runat="server" Text="Enter Old Password"></asp:Label>
                    </div>
                    <div class="col-xs-6">
                        <asp:TextBox ID="TextBox1" runat="server" Width="100%" Height="20px" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-6">
                        <asp:Label ID="Label2" runat="server" Text="Enter New Password"></asp:Label>
                    </div>
                    <div class="col-xs-6">
                        <asp:TextBox ID="TextBox2" runat="server" Width="100%" Height="20px" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-6">
                        <asp:Label ID="Label3" runat="server" Text="Re-Enter New Password"></asp:Label>
                    </div>
                    <div class="col-xs-6">
                        <asp:TextBox ID="TextBox3" runat="server" Width="100%" Height="20px" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <asp:Button ID="Button1" runat="server" Text="Change" Width="40%" Align="center" Height="30px" OnClick="Button1_Click" />
                    <asp:Button ID="Button2" runat="server" Text="Reset" Width="40%" Align="center" Height="30px" OnClick="Button2_Click" />
                    <br />
                    <br />
                    <asp:Label ID="Label4" runat="server" Font-Bold="True"></asp:Label>
                </div>

            </div>

            <!-- Headings -->

        </div>

    </form>
</body>
</html>

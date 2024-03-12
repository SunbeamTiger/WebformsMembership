<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Membership.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="float:right; width:200px; height:70px; border:solid 2px black;padding: 4px 4px 4px 4px;">
                <asp:TextBox ID="txtUsername" runat= "server" /><br />
                <asp:TextBox ID="txtPassword" runat= "server" /><br />
                <asp:Button ID="btnLogin" runat="server" Text="Log In" OnClick="btnLogin_Click" /><asp:Label ID="lblMessage" ForeColor="Red" runat="server" />
            </div>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="yemek.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yemek Siparis</title>
</head>
<body>

    <style type="text/css">
        .ortalama {
            margin-bottom: auto;
            margin-left: auto;
            margin-right: auto;
            margin-top: auto;
            top: 50%;
            left: 50%;
            margin-bottom: auto;
            margin-left: auto;
        }

    </style>

    <form id="form1" runat="server">
        <div style="width:240px; height:20px; margin-top:10px; margin-left:35px;">
                <asp:Label runat="server" ID="lblHataMesaj" ForeColor="#434242"></asp:Label>
            </div>
    <div>
        <table width:400px; height:300px; top:150px; left:250; font-size:50%" class:"ortalama">
            <tr>
                <td> <asp:Label ID="LblEMail" runat="server" Text="Email  Giris:" Font-Italic="true" CssClass="VeriAlTitle"></asp:Label> </td>
                <td> <asp:TextBox ID="TxtEMail" runat="server" BackColor="#cccccc" CssClass="VeriAltxt"></asp:TextBox> </td>
               
            </tr>

            <tr>
                <td> <asp:Label ID="LblSifre" runat="server" Text="Sifre" Font-Italic="true" CssClass="VeriAlTitle" ></asp:Label> </td>
                <td> <asp:TextBox ID="TxtSifre" runat="server" BackColor="#cccccc" BorderStyle="Inset" CssClass="VeriAltxt" ></asp:TextBox > </td>
            </tr>

            <tr>
                <td> <asp:Button ID="LoginBtn" runat="server" Text="Giris" OnClick="LoginBtn_Click" style="height: 26px" Font-Italic="true" CssClass="ButtonStyle" /> </td>
            </tr>

        </table>
    
    </div>
    </form>
</body>
</html>

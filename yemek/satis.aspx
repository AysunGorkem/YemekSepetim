<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="satis.aspx.cs" Inherits="yemek.satis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
 <%--Listeleme--%>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="SatisId" DataSourceID="SqlDataSource1">

            <Columns>
                <asp:BoundField DataField="SatısId" HeaderText="SatısId" InsertVisible="False" ReadOnly="True" SortExpression="SatısId" />
                <asp:BoundField DataField="YemekId" HeaderText="YemekId" SortExpression="YemekId" />
                <asp:BoundField DataField="SatisAdet" HeaderText="SatisAdet" SortExpression="SatisAdet" />
                <asp:BoundField DataField="SatisTarih" HeaderText="SatisTarih" SortExpression="SatisTarih" />
                <asp:BoundField DataField="SatisTutar" HeaderText="SatisTutar" SortExpression="SatisTutar" />
            </Columns>
        </asp:GridView>

    </div>

         <%--Ekleme Ekranını Göster--%>

      
        <asp:Button ID="btnUrunEkle" runat="server" Text=" Satis'a Git" OnClick="btnSatisaGit_Click"/>
        



         <%-- Yemek Ekleme --%>
       
        <asp:Panel ID="pnlYemekEkle" runat="server">
            <div style="height:30px; margin-bottom:20px">
                <asp:Label ID="Label1" runat="server" Text="SATIS" Font-Size="X-Large" > </asp:Label>
            </div>

             <%-- İçin Açılır Ekrandaki Textboxlar--%>
            <div>
                <asp:Label ID="lblYemekId" runat="server" Text="Yemek"></asp:Label>
            </div>
            <div>
                <asp:DropDownList ID="ddlYemekId" runat="server" AutoPostBack="True" Visible="true" CssClass="VeriAltxt" Style="margin-right:10px"></asp:DropDownList>
            </div>
            <div>
                <asp:Label ID="lblSatisAdet" runat="server" Text="Adet "></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txtSatisAdet" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lblSatisTarih" runat="server" Text="Tarih"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txtSatisTarih" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lblSatisTutar" runat="server" Text="Satis Tutar"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txtSatisTutar" runat="server"></asp:TextBox>
            </div>
        </asp:Panel>
    </form>
</body>
</html>

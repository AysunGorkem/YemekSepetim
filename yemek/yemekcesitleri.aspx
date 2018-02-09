<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="yemekcesitleri.aspx.cs" Inherits="yemek.yemekcesitleri" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yemek Siparis</title>
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <%--Listele --%>

        <div class="Ortala" style="width:1280px; margin-top:30px;">

       <asp:GridView ID="gvSatis" runat="server" BackColor="White" BorderColor="#ff3399" Visible="true" BorderStyle="None" BorderWidth="1px" CellPadding="3" AllowPaging="True" AutoGenerateColumns="False" PageSize="15" HorizontalAlign="Center" CssClass="Liste" ShowFooter="true" OnRowDataBound="gvSatis_RowDataBound" OnRowCommand="gvSatis_RowCommand"> 
            <Columns>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="lbDuzenle" CommandArgument='<%# Eval("SatisId") %>' CommandName="Duzenle" Text="Düzenle"></asp:LinkButton>
                        <asp:LinkButton runat="server" ID="lbSil" CommandArgument='<%# Eval("SatisId") %>' CommandName="Sil" Text="Sil"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Yemek">
                    <ItemTemplate>
                        <asp:Label ID="lblYemekId" runat="server" Text='<%# Eval("YemekId") %>' Visible="false"></asp:Label>
                        
                        <asp:Label ID="lblYemekAd" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
       
                <asp:BoundField DataField="SatisAdet" HeaderText="Adet"/>
                <asp:BoundField DataField="SatisTarih" HeaderText="Tarih" DataFormatString="{0:dd.MM.yyyy}" />
                <asp:BoundField DataField="SatisTutar" HeaderText="Tutar" />


            </Columns>
           <FooterStyle BackColor="#ff3c00" ForeColor="#ff3c00"  />
            <PagerStyle BackColor="#ededed" ForeColor="#434242" HorizontalAlign="Left" />
            <HeaderStyle BackColor="#ff3c00" Font-Bold="True" ForeColor="White" />
            <FooterStyle BackColor="Yellow" ForeColor="Turquoise" />
            <RowStyle ForeColor="#000066" />
            </asp:GridView>

            <div style="margin-bottom:50px">
            <asp:Panel ID="Panel1" runat="server">
            <div style="height:30px; margin-bottom:20px">
                <asp:Label ID="Label3" runat="server" > </asp:Label>
            </div>      
        </asp:Panel>
            </div>
            <%--Yemek Ekleme Ekranını Göster--%>
         <asp:Button ID="btnYemekEkle" runat="server" Text="Yemek Ekle" CssClass="ButtonStyle" Visible="true" style="margin:auto; float:right" OnClick="btnPopupYemekEkle_Click"/>
            <asp:Button runat="server" Text="Cesit Ekle" ID="btnPopupCesit" CssClass="ButtonStyle" Visible="true" style="margin:auto; float:right; margin-right:10px" OnClick="btnPopupCesit_Click" />

            <asp:Button ID="btnPopupSatis" runat="server" Text="Satis" CssClass="ButtonStyle" Visible="true" style="float:right; margin-right:10px; margin-left: auto; margin-bottom: auto;" OnClientClick="btnPopupYemek" OnClick="btnPopupSatis_Click" />

            </div>

        <%--Popup--%>

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <cc1:ModalPopupExtender ID="ModalEkle" runat="server" TargetControlID="btnYemekEkle" PopupControlID="pnlYemekEkle" BackgroundCssClass="modal-backdrop">
            <Animations>
                <OnShown><Fadein Duration="0.50" /></OnShown>
                <OnHiding><Fadeout Duration="0.35" /></OnHiding>
             </Animations>
        </cc1:ModalPopupExtender>

        <%--Popup Yemek Ekle --%>
        
        <asp:Panel ID="pnlYemekEkle" runat="server" CssClass="Popup">
            <div style="height:15px; margin-bottom:20px;">
                <asp:ImageButton ID="ImgBtnKpt" runat="server" ImageUrl="~/css/close.png" style="float:right; margin-right:5px; margin-top:5px;" />
                <asp:Label ID="Label2" runat="server" Text="Yemek Ekle" Font-Size="X-Large" ></asp:Label>     
            </div>


             <%--Yemek Eklemek İçin Açılır Ekrandaki Textboxlar--%>
                <div>
                    <asp:Label runat="server" ID="lblYemekAd" Text="Yemek Ad" CssClass="VeriAlTitle"></asp:Label>
                </div>
                <div>
                    <asp:TextBox runat="server" ID="txtYemekAd" CssClass="VeriAltxt" Style="margin-right:10px;"></asp:TextBox>
                </div>   
                <div>
                    <asp:Label ID="lblCesit" runat="server" Text="Cesit " CssClass="VeriAlTitle"></asp:Label>
                </div>           
                <div>
                    <asp:DropDownList ID="ddlYemekEkle" runat="server" AutoPostBack="True" Visible="true" CssClass="VeriAltxt" Style="margin-right:10px">   </asp:DropDownList>
                </div>
                <div>
                    <asp:Button runat="server" ID="Kaydet" Text="Kaydet" CssClass="ButtonStyle" OnClick="Kaydet_Click"/>
                    <asp:Label ID="lblYemekNo" runat="server" Text="" Visible="false"></asp:Label>
                </div>

      </asp:Panel>

        <%-- Cesit Ekle icin popup --%>
        <cc1:ModalPopupExtender ID="ModalCesit" runat="server" TargetControlID="btnPopupCesit" PopupControlID="pnlCesitEkle" BackgroundCssClass="modal-backdrop">
        <Animations>
                <OnShown><Fadein Duration="0.50" /></OnShown>
                <OnHiding><Fadeout Duration="0.35" /></OnHiding>
             </Animations>
        </cc1:ModalPopupExtender>

         <%--Popup Cesit Ekle --%>
        <asp:Panel ID="pnlCesitEkle" runat="server" CssClass="Popup" Style="width:auto; height:auto">
            <div >   
               <asp:Label ID="Label1" runat="server" Text="Cesit Ekle" Font-Size="X-Large" Style="width:auto; height:auto"></asp:Label>
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/css/close.png" Style="float:right;" />
            </div>
            <div>
                <asp:Label ID="lblPopupCesit" runat="server" Text="Cesit Ad" CssClass="VeriAlTitle" Style="width:auto; height:auto"></asp:Label>
                <br />
                <asp:TextBox ID="txtPopupCesit" runat="server" CssClass="VeriAltxt" Style="width:auto; height:auto"></asp:TextBox>
                <br />
                <asp:Button ID="Ekle" runat="server" Text="Ekle" CssClass="ButtonStyle" Style="width:auto; " OnClick="Ekle_Click"/>
            </div>
        </asp:Panel>


         <%--Popup Satis--%>
        <cc1:ModalPopupExtender ID="ModalSatis" runat="server" TargetControlID="btnPopupSatis" PopupControlID="pnlSatis" BackgroundCssClass="modal-backdrop">
            <Animations>
                <OnShown><Fadein Duration="0.50" /></OnShown>
                <OnHiding><Fadeout Duration="0.35" /></OnHiding>
             </Animations>
        </cc1:ModalPopupExtender>

         <%--Popup Satis --%>
            <asp:Panel ID="pnlSatis" runat="server" CssClass="Popup" Style="width:auto; height:auto">
                <div style="height:20px; margin-bottom:40px">
                    <asp:ImageButton ID="ImgSatisKapat" runat="server" ImageUrl="~/css/close.png" style="float:right; margin-right:5px; margin-top:5px;" />
                    <asp:Label ID="Label4" runat="server" Text="Satis" Font-Size="X-Large"></asp:Label>
                </div>

         <%--Satis Açılır Ekrandaki Textboxlar--%>
        <div>
                <asp:Label ID="lblYemekId" runat="server" Text="Yemek" CssClass="VeriAlTitle"></asp:Label>
            </div>
            <div>
                <asp:DropDownList ID="ddlYemekId" runat="server" Visible="true" CssClass="VeriAltxt" Style="margin-right:10px"></asp:DropDownList>
            </div>
            <div>
                <asp:Label ID="lblAdet" runat="server" Text="Adet" CssClass="VeriAlTitle"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txtSatisAdet" runat="server" CssClass="VeriAltxt"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lblTarih" runat="server" Text="Tarih" CssClass="VeriAlTitle"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txtSatisTarih" runat="server" CssClass="VeriAltxt"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lblSatisTutar" runat="server" Text="Satis Tutar" CssClass="VeriAlTitle"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txtSatisTutar" runat="server" CssClass="VeriAltxt"></asp:TextBox>
            </div>
                <div>
                <asp:Button ID="Satis" runat="server" Text="SATIS"  CssClass="ButtonStyle" Style="width:auto; height:auto" OnClick="Satis_Click" />
                    <asp:Label ID="lblSatisID" runat="server" Text="Label" Visible="false"></asp:Label>
                </div>
         </asp:Panel>
              

            </asp:Panel>



       

       
    </form>
</body>
</html>

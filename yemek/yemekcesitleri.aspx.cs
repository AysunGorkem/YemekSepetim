using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace yemek
{
    public partial class yemekcesitleri : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["id"] == null)
                    Response.Redirect("/Login.aspx");
                gvSatisDoldur();
                CesitddlDoldur();
                YemekddlDoldur();
            }
        }

        DataTable dt2 = new DataTable();
        protected void GridDoldur() 
        {
            string query = "select * from Satis";
            string connString = ConfigurationManager.ConnectionStrings["cs"].ToString();
            SqlConnection conn = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt2);
            conn.Close();
            da.Dispose();

            gvSatis.DataSource = dt2;
            gvSatis.DataBind();
        }
           
        private void CesitddlDoldur()
        {
            string conn = ConfigurationManager.ConnectionStrings["cs"].ToString();
            SqlDataAdapter adptr = new SqlDataAdapter("SELECT * FROM Cesitler", conn);
            DataTable tbl = new DataTable();
            adptr.Fill(tbl);
            ddlYemekEkle.DataSource = tbl;
            ddlYemekEkle.DataTextField = "Ad";
            ddlYemekEkle.DataValueField = "CesitId";
            ddlYemekEkle.DataBind();                    
       }

        private void YemekddlDoldur()
        {
            string conn = ConfigurationManager.ConnectionStrings["cs"].ToString();
            SqlDataAdapter adptr = new SqlDataAdapter("SELECT * FROM Yemek", conn);
            DataTable tbl = new DataTable();
            adptr.Fill(tbl);
            ddlYemekId.DataSource = tbl;
            ddlYemekId.DataTextField = "YemekAd";
            ddlYemekId.DataValueField = "YemekId";
            ddlYemekId.DataBind();
        }

        private void SatisddlDoldur() {
            string conn = ConfigurationManager.ConnectionStrings["cs"].ToString();
            SqlDataAdapter adptr = new SqlDataAdapter("SELECT * FROM Satis", conn);
            DataTable tbl = new DataTable();
            adptr.Fill(tbl);
            ddlYemekId.DataSource = tbl;
            ddlYemekId.DataTextField = "SatisAdet";
            ddlYemekId.DataValueField = "SatisId";

 
        }



       

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["cs"].ToString();
            SqlConnection conn = new SqlConnection(connString);
            SqlCommand goruntule = new SqlCommand();
            conn.Open();


            if(e.CommandName == "Duzenle")
            {
                int YemekNo = Convert.ToInt32(e.CommandArgument);
                lblYemekNo.Text = YemekNo.ToString();
                goruntule.Connection = conn;
                goruntule.CommandText = "Select * from Yemek where YemekId=@YemekId";
                goruntule.Parameters.AddWithValue("YemekId", YemekNo);
                goruntule.ExecuteNonQuery();
                SqlDataReader dr = goruntule.ExecuteReader();

                if (dr.Read()) 
                {
                    txtYemekAd.Text = dr["YemekAd"].ToString();
                  //  txtCesit.Text = dr["CesitId"].ToString();
                }
                
              
            }

            else if (e.CommandName == "sil") 
            {
                int YemekId = Convert.ToInt32(e.CommandArgument);
                SqlCommand sil = new SqlCommand("Delete from Yemek Where YemekId=@YemekId", conn);
                sil.Parameters.AddWithValue("YemekId", YemekId);
                sil.ExecuteNonQuery();
                //GridDoldur();
            }

        }

        protected void btnPopupYemekEkle_Click(object sender, EventArgs e)
        {
            ModalEkle.Show();
            YemekddlDoldur();  
        }

        protected void btnPopupCesit_Click(object sender, EventArgs e)
        {

            ModalCesit.Show();
            CesitddlDoldur(); 
        }
        protected void btnPopupSatis_Click(object sender, EventArgs e)
        {
            ModalSatis.Show();
        }


        #region Satis
        protected void gvSatis_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["cs"].ToString();
            SqlConnection conn = new SqlConnection(connString);
            SqlCommand goruntule = new SqlCommand();
            conn.Open();



            if (e.CommandName == "Duzenle")
            {
                int guid = Convert.ToInt32(e.CommandArgument);
                lblSatisID.Text = guid.ToString();
                goruntule.Connection = conn;
                goruntule.CommandText = "Select * from Satis where SatisId=@SatisId";
                goruntule.Parameters.AddWithValue("SatisId", guid);
                goruntule.ExecuteNonQuery();
                SqlDataReader dr = goruntule.ExecuteReader();

                if (dr.Read())
                {
                    txtSatisAdet.Text = dr["SatisAdet"].ToString();
                    txtSatisTarih.Text = Convert.ToDateTime(dr["SatisTarih"].ToString()).ToShortDateString();
                    txtSatisTutar.Text = dr["SatisTutar"].ToString();
                    ddlYemekId.SelectedValue = dr["YemekId"].ToString();
                    
                }
                ModalSatis.Show();

            }
            else if (e.CommandName == "Sil")
            {
                int guid = Convert.ToInt32(e.CommandArgument);
                SqlCommand sil = new SqlCommand("Delete from Satis where SatisId=@SatisId", conn);
                sil.Parameters.AddWithValue("SatisId", guid);
                sil.ExecuteNonQuery();
                gvSatisDoldur();

            }
        }

       


        protected void gvSatis_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblYemekId = (Label)e.Row.FindControl("lblYemekId");
                Label lblYemekAd = (Label)e.Row.FindControl("lblYemekAd");
                if (lblYemekId != null && !string.IsNullOrEmpty(lblYemekId.Text) && lblYemekAd != null)
                {
                    int guid = Convert.ToInt32(lblYemekId.Text);
                    string connString = ConfigurationManager.ConnectionStrings["cs"].ToString();
                    SqlConnection conn = new SqlConnection(connString);
                    SqlCommand goruntule = new SqlCommand();
                    conn.Open();

                    goruntule.Connection = conn;
                    goruntule.CommandText = "Select YemekAd from Yemek where YemekId=@YemekId";
                    goruntule.Parameters.AddWithValue("YemekId", guid);
                    goruntule.ExecuteNonQuery();
                    SqlDataReader dr = goruntule.ExecuteReader();

                    if (dr.Read())
                    {
                        lblYemekAd.Text = dr["YemekAd"].ToString();
                    }

                    dr.Dispose();
                    conn.Dispose();
                    conn.Close();
                }
            }

        }

        DataTable dt1 = new DataTable();
        protected void gvSatisDoldur()
        {
            string query = "select * from Satis";
            string connString = ConfigurationManager.ConnectionStrings["cs"].ToString();
            SqlConnection conn = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();


            SqlDataAdapter da = new SqlDataAdapter(cmd);

            da.Fill(dt1);
            conn.Close();
            da.Dispose();

            gvSatis.DataSource = dt1;
            gvSatis.DataBind();
        }
       


        
        #endregion

        protected void Kaydet_Click(object sender, EventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["cs"].ToString();
            SqlConnection conn = new SqlConnection(connString);
            conn.Open();

            if (lblSatisID.Text != "") 
            {
                int guid = Convert.ToInt32(lblSatisID.Text);
                SqlCommand guncelle = new SqlCommand("Update Satis set YemekId=@YemekId, SatisAdet=@SatisAdet, SatisTarih=@SatisTarih, SatisTutar=@SatisTutar, SatisAktif=@SatisAktif where SatisId=@SatisId", conn);
                guncelle.Parameters.AddWithValue("YemekId", ddlYemekId.Text);
                guncelle.Parameters.AddWithValue("SatisAdet",txtSatisAdet.Text);
                guncelle.Parameters.AddWithValue("SatisTarih", txtSatisTarih.Text);
                guncelle.Parameters.AddWithValue("SatisTutar", txtSatisTutar.Text);
                guncelle.Parameters.AddWithValue("SatisAktif", true);
                guncelle.Parameters.AddWithValue("SatisId", guid);
                guncelle.ExecuteNonQuery();
                lblSatisID.Text = "";
                GridDoldur();
            }
            else if (lblSatisID.Text == "") 
            {
                string kayit = "insert into Satis (YemekId, SatisAdet, SatisAdet, SatisTarih, SatisTutar, SatisAktif) values (@YemekId, @SatisAdet, @SatisAdet, @SatisTarih, @SatisTutar, @SatisAktif)";
                SqlCommand ekle = new SqlCommand(kayit, conn);
                ekle.Parameters.AddWithValue("YemekId", ddlYemekId.Text);
                ekle.Parameters.AddWithValue("SatisAdet", txtSatisAdet.Text);
                ekle.Parameters.AddWithValue("SatisTarih", txtSatisTarih.Text);
                ekle.Parameters.AddWithValue("SatisTutar", txtSatisTutar.Text);
                ekle.Parameters.AddWithValue("SatisAktif", true);
                ekle.ExecuteNonQuery();
                GridDoldur();
            }
            txtSatisAdet.Text = "";
            txtSatisTarih.Text = "";
            txtSatisTutar.Text = "";

         
        }


        protected void Ekle_Click(object sender, EventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["cs"].ToString();
            SqlConnection conn = new SqlConnection(connString);
            conn.Open();
            string kayit = "insert into Cesitler (Ad, Aktif) values (@Ad,@Aktif )";
            SqlCommand ekle = new SqlCommand(kayit, conn);
            ekle.Parameters.AddWithValue("Ad", txtPopupCesit.Text);
            ekle.Parameters.AddWithValue("Aktif", true);

            ekle.ExecuteNonQuery();

            CesitddlDoldur();
        }


        protected void Satis_Click(object sender, EventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["cs"].ToString();
            SqlConnection conn = new SqlConnection(connString);
            conn.Open();
            string veri = "insert into Satis (YemekId, SatisAdet, SatisTarih, SatisTutar, SatisAktif) values (@YemekId, @SatisAdet, @SatisTarih, @SatisTutar, @SatisAktif)";
            SqlCommand ekle = new SqlCommand(veri, conn);
            ekle.Parameters.AddWithValue("YemekId", ddlYemekId.Text);
            ekle.Parameters.AddWithValue("SatisAdet", txtSatisAdet.Text);
            ekle.Parameters.AddWithValue("SatisTarih", txtSatisTarih.Text);
            ekle.Parameters.AddWithValue("SatisTutar", txtSatisTutar.Text);
            ekle.Parameters.AddWithValue("SatisAktif", true);

            ekle.ExecuteNonQuery();

            SatisddlDoldur();
        }




    }
}
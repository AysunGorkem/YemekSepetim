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
    public partial class satis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }


        protected void btnSatisaGit_Click(object sender, EventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["cs"].ToString();
            SqlConnection conn = new SqlConnection(connString);
            conn.Open();
            string kayit = "insert into Yemekler (YemekId, SatisAdet, SatisTarih, SatisTutar, SatisAktif) values (@YemekId, @SatisAdet, @SatisTarih, @SatisTutar, @SatisAktif )";
            SqlCommand ekle = new SqlCommand(kayit, conn);
            ekle.Parameters.AddWithValue("YemekId", ddlYemekId.SelectedValue);
            ekle.Parameters.AddWithValue("SatisAdet", txtSatisAdet.Text);
            ekle.Parameters.AddWithValue("SatisTarih", txtSatisTarih.Text);
            ekle.Parameters.AddWithValue("SatisTutar", txtSatisTutar.Text);
            ekle.Parameters.AddWithValue("Aktif", true);
        
        }


    }
}
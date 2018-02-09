using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace yemek
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void LoginBtn_Click(object sender, EventArgs e) //Giris
        {
            SqlConnection myConnection = new SqlConnection("user id=sa" + 
            "password=1234; server=User;"+ 
            "Trusted_Connection=yes;"+
            "database=yemek;" +
            "connection timeout=30");
            try
            {
                myConnection.Open();

                string query = "select * from Kullanici where EMail=@EMail and Sifre=@Sifre and Aktif=1";
                SqlCommand myCommand = new SqlCommand(query, myConnection);
               
               
                 myCommand.Parameters.AddWithValue("EMail", TxtEMail.Text);
                myCommand.Parameters.AddWithValue("Sifre", TxtSifre.Text);
                SqlDataReader rd = myCommand.ExecuteReader();

                if(rd.Read())
                {

                    Session["id"] = rd["id"].ToString();
                    Response.Redirect("yemekcesitleri.aspx");
                    rd.Close();
                    myConnection.Close();

                    
                }
                else
                {
                    lblHataMesaj.Text = "Kullanici adi veya sifre yalnis ! " ;
                } 
            }
                catch(Exception ex)
            {
                    Console.WriteLine(ex.ToString());
            }
            

           
            
            
                
        }
    }
    }

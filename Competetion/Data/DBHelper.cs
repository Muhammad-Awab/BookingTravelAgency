using System.Data.SqlClient;

namespace Competetion.Data
{
    public class DBHelper
    {
        public static SqlConnection GetConnection()
        {
            SqlConnection con = new SqlConnection(@"Data Source =.; Initial Catalog = competetion; Integrated Security = True");
            //SqlConnection con = new SqlConnection(@"Data Source=65.108.97.18;Initial Catalog=db_pkversity; User ID=user_pkversity; password=y^7R7lv28");

            //online
            //SqlConnection con = new SqlConnection("Data Source = pktour.database.windows.net; Initial Catalog = Trip; Persist Security Info = True; User ID = pkadmin;Password=SAAD@aashir");
            return con;
        }
    }
}

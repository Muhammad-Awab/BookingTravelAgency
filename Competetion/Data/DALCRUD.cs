using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;
using Competetion.ClassLibraryEntities;

namespace Competetion.Data
{
    public class DALCRUD
    {
        public static async Task CRUD(string ProcedureName, SqlParameter[] sqlParameters)
        {
            try
            {
                using (SqlConnection con = DBHelper.GetConnection())
                {
                    await con.OpenAsync();
                    using (SqlCommand cmd = new SqlCommand(ProcedureName, con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddRange(sqlParameters);
                        await cmd.ExecuteNonQueryAsync();
                        await con.CloseAsync();
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception Occurred: {ex.Message}");
            }
        }
        public static async Task<DataTable> ReadData(string ProcedureName)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection conn = DBHelper.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand(ProcedureName, conn))
                    {
                        await conn.OpenAsync();
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        sda.Fill(dt);
                        SqlDataReader rdr = await cmd.ExecuteReaderAsync();
                        await conn.CloseAsync();

                        if (dt.Rows.Count > 0)
                        {
                            // If you still need to return a ContentResult, you can handle it in the calling code
                            // For now, just return the DataTable
                            return dt;
                        }
                        else
                        {
                            // Return an empty DataTable if there are no rows
                            return new DataTable();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception Occurred: {ex.Message}");
                // Return an empty DataTable in case of an exception
                return new DataTable();
            }
        }
        public static async Task<ActionResult> ReadData(string ProcedureName, SqlParameter[] sqlParameters)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection conn = DBHelper.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand(ProcedureName, conn))
                    {
                        await conn.OpenAsync();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddRange(sqlParameters);
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        sda.Fill(dt);
                        SqlDataReader rdr = await cmd.ExecuteReaderAsync();
                        await conn.CloseAsync();

                        if (dt.Rows.Count > 0)
                        {
                            string json = DalCustomLogics.DataTableToJSONWithJSONNet(dt);
                            return new ContentResult { Content = json, ContentType = "application/json" };
                        }
                        else
                        {

                            dt = new DataTable();
                            string json = DalCustomLogics.DataTableToJSONWithJSONNet(dt);
                            return new ContentResult { Content = json, ContentType = "application/json" };
                        }
                    }

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception Occurred: {ex.Message}");
                return new ContentResult { Content = "", ContentType = "application/json" };
            }
        }
        public static async Task<DataTable> ReadDataSpecific(string ProcedureName, SqlParameter[] sqlParameters)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection conn = DBHelper.GetConnection())
                {
                    using (SqlCommand cmd = new SqlCommand(ProcedureName, conn))
                    {
                        await conn.OpenAsync();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddRange(sqlParameters);
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        sda.Fill(dt);
                        SqlDataReader rdr = await cmd.ExecuteReaderAsync();
                        await conn.CloseAsync();

                        if (dt.Rows.Count > 0)
                        {

                            return dt;

                        }
                        else { return new DataTable(); }
                    }

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception Occurred: {ex.Message}");
            }
            return new DataTable();

        }

        public static EntUserLogin GetUserByName(string? Email)
        {
            EntUserLogin ee = new EntUserLogin();

            try
            {


                SqlConnection con = DBHelper.GetConnection();
                con.Open();
                SqlCommand cmd = new SqlCommand("U_SP_GetUserByName", con);
                cmd.Parameters.AddWithValue("@Email", Email);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    ee.UserId = sdr["UserId"].ToString();
                    ee.Email = sdr["Email"].ToString();
                    ee.Role = sdr["Role"].ToString();
                    ee.Password = sdr["Password"].ToString();


                }
                con.Close();
            }
            catch (Exception ex)
            {
               Console.WriteLine($"Exception Occurred: {ex.Message}");
            }
            return ee;

        }
    }

}


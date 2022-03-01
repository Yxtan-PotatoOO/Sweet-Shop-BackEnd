using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
///DBConnection 的摘要说明
/// </summary>
namespace testDAO.Library
{
    public class DBHelper
    {
        private String connectionString = "server=.;database=SweetyDB;uid=aa;pwd=123456";
        static string Conns = "server=.;database=SweetyDB;uid=aa;pwd=123456";

        public SqlDataReader ExecuteReader(String sql)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            SqlCommand command = new SqlCommand(sql, connection);

            SqlDataReader result = command.ExecuteReader();

            return result;
        }

        public bool ExecuteCommand(String sql)
        {
            bool result = false;

            try
            {
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();

                SqlCommand command = new SqlCommand(sql, connection);
                command.ExecuteNonQuery();


                connection.Close();

                result = true;
            }
            catch (Exception e)
            {
                throw e;
            }

            return result;
        }
        public DBHelper()
        {
            //
            //TODO: 在此处添加构造函数逻辑
            //
        }
        public static DataTable Table(string sql)
        {
            using (SqlConnection conn = new SqlConnection(Conns))
            {
                SqlDataAdapter sda = new SqlDataAdapter(sql, conn);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                return dt;
            }
        }
        public static bool InsertOrDelete(string sql)
        {
            using (SqlConnection conn = new SqlConnection(Conns))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                return cmd.ExecuteNonQuery() > 0;
            }
        }

    }
}

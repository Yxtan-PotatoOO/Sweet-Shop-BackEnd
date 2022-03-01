using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
///UserService 的摘要说明
/// </summary>
namespace testDAO.Library
{
    public class UserService
    {
        public User GetUserByLogin(User user)
        {
            String sql = "";
            sql = "select * from Admin where Ano='" + user.UserLogin + "'";
            DBHelper helper = new DBHelper();
            SqlDataReader reader = helper.ExecuteReader(sql);
            User result = new User();
            if (reader.Read())
            {
                result.UserLogin = reader.GetString(0);
                result.UserPwd = reader.GetString(2);
            }
            else
            {
                return null;
            }
            return result;
        }

        public List<User> GetAllUsers()
        {
            String sql = "";
            sql = "select * from Admin";
            DBHelper helper = new DBHelper();
            SqlDataReader reader = helper.ExecuteReader(sql);

            if (!reader.HasRows)
            {
                return null;
            }

            List<User> list = new List<User>();
            while (reader.Read())
            {
                User item = new User();
                item.UserLogin = reader.GetString(0);
                item.UserPwd = reader.GetString(2);
                list.Add(item);
            }
            return list;
        }
    }
}

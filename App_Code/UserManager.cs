using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
///UserManager 的摘要说明
/// </summary>
namespace testDAO.Library
{
    public class UserManager
    {
        public bool Login(User user)
        {
            bool result = false;

            UserService service = new UserService();

            User temp = service.GetUserByLogin(user);
            if (temp == null)
            {
                result = false;
            }
            else if (user.UserPwd.Equals(temp.UserPwd))
            {
                result = true;
            }

            return result;
        }

        public List<User> GetAllUsers()
        {
            UserService service = new UserService();
            return service.GetAllUsers();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///User 的摘要说明
/// </summary>
namespace testDAO.Library
{
    public class User
    {
        private String userLogin = "";
        private String userPwd = "";

        public String UserLogin
        {
            get
            {
                return userLogin;
            }
            set
            {
                userLogin = value;
            }
        }

        public String UserPwd
        {
            get
            {
                return userPwd;
            }
            set
            {
                userPwd = value;
            }
        }
    }
}

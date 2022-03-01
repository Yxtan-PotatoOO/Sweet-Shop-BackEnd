using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using testDAO.Library;
using System.Data.SqlClient;
using System.Data;

public partial class aspx_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        //User user = new User();
        //user.UserLogin = loginText.Text;
        //user.UserPwd = pwdText.Text;
        //UserManager manager = new UserManager();
        //bool result = manager.Login(user);
        //if (result)
        //{
        //    Response.Redirect("Home.aspx");
        //}
        //else
        //{
        //    Response.Write("<script languge=javascript>alert('登录失败,请输入正确的用户名和密码')</script>");
        //}

        string UserLogin = this.LoginText.Text;
        string UserPwd = this.PwdText.Text;

        string str = "server=.;database=SweetyDB;uid=aa;pwd=123456";
        SqlConnection sqlCon = new SqlConnection(str);
        sqlCon.Open();
        SqlCommand sqlComGet = new SqlCommand();
        sqlComGet.Connection = sqlCon;
        sqlComGet.CommandText = "select * from Admin where Ano='" + UserLogin + "' and Apasswd='" + UserPwd + "' and Astate='启用'";
        SqlDataReader sqlDr = sqlComGet.ExecuteReader();

        if (sqlDr.Read())                                  //帐号和密码正确
        {
            Session["user"] = UserLogin;                      //用Session记录帐号
            Session["passwd"] = UserPwd;                //用Session记录密码
            //Response.Redirect("Home.aspx?user=" + UserLogin);
            Response.Redirect("Home.aspx");
        }
        else                                              //帐号或密码错误
        {
            Response.Write("<script>window.alert('登录失败！');</script>");
        }
        sqlCon.Close();
    }
}
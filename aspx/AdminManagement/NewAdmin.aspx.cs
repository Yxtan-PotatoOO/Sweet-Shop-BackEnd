using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Configuration;

public partial class aspx_NewAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string str = "server=.;database=SweetyDB;uid=aa;pwd=123456";
        if (Session["user"] == null)
        {
            Response.Write("<script>alert('请先登录!');</script>");
        }
        else
        {
            string ano = Session["user"].ToString();
            if (!IsPostBack)
            {
                using (SqlConnection sqlCon = new SqlConnection(str))
                {
                    sqlCon.Open();
                    string Selname = String.Format("select Aname from Admin where Ano='" + ano + "'");
                    using (SqlCommand cmd = new SqlCommand(Selname, sqlCon))
                    {
                        string aname = Convert.ToString(cmd.ExecuteScalar());
                        AnameLabel.Text = aname.ToString();
                    }
                }
                using (SqlConnection sqlCon = new SqlConnection(str))
                {
                    sqlCon.Open();
                    string Selname = String.Format("select Aportrait from Admin where Ano='" + ano + "'");
                    using (SqlCommand cmd = new SqlCommand(Selname, sqlCon))
                    {
                        string aportrait = Convert.ToString(cmd.ExecuteScalar());
                        AportraitImage.ImageUrl = "~/aspx/AdminManagement/imgUploads/" + aportrait.ToString();
                    }
                }
                //绑定所属分组下拉框
                string sqlgroup = string.Format(" select DISTINCT Agroup from Admin");
                AgroupDropDownList.DataSource = testDAO.Library.DBHelper.Table(sqlgroup);
                AgroupDropDownList.DataTextField = "Agroup";
                AgroupDropDownList.DataValueField = "Agroup";
                AgroupDropDownList.DataBind();
                AgroupDropDownList.Items.Insert(0, new ListItem(" ", " "));
            }
        }
    }
    //保存新添加的管理员数据
    protected void Save_Click(object sender, EventArgs e)
    {
        string num = AnoText.Text;
        string name = AnameText.Text;
        string pwd = ApasswdText.Text;
        string pho = AphoneText.Text;
        string sex = Request["sex"].ToString();
        string gro = AgroupDropDownList.SelectedValue;
        string sta = Request["state"].ToString();
        string inf = AinfoText.Text;
        string portrait = "默认头像.jpg";
        string insertsql = "insert into Admin(Ano,Aname,Apasswd,Aphone,Asex,Agroup,Astate,Ainfo,Aportrait) values ('" + num + "','" + name + "','" + pwd + "','" + pho + "','" + sex + "','" + gro + "','" + sta + "','" + inf + "','" + portrait + "')";
        OperateDataBase obd = new OperateDataBase();
        bool add = obd.ExceSql(insertsql);
        if (add == true)
        {
            Response.Write("<script language='javascript'>alert('添加成功！');location.href='Admin.aspx'</script>");
        }
        else
        {
            Response.Write("<script language='javascript'>alert('添加失败！');location.href='NewAdmin.aspx'</script>");
        }
    }
}
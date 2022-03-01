using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class aspx_GoodsManagement_inside_newTem : System.Web.UI.Page
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
            }
        }
    }
    protected void Save_Click(object sender, EventArgs e)
    {
        string tno = TnoText.Text;
        string tname = TnameText.Text;
        string texemption = Request["way1"].ToString();
        string tvalue = Request["way2"].ToString();
        string tsend = Request["way3"].ToString();
        string taddress = TaddressText.Text;
        string tweight1=" ";
        string tfare1 = " ";
        string tweight2 = " ";
        string tfare2 = " ";
        if (tsend == "快递")
        {
            tweight1 = Tweight1Text1.Text;
            tfare1 = Tfare1Text1.Text;
            tweight2 = Tweight2Text1.Text;
            tfare2 = Tfare2Text1.Text;
        }
        else if (tsend == "EMS")
        {
            tweight1 = Tweight1Text2.Text;
            tfare1 = Tfare1Text2.Text;
            tweight2 = Tweight2Text2.Text;
            tfare2 = Tfare2Text2.Text;
        }
        else if (tsend == "平邮")
        {
            tweight1 = Tweight1Text3.Text;
            tfare1 = Tfare1Text3.Text;
            tweight2 = Tweight2Text3.Text;
            tfare2 = Tfare2Text3.Text;
        }
        string insertsql = "insert into Template(Tno, Tname, Texemption, Tvalue, Tsend, Taddress, Tweight1, Tfare1, Tweight2, Tfare2) values ('" + tno + "','" + tname + "','" + texemption + "','" + tvalue + "','" + tsend + "','" + taddress + "','" + tweight1 + "','" + tfare1 + "','" + tweight2 + "','" + tfare2 + "')";
        OperateDataBase obd = new OperateDataBase();
        bool add = obd.ExceSql(insertsql);
        if (add == true)
        {
            Response.Write("<script language='javascript'>alert('添加成功！');location.href='Template.aspx'</script>");
        }
        else
        {
            Response.Write("<script language='javascript'>alert('添加失败！');location.href='NewTem.aspx'</script>");
        }
    }
}
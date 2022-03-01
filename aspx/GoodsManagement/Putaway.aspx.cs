using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class aspx_GoodsManagement_Putaway : System.Web.UI.Page
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
    protected void Next_Click(object sender, EventArgs e)
    {
        string no = GnoText.Text;
        Session["no"] = no;
        string name;
        string sort;
        decimal price;
        string detail;
        string slogan;
        string afterinfo;
        string countmode;
        string shelftime;
        
        if (GnameText.Text == " ") { name = ""; } else {name = GnameText.Text; }
        if (GsortText.Text == " ") { sort = ""; }else {sort = GsortText.Text; }
        if (GpriceText.Text == " ") { price = 1; } else { price = Convert.ToDecimal(GpriceText.Text); }
        if (GdetailText.Text == " ") { detail = ""; }else {detail = GdetailText.Text; }
        if (GsloganText.Text == " ") { slogan = ""; }else {slogan = GsloganText.Text; }
        if (Request["after"].ToString() == " ") { afterinfo = ""; }else {afterinfo = Request["after"].ToString(); }
        if (Request["count"].ToString() == " ") { countmode = ""; }else {countmode = Request["count"].ToString(); }
        if (Request["time"].ToString() == " ") { shelftime = ""; }else {shelftime = Request["time"].ToString(); }
        //Label5.Text = price;
        string insertsql = "insert into Goods(Gno,Gname,Gsort,Gprice,Gdetail,Gafterinfo,Gcountmode,Gshelftime,Gslogan) values ('" + no + "','" + name + "','" + sort + "','" + price + "','" + detail + "','" + afterinfo + "','" + countmode + "','" + shelftime + "','" + slogan + "')";
        //string insertsql = "insert into Goods(Gno) values ('" + no + "')";
        //string insertsql = "insert into Goods(Gno,Gname,Gsort,Gdetail,Gafterinfo,Gcountmode,Gshelftime,Gslogan) values ('" + no + "','" + name + "','" + sort + "','" + detail + "','" + afterinfo + "','" + countmode + "','" + shelftime + "'','" + slogan + "')";
        //string insertsql = "insert into Goods(Gno,Gname) values ('" + no + "','" + name + "')";
        //string insertsql = "insert into Goods(Gno,Gname,Gsort,Gdetail,Gafterinfo,Gcountmode,Gshelftime) values ('" + no + "','" + name + "','" + sort + "','" + detail + "','" + afterinfo + "','" + countmode + "','" + shelftime + "')";
        OperateDataBase obd = new OperateDataBase();
        bool add = obd.ExceSql(insertsql);
        if (add == true)
        {
            Response.Write("<script language='javascript'>alert('添加成功！');location.href='AddImages.aspx?no=" + no + "'</script>");
        }
        else
        {
            Response.Write("<script language='javascript'>alert('请先填写好本页信息！');</script>");
        }      
    }
}
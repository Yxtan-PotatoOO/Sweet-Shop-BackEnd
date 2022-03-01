using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class aspx_OrderManagement_OrderDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string str = "server=.;database=SweetyDB;uid=aa;pwd=123456";
        string ono = Request["ono"];
        string uno = Request["uno"];
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
        string sqlSelect = String.Format("select * from Orders o,Goods g,Address ad where Ono='" + ono + "' and o.Uno='" + uno + "' and o.Gno=g.Gno and o.Uno=ad.Uno and o.ADno = ad.ADno");
        using (SqlConnection sqlCon = new SqlConnection(str))
        {
            sqlCon.Open();
            SqlDataAdapter da = new SqlDataAdapter(sqlSelect, str); //创建DataAdapter数据适配器实例
            DataSet ds = new DataSet();//创建DataSet实例

            da.Fill(ds); //贴数据，说白了就是把数据贴到数据集上
            Repeater1.DataSource = ds; //我们的Repeater控件ID为： repeater_info，这里调用.DataSource方法加载数据源头
            Repeater1.DataBind(); //用DataBind方法绑定具体的控件
        }

        using (SqlConnection sqlCon = new SqlConnection(str))
        {
            sqlCon.Open();
            SqlDataAdapter da = new SqlDataAdapter(sqlSelect, str); //创建DataAdapter数据适配器实例
            DataSet ds = new DataSet();//创建DataSet实例

            da.Fill(ds); //贴数据，说白了就是把数据贴到数据集上
            Repeater2.DataSource = ds; //我们的Repeater控件ID为： repeater_info，这里调用.DataSource方法加载数据源头
            Repeater2.DataBind(); //用DataBind方法绑定具体的控件
        }
        using (SqlConnection sqlCon = new SqlConnection(str))
        {
            sqlCon.Open();
            SqlDataAdapter da = new SqlDataAdapter(sqlSelect, str); //创建DataAdapter数据适配器实例
            DataSet ds = new DataSet();//创建DataSet实例

            da.Fill(ds); //贴数据，说白了就是把数据贴到数据集上
            Repeater3.DataSource = ds; //我们的Repeater控件ID为： repeater_info，这里调用.DataSource方法加载数据源头
            Repeater3.DataBind(); //用DataBind方法绑定具体的控件
        }
        using (SqlConnection sqlCon = new SqlConnection(str))
        {
            sqlCon.Open();
            SqlDataAdapter da = new SqlDataAdapter(sqlSelect, str); //创建DataAdapter数据适配器实例
            DataSet ds = new DataSet();//创建DataSet实例

            da.Fill(ds); //贴数据，说白了就是把数据贴到数据集上
            Repeater4.DataSource = ds; //我们的Repeater控件ID为： repeater_info，这里调用.DataSource方法加载数据源头
            Repeater4.DataBind(); //用DataBind方法绑定具体的控件
        }
        using (SqlConnection sqlCon = new SqlConnection(str))
        {
            sqlCon.Open();
            string Selostate = String.Format("select Ostate from Orders where Ono='" + ono + "' and Uno='" + uno + "'");
            using (SqlCommand cmd = new SqlCommand(Selostate, sqlCon))
            {
                string ostate = Convert.ToString(cmd.ExecuteScalar());
                OstateText.Text = ostate.ToString();
            }
        }
    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        string[] estr = ((Button)sender).CommandArgument.ToString().Split(',');
        string ono = Convert.ToString(estr[0]);
        string uno = Convert.ToString(estr[1]);
        string updSql = String.Format("update Orders set Ostate='已取消' where Ono='" + ono + "' and Uno='"+ uno +"'");
        OperateDataBase obd = new OperateDataBase();
        bool upd = obd.ExceSql(updSql);
        if (upd == true)
        {
            Response.Write("<script>window.alert('取消成功!');location.href='OrderDetails.aspx?ono='"+ono+"';</script>");
        }
        else
        {
            Response.Write("<script>window.alert('取消失败!');location.href='OrderDetails.aspx?ono='" + ono + "';</script>");
        }
        //重新获取数据
    }
    protected void Back_Click(object sender, EventArgs e)
    {    
        if (OstateText.Text == "待发货") 
        {
            Response.Redirect("OList-WaitSend.aspx");
        }
        else if (OstateText.Text == "已发货")
        {
            Response.Redirect("OList-Finish.aspx");
        }
        else if (OstateText.Text == "已完成")
        {
            Response.Redirect("OList-Finish.aspx");
        }
        else if (OstateText.Text == "待退货")
        {
            Response.Redirect("Return.aspx");
        }
        else if (OstateText.Text == "处理中")
        {
            Response.Redirect("Return-Sending.aspx");
        }
        else if (OstateText.Text == "已退货")
        {
            Response.Redirect("Return-Finish.aspx");
        }
        else
        {
            Response.Redirect("OList.aspx?a='" + OstateText.Text + "'");
        }
        
    }
}
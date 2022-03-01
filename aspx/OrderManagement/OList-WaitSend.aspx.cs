using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class aspx_OrderManagement_OList : System.Web.UI.Page
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
        string sqlSelect = String.Format("select * from Orders o,Goods g,Address ad where Ostate='待发货' and o.Gno=g.Gno and o.Uno=ad.Uno and o.ADno = ad.ADno");
        using (SqlConnection sqlCon = new SqlConnection(str))
        {
            sqlCon.Open();
            SqlDataAdapter da = new SqlDataAdapter(sqlSelect, str); //创建DataAdapter数据适配器实例
            DataSet ds = new DataSet();//创建DataSet实例
            da.Fill(ds); //贴数据，说白了就是把数据贴到数据集上
            Repeater1.DataSource = ds; //我们的Repeater控件ID为： repeater_info，这里调用.DataSource方法加载数据源头

            PagedDataSource pag = new PagedDataSource();
            pag.AllowPaging = true;// 设置允许分页
            pag.PageSize = 2; // 每页显示为2行
            pag.DataSource = ds.Tables[0].DefaultView; // 模板绑定数据源 
            Total.Text = pag.PageCount.ToString(); // 显示总共页数
            int CurrentPage;
            // 请求页码为不为null设置当前页，否则为第一页
            if (Request.QueryString["Page"] != null)
            {

                CurrentPage = Convert.ToInt32(Request.QueryString["Page"]);
            }
            else
            {
                CurrentPage = 1;
            }
            if (Request.QueryString["PageSize"] != null)
            {
                pag.PageSize = Convert.ToInt32(Request.QueryString["PageSize"]);
            }
            else
            {
                pag.PageSize = 2;// 每页显示为2行
            }
            pag.CurrentPageIndex = CurrentPage - 1; // 当前页所引为页码-1
            Now.Text = CurrentPage.ToString(); // 当前页
            if (!pag.IsFirstPage)
            {
                //  Request.CurrentExecutionFilePath为当前请求虚拟路径
                LnkPrev.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurrentPage - 1);
            }
            // 如果不是最后一页，通过参数Page设置下一页为当前页+1，否则不显示连接
            if (!pag.IsLastPage)
            {
                // Request.CurrentExecutionFilePath为当前请求虚拟路径
                LnkNext.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurrentPage + 1);
            }
            //首页
            First.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(1);
            //尾页
            End.NavigateUrl = Request.CurrentExecutionFilePath + "?page=" + pag.PageCount.ToString();
            if (Convert.ToInt32(HttpContext.Current.Request["page"]) > pag.PageCount)
            {
                First.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(1);
            }
            this.Repeater1.DataSource = pag;
            Repeater1.DataBind(); //用DataBind方法绑定具体的控件
        }
    }
    protected void Query_Click(object sender, EventArgs e)
    {
        string str = "server=.;database=SweetyDB;uid=aa;pwd=123456";
        string ono = OnoText.Text;
        if (OnoText.Text.Trim() != String.Empty && PtimeText1.Text.Trim() != String.Empty && PtimeText2.Text.Trim() != String.Empty)
        {
            string sqlSelect = String.Format("select * from Orders o,Goods g,Address ad where Ostate='待发货' and o.Gno=g.Gno and o.Uno=ad.Uno and o.ADno = ad.ADno and Ono='" + ono + "'and Ptime >='" + PtimeText1.Text.Trim() + "' and Ptime <='" + PtimeText2.Text.Trim() + "'");
            using (SqlConnection sqlCon = new SqlConnection(str))
            {
                sqlCon.Open();
                SqlDataAdapter da = new SqlDataAdapter(sqlSelect, str); //创建DataAdapter数据适配器实例
                DataSet ds = new DataSet();//创建DataSet实例
                da.Fill(ds); //贴数据，说白了就是把数据贴到数据集上
                Repeater1.DataSource = ds; //我们的Repeater控件ID为： repeater_info，这里调用.DataSource方法加载数据源头

                PagedDataSource pag = new PagedDataSource();
                pag.AllowPaging = true;// 设置允许分页
                pag.PageSize = 2; // 每页显示为2行
                pag.DataSource = ds.Tables[0].DefaultView; // 模板绑定数据源 
                Total.Text = pag.PageCount.ToString(); // 显示总共页数
                int CurrentPage;
                // 请求页码为不为null设置当前页，否则为第一页
                if (Request.QueryString["Page"] != null)
                {

                    CurrentPage = Convert.ToInt32(Request.QueryString["Page"]);
                }
                else
                {
                    CurrentPage = 1;
                }
                if (Request.QueryString["PageSize"] != null)
                {
                    pag.PageSize = Convert.ToInt32(Request.QueryString["PageSize"]);
                }
                else
                {
                    pag.PageSize = 2;// 每页显示为2行
                }
                pag.CurrentPageIndex = CurrentPage - 1; // 当前页所引为页码-1
                Now.Text = CurrentPage.ToString(); // 当前页
                if (!pag.IsFirstPage)
                {
                    //  Request.CurrentExecutionFilePath为当前请求虚拟路径
                    LnkPrev.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurrentPage - 1);
                }
                // 如果不是最后一页，通过参数Page设置下一页为当前页+1，否则不显示连接
                if (!pag.IsLastPage)
                {
                    // Request.CurrentExecutionFilePath为当前请求虚拟路径
                    LnkNext.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurrentPage + 1);
                }
                //首页
                First.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(1);
                //尾页
                End.NavigateUrl = Request.CurrentExecutionFilePath + "?page=" + pag.PageCount.ToString();
                if (Convert.ToInt32(HttpContext.Current.Request["page"]) > pag.PageCount)
                {
                    First.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(1);
                }
                this.Repeater1.DataSource = pag;
                Repeater1.DataBind(); //用DataBind方法绑定具体的控件
            }
        }
        else if (OnoText.Text.Trim() == String.Empty && PtimeText1.Text.Trim() != String.Empty && PtimeText2.Text.Trim() != String.Empty)
        {
            string sqlSelect = String.Format("select * from Orders o,Goods g,Address ad where o.Gno=g.Gno and o.Uno=ad.Uno and o.ADno = ad.ADno and Ptime >='" + PtimeText1.Text.Trim() + "' and Ptime <='" + PtimeText2.Text.Trim() + "' and  Ostate='待发货'");
            using (SqlConnection sqlCon = new SqlConnection(str))
            {
                sqlCon.Open();
                SqlDataAdapter da = new SqlDataAdapter(sqlSelect, str); //创建DataAdapter数据适配器实例
                DataSet ds = new DataSet();//创建DataSet实例
                da.Fill(ds); //贴数据，说白了就是把数据贴到数据集上
                Repeater1.DataSource = ds; //我们的Repeater控件ID为： repeater_info，这里调用.DataSource方法加载数据源头

                PagedDataSource pag = new PagedDataSource();
                pag.AllowPaging = true;// 设置允许分页
                pag.PageSize = 2; // 每页显示为2行
                pag.DataSource = ds.Tables[0].DefaultView; // 模板绑定数据源 
                Total.Text = pag.PageCount.ToString(); // 显示总共页数
                int CurrentPage;
                // 请求页码为不为null设置当前页，否则为第一页
                if (Request.QueryString["Page"] != null)
                {

                    CurrentPage = Convert.ToInt32(Request.QueryString["Page"]);
                }
                else
                {
                    CurrentPage = 1;
                }
                if (Request.QueryString["PageSize"] != null)
                {
                    pag.PageSize = Convert.ToInt32(Request.QueryString["PageSize"]);
                }
                else
                {
                    pag.PageSize = 2;// 每页显示为2行
                }
                pag.CurrentPageIndex = CurrentPage - 1; // 当前页所引为页码-1
                Now.Text = CurrentPage.ToString(); // 当前页
                if (!pag.IsFirstPage)
                {
                    //  Request.CurrentExecutionFilePath为当前请求虚拟路径
                    LnkPrev.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurrentPage - 1);
                }
                // 如果不是最后一页，通过参数Page设置下一页为当前页+1，否则不显示连接
                if (!pag.IsLastPage)
                {
                    // Request.CurrentExecutionFilePath为当前请求虚拟路径
                    LnkNext.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurrentPage + 1);
                }
                //首页
                First.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(1);
                //尾页
                End.NavigateUrl = Request.CurrentExecutionFilePath + "?page=" + pag.PageCount.ToString();
                if (Convert.ToInt32(HttpContext.Current.Request["page"]) > pag.PageCount)
                {
                    First.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(1);
                }
                this.Repeater1.DataSource = pag;
                Repeater1.DataBind(); //用DataBind方法绑定具体的控件
            }
        }

        else if (OnoText.Text.Trim() != String.Empty && PtimeText1.Text.Trim() == String.Empty && PtimeText2.Text.Trim() == String.Empty)
        {
            string sqlSelect = String.Format("select * from Orders o,Goods g,Address ad where o.Gno=g.Gno and o.Uno=ad.Uno and o.ADno = ad.ADno and Ono='" + ono + "' and  Ostate='待发货'");
            using (SqlConnection sqlCon = new SqlConnection(str))
            {
                sqlCon.Open();
                SqlDataAdapter da = new SqlDataAdapter(sqlSelect, str); //创建DataAdapter数据适配器实例
                DataSet ds = new DataSet();//创建DataSet实例
                da.Fill(ds); //贴数据，说白了就是把数据贴到数据集上
                Repeater1.DataSource = ds; //我们的Repeater控件ID为： repeater_info，这里调用.DataSource方法加载数据源头

                PagedDataSource pag = new PagedDataSource();
                pag.AllowPaging = true;// 设置允许分页
                pag.PageSize = 2; // 每页显示为2行
                pag.DataSource = ds.Tables[0].DefaultView; // 模板绑定数据源 
                Total.Text = pag.PageCount.ToString(); // 显示总共页数
                int CurrentPage;
                // 请求页码为不为null设置当前页，否则为第一页
                if (Request.QueryString["Page"] != null)
                {

                    CurrentPage = Convert.ToInt32(Request.QueryString["Page"]);
                }
                else
                {
                    CurrentPage = 1;
                }
                if (Request.QueryString["PageSize"] != null)
                {
                    pag.PageSize = Convert.ToInt32(Request.QueryString["PageSize"]);
                }
                else
                {
                    pag.PageSize = 2;// 每页显示为2行
                }
                pag.CurrentPageIndex = CurrentPage - 1; // 当前页所引为页码-1
                Now.Text = CurrentPage.ToString(); // 当前页
                if (!pag.IsFirstPage)
                {
                    //  Request.CurrentExecutionFilePath为当前请求虚拟路径
                    LnkPrev.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurrentPage - 1);
                }
                // 如果不是最后一页，通过参数Page设置下一页为当前页+1，否则不显示连接
                if (!pag.IsLastPage)
                {
                    // Request.CurrentExecutionFilePath为当前请求虚拟路径
                    LnkNext.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurrentPage + 1);
                }
                //首页
                First.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(1);
                //尾页
                End.NavigateUrl = Request.CurrentExecutionFilePath + "?page=" + pag.PageCount.ToString();
                if (Convert.ToInt32(HttpContext.Current.Request["page"]) > pag.PageCount)
                {
                    First.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(1);
                }
                this.Repeater1.DataSource = pag;
                Repeater1.DataBind(); //用DataBind方法绑定具体的控件
            }
        }
    }
    protected void Reset_Click(object sender, EventArgs e)
    {
        OnoText.Text = "";
        PtimeText1.Text = "";
        PtimeText2.Text = "";
    }

    protected void Detail_Click(object sender, EventArgs e)
    {
        string[] estr = ((Button)sender).CommandArgument.ToString().Split(',');
        string ono = Convert.ToString(estr[0]);
        string uno = Convert.ToString(estr[1]);
        Response.Redirect("OrderDetails.aspx?ono=" + ono + "&uno=" + uno);
    }
    protected void Send_Click(object sender, EventArgs e)
    {
        string[] estr = ((Button)sender).CommandArgument.ToString().Split(',');
        string ono = Convert.ToString(estr[0]);
        string uno = Convert.ToString(estr[1]);
        string updSql = String.Format("update Orders set Ostate='已发货' where Ono='" + ono + "' and Uno='" + uno + "'");
        OperateDataBase obd = new OperateDataBase();
        bool upd = obd.ExceSql(updSql);
        if (upd == true)
        {
            Response.Write("<script>window.alert('发货处理中!');location.href='OList-Sending.aspx';</script>");
        }
        else
        {
            Response.Write("<script>window.alert('发货失败!');location.href='OList-WaitSend.aspx';</script>");
        }
        //重新获取数据
    }
}
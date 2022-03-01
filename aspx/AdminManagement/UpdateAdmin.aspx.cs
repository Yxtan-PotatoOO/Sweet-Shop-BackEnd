using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;

public partial class aspx_AdminManagement_UpdateAdmin : System.Web.UI.Page
{
    protected string DefaultTitle = ConfigurationSettings.AppSettings["SystemName"].ToString();             //获取系统名称
    protected string strConn = ConfigurationSettings.AppSettings["strSqlConn"].ToString();                  //获取数据库连接字条串
    protected string UploadFileTypes = ConfigurationSettings.AppSettings["UploadFileType"].ToString();            //获取允许上传的格式
    protected string UploadSavePath = ConfigurationSettings.AppSettings["UploadSavePath"].ToString();       //获取附件保存根目录,如upfiles/
    protected void Page_Load(object sender, EventArgs e)
    {
        string str = "server=.;database=SweetyDB;uid=aa;pwd=123456";
        string ano1 = Request["ano1"];
        AnoLabel.Text = ano1;
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
                using (SqlConnection sqlCon = new SqlConnection(str))
                {
                    sqlCon.Open();
                    string Selname = String.Format("select Aname from Admin where Ano='" + ano1 + "'");
                    using (SqlCommand cmd = new SqlCommand(Selname, sqlCon))
                    {
                        string aname = Convert.ToString(cmd.ExecuteScalar());
                        AnameText.Text = aname.ToString();
                    }

                    string Selphone = String.Format("select Aphone from Admin where Ano='" + ano1 + "'");
                    using (SqlCommand cmd = new SqlCommand(Selphone, sqlCon))
                    {
                        string aphone = Convert.ToString(cmd.ExecuteScalar());
                        AphoneText.Text = aphone.ToString();
                    }

                    string Selgroup = String.Format("select Agroup from Admin where Ano='" + ano1 + "'");
                    using (SqlCommand cmd = new SqlCommand(Selgroup, sqlCon))
                    {
                        string agroup = Convert.ToString(cmd.ExecuteScalar());
                        AgroupText.Text = agroup.ToString();
                    }

                    string Selinfo = String.Format("select Ainfo from Admin where Ano='" + ano1 + "'");
                    using (SqlCommand cmd = new SqlCommand(Selinfo, sqlCon))
                    {
                        string ainfo = Convert.ToString(cmd.ExecuteScalar());
                        AinfoText.Text = ainfo.ToString();
                    }
                }
            }
        }
    }
    //保存更新后的数据
    protected void Save_Click(object sender, EventArgs e)
    {
        string ano1 = Request["ano1"];
        string name = AnameText.Text;
        string passwd = ApasswdText.Text;
        string sex = Request["sex"].ToString();
        string phone = AphoneText.Text;
        string group = AgroupText.Text;
        string state = Request["state"].ToString();
        string info = AinfoText.Text;
        string updSql = String.Format("update Admin set Aname = '" + name + "',Apasswd = '" + passwd + "',Asex = '" + sex + "',Aphone = '" + phone + "',Agroup = '" + group + "',Astate = '" + state + "',Ainfo = '" + info + "'where Ano='" + ano1 + "'");
        
        //buxing string updSql = String.Format("update Admin set Aname = '" + name + "'where Ano='" + ano1 + "'");
        //string updSql = String.Format("update Admin set Apasswd = '" + passwd + "'where Ano='" + ano1 + "'");
        //string updSql = String.Format("update Admin set Asex = '" + sex + "'where Ano='" + ano1 + "'");
        //string updSql = String.Format("update Admin set Aphone = '" + phone  + "'where Ano='" + ano1 + "'");
        //string updSql = String.Format("update Admin set Ainfo = '" + info + "'where Ano='" + ano1 + "'");
        OperateDataBase obd = new OperateDataBase();
        bool del = obd.ExceSql(updSql);
        if (del == true)
        {
            Response.Write("<script>window.alert('更新成功!');location.href='Admin.aspx';</script>");
        }
        else
        {
            Response.Write("<script>window.alert('更新失败!');location.href='UpdateAdmin.aspx';</script>");
        }
    }

    protected void UpLoad_Click(object sender, EventArgs e)
    {
        string ano1 = Request["ano1"];
        string filePath;                                      //文件路径
        string fileName;                                      //附件名称
        int fileSize;                                      //附件大小
        string fileType;                                      //附件格式
        string sAbsoluteSavePath;                             //服务器端附件保存根目录
        string sFileSaveName;                                 //附件保存在服务器上的名称
        int tt;
        if (FileUpload.PostedFile.FileName != "")
        {
            filePath = FileUpload.PostedFile.FileName;
            fileName = Path.GetFileName(filePath);                           //原始附件名称
            fileSize = FileUpload.PostedFile.ContentLength;               //附件大小
            tt = fileName.LastIndexOf(".");
            fileType = fileName.Substring(tt).ToLower();                   //附件格式,小写
            sAbsoluteSavePath = Path.Combine(Request.MapPath(UploadSavePath));
            sFileSaveName = DateTime.Now.ToString("yymmddhhmmss") + fileType;
            if (fileSize > 0 && fileType.Length > 0 && ("|" + UploadFileTypes + "|").IndexOf("|" + fileType + "|") > -1)
            {
                try
                {
                    //string sqlInsert;
                    string sqlUpdate;
                    FileUpload.PostedFile.SaveAs(Path.Combine(sAbsoluteSavePath, sFileSaveName));
                    SqlConnection sqlcon = new SqlConnection(strConn);
                    sqlUpdate = "update Admin set Aportrait = '" + sFileSaveName + "' where Ano ='" + ano1 + "'";
                    SqlCommand sqlcom = new SqlCommand(sqlUpdate, sqlcon);
                    sqlcon.Open();
                    sqlcom.ExecuteNonQuery();
                    string show = "select Aportrait from Admin where Ano ='" + ano1 + "'";
                    SqlDataAdapter da = new SqlDataAdapter(show, sqlcon);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    //将取得的路径设置到Image控件的ImageUrl属性中去  
                    Response.Write("<script>alert('上传成功!');</script>");
                    DataTable datatable = ds.Tables[0];
                    for (int i = 0; i < datatable.Rows.Count; i++)
                    {
                        this.ShowImage.ImageUrl = "~/aspx/AdminManagement/imgUploads/" + ds.Tables[0].Rows[i]["Aportrait"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("错误：" + ex.Message);
                }
            }
        }
        else
        {
            Response.Write("<script>alert('请选择文件!');</script>");
        }
    }
}
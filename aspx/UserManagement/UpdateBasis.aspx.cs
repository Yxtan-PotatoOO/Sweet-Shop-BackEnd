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
    protected string UploadSavePath3 = ConfigurationSettings.AppSettings["UploadSavePath3"].ToString(); 
    protected void Page_Load(object sender, EventArgs e)
    {
        string str = "server=.;database=SweetyDB;uid=aa;pwd=123456";
        string uno1 = Request["uno1"];
        UnoLabel.Text = uno1;
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
                    string Selname = String.Format("select Uname from Users where Uno='" + uno1 + "'");
                    using (SqlCommand cmd = new SqlCommand(Selname, sqlCon))
                    {
                        string uname = Convert.ToString(cmd.ExecuteScalar());
                        UnameText.Text = uname.ToString();
                    }

                    string Selphone = String.Format("select Uphone from Users where Uno='" + uno1 + "'");
                    using (SqlCommand cmd = new SqlCommand(Selphone, sqlCon))
                    {
                        string uphone = Convert.ToString(cmd.ExecuteScalar());
                        UphoneText.Text = uphone.ToString();
                    }
                }
            }
        }
    }
    //保存更新后的数据
    protected void Save_Click(object sender, EventArgs e)
    {
        string uno1 = Request["uno1"];
        string name = UnameText.Text;
        string sex = Request["sex"].ToString();
        string phone = UphoneText.Text;
        string state = Request["state"].ToString();
        string updSql = String.Format("update Users set Uname = '" + name + "',Usex = '" + sex + "',Uphone = '" + phone + "',Ustate = '" + state + "' where Uno='" + uno1 + "'");
        OperateDataBase obd = new OperateDataBase();
        bool del = obd.ExceSql(updSql);
        if (del == true)
        {
            Response.Write("<script>window.alert('更新成功!');location.href='Basis.aspx';</script>");
        }
        else
        {
            Response.Write("<script>window.alert('更新失败!');</script>");
        }
    }

    protected void UpLoad_Click(object sender, EventArgs e)
    {
        string uno1 = Request["uno1"];
        string filePath;                                      //文件路径
        string fileName;                                      //附件名称
        int fileSize;                                      //附件大小
        string fileType;                                      //附件格式
        string sAbsoluteSavePath;                             //服务器端附件保存根目录
        string sAbsoluteSavePath3;
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
            sAbsoluteSavePath3 = Path.Combine(Request.MapPath(UploadSavePath3));
            sFileSaveName = DateTime.Now.ToString("yymmddhhmmss") + fileType;
            if (fileSize > 0 && fileType.Length > 0 && ("|" + UploadFileTypes + "|").IndexOf("|" + fileType + "|") > -1)
            {
                try
                {
                    //string sqlInsert;
                    string sqlUpdate;
                    FileUpload.PostedFile.SaveAs(Path.Combine(sAbsoluteSavePath, sFileSaveName));
                    FileUpload.PostedFile.SaveAs(Path.Combine(sAbsoluteSavePath3, sFileSaveName));
                    SqlConnection sqlcon = new SqlConnection(strConn);
                    sqlUpdate = "update Users set Uportrait = '" + sFileSaveName + "' where Uno ='" + uno1 + "'";
                    SqlCommand sqlcom = new SqlCommand(sqlUpdate, sqlcon);
                    sqlcon.Open();
                    sqlcom.ExecuteNonQuery();
                    string show = "select Uportrait from Users where Uno ='" + uno1 + "'";
                    SqlDataAdapter da = new SqlDataAdapter(show, sqlcon);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    //将取得的路径设置到Image控件的ImageUrl属性中去  
                    Response.Write("<script>alert('上传成功!');</script>");
                    DataTable datatable = ds.Tables[0];
                    for (int i = 0; i < datatable.Rows.Count; i++)
                    {
                        this.ShowImage.ImageUrl = "~/aspx/UserManagement/imgUploads/" + ds.Tables[0].Rows[i]["Uportrait"].ToString();
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
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

public partial class aspx_GoodsManagement_AddImages : System.Web.UI.Page
{
    protected string DefaultTitle = ConfigurationSettings.AppSettings["SystemName"].ToString();             //获取系统名称
    protected string strConn = ConfigurationSettings.AppSettings["strSqlConn"].ToString();                  //获取数据库连接字条串
    protected string UploadFileTypes = ConfigurationSettings.AppSettings["UploadFileType"].ToString();            //获取允许上传的格式
    protected string UploadSavePath = ConfigurationSettings.AppSettings["UploadSavePath"].ToString();       //获取附件保存根目录,如upfiles/
    protected string UploadSavePath2 = ConfigurationSettings.AppSettings["UploadSavePath2"].ToString();       
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
    protected void UpLoad1_Click(object sender, EventArgs e)
    {
        string gno = Request["no"];
        string filePath;                                      //文件路径
        string fileName;                                      //附件名称
        int fileSize;                                      //附件大小
        string fileType;                                      //附件格式
        string sAbsoluteSavePath;                             //服务器端附件保存根目录
        string sAbsoluteSavePath2;
        string sFileSaveName;                                 //附件保存在服务器上的名称
        int tt;
        if (FileUpload1.PostedFile.FileName != "")
        {
            filePath = FileUpload1.PostedFile.FileName;
            fileName = Path.GetFileName(filePath);                           //原始附件名称
            fileSize = FileUpload1.PostedFile.ContentLength;               //附件大小
            tt = fileName.LastIndexOf(".");
            fileType = fileName.Substring(tt).ToLower();                   //附件格式,小写
            sAbsoluteSavePath = Path.Combine(Request.MapPath(UploadSavePath));
            sAbsoluteSavePath2 = Path.Combine(Request.MapPath(UploadSavePath2));
            sFileSaveName = DateTime.Now.ToString("yymmddhhmmss") + fileType;
            if (fileSize > 0 && fileType.Length > 0 && ("|" + UploadFileTypes + "|").IndexOf("|" + fileType + "|") > -1)
            {
                try
                {
                    //string sqlInsert;
                    string sqlUpdate;
                    FileUpload1.PostedFile.SaveAs(Path.Combine(sAbsoluteSavePath, sFileSaveName));
                    FileUpload1.PostedFile.SaveAs(Path.Combine(sAbsoluteSavePath2, sFileSaveName));
                    SqlConnection sqlcon = new SqlConnection(strConn);
                    sqlUpdate = "update Goods set Gimage1 = '" + sFileSaveName + "' where Gno ='" + gno + "'";
                    SqlCommand sqlcom = new SqlCommand(sqlUpdate, sqlcon);
                    sqlcon.Open();
                    sqlcom.ExecuteNonQuery();
                    string show = "select Gimage1 from Goods where Gno ='" + gno + "'";
                    SqlDataAdapter da = new SqlDataAdapter(show, sqlcon);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    //将取得的路径设置到Image控件的ImageUrl属性中去  
                    Response.Write("<script>alert('上传成功!');</script>");
                    DataTable datatable = ds.Tables[0];
                    for (int i = 0; i < datatable.Rows.Count; i++)
                    {
                        this.ShowImage1.ImageUrl = "~/aspx/GoodsManagement/imgUploads/" + ds.Tables[0].Rows[i]["Gimage1"].ToString();
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
    protected void UpLoad2_Click(object sender, EventArgs e)
    {
        //string gno = Session["no"].ToString();
        string gno = Request["no"];
        string filePath;                                      //文件路径
        string fileName;                                      //附件名称
        int fileSize;                                      //附件大小
        string fileType;                                      //附件格式
        string sAbsoluteSavePath;                             //服务器端附件保存根目录
        string sAbsoluteSavePath2; 
        string sFileSaveName;                                 //附件保存在服务器上的名称
        int tt;
        if (FileUpload2.PostedFile.FileName != "")
        {
            filePath = FileUpload2.PostedFile.FileName;
            fileName = Path.GetFileName(filePath);                           //原始附件名称
            fileSize = FileUpload2.PostedFile.ContentLength;               //附件大小
            tt = fileName.LastIndexOf(".");
            fileType = fileName.Substring(tt).ToLower();                   //附件格式,小写
            sAbsoluteSavePath = Path.Combine(Request.MapPath(UploadSavePath));
            sAbsoluteSavePath2 = Path.Combine(Request.MapPath(UploadSavePath2));
            sFileSaveName = DateTime.Now.ToString("yymmddhhmmss") + fileType;
            if (fileSize > 0 && fileType.Length > 0 && ("|" + UploadFileTypes + "|").IndexOf("|" + fileType + "|") > -1)
            {
                try
                {
                    //string sqlInsert;
                    string sqlUpdate;
                    FileUpload2.PostedFile.SaveAs(Path.Combine(sAbsoluteSavePath, sFileSaveName));
                    FileUpload2.PostedFile.SaveAs(Path.Combine(sAbsoluteSavePath2, sFileSaveName));
                    SqlConnection sqlcon = new SqlConnection(strConn);
                    sqlUpdate = "update Goods set Gimage2 = '" + sFileSaveName + "' where Gno ='" + gno + "'";
                    SqlCommand sqlcom = new SqlCommand(sqlUpdate, sqlcon);
                    sqlcon.Open();
                    sqlcom.ExecuteNonQuery();
                    string show = "select Gimage2 from Goods where Gno ='" + gno + "'";
                    SqlDataAdapter da = new SqlDataAdapter(show, sqlcon);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    //将取得的路径设置到Image控件的ImageUrl属性中去  
                    Response.Write("<script>alert('上传成功!');</script>");
                    DataTable datatable = ds.Tables[0];
                    for (int i = 0; i < datatable.Rows.Count; i++)
                    {
                        this.ShowImage2.ImageUrl = "~/aspx/GoodsManagement/imgUploads/" + ds.Tables[0].Rows[i]["Gimage2"].ToString();
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
    protected void UpLoad3_Click(object sender, EventArgs e)
    {
        //string gno = Session["no"].ToString();
        string gno = Request["no"];
        string filePath;                                      //文件路径
        string fileName;                                      //附件名称
        int fileSize;                                      //附件大小
        string fileType;                                      //附件格式
        string sAbsoluteSavePath;                             //服务器端附件保存根目录
        string sAbsoluteSavePath2; 
        string sFileSaveName;                                 //附件保存在服务器上的名称
        int tt;
        if (FileUpload3.PostedFile.FileName != "")
        {
            filePath = FileUpload3.PostedFile.FileName;
            fileName = Path.GetFileName(filePath);                           //原始附件名称
            fileSize = FileUpload3.PostedFile.ContentLength;               //附件大小
            tt = fileName.LastIndexOf(".");
            fileType = fileName.Substring(tt).ToLower();                   //附件格式,小写
            sAbsoluteSavePath = Path.Combine(Request.MapPath(UploadSavePath));
            sAbsoluteSavePath2 = Path.Combine(Request.MapPath(UploadSavePath2));
            sFileSaveName = DateTime.Now.ToString("yymmddhhmmss") + fileType;
            if (fileSize > 0 && fileType.Length > 0 && ("|" + UploadFileTypes + "|").IndexOf("|" + fileType + "|") > -1)
            {
                try
                {
                    string sqlUpdate;
                    FileUpload3.PostedFile.SaveAs(Path.Combine(sAbsoluteSavePath, sFileSaveName));
                    FileUpload3.PostedFile.SaveAs(Path.Combine(sAbsoluteSavePath2, sFileSaveName));
                    SqlConnection sqlcon = new SqlConnection(strConn);
                    sqlUpdate = "update Goods set Gimage3 = '" + sFileSaveName + "' where Gno ='" + gno + "'";
                    SqlCommand sqlcom = new SqlCommand(sqlUpdate, sqlcon);
                    sqlcon.Open();
                    sqlcom.ExecuteNonQuery();
                    string show = "select Gimage3 from Goods where Gno ='" + gno + "'";
                    SqlDataAdapter da = new SqlDataAdapter(show, sqlcon);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    //将取得的路径设置到Image控件的ImageUrl属性中去  
                    Response.Write("<script>alert('上传成功!');</script>");
                    DataTable datatable = ds.Tables[0];
                    for (int i = 0; i < datatable.Rows.Count; i++)
                    {
                        this.ShowImage3.ImageUrl = "~/aspx/GoodsManagement/imgUploads/" + ds.Tables[0].Rows[i]["Gimage3"].ToString();
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
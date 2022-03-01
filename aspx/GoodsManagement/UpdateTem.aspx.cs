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

public partial class aspx_GoodsManagement_UpdateTem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string str = "server=.;database=SweetyDB;uid=aa;pwd=123456";
        string tno = Request["tno"];
        TnoLabel.Text = tno;

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
                    string Selname = String.Format("select Tname from Template where Tno='" + tno + "'");
                    using (SqlCommand cmd = new SqlCommand(Selname, sqlCon))
                    {
                        string tname = Convert.ToString(cmd.ExecuteScalar());
                        TnameText.Text = tname.ToString();
                    }
                }
                using (SqlConnection sqlCon = new SqlConnection(str))
                {
                    sqlCon.Open();
                    string Seladdress = String.Format("select Taddress from Template where Tno='" + tno + "'");
                    using (SqlCommand cmd = new SqlCommand(Seladdress, sqlCon))
                    {
                        string taddress = Convert.ToString(cmd.ExecuteScalar());
                        TaddressText.Text = taddress.ToString();
                    }
                }
                using (SqlConnection sqlCon = new SqlConnection(str))
                {
                    sqlCon.Open();
                    string Selexemption = String.Format("select Texemption from Template where Tno='" + tno + "'");
                    using (SqlCommand cmd = new SqlCommand(Selexemption, sqlCon))
                    {
                        string texemption = Convert.ToString(cmd.ExecuteScalar());
                        if (texemption == "是")
                        {
                            Y.Checked = true;
                        }
                        else { N.Checked = true; }
                    }
                }
                //using (SqlConnection sqlCon = new SqlConnection(str))
                //{
                //    sqlCon.Open();
                //    string Selsend = String.Format("select Tsend from Template where Tno='" + tno + "'");
                //    using (SqlCommand cmd = new SqlCommand(Selsend, sqlCon))
                //    {
                //        string tsend = Convert.ToString(cmd.ExecuteScalar());
                //        if (tsend == "快递")
                //        {
                //            kd.Checked = true;
                //            this.Div1.Style.Add("display", "block");
                //        }
                //        else if (tsend == "EMS")
                //        {
                //            ems.Checked = true;
                //            this.Div2.Style.Add("display", "block");
                //        }
                //        else if (tsend == "平邮")
                //        {
                //            py.Checked = true;
                //            this.Div3.Style.Add("display", "block");
                //        }
                //    }
                //}
                //using (SqlConnection sqlCon = new SqlConnection(str))
                //{
                //    sqlCon.Open();
                //    string Selweight1 = String.Format("select Tweight1 from Template where Tno='" + tno + "'");
                //    using (SqlCommand cmd = new SqlCommand(Selweight1, sqlCon))
                //    {
                //        string tweight1 = Convert.ToString(cmd.ExecuteScalar());
                //        if (kd.Checked == true) { Tweight1Text1.Text = tweight1; }
                //        else if (ems.Checked == true) { Tweight1Text2.Text = tweight1; }
                //        else if (py.Checked == true) { TnameText0.Text = tweight1; }
                //    }
                //}
                //using (SqlConnection sqlCon = new SqlConnection(str))
                //{
                //    sqlCon.Open();
                //    string Selfare1 = String.Format("select Tfare1 from Template where Tno='" + tno + "'");
                //    using (SqlCommand cmd = new SqlCommand(Selfare1, sqlCon))
                //    {
                //        string tfare1 = Convert.ToString(cmd.ExecuteScalar());
                //        if (kd.Checked == true) { TextBox3.Text = tfare1; }
                //        else if (ems.Checked == true) { TextBox7.Text = tfare1; }
                //        else if (py.Checked == true) { TnameText1.Text = tfare1; }
                //    }
                //}
                //using (SqlConnection sqlCon = new SqlConnection(str))
                //{
                //    sqlCon.Open();
                //    string Selweight2 = String.Format("select Tweight2 from Template where Tno='" + tno + "'");
                //    using (SqlCommand cmd = new SqlCommand(Selweight2, sqlCon))
                //    {
                //        string tweight2 = Convert.ToString(cmd.ExecuteScalar());
                //        if (kd.Checked == true) { TextBox4.Text = tweight2; }
                //        else if (ems.Checked == true) { TextBox8.Text = tweight2; }
                //        else if (py.Checked == true) { TnameText2.Text = tweight2; }
                //    }
                //}
                //using (SqlConnection sqlCon = new SqlConnection(str))
                //{
                //    sqlCon.Open();
                //    string Selfare2 = String.Format("select Tfare2 from Template where Tno='" + tno + "'");
                //    using (SqlCommand cmd = new SqlCommand(Selfare2, sqlCon))
                //    {
                //        string tfare2 = Convert.ToString(cmd.ExecuteScalar());
                //        if (kd.Checked == true) { TextBox5.Text = tfare2; }
                //        else if (ems.Checked == true) { TextBox9.Text = tfare2; }
                //        else if (py.Checked == true) { TnameText3.Text = tfare2; }
                //    }
                //}

            }
        }
    }
    protected void Save_Click(object sender, EventArgs e)
    {
        string tno = Request["tno"];
        string tname = TnameText.Text;
        string texemption = Request.Form["way1"];
        string tvalue = Request.Form["way2"];
        string tsend = Request.Form["way3"];
        string taddress = TaddressText.Text;
        string tweight1 = " ";
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
        string updSql = String.Format("update Template set Tname = '" + tname + "',Texemption = '" + texemption + "',Tvalue = '" + tvalue + "',Tsend  = '" + tsend + "',Taddress = '" + taddress + "',Tweight1 = '" + tweight1 + "',Tfare1 = '" + tfare1 + "',Tweight2 = '" + tweight2 + "',Tfare2 = '" + tfare2 + "' where Tno='" + tno + "'");
        //string updSql = String.Format("update Template set Tname = '" + tname + "',Texemption = '" + texemption + "',Tvalue = '" + tvalue + "',Tsend  = '" + tsend + "',Taddress = '" + taddress + "' where Tno='" + tno + "'");
        OperateDataBase obd = new OperateDataBase();
        bool upd = obd.ExceSql(updSql);
        if (upd == true)
        {
            Response.Write("<script>window.alert('更新成功!');location.href='Template.aspx'</script>");
        }
        else
        {
            Response.Write("<script>window.alert('更新失败!');location.href='UpdateTem.aspx?tno=" + tno + "'</script></script>");
        }
    }
}
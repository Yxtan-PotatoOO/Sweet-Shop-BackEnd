using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
///OperateDataBase 的摘要说明
/// </summary>
public class OperateDataBase
{
    protected SqlConnection conn;
    protected string constr;

    public OperateDataBase()
    {
        constr = "server=.;database=SweetyDB;uid=aa;pwd=123456";
    }
    private void Open()
    {
        if (conn == null)
        {
            conn = new SqlConnection(constr);
            conn.Open();
        }
        else
        {
            if (conn.State.Equals(ConnectionState.Closed))
            {
                conn.Open();
            }
        }
    }
    private void Close()
    {
        if (conn.State.Equals(ConnectionState.Open))
        {
            conn.Close();
        }
    }

    public bool ExceSql(String strSqlCom)
    {
        Open();
        SqlCommand sqlcom = new SqlCommand(strSqlCom, conn);
        try
        {
            sqlcom.ExecuteNonQuery();
            return true;
        }
        catch
        {
            return false;
        }
        finally
        {
            Close();
        }
    }
}
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       
        DataSourceSelectArguments ar = new DataSourceSelectArguments();
        DataView dv = (DataView)SqlDataSource1.Select(ar);      //将“SqlDataSource1”替换为所需名

        //开始赋值，只有一行。Rows[0]代表取第一行
        this.TextBox1.Text  = dv.Table.Rows[0]["id"].ToString();
        this.TextBox2.Text = dv.Table.Rows[0]["name"].ToString();

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string strconn = ConfigurationManager.ConnectionStrings["ado_TestConnectionString"].ConnectionString;
        SqlConnection cn = new SqlConnection(strconn);
        cn.Open();//打开这个连接

        string mysql = "select * from info where classid=30";
        SqlCommand cm = new SqlCommand(mysql, cn);
        SqlDataReader dr = cm.ExecuteReader();//执行这个查询，将结果放到DataReader对象

        if (dr.Read())   //如果存在
        {
           this.TextBox3.Text = dr.GetValue(2).ToString();
        }
        cn.Close();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        //建立连接       
        string strconn = ConfigurationManager.ConnectionStrings["ado_TestConnectionString"].ConnectionString;
        SqlConnection cn = new SqlConnection(strconn);
        cn.Open();

        //sql语句
        string mysql = "select * from info where classid=10";

        SqlDataAdapter ad = new SqlDataAdapter(mysql, cn);//新建一个adapter,用以获取数据
        DataSet ds = new DataSet();//新建一个dataset，用以获取adapter中的值
        ad.Fill(ds, "info");//为dataset赋值，必须指定adapter中某个表。
        GridView2.DataSource = ds;//将dataset中的值绑定给gridview，展示到客户端。
        GridView2.DataBind();
        cn.Close();
    }
    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using jobworld.Common;
using System.Net;
using System.IO;

namespace jobworld.Account
{
    public partial class getStatueAPI : Common.PageBase
    {
        protected override void Page_Init(object sender, EventArgs e)
        {

        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.Params["id"]))
            {
                return;
            }
            string id = Request.Params["id"];

            if (string.IsNullOrEmpty(Request.Params["type"]))
            {
                return;
            }
            string type = Request.Params["type"];

            string value = "";
            if (!string.IsNullOrEmpty(Request.Params["value"]))
            {
                value = Request.Params["value"];
            }

            if(value == "")
            {
                if(type == "0")
                {
                    try
                    {
                        PageDataSource = DBConn.RunSelectQuery("select statue from news_setting where id=" + id);
                        if(PageDataSource.Tables[0].Rows.Count > 0)
                        {
                            int statue = Convert.ToInt32(PageDataSource.Tables[0].Rows[0][0].ToString());
                            Response.Write(statue);
                        }
                    }
                    catch(Exception)
                    {
                        Response.Write("0");
                    }
                }
                else if(type == "1")
                {
                    try
                    {
                        PageDataSource = DBConn.RunSelectQuery("select statue from news_setting where id=" + id);
                        if (PageDataSource.Tables[0].Rows.Count > 0)
                        {
                            int statue = Convert.ToInt32(PageDataSource.Tables[0].Rows[0][0].ToString());
                            Response.Write(statue);
                        }
                    }
                    catch (Exception)
                    {
                        Response.Write("0");
                    }
                }
                else if(type == "2")
                {
                    try
                    {
                        PageDataSource = DBConn.RunSelectQuery("select * from news_setting where id=" + id);
                        if (PageDataSource.Tables[0].Rows.Count > 0)
                        {
                            int statue = Convert.ToInt32(PageDataSource.Tables[0].Rows[0][6].ToString());
                            int c_statue = Convert.ToInt32(PageDataSource.Tables[0].Rows[0][4].ToString());
                            if(statue == 2 && c_statue == 1)
                            {
                                //편집가능
                                Response.Write("4");
                            }
                            else if(statue == 3)
                            {
                                //편집회의
                                Response.Write(statue);
                            }
                            else if(statue == 1)
                            {
                                //bakcup
                                Response.Write("1");
                            }
                            else if(statue == 2 && c_statue == 2)
                            {
                                //정상
                                Response.Write("2");
                            }
                        }
                    }
                    catch (Exception)
                    {
                        Response.Write("0");
                    }
                }
            }
            else
            {
                if (type == "0")
                {
                    try
                    {
                        string query = "update news_setting set c_statue = '" + value + "' where id='" + id + "'";
                        DBConn.RunUpdateQuery(query);
                        Response.Write("success");
                    }
                    catch (Exception)
                    {
                        Response.Write("fail");
                    }

                    string title = "";
                    string content = "";
                    string summary = "";

                    if (!string.IsNullOrEmpty(Request.Params["title"]))
                    {
                        title = Server.UrlDecode(Request.Params["title"]);
                    }
                    if (!string.IsNullOrEmpty(Request.Params["content"]))
                    {
                        content = Server.UrlDecode(Request.Params["content"]);
                    }
                    if (!string.IsNullOrEmpty(Request.Params["summary"]))
                    {
                        summary = Server.UrlDecode(Request.Params["summary"]);
                    }

                    title = title.Replace("'", "''");
                    content = content.Replace("'", "''");
                    summary = summary.Replace("'", "''");

                    string filepath = "";
                    try
                    {
                        filepath = uploadFile(Request.Files["file"], absContentPath, System.IO.Path.GetFileName(Request.Files["file"].FileName));
                        filepath = Path.GetFileName(filepath);
                    }
                    catch (Exception)
                    {

                    }
                    string query1 = "select * from news_setting where id=" + id;

                    string company = "";
                    string collector = "";
                    string editor = "";
                    string c_place = "";
                    string c_email = "";
                    string e_email = "";
                    string news_type = "";
                    string news_name = "";

                    try
                    {
                        DataSet dataset = DBConn.RunSelectQuery(query1);
                        if (dataset.Tables[0].Rows.Count > 0)
                        {
                            company = dataset.Tables[0].Rows[0][1].ToString();
                            collector = dataset.Tables[0].Rows[0][2].ToString();
                            editor = dataset.Tables[0].Rows[0][3].ToString();
                            c_place = dataset.Tables[0].Rows[0][7].ToString();
                            c_email = dataset.Tables[0].Rows[0][8].ToString();
                            e_email = dataset.Tables[0].Rows[0][11].ToString();
                            news_type = dataset.Tables[0].Rows[0][9].ToString();
                            news_name = dataset.Tables[0].Rows[0][10].ToString();
                        }
                    }
                    catch (Exception)
                    {

                    }

                    try
                    {
                        string query = "insert into content values('" + id + "', '4', '" + title + "', '" + content + "', '" + summary + "', '" + filepath + "', '', '"
                            + strCurDate
                            + "', '', '"
                            + company
                            + "', '"
                            + collector
                            + "', '"
                            + editor
                            + "', '"
                            + c_place
                            + "', '"
                            + c_email
                            + "', '"
                            + news_type
                            + "', '"
                            + news_name
                            + "', '"
                            + e_email
                            + "', 0, '"
                            + collector
                            + "')";
                        DBConn.RunInsertQuery(query);
                    }
                    catch (Exception)
                    {
                        Response.Write("<script>alert('등록하는 동안 알지 못할 오류가 발생했습니다.')</script>");
                    }
                }
                else if (type == "1")
                {
                    try
                    {
                        string query = "update news_setting set e_statue = '" + value + "' where id='" + id + "'";
                        DBConn.RunUpdateQuery(query);
                        Response.Write("success");
                    }
                    catch (Exception)
                    {
                        Response.Write("fail");
                    }
                }
            }
        }
    }
}
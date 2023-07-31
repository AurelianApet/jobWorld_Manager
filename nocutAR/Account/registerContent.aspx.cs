using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Text;
using System.Data;

namespace jobworld.Account
{
    public partial class registerContent : Common.PageBase
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            string etitle = Request.Params["title"];
            string content = Request.Params["content"];
            string esummary = Request.Params["summary"];
            string etype = Request.Params["sel_type"];
            string author = Request.Params["author"];
            string id = Request.Params["id"];

            etitle = etitle.Replace("'", "''");
            content = content.Replace("'", "''");
            esummary = esummary.Replace("'", "''");
            author = author.Replace("'", "''");

            if (etype == "정치/사회")
            {
                etype = "0";
            }
            else if (etype == "경제/국제")
            {
                etype = "1";
            }
            else if (etype == "문화/예술")
            {
                etype = "2";
            }
            else if (etype == "과학/기술")
            {
                etype = "3";
            }
            else if (etype == "취재기사")
            {
                etype = "4";
            }

            string eid = "0";

            try
            {
                if(id == "0")
                {
                    string query = "insert into content values('" + eid + "', '" + etype + "', '" + etitle + "', '" + content + "', '" + esummary + "', '', '', '"
                        + strCurDate
                        + "', '', '', '', '', '', '', '" + eid + "', '', '', 0, '"
                        + author
                        + "')";
                    DBConn.RunInsertQuery(query);
                }
                else if(id == "1")
                {
                    string query = "select max(id) from content";
                    PageDataSource = DBConn.RunSelectQuery(query);
                    int mid = -1;
                    if (PageDataSource.Tables[0].Rows.Count > 0)
                    {
                        mid = Convert.ToInt32(PageDataSource.Tables[0].Rows[0][0].ToString());
                        query = "update content set eid='" + eid + "', type='" + etype + "', etitle='" + etitle + "', econtent='" + content + "', news_type='" + etype + "', esummary='" + esummary + "', regdate='" + strCurDate + "' where id=" + mid;
                        DBConn.RunUpdateQuery(query);
                    }
                    else
                    {
                        query = "insert into content values('" + eid + "', '" + etype + "', '" + etitle + "', '" + content + "', '" + esummary + "', '', '', '"
                            + strCurDate
                            + "', '', '', '', '', '', '', '" + eid + "', '', '', 0, '"
                            + author
                            + "')";
                        DBConn.RunInsertQuery(query);
                    }
                }
                Response.Write("성공적으로 등록되었습니다.");
            }
            catch (Exception)
            {
                Response.Write("등록하는 동안 알지 못할 오류가 발생했습니다.");
            }
        }
    }
}
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
    public partial class modifyContent : Common.PageBase
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

            try
            {
                string query = "update content set type='" + etype + "', etitle='" + etitle + "', regdate='" + strCurDate + "', econtent='" + content + "', esummary='" + esummary + "', author='" + author + "' where id=" + id;
                DBConn.RunUpdateQuery(query);
                Response.Write("성공적으로 수정되었습니다.");
            }
            catch (Exception)
            {
                Response.Write("수정하는 동안 알지 못할 오류가 발생했습니다.");
            }
        }
    }
}

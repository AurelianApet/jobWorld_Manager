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
    public partial class setEcontentAPI : Common.PageBase
    {
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

            if (string.IsNullOrEmpty(Request.Params["title"]))
            {
                return;
            }
            string title = Request.Params["title"];

            if (string.IsNullOrEmpty(Request.Params["content"]))
            {
                return;
            }
            string content = Request.Params["content"];

            if (string.IsNullOrEmpty(Request.Params["summary"]))
            {
                return;
            }
            string summary = Request.Params["summary"];

            if (string.IsNullOrEmpty(Request.Params["imagepath"]))
            {
                return;
            }

            title = title.Replace("'", "''");
            content = content.Replace("'", "''");
            summary = summary.Replace("'", "''");

            string imagepath = Request.Params["imagepath"];

            string query = "insert into content values('" + id + "', '" + type + "', '" + title + "', '" + content + "', '" + summary + "', '" + imagepath + "', '', '"
                + strCurDate
                + "', '', '', '', '', '', '', '" + id + "', '', '', 0, '')";
            DBConn.RunInsertQuery(query);

        }
    }
}
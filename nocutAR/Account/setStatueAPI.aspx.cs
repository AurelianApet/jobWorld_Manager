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

namespace jobworld.Account
{
    public partial class setStatueAPI : Common.PageBase
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
            string query = "select * from news_setting where id='" + id + "'";
            PageDataSource = DBConn.RunSelectQuery(query);
            int count = PageDataSource.Tables[0].Rows.Count;
            string statue = "";
            if(count > 0)
            {
                statue = PageDataSource.Tables[0].Rows[0][6].ToString();
            }
            Response.Write(statue);
        }
    }
}
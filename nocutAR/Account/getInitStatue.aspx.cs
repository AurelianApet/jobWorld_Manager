using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Text;
using System.Data;
using jobworld.Common;
using System.Net;


namespace jobworld.Account
{
    public partial class getInitStatue : Common.PageBase
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            string query = "select max(statue) from news_setting";
            PageDataSource = DBConn.RunSelectQuery(query);
            int count = PageDataSource.Tables[0].Rows.Count;
            if (count > 0)
            {
                Response.Write(PageDataSource.Tables[0].Rows[0][0].ToString());
            }
            else
            {
                Response.Write("");
            }
        }

        protected override void Page_Init(object sender, EventArgs e)
        {

        }
    }
}
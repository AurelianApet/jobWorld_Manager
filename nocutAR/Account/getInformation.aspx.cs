using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Net;
using jobworld.Common;

namespace jobworld.Account
{
    public partial class getInformation : Common.PageBase
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(Request.Params["id"]))
            {
                return;
            }
            if (string.IsNullOrEmpty(Request.Params["type"]))
            {
                return;
            }
            string id = Request.Params["id"];
            string type = Request.Params["type"];
            string str = "";
            PageDataSource = DBConn.RunSelectQuery("select * from news_setting where id=" + id);
            if(PageDataSource.Tables[0].Rows.Count > 0)
            {
                if(type == "0")
                {
                    string collector = PageDataSource.Tables[0].Rows[0][2].ToString();
                    string email = PageDataSource.Tables[0].Rows[0][8].ToString();
                    str = collector + "," + email;
                }
                else if(type == "1")
                {
                    string editor = PageDataSource.Tables[0].Rows[0][3].ToString();
                    string email = PageDataSource.Tables[0].Rows[0][11].ToString();
                    str = editor + "," + email;
                }
            }
            Response.Write(str);
        }
    }
}
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
    public partial class getInitStatueAPI : Common.PageBase
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

            if (string.IsNullOrEmpty(Request.Params["value"]))
            {
                return;
            }
            string value = Request.Params["value"];

            if(type == "0")
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
            }
            else if(type == "1")
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
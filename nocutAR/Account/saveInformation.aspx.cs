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
    public partial class saveInformation : Common.PageBase
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.Params["id"]))
            {
                return;
            }
            if (string.IsNullOrEmpty(Request.Params["type"]))
            {
                return;
            }
            string id = Request.Params["id"];
            string type = Request.Params["type"];

            string editor = Request.Params["editor"];
            string email = Request.Params["email"];
            if(type == "0")
            {
                string query = "update news_setting set collector = '" + editor + "', c_email = '" + email + "' where id=" + id;
                try
                {
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
                string query = "update news_setting set editor = '" + editor + "', e_email = '" + email + "' where id=" + id;
                try
                {
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
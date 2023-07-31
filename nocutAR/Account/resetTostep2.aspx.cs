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
    public partial class resetTostep2 : Common.PageBase
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(Request.Params["type"]))
            {
                return;
            }
            string type = Request.Params["type"];
            if(type == "0")
            {
                if (string.IsNullOrEmpty(Request.Params["id"]))
                {
                    return;
                }
                string id = Request.Params["id"];
                string query = "update news_setting set c_statue=1 where id=" + id;
                try
                {
                    DBConn.RunUpdateQuery(query);
                    Response.Write("success");
                }
                catch (Exception)
                {

                }
            }
            else if(type == "1")
            {
                if (string.IsNullOrEmpty(Request.Params["id"]))
                {
                    return;
                }
                string id = Request.Params["id"];
                string query = "update news_setting set e_statue=1 where id=" + id;
                try
                {
                    DBConn.RunUpdateQuery(query);
                    Response.Write("success");
                }
                catch (Exception)
                {

                }
            }
        }
    }
}
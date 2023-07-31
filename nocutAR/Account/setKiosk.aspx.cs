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
    public partial class setKiosk : Common.PageBase
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.Params["ids"]))
            {
                return;
            }
            if (string.IsNullOrEmpty(Request.Params["type"]))
            {
                return;
            }
            string ids = Request.Params["ids"];
            string[] id = ids.Split(',');
            string type = Request.Params["type"];

            if(type == "0")
            {
                for(int i = 0; i < id.Length - 1; i ++)
                {
                    try
                    {
                        string query = "update completeArticles set kiosk=0 where id=" + id[i];
                        DBConn.RunUpdateQuery(query);
                        query = "insert into kiosk_log values('0')";
                        DBConn.RunInsertQuery(query);
                    }
                    catch (Exception)
                    {
                        Response.Write("fail");
                    }
                }
                Response.Write("success");
            }
            else if(type == "1")
            {
                for (int i = 0; i < id.Length - 1; i++)
                {
                    try
                    {
                        string query = "update completeArticles set kiosk=1 where id=" + id[i];
                        DBConn.RunUpdateQuery(query);
                        query = "insert into kiosk_log values('1')";
                        DBConn.RunInsertQuery(query);
                    }
                    catch (Exception)
                    {
                        Response.Write("fail");
                    }
                }
                Response.Write("success");
            }

        }
    }
}
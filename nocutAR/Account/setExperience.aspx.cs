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
    public partial class setExperience : Common.PageBase
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.Params["type"]))
            {
                return;
            }
            if (string.IsNullOrEmpty(Request.Params["no"]))
            {
                return;
            }
            string type = Request.Params["type"];
            int no = Convert.ToInt32(Request.Params["no"]) + 1;

            string data = "";
            if (!string.IsNullOrEmpty(Request.Params["data"]))
            {
                data = Request.Params["data"];
            }

            try
            {
                if (type == "0")
                {
                    string query = "update news_setting set collector = '" + data + "' where id='" + Convert.ToString(no) + "'";
                    DBConn.RunUpdateQuery(query);
                }
                else if (type == "1")
                {
                    string query = "update news_setting set editor = '" + data + "' where id='" + Convert.ToString(no) + "'";
                    DBConn.RunUpdateQuery(query);
                }
                else if (type == "2")
                {
                    string query = "update news_setting set company = '" + data + "' where id='" + Convert.ToString(no) + "'";
                    DBConn.RunUpdateQuery(query);
                }
                Response.Write("success");
            }
            catch(Exception)
            {
                Response.Write("fail");
            }
        }

        protected override void Page_Init(object sender, EventArgs e)
        {

        }
    }
}
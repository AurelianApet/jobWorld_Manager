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
    public partial class setLoginInformation : Common.PageBase
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
            if (string.IsNullOrEmpty(Request.Params["type"]))
            {
                return;
            }
            string id = Request.Params["id"];
            string type = Request.Params["type"];

            if(type == "0")
            {
                if (string.IsNullOrEmpty(Request.Params["name"]))
                {
                    return;
                }
                string name = Request.Params["name"];

                if (string.IsNullOrEmpty(Request.Params["place"]))
                {
                    return;
                }
                string place = Request.Params["place"];

                if (string.IsNullOrEmpty(Request.Params["email"]))
                {
                    return;
                }
                string email = Request.Params["email"];

                string query = "update news_setting set collector='" + name + "', c_place='" + place + "', c_email='" + email + "', c_statue='1' where id='" + id + "'";
                DBConn.RunUpdateQuery(query);
/*
                query = "select * from news_setting where id='" + id + "'";
                PageDataSource = DBConn.RunSelectQuery(query);
                string e_statue = PageDataSource.Tables[0].Rows[0][5].ToString();
                if(e_statue == "1")
                {
                    query = "update news_setting set statue=1 where id='" + id + "'";
                    DBConn.RunUpdateQuery(query);
                }
*/
            }
            else if(type == "1")
            {
                if (string.IsNullOrEmpty(Request.Params["name"]))
                {
                    return;
                }
                string name = Request.Params["name"];

                if (string.IsNullOrEmpty(Request.Params["news_type"]))
                {
                    return;
                }
                string news_type = Request.Params["news_type"];

                if (string.IsNullOrEmpty(Request.Params["news_name"]))
                {
                    return;
                }
                string news_name = Request.Params["news_name"];

                if (string.IsNullOrEmpty(Request.Params["email"]))
                {
                    return;
                }
                string email = Request.Params["email"];

                string query = "update news_setting set editor='" + name + "', news_type='" + news_type + "', news_name='" + news_name + "', e_email='" + email + "', e_statue='1' where id='" + id + "'";
                DBConn.RunUpdateQuery(query);

/*
                query = "select * from news_setting where id='" + id + "'";
                PageDataSource = DBConn.RunSelectQuery(query);
                string c_statue = PageDataSource.Tables[0].Rows[0][4].ToString();
                if(c_statue == "1")
                {
                    query = "update news_setting set statue=1 where id='" + id + "'";
                    DBConn.RunUpdateQuery(query);
                }
*/
            }
        }
    }
}
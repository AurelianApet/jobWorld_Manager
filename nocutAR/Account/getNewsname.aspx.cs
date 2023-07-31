using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

namespace jobworld.Account
{
    public partial class getNewsname : Common.PageBase
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(Request.Params["type"]))
            {
                return;
            }
            string type = Request.Params["type"];
            StringBuilder responseXml = new StringBuilder();
            if (type == "0")
            {
                string query = "select * from news";
                responseXml.Append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
                try
                {
                    PageDataSource = DBConn.RunSelectQuery(query);
                    responseXml.Append("<content>");
                    if (PageDataSource.Tables[0].Rows.Count > 0)
                    {
                        for(int i = 0; i < PageDataSource.Tables[0].Rows.Count; i ++)
                        {
                            string name = PageDataSource.Tables[0].Rows[i][1].ToString();
                            string link = PageDataSource.Tables[0].Rows[i][2].ToString();
                            responseXml.Append("<name>");
                            responseXml.Append(name);
                            responseXml.Append("</name>");
                            responseXml.Append("<link>");
                            responseXml.Append(link);
                            responseXml.Append("</link>");
                        }
                    }
                    responseXml.Append("</content>");
                    Response.Write(responseXml.ToString());
                }
                catch (Exception)
                {

                }
            }
            else if(type == "1")
            {
                for(int i = 0; i < 8; i ++)
                {
                    string name = Request.Params["name" + i];
                    string link = Request.Params["link" + i];
                    string query = "update news set name='" + name + "', link='" + link + "' where id=" + Convert.ToString(i + 1);
                    try
                    {
                        DBConn.RunUpdateQuery(query);
                    }
                    catch(Exception)
                    {

                    }
                }
            }
        }
    }
}
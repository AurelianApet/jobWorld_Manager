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
    public partial class getContent : Common.PageBase
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.Params["id"]))
            {
                return;
            }
            string id = Request.Params["id"];

            StringBuilder responseXml = new StringBuilder();
            try
            {
                responseXml.Append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
                string query = "select * from content where id='" + id + "'";
                PageDataSource = DBConn.RunSelectQuery(query);
                int count = PageDataSource.Tables[0].Rows.Count;
                string type;
                string title;
                string econtent;
                string summary;
                string imagepath;
                if (count > 0)
                {
                    responseXml.Append("<content>");
                    responseXml.Append("<type>");
                    type = PageDataSource.Tables[0].Rows[0][2].ToString();
                    responseXml.Append(type);
                    responseXml.Append("</type>");
                    responseXml.Append("<title>");
                    title = PageDataSource.Tables[0].Rows[0][3].ToString();
                    responseXml.Append(title);
                    responseXml.Append("</title>");
                    responseXml.Append("<econtent>");
                    econtent = PageDataSource.Tables[0].Rows[0][4].ToString();
                    responseXml.Append(econtent.Replace("\r\n", "\\r\\n"));
                    responseXml.Append("</econtent>");
                    responseXml.Append("<summary>");
                    summary = PageDataSource.Tables[0].Rows[0][5].ToString();
                    responseXml.Append(summary.Replace("\r\n", "\\r\\n"));
                    responseXml.Append("</summary>");
                    responseXml.Append("<imagepath>");
                    imagepath = PageDataSource.Tables[0].Rows[0][6].ToString();
                    responseXml.Append(imagepath);
                    responseXml.Append("</imagepath>");
                    responseXml.Append("<author>");
                    imagepath = PageDataSource.Tables[0].Rows[0][19].ToString();
                    responseXml.Append(imagepath);
                    responseXml.Append("</author>");
                    responseXml.Append("</content>");
                }
                Response.Write(responseXml.ToString());
            }
            catch (Exception)
            {

            }
        }
    }
}
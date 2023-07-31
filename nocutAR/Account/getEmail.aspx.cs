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
    public partial class getEmail : Common.PageBase
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(Request.Params["id"]))
            {
                return;
            }
            string id = Request.Params["id"];

            string emails = "";
            try
            {
                string query = "select * from news_setting where id=" + id;
                PageDataSource = DBConn.RunSelectQuery(query);
                int count = PageDataSource.Tables[0].Rows.Count;
                if (count > 0)
                {
                    emails = PageDataSource.Tables[0].Rows[0][8].ToString() + "," + PageDataSource.Tables[0].Rows[0][11].ToString();
                }
            }
            catch (Exception)
            {

            }
            Response.Write(emails);
        }
    }
}
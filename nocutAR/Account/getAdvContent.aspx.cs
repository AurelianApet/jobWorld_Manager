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
    public partial class getAdvContent : Common.PageBase
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.Params["id"]))
            {
                return;
            }
            string id = Request.Params["id"];

            try
            {
                string query = "select * from advertisement where id='" + id + "'";
                PageDataSource = DBConn.RunSelectQuery(query);
                int count = PageDataSource.Tables[0].Rows.Count;
                string imagepath;
                string type;
                if (count > 0)
                {
                    imagepath = PageDataSource.Tables[0].Rows[0][2].ToString();
                    type = PageDataSource.Tables[0].Rows[0][1].ToString();
                    Response.Write(imagepath + "," + type);
                }
            }
            catch (Exception)
            {

            }
        }
    }
}
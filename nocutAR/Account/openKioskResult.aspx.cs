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
    public partial class openKioskResult : Common.PageBase
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.Params["id"]))
            {
                return;
            }
            string id = Request.Params["id"];
            PageDataSource = DBConn.RunSelectQuery("select * from completeArticles where id=" + id);
            if(PageDataSource.Tables[0].Rows.Count > 0)
            {
                string path = conPath + PageDataSource.Tables[0].Rows[0][2].ToString();
                try
                {
                    System.Diagnostics.Process.Start(path);
                    Response.Write("");
                }
                catch(Exception ex)
                {
                    Response.Write(ex);
                }
            }
        }
    }
}
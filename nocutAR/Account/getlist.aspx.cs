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
    public partial class getlist : Common.PageBase
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            string list = "";

            try
            {
                string query = "select * from content";
                PageDataSource = DBConn.RunSelectQuery(query);
                int count = PageDataSource.Tables[0].Rows.Count;
                if (count > 0)
                {
                    for(int i = 0; i < count; i ++)
                    {
                        list += PageDataSource.Tables[0].Rows[i][0].ToString() + ",";
                    }
                }
            }
            catch (Exception)
            {

            }
            Response.Write(list);
        }
    }
}
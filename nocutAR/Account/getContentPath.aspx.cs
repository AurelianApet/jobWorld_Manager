﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Net;
using jobworld.Common;
using System.IO;

namespace jobworld.Account
{
    public partial class getContentPath : Common.PageBase
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.Params["id"]))
                return;
            string id = Request.Params["id"];

            PageDataSource = DBConn.RunSelectQuery("select savePath from news_setting where id=" + id);
            if(PageDataSource.Tables[0].Rows.Count > 0)
            {
                string savepath = PageDataSource.Tables[0].Rows[0][0].ToString();
                if(savepath != "")
                {
                    Response.Write(fileContentPath + savepath);
                }
            }
        }
    }
}
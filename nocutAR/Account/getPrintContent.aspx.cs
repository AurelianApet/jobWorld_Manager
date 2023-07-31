using System;
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
    public partial class getPrintContent : Common.PageBase
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.Params["id"]))
                return;
            string id = Request.Params["id"];

            string saveImagePath = "";
            string savePath = "";
            try
            {
                PageDataSource = DBConn.RunSelectQuery("select * from news_setting where id=" + id);
                saveImagePath = PageDataSource.Tables[0].Rows[0][13].ToString();
                savePath = PageDataSource.Tables[0].Rows[0][12].ToString();
            }
            catch (Exception)
            {

            }
            saveImagePath = imagePath + saveImagePath;
            savePath = conPath + savePath;

//            Response.Write(saveImagePath);

            if (savePath.IndexOf(".pdf") > -1)
            {
                try
                {
                    savePath = savePath.Replace(".pdf", "_print.html");
                }
                catch (Exception)
                {

                }
            }
            else
            {
                try
                {
                    savePath = savePath.Replace(".html", "_print.html");
                }
                catch (Exception)
                {

                }
            }

//            string Printcontent = "";
            try
            {
//                Printcontent = File.ReadAllText(savePath);
            }
            catch (Exception)
            {

            }
            Response.Write(savePath);
        }
    }
}
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
    public partial class setPrevStatue : Common.PageBase
    {
        protected override void Page_Init(object sender, EventArgs e)
        {

        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.Params["step"]))
            {
                return;
            }
            string step = Request.Params["step"];

            try
            {
                if (step == "1")
                {
                    try
                    {
                        string query = "update news_setting set statue = 0, c_statue = 0, e_statue = 0, company='신문사명', collector='체험자', editor='체험자', c_email='', e_email='', c_place='', savePath='', saveImagePath=''";
                        DBConn.RunUpdateQuery(query);
                    }
                    catch(Exception)
                    {
                        Response.Write("fail");
                    }
                }
                else if (step == "2")
                {
                    try
                    {
                        string query = "update news_setting set statue = 1, c_statue=0,e_statue=0 where statue=2";
                        DBConn.RunUpdateQuery(query);
                    }
                    catch (Exception)
                    {
                        Response.Write("fail");
                    }
                }
                else if (step == "3")
                {
                    try
                    {
                        string query = "update news_setting set statue = 2, c_statue=1, e_statue=1 where statue=3";
                        DBConn.RunUpdateQuery(query);
                    }
                    catch (Exception)
                    {
                        Response.Write("fail");
                    }
                }
                Response.Write("success");
            }
            catch(Exception)
            {
                Response.Write("fail");
            }
        }
    }
}
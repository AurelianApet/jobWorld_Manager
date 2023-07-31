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
    public partial class setStatue : Common.PageBase
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
                if (step == "0")
                {
                    try
                    {
                        string query = "update news_setting set statue = '1'";
                        DBConn.RunUpdateQuery(query);
                    }
                    catch(Exception)
                    {
                        Response.Write("fail");
                    }
                }
                else if (step == "1")
                {
                    try
                    {
                        string query = "update news_setting set statue = '2' where c_statue=1 and e_statue=1";
                        DBConn.RunUpdateQuery(query);
                    }
                    catch (Exception)
                    {
                        Response.Write("fail");
                    }
                }
                else if (step == "2")
                {
                    try
                    {
                        string query = "update news_setting set statue = '3' where c_statue=2 and e_statue=2";
                        DBConn.RunUpdateQuery(query);
                    }
                    catch (Exception)
                    {
                        Response.Write("fail");
                    }
                }
                else if(step == "3")
                {
                    try
                    {
                        string query = "select * from news_setting where statue=3";
                        PageDataSource = DBConn.RunSelectQuery(query);
                        if(PageDataSource.Tables[0].Rows.Count > 0)
                        {
                            for(int i = 0; i < PageDataSource.Tables[0].Rows.Count; i ++)
                            {
                                int id = Convert.ToInt32(PageDataSource.Tables[0].Rows[0][0].ToString());
                            }
                        }

                        query = "update news_setting set contentid=0";
                        DBConn.RunUpdateQuery(query);

                        query = "update news_setting set statue = '0'";
                        DBConn.RunUpdateQuery(query);
                        query = "update news_setting set c_statue = '0'";
                        DBConn.RunUpdateQuery(query);
                        query = "update news_setting set e_statue = '0'";
                        DBConn.RunUpdateQuery(query);
                        for (int i = 1; i <= 6; i++)
                        {
                            string com = "신문사명" + Convert.ToString(i);
                            query = "update news_setting set company = '" + com + "' where id = '" + Convert.ToString(i) + "'";
                            DBConn.RunUpdateQuery(query);

                            string col = "체험자" + Convert.ToString(2 * i - 1);
                            query = "update news_setting set collector = '" + col + "' where id = '" + Convert.ToString(i) + "'";
                            DBConn.RunUpdateQuery(query);

                            string edi = "체험자" + Convert.ToString(2 * i);
                            query = "update news_setting set editor = '" + edi + "' where id = '" + Convert.ToString(i) + "'";
                            DBConn.RunUpdateQuery(query);
                        }

                        query = "select number from news_setting";
                        int number = Convert.ToInt32(DBConn.RunSelectQuery(query).Tables[0].Rows[0][0]);
                        query = "update news_setting set number = '" + (number + 1) + "' where number = '" + number + "'";
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
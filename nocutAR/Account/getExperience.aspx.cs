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
    public partial class getExperience : Common.PageBase
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.Params["step"]))
            {
                return;
            }
            if (string.IsNullOrEmpty(Request.Params["type"]))
            {
                return;
            }
            string step = Request.Params["step"];
            string type = Request.Params["type"];

            StringBuilder responseXml = new StringBuilder();

            try
            {
                if (step == "1")
                {
                    if (type == "1")
                    {
                        responseXml.Append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
                        string query = "select * from news_setting where c_statue='1' order by id asc";
                        PageDataSource = DBConn.RunSelectQuery(query);
                        int count = PageDataSource.Tables[0].Rows.Count;
                        string cid;
                        string collector;
                        string email;
                        if (count > 0)
                        {
                            responseXml.Append("<collector>");
                            for (int i = 0; i < count; i++)
                            {
                                cid = PageDataSource.Tables[0].Rows[i][0].ToString();
                                collector = PageDataSource.Tables[0].Rows[i][2].ToString();
                                responseXml.Append("<id>");
                                responseXml.Append(cid);
                                responseXml.Append("</id>");
                                responseXml.Append("<content>");
                                responseXml.Append(collector);
                                responseXml.Append("</content>");
                                email = PageDataSource.Tables[0].Rows[i][8].ToString();
                                responseXml.Append("<email>");
                                responseXml.Append(email);
                                responseXml.Append("</email>");
                            }
                            responseXml.Append("</collector>");
                        }

                    }
                    else if (type == "2")
                    {
                        responseXml.Append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
                        string query = "select * from news_setting where e_statue='1' order by id asc";
                        PageDataSource = DBConn.RunSelectQuery(query);
                        int count = PageDataSource.Tables[0].Rows.Count;
                        string eid;
                        string editor;
                        string email;
                        if (count > 0)
                        {
                            responseXml.Append("<editor>");
                            for (int i = 0; i < count; i++)
                            {
                                eid = PageDataSource.Tables[0].Rows[i][0].ToString();
                                editor = PageDataSource.Tables[0].Rows[i][3].ToString();
                                responseXml.Append("<id>");
                                responseXml.Append(eid);
                                responseXml.Append("</id>");

                                responseXml.Append("<content>");
                                responseXml.Append(editor);
                                responseXml.Append("</content>");

                                email = PageDataSource.Tables[0].Rows[i][11].ToString();
                                responseXml.Append("<email>");
                                responseXml.Append(email);
                                responseXml.Append("</email>");
                            }
                            responseXml.Append("</editor>");
                        }
                    }
                    else if (type == "3")
                    {
                        responseXml.Append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
                        string query = "select * from news_setting where e_statue='1' order by id asc";
                        PageDataSource = DBConn.RunSelectQuery(query);
                        int count = PageDataSource.Tables[0].Rows.Count;
                        string Cid;
                        string Company;
                        if (count > 0)
                        {
                            responseXml.Append("<company>");
                            for (int i = 0; i < count; i++)
                            {
                                Cid = PageDataSource.Tables[0].Rows[i][0].ToString();
                                Company = PageDataSource.Tables[0].Rows[i][1].ToString();
                                responseXml.Append("<id>");
                                responseXml.Append(Cid);
                                responseXml.Append("</id>");
                                string place = PageDataSource.Tables[0].Rows[i][7].ToString();
                                responseXml.Append("<place>");
                                responseXml.Append(place);
                                responseXml.Append("</place>");
                                string newsType = PageDataSource.Tables[0].Rows[i][9].ToString();
                                responseXml.Append("<newsType>");
                                responseXml.Append(newsType);
                                responseXml.Append("</newsType>");
                                responseXml.Append("<content>");
                                responseXml.Append(Company);
                                responseXml.Append("</content>");
                            }
                            responseXml.Append("</company>");
                        }
                    }
                }
                else if (step == "2")
                {
                    if (type == "1")
                    {
                        responseXml.Append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
                        string query = "select * from news_setting where statue='2' order by id asc";
                        PageDataSource = DBConn.RunSelectQuery(query);
                        int count = PageDataSource.Tables[0].Rows.Count;
                        string cid;
                        string collector;
                        string email;
                        if (count > 0)
                        {
                            responseXml.Append("<collector>");
                            for (int i = 0; i < count; i++)
                            {
                                cid = PageDataSource.Tables[0].Rows[i][0].ToString();
                                collector = PageDataSource.Tables[0].Rows[i][2].ToString();
                                responseXml.Append("<id>");
                                responseXml.Append(cid);
                                responseXml.Append("</id>");
                                email = PageDataSource.Tables[0].Rows[i][8].ToString();
                                responseXml.Append("<email>");
                                responseXml.Append(email);
                                responseXml.Append("</email>");
                                responseXml.Append("<content>");
                                responseXml.Append(collector);
                                responseXml.Append("</content>");
                            }
                            query = "select * from news_setting where c_statue='2' order by id asc";
                            DataSet dataset = DBConn.RunSelectQuery(query);
                            int count1 = dataset.Tables[0].Rows.Count;
                            string cid1;
//                            string collector1;
                            if(count1 > 0)
                            {
                                for(int i = 0; i < count1; i ++)
                                {
                                    cid1 = dataset.Tables[0].Rows[i][0].ToString();
  //                                  collector1 = dataset.Tables[0].Rows[i][2].ToString();
                                    responseXml.Append("<id1>");
                                    responseXml.Append(cid1);
                                    responseXml.Append("</id1>");
//                                    responseXml.Append("<content1>");
//                                    responseXml.Append(collector1);
//                                    responseXml.Append("</content1>");
                                }
                            }
                            responseXml.Append("</collector>");
                        }
                    }
                    else if (type == "2")
                    {
                        responseXml.Append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
                        string query = "select * from news_setting where statue='2' order by id asc";
                        PageDataSource = DBConn.RunSelectQuery(query);
                        int count = PageDataSource.Tables[0].Rows.Count;
                        string eid;
                        string editor;
                        string email;
                        if (count > 0)
                        {
                            responseXml.Append("<editor>");
                            for (int i = 0; i < count; i++)
                            {
                                eid = PageDataSource.Tables[0].Rows[i][0].ToString();
                                editor = PageDataSource.Tables[0].Rows[i][3].ToString();
                                responseXml.Append("<id>");
                                responseXml.Append(eid);
                                responseXml.Append("</id>");
                                responseXml.Append("<content>");
                                responseXml.Append(editor);
                                responseXml.Append("</content>");
                                email = PageDataSource.Tables[0].Rows[i][11].ToString();
                                responseXml.Append("<email>");
                                responseXml.Append(email);
                                responseXml.Append("</email>");
                            }
                            query = "select * from news_setting where e_statue='2' order by id asc";
                            DataSet dataset = DBConn.RunSelectQuery(query);
                            int count1 = dataset.Tables[0].Rows.Count;
                            string eid1;
//                            string editor1;
                            if (count1 > 0)
                            {
                                for (int i = 0; i < count1; i++)
                                {
                                    eid1 = dataset.Tables[0].Rows[i][0].ToString();
//                                    editor1= dataset.Tables[0].Rows[i][3].ToString();
                                    responseXml.Append("<id1>");
                                    responseXml.Append(eid1);
                                    responseXml.Append("</id1>");
//                                    responseXml.Append("<content1>");
  //                                  responseXml.Append(editor1);
    //                                responseXml.Append("</content1>");
                                }
                            }
                            responseXml.Append("</editor>");
                        }
                    }
                    else if (type == "3")
                    {
                        responseXml.Append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
                        string query = "select * from news_setting where statue='2' order by id asc";
                        PageDataSource = DBConn.RunSelectQuery(query);
                        int count = PageDataSource.Tables[0].Rows.Count;
                        string Cid;
                        string Company;
                        if (count > 0)
                        {
                            responseXml.Append("<company>");
                            for (int i = 0; i < count; i++)
                            {
                                Cid = PageDataSource.Tables[0].Rows[i][0].ToString();
                                Company = PageDataSource.Tables[0].Rows[i][1].ToString();
                                responseXml.Append("<id>");
                                responseXml.Append(Cid);
                                responseXml.Append("</id>");
                                string place = PageDataSource.Tables[0].Rows[i][7].ToString();
                                responseXml.Append("<place>");
                                responseXml.Append(place);
                                responseXml.Append("</place>");
                                string newsType = PageDataSource.Tables[0].Rows[i][9].ToString();
                                responseXml.Append("<newsType>");
                                responseXml.Append(newsType);
                                responseXml.Append("</newsType>");
                                responseXml.Append("<content>");
                                responseXml.Append(Company);
                                responseXml.Append("</content>");
                            }
                            responseXml.Append("</company>");
                        }
                    }
                }
                else if(step == "3")
                {
                    if (type == "1")
                    {
                        responseXml.Append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
                        string query = "select * from news_setting where c_statue='3' order by id asc";
                        PageDataSource = DBConn.RunSelectQuery(query);
                        int count = PageDataSource.Tables[0].Rows.Count;
                        string cid;
                        string collector;
                        string email;
                        if (count > 0)
                        {
                            responseXml.Append("<collector>");
                            for (int i = 0; i < count; i++)
                            {
                                cid = PageDataSource.Tables[0].Rows[i][0].ToString();
                                collector = PageDataSource.Tables[0].Rows[i][2].ToString();
                                responseXml.Append("<id>");
                                responseXml.Append(cid);
                                responseXml.Append("</id>");
                                email = PageDataSource.Tables[0].Rows[i][8].ToString();
                                responseXml.Append("<email>");
                                responseXml.Append(email);
                                responseXml.Append("</email>");
                                responseXml.Append("<content>");
                                responseXml.Append(collector);
                                responseXml.Append("</content>");
                            }
                            responseXml.Append("</collector>");
                        }
                    }
                    else if (type == "2")
                    {
                        responseXml.Append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
                        string query = "select * from news_setting where e_statue='3' order by id asc";
                        PageDataSource = DBConn.RunSelectQuery(query);
                        int count = PageDataSource.Tables[0].Rows.Count;
                        string eid;
                        string editor;
                        string email;
                        if (count > 0)
                        {
                            responseXml.Append("<editor>");
                            for (int i = 0; i < count; i++)
                            {
                                eid = PageDataSource.Tables[0].Rows[i][0].ToString();
                                editor = PageDataSource.Tables[0].Rows[i][3].ToString();
                                responseXml.Append("<id>");
                                responseXml.Append(eid);
                                responseXml.Append("</id>");
                                responseXml.Append("<content>");
                                responseXml.Append(editor);
                                responseXml.Append("</content>");
                                email = PageDataSource.Tables[0].Rows[i][11].ToString();
                                responseXml.Append("<email>");
                                responseXml.Append(email);
                                responseXml.Append("</email>");
                            }
                            responseXml.Append("</editor>");
                        }
                    }
                    else if (type == "3")
                    {
                        responseXml.Append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
                        string query = "select * from news_setting where statue='2' order by id asc";
                        PageDataSource = DBConn.RunSelectQuery(query);
                        int count = PageDataSource.Tables[0].Rows.Count;
                        string Cid;
                        string Company;
                        if (count > 0)
                        {
                            responseXml.Append("<company>");
                            for (int i = 0; i < count; i++)
                            {
                                Cid = PageDataSource.Tables[0].Rows[i][0].ToString();
                                Company = PageDataSource.Tables[0].Rows[i][1].ToString();
                                responseXml.Append("<id>");
                                responseXml.Append(Cid);
                                responseXml.Append("</id>");
                                string place = PageDataSource.Tables[0].Rows[i][7].ToString();
                                responseXml.Append("<place>");
                                responseXml.Append(place);
                                responseXml.Append("</place>");
                                string newsType = PageDataSource.Tables[0].Rows[i][9].ToString();
                                responseXml.Append("<newsType>");
                                responseXml.Append(newsType);
                                responseXml.Append("</newsType>");
                                responseXml.Append("<content>");
                                responseXml.Append(Company);
                                responseXml.Append("</content>");
                            }
                            responseXml.Append("</company>");
                        }
                    }
                }
                Response.Write(responseXml.ToString());
            }
            catch(Exception)
            {
            }
        }

        protected override void Page_Init(object sender, EventArgs e)
        {

        }
    }
}
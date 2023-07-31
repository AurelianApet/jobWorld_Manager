using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Text;
using System.Data;
using System.IO;

namespace jobworld.Account
{
    public partial class kiosk : Common.PageBase
    {
        private bool flag = false;
        private void KPageLoad(DataSet kdataset, int cur_kpage)
        {
            int kiosk_page = 0;
            showKioskList.Text = "";
            PageDataSource = kdataset;
            string ids = "";
            if (PageDataSource.Tables[0].Rows.Count > 0)
            {
                kiosk_page = Convert.ToInt32(Math.Ceiling(PageDataSource.Tables[0].Rows.Count / 6.0));
                for (int i = (cur_kpage - 1) * 6; i < cur_kpage * 6; i++)
                {
                    if (i >= PageDataSource.Tables[0].Rows.Count)
                        break;
                    int id = Convert.ToInt32(PageDataSource.Tables[0].Rows[i][0].ToString());
                    int eid = Convert.ToInt32(PageDataSource.Tables[0].Rows[i][1].ToString());
                    string cname = "";
                    string ename = "";
                    string newsname = "";

                    string filename = PageDataSource.Tables[0].Rows[i][2].ToString();
                    string realContentPath = conPath;

                    ids += id + ",";

                    filename = realContentPath + filename.Replace(@"\", @"/");

                    newsname = PageDataSource.Tables[0].Rows[i][5].ToString();
                    ename = PageDataSource.Tables[0].Rows[i][6].ToString();
                    cname = PageDataSource.Tables[0].Rows[i][7].ToString();


                    if (newsname.Length > 6)
                    {
                        newsname = newsname.Substring(0, 6);
                    }
                    if (ename.Length > 6)
                    {
                        ename = ename.Substring(0, 6);
                    }
                    if (cname.Length > 6)
                    {
                        cname = cname.Substring(0, 6);
                    }

                    showKioskList.Text += "<tr><td><input id='"
                        + "kiosk_option" + id
                        + "' type = 'checkbox' onclick='setKiosk("
                        + id
                        + ")' /></td>"
                        + "<td>"
                        + Convert.ToString(i + 1)
                        + "</td><td>"
                        + newsname
                        + "</td><td>"
                        + PageDataSource.Tables[0].Rows[i][4].ToString()
                        + "</td><td>"
                        + cname
                        + "</td><td>"
                        + ename
                        + "</td>"
                        + "<td><span class='btn_agry3'><a style='cursor:pointer' onclick='window.open(\""
                        + filename
                        + "\", \"_blank\", \"toolbar=yes,scrollbars=yes,resizable=yes\")'>미리보기</a></span></td></tr>";
                    //                        + "<td><span onclick = 'showPreview("
                    //                        + id
                    //                        + ")' class='btn_agry3'><a style='cursor:pointer'>미리보기</a></span></td></tr>";
                    allkids.Value = ids;
                }
            }
            if (cur_kpage == 1)
            {
                showKioskListPage.Text = "<a class='on' onclick='KgotoFirstPage()' style='cursor:pointer;width:65px;'>첫페이지</a>";
            }
            else
            {
                showKioskListPage.Text = "<a onclick='KgotoFirstPage()' style='cursor:pointer;width:65px;'>첫페이지</a>";
            }
            if (cur_kpage - 1 >= 1)
            {
                showKioskListPage.Text += "<span class='btn_prev'>"
                    + "<a onclick = 'AGoPrevPage("
                    + cur_kpage
                    + ")' style = 'cursor:pointer'>이전</a>"
                    + "</span>";
            }

            for (int pageno = Convert.ToInt32(Math.Floor((cur_kpage - 1) / 8.0) * 8 + 1); pageno <= Convert.ToInt32(Math.Floor((cur_kpage - 1) / 8.0) * 8 + 8); pageno++)
            {
//                if(pageno == )
                if (pageno == cur_kpage)
                {
                    showKioskListPage.Text += "<a class='on' onclick = 'kGotoPage("
                        + pageno
                        + ")' style = 'cursor:pointer' >"
                        + pageno
                        + "</a>";
                }
                else
                {
                    showKioskListPage.Text += "<a onclick = 'kGotoPage("
                        + pageno
                        + ")' style = 'cursor:pointer' >"
                        + pageno
                        + "</a>";
                }
            }
            if (cur_kpage + 1 <= kiosk_page)
            {
                showKioskListPage.Text += "<span class='btn_next'>"
                    + "<a onclick = 'kGoNextPage("
                    + cur_kpage
                    + ")' style = 'cursor:pointer'>이전</a>"
                    + "</span>";
            }

            if(cur_kpage == kiosk_page)
            {
                showKioskListPage.Text += "<a class='on' onclick='KgotoLastPage("
                    + kiosk_page
                    + ")' style='cursor:pointer;width:65px;'>끝페이지</a>";
            }
            else
            {
                showKioskListPage.Text += "<a onclick='KgotoLastPage("
                    + kiosk_page
                    + ")' style='cursor:pointer;width:65px;'>끝페이지</a>";
            }
        }

        private void APageLoad(DataSet adataset, int cur_allpage)
        {
            int all_page = 0;            
            showAllList.Text = "";
            PageDataSource = adataset;
            string ids = "";
            if (PageDataSource.Tables[0].Rows.Count > 0)
            {
                all_page = Convert.ToInt32(Math.Ceiling(PageDataSource.Tables[0].Rows.Count / 6.0));

                showAllList.Text += "";
                for (int i = (cur_allpage - 1) * 6; i < cur_allpage * 6; i++)
                {
                    if (i >= PageDataSource.Tables[0].Rows.Count)
                        break;

                    int id = Convert.ToInt32(PageDataSource.Tables[0].Rows[i][0].ToString());
                    int eid = Convert.ToInt32(PageDataSource.Tables[0].Rows[i][1].ToString());
                    string cname = "";
                    string ename = "";
                    string newsname = "";
                    newsname = PageDataSource.Tables[0].Rows[i][5].ToString();
                    ename = PageDataSource.Tables[0].Rows[i][6].ToString();
                    cname = PageDataSource.Tables[0].Rows[i][7].ToString();

                    string filename = PageDataSource.Tables[0].Rows[i][2].ToString();
                    string realContentPath = conPath;

                    ids += id + ",";

                    filename = realContentPath + filename.Replace(@"\", @"/");

                    if (newsname.Length > 6)
                    {
                        newsname = newsname.Substring(0, 6);
                    }
                    if (ename.Length > 6)
                    {
                        ename = ename.Substring(0, 6);
                    }
                    if (cname.Length > 6)
                    {
                        cname = cname.Substring(0, 6);
                    }

                    showAllList.Text += "<tr><td><input id='"
                        + "all_option" + id
                        + "' type = 'checkbox' onclick='setAll("
                        + id
                        + ")' /></td>"
                        + "<td>"
                        + Convert.ToString(i + 1)
                        + "</td><td>"
                        + newsname
                        + "</td><td>"
                        + PageDataSource.Tables[0].Rows[i][4].ToString()
                        + "</td><td>"
                        + cname
                        + "</td><td>"
                        + ename
                        + "</td>"
                        + "<td><span class='btn_agry3'><a style='cursor:pointer' onclick='window.open(\""
                        + filename
                        + "\", \"_blank\", \"toolbar=yes,scrollbars=yes,resizable=yes\")'>미리보기</a></span></td></tr>";
                    allaids.Value = ids;
                }
            }
            
            if(cur_allpage == 1)
            {
                showAllListPage.Text = "<a class='on' onclick='AgotoFirstPage()' style='cursor:pointer;width:65px;'>첫페이지</a>";
            }
            else
            {
                showAllListPage.Text = "<a onclick='AgotoFirstPage()' style='cursor:pointer;width:65px;'>첫페이지</a>";
            }
            if (cur_allpage - 1 >= 1)
            {
                showAllListPage.Text += "<span class='btn_prev'>"
                    + "<a onclick = 'AGoPrevPage("
                    + cur_allpage
                    + ")' style = 'cursor:pointer'>이전</a>"
                    + "</span>";
            }

            for (int pageno = Convert.ToInt32(Math.Floor((cur_allpage - 1) / 8.0) * 8 + 1); pageno <= Convert.ToInt32(Math.Floor((cur_allpage - 1) / 8.0) * 8 + 8); pageno++)
            {
                if (pageno == cur_allpage)
                {
                    showAllListPage.Text += "<a class='on' onclick = 'AGotoPage("
                        + pageno
                        + ")' style = 'cursor:pointer' >"
                        + pageno
                        + "</a>";
                }
                else
                {
                    showAllListPage.Text += "<a onclick = 'AGotoPage("
                        + pageno
                        + ")' style = 'cursor:pointer' >"
                        + pageno
                        + "</a>";
                }
            }
            if (cur_allpage + 1 <= all_page)
            {
                showAllListPage.Text += "<span class='btn_next'>"
                    + "<a onclick = 'AGoNextPage("
                    + cur_allpage
                    + ")' style = 'cursor:pointer'>다음</a>"
                    + "</span>";
            }
            if(cur_allpage == all_page)
            {
                showAllListPage.Text += "<a class='on' onclick='AgotoLastPage("
                    + all_page
                    + ")' style='cursor:pointer;width:65px;'>끝페이지</a>";
            }
            else
            {
                showAllListPage.Text += "<a onclick='AgotoLastPage("
                    + all_page
                    + ")' style='cursor:pointer;width:65px;'>끝페이지</a>";
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            int cur_kpage = 1;
            int cur_allpage = 1;

            if (!string.IsNullOrEmpty(Request.Params["kpageno"]))
            {
                cur_kpage = Convert.ToInt32(Request.Params["kpageno"]);
            }

            if (!string.IsNullOrEmpty(Request.Params["allpageno"]))
            {
                cur_allpage = Convert.ToInt32(Request.Params["allpageno"]);
            }

            string query = "select * from completeArticles";
            DataSet dataset = DBConn.RunSelectQuery(query);
            for(int i = 0; i < dataset.Tables[0].Rows.Count; i ++)
            {
                string id = dataset.Tables[0].Rows[i][0].ToString();
                string filename = dataset.Tables[0].Rows[i][2].ToString();
                if (!File.Exists(absPath + filename))
                {
                    query = "update completeArticles set exist=0 where id=" + id;
                    DBConn.RunUpdateQuery(query);
                    continue;
                }
            }

            query = "select * from completeArticles where type=0 and kiosk=1 and exist=1 order by regdate desc";
            DataSet dataset1 = DBConn.RunSelectQuery(query);
            query = "select * from completeArticles where type=0 and exist=1 order by regdate desc";
//            query = "select * from content where kiosk=0";
            DataSet dataset2 = DBConn.RunSelectQuery(query);
            KPageLoad(dataset1, cur_kpage);
            APageLoad(dataset2, cur_allpage);
        }

        protected void onKsearch(object sender, EventArgs e)
        {
            if(!flag)
            {
                flag = true;
                onAsearch(sender, e);
            }
            else
            {
                flag = false;
            }
            string startdate = kstartDate.Text;
            string enddate = kendDate.Text;
            string type = ktype.SelectedValue;
            string field = kfield.Text;
            string condition = "";
            int startindex = 0;
            if(startdate != "")
            {
                if(startindex == 2)
                {
                    condition += " and regdate > '" + startdate + "'";
                }
                else
                {
                    condition += "regdate > '" + startdate + "'";
                }
                startindex = 2;
            }
            if (enddate != "")
            {
                if (startindex == 2)
                {
                    condition += " and regdate < '" + enddate + "'";
                }
                else
                {
                    condition += "regdate < '" + enddate + "'";
                }
                startindex = 2;
            }
            if (field != "")
            {
                if (type == "신문명")
                {
                    string query = "select * from completeArticles where company like '%" + field + "%'";
                    if(condition != "")
                    {
                        query += " and " + condition;
                    }
                    PageDataSource = DBConn.RunSelectQuery(query);
                    if(startindex == 0)
                        startindex = 1;
                    if (PageDataSource.Tables[0].Rows.Count > 0)
                    {
                        for (int i = 0; i < PageDataSource.Tables[0].Rows.Count; i++)
                        {
                            int id = Convert.ToInt32(PageDataSource.Tables[0].Rows[i][0].ToString());
                            if (startindex == 2)
                                condition += " and id=" + id;
                            else if (startindex == 1)
                                condition += "id=" + id;
                            else if (startindex == 3)
                                condition += " or id=" + id;
                            startindex = 3;
                        }
                    }
                    else
                    {
                        if(startindex == 2)
                        {
                            condition += " and 1=0";
                        }
                        else if (startindex == 1)
                        {
                            condition += "1=0";
                        }
                    }
                }
                else if (type == "취재기자")
                {
                    string query = "select * from completeArticles where collector like '" + field + "'";
                    if (condition != "")
                    {
                        query += " and " + condition;
                    }
                    PageDataSource = DBConn.RunSelectQuery(query);
                    if (startindex == 0)
                        startindex = 1;
                    if (PageDataSource.Tables[0].Rows.Count > 0)
                    {
                        for (int i = 0; i < PageDataSource.Tables[0].Rows.Count; i++)
                        {
                            int id = Convert.ToInt32(PageDataSource.Tables[0].Rows[i][0].ToString());
                            if (startindex == 2)
                                condition += " and id=" + id;
                            else if (startindex == 1)
                                condition += "id=" + id;
                            else if (startindex == 3)
                                condition += " or id=" + id;
                            startindex = 3;
                        }
                    }
                    else
                    {
                        if (startindex == 2)
                        {
                            condition += " and 1=0";
                        }
                        else if (startindex == 1)
                        {
                            condition += "1=0";
                        }
                    }
                }
                else if (type == "편집기자")
                {
                    string query = "select * from completeArticles where editor like '" + field + "'";
                    if (condition != "")
                    {
                        query += " and " + condition;
                    }
                    PageDataSource = DBConn.RunSelectQuery(query);
                    if (startindex == 0)
                        startindex = 1;
                    if (PageDataSource.Tables[0].Rows.Count > 0)
                    {
                        for (int i = 0; i < PageDataSource.Tables[0].Rows.Count; i++)
                        {
                            int id = Convert.ToInt32(PageDataSource.Tables[0].Rows[i][0].ToString());
                            if (startindex == 2)
                                condition += " and id=" + id;
                            else if (startindex == 1)
                                condition += "id=" + id;
                            else if (startindex == 3)
                                condition += " or id=" + id;
                            startindex = 3;
                        }
                    }
                    else
                    {
                        if (startindex == 2)
                        {
                            condition += " and 1=0";
                        }
                        else if (startindex == 1)
                        {
                            condition += "1=0";
                        }
                    }
                }
            }

            if(condition != "")
            {
                condition = "select * from completeArticles where (" + condition + ") and kiosk=1 order by regdate desc";
            }
            else
            {
                if(startindex == 0 || startindex == 1)
                {
                    condition = "select * from completeArticles where kiosk=1 order by regdate desc";
                }
                else
                {
                    condition = "select * from completeArticles where 1=0";
                }
            }
            PageDataSource = DBConn.RunSelectQuery(condition);
            KPageLoad(PageDataSource, 1);
        }

        protected void onAsearch(object sender, EventArgs e)
        {
            if (!flag)
            {
                flag = true;
                onKsearch(sender, e);
            }
            else
            {
                flag = false;
            }
            string startdate = astartDate.Text;
            string enddate = aendDate.Text;
            string type = atype.SelectedValue;
            string field = afield.Text;
            string condition = "";
            int startindex = 0;
            if (startdate != "")
            {
                if (startindex == 2)
                {
                    condition += " and regdate > '" + startdate + "'";
                }
                else
                {
                    condition += "regdate > '" + startdate + "'";
                }
                startindex = 2;
            }
            if (enddate != "")
            {
                if (startindex == 2)
                {
                    condition += " and regdate < '" + enddate + "'";
                }
                else
                {
                    condition += "regdate < '" + enddate + "'";
                }
                startindex = 2;
            }
            if (field != "")
            {
                if (type == "신문명")
                {
                    string query = "select * from completeArticles where company like '%" + field + "%'";
                    if (condition != "")
                    {
                        query += " and " + condition;
                    }
                    PageDataSource = DBConn.RunSelectQuery(query);
                    if (startindex == 0)
                        startindex = 1;
                    if (PageDataSource.Tables[0].Rows.Count > 0)
                    {
                        for (int i = 0; i < PageDataSource.Tables[0].Rows.Count; i++)
                        {
                            int id = Convert.ToInt32(PageDataSource.Tables[0].Rows[i][0].ToString());
                            if (startindex == 2)
                                condition += " and id=" + id;
                            else if (startindex == 1)
                                condition += "id=" + id;
                            else if (startindex == 3)
                                condition += " or id=" + id;
                            startindex = 3;
                        }
                    }
                    else
                    {
                        if (startindex == 2)
                        {
                            condition += " and 1=0";
                        }
                        else if (startindex == 1)
                        {
                            condition += "1=0";
                        }
                    }
                }
                else if (type == "취재기자")
                {
                    string query = "select * from completeArticles where collector like '" + field + "'";
                    if (condition != "")
                    {
                        query += " and " + condition;
                    }
                    PageDataSource = DBConn.RunSelectQuery(query);
                    if (startindex == 0)
                        startindex = 1;
                    if (PageDataSource.Tables[0].Rows.Count > 0)
                    {
                        for (int i = 0; i < PageDataSource.Tables[0].Rows.Count; i++)
                        {
                            int id = Convert.ToInt32(PageDataSource.Tables[0].Rows[i][0].ToString());
                            if (startindex == 2)
                                condition += " and id=" + id;
                            else if (startindex == 1)
                                condition += "id=" + id;
                            else if (startindex == 3)
                                condition += " or id=" + id;
                            startindex = 3;
                        }
                    }
                    else
                    {
                        if (startindex == 2)
                        {
                            condition += " and 1=0";
                        }
                        else if (startindex == 1)
                        {
                            condition += "1=0";
                        }
                    }
                }
                else if (type == "편집기자")
                {
                    string query = "select * from completeArticles where editor like '" + field + "'";
                    if (condition != "")
                    {
                        query += " and " + condition;
                    }
                    PageDataSource = DBConn.RunSelectQuery(query);
                    if (startindex == 0)
                        startindex = 1;
                    if (PageDataSource.Tables[0].Rows.Count > 0)
                    {
                        for (int i = 0; i < PageDataSource.Tables[0].Rows.Count; i++)
                        {
                            int id = Convert.ToInt32(PageDataSource.Tables[0].Rows[i][0].ToString());
                            if (startindex == 2)
                                condition += " and id=" + id;
                            else if (startindex == 1)
                                condition += "id=" + id;
                            else if (startindex == 3)
                                condition += " or id=" + id;
                            startindex = 3;
                        }
                    }
                    else
                    {
                        if (startindex == 2)
                        {
                            condition += " and 1=0";
                        }
                        else if (startindex == 1)
                        {
                            condition += "1=0";
                        }
                    }
                }
            }

            if (condition != "")
            {
                condition = "select * from completeArticles where " + condition + " order by regdate desc";
            }
            else
            {
                if (startindex == 0 || startindex == 1)
                {
                    condition = "select * from completeArticles order by regdate desc";
                }
                else
                {
                    condition = "select * from completeArticles where 1=0";
                }
            }
            PageDataSource = DBConn.RunSelectQuery(condition);
            APageLoad(PageDataSource, 1);
        }
    }
}
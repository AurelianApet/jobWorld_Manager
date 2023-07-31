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
    public partial class content : Common.PageBase
    {
        private void PageLoad(int type)
        {
            string query = "select * from content order by regdate desc;";
            PageDataSource = DBConn.RunSelectQuery(query);

            showContent.Text = "";
            if (type == 0)
            {
                int count = PageDataSource.Tables[0].Rows.Count;
                if (count > 0)
                {
                    for (int i = 0; i < count; i++)
                    {
                        showContent.Text += "<li id='liContent"
                            + PageDataSource.Tables[0].Rows[i][0].ToString()
                            + "'><div class='tx_data'><a onclick='showContent("
                            + PageDataSource.Tables[0].Rows[i][0].ToString()
                            + ")' style='cursor:pointer' >"
                            + PageDataSource.Tables[0].Rows[i][3].ToString()
                            + "</a>"
                            + "<span class='icpos'><img src='../images/ad_arll.png'></span></div></li>";
                    }
                };
            }
            else if (type == 1)
            {
                int count = PageDataSource.Tables[0].Rows.Count;
                if (count > 0)
                {
                    for (int i = 0; i < count; i++)
                    {
                        showContent.Text += "<li id='liContent"
                            + PageDataSource.Tables[0].Rows[i][0].ToString()
                            + "'><div class='tx_data'><a onclick='showContent("
                            + PageDataSource.Tables[0].Rows[i][0].ToString()
                            + ")' style='cursor:pointer' >"
                            + PageDataSource.Tables[0].Rows[i][4].ToString()
                            + "</a>"
                            + "<span class='icpos'><img src='../images/ad_arll.png'></span></div></li>";
                    }
                };
            }
            else if (type == 2)
            {
                int count = PageDataSource.Tables[0].Rows.Count;
                if (count > 0)
                {
                    for (int i = 0; i < count; i++)
                    {
                        showContent.Text += "<li id='liContent"
                            + PageDataSource.Tables[0].Rows[i][0].ToString()
                            + "'><div class='tx_data'><a onclick='showContent("
                            + PageDataSource.Tables[0].Rows[i][0].ToString()
                            + ")' style='cursor:pointer' >"
                            + PageDataSource.Tables[0].Rows[i][5].ToString()
                            + "</a>"
                            + "<span class='icpos'><img src='../images/ad_arll.png'></span></div></li>";
                    }
                };
            }

            query = "select * from advertisement where type=0 order by id asc";
            PageDataSource = DBConn.RunSelectQuery(query);
            int count1 = PageDataSource.Tables[0].Rows.Count;
            if (count1 > 0)
            {
                AdvertisementList1.Text = "";
                for (int i = 0; i < count1; i++)
                {
                    string id = PageDataSource.Tables[0].Rows[i][0].ToString();
                    string imgpath = PageDataSource.Tables[0].Rows[i][2].ToString();
                    AdvertisementList1.Text += "<li><div class='tx_data'><a style='cursor:pointer' onclick='showAdvContent("
                        + id
                        + ")'><img style='width:182px;height:181px;' src="
                        + advPath + imgpath
                        + "></a></div></li>";
                }
            }

            query = "select * from advertisement where type=1 order by id asc";
            PageDataSource = DBConn.RunSelectQuery(query);
            count1 = PageDataSource.Tables[0].Rows.Count;
            if (count1 > 0)
            {
                AdvertisementList2.Text = "";
                for (int i = 0; i < count1; i++)
                {
                    string id = PageDataSource.Tables[0].Rows[i][0].ToString();
                    string imgpath = PageDataSource.Tables[0].Rows[i][2].ToString();
                    AdvertisementList2.Text += "<li><div class='tx_data'><a style='cursor:pointer' onclick='showAdvContent("
                        + id
                        + ")'><img style='width:180px;height:76px;' src="
                        + advPath + imgpath
                        + "></a></div></li>";
                }
            }

            query = "select * from advertisement where type=2 order by id asc";
            PageDataSource = DBConn.RunSelectQuery(query);
            count1 = PageDataSource.Tables[0].Rows.Count;
            if (count1 > 0)
            {
                AdvertisementList3.Text = "";
                for (int i = 0; i < count1; i++)
                {
                    string id = PageDataSource.Tables[0].Rows[i][0].ToString();
                    string imgpath = PageDataSource.Tables[0].Rows[i][2].ToString();
                    AdvertisementList3.Text += "<li><div class='tx_data'><a style='cursor:pointer' onclick='showAdvContent("
                        + id
                        + ")'><img style='width:180px;height:108px;' src="
                        + advPath + imgpath
                        + "></a></div></li>";
                }
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            PageLoad(0);
        }

        protected void onShowArticleSearch(object sender, EventArgs e)
        {
            string article_type = articleSearch.SelectedValue;
            if (article_type == "기사제목보기")
            {
                PageLoad(0);
            }
            else if (article_type == "기사요약보기")
            {
                PageLoad(2);
            }
            else if (article_type == "기사원고보기")
            {
                PageLoad(1);
            }
        }
    }
}
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
using System.Text;

namespace jobworld.Account
{
    public partial class home : Common.PageBase
    {
        protected void onGotoNextStep(object sender, EventArgs e)
        {
            Page_Load(sender, e);
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            PageDataSource = DBConn.RunSelectQuery("SELECT * FROM news_setting order by id asc");
            experienceapp0.Text = "";
            experienceapp1.Text = "";
            experienceapp2.Text = "";
            experienceapp3.Text = "";
            int count = PageDataSource.Tables[0].Rows.Count;
            if(count > 0)
            {
                for (int i = 0; i < Math.Ceiling(count / 3.0); i ++)
                {
                    for (int j = 0; j < 3; j ++)
                    {
                        if (3 * i + j >= count)
                            break;

                        string company = PageDataSource.Tables[0].Rows[3 * i + j][1].ToString();
                        string collector = PageDataSource.Tables[0].Rows[3 * i + j][2].ToString();
                        string editor = PageDataSource.Tables[0].Rows[3 * i + j][3].ToString();

                        if (company.Length > 6)
                            company = company.Substring(0, 6);
                        if (collector.Length > 6)
                            collector = collector.Substring(0, 6);
                        if (editor.Length > 6)
                            editor = editor.Substring(0, 6);

                        experienceapp0.Text += "<li>"
                            + "<strong>"
                            + "<span class='num'>"
                            + (3 * i + j + 1)
                            + "</span>"
                            + "신문사명"
                            + "</strong>"
                            + "<div class='ar_data'>"
                            + "<div class='dst mb10'>"
                            + "<em>취재</em>"
                            + "<ul class='on'>"
                            + "<li><input type = 'text' value='"
                            + "체험자"
    //                        + Convert.ToString(2 * (3 * i + j + 1) - 1)
                            + "' readonly placeholder ='체험자' /></li>"
                            + "<li><input type = 'text' placeholder='e-mail' readonly /></li>"
                            + "</ul>"
                            + "<div class='btn_rgt btn_awhtln'><a>대기</a></div>"
                            + "</div>"
                            + "<div class='dst'>"
                            + "<em>편집</em>"
                            + "<ul>"
                            + "<li><input type = 'text' placeholder='체험자' value='"
                            + "체험자"
    //                        + Convert.ToString(2 * (3 * i + j + 1))
                            + "' readonly></li>"
                            + "<li><input type = 'text' placeholder='e-mail' readonly /></li>"
                            + "</ul>"
                            + "<div class='btn_rgt btn_awhtln'><a>대기</a></div>"
                            + "</div>"
                            + "</div>"
                            + "</li>";

                        experienceapp1.Text += "<li id='"
                            + "li"
                            + Convert.ToString(3 * i + j)
                            + "'>"
                            + "<strong id = 'company"
                            + Convert.ToString(3 * i + j)
                            + "' >"
                            + "<span class='num'>"
                            + (3 * i + j + 1)
                            + "</span>"
                            + "신문사명"
                            + "<img id='comimg"
                            + Convert.ToString(3 * i + j)
                            + "' src='' /></strong>"
                            + "<div class='ar_data'>"
                            + "<div class='dst mb10'>"
                            + "<em>취재</em>"
                            + "<ul class='on'>"
                            + "<li><input type = 'text' id='collector"
                            + Convert.ToString(3 * i + j)
                            + "' value='"
                            + "체험자"
                            + "' readonly placeholder ='체험자' /></li>"
                            + "<li><input type = 'text' id='c_email"
                            + Convert.ToString(3 * i + j)
                            + "' placeholder='e-mail' readonly /></li>"
                            + "</ul>"
                            + "<div class='btn_rgt btn_awhtln' id='"
                            + "dvCol"
                            + Convert.ToString(3 * i + j)
                            + "'><a id='btnCol"
                            + Convert.ToString(3 * i + j)
                            + "' onclick='DsetCollector("
                            + Convert.ToString(3 * i + j)
                            + ")'>대기</a></div>"
                            + "</div>"
                            + "<div class='dst'>"
                            + "<em>편집</em>"
                            + "<ul>"
                            + "<li><input type = 'text' id='editor"
                            + Convert.ToString(3 * i + j)
                            + "' placeholder='체험자' value='"
                            + "체험자"
                            + "' readonly></li>"
                            + "<li><input type = 'text' readonly id='e_email"
                            + Convert.ToString(3 * i + j)
                            + "' placeholder='e-mail'></li>"
                            + "</ul>"
                            + "<div class='btn_rgt btn_awhtln' id='"
                            + "dvEdi"
                            + Convert.ToString(3 * i + j)
                            + "'><a id='btnEdi"
                            + Convert.ToString(3 * i + j)
                            + "' onclick='DsetEditor("
                            + Convert.ToString(3 * i + j)
                            + ")'>대기</a></div>"
                            + "</div>"
                            + "</div>"
                            + "</li>";

                        experienceapp2.Text += "<li id='"
                            + "li1"
                            + Convert.ToString(3 * i + j)
                            + "'>"
                            + "<strong id = 'company1"
                            + Convert.ToString(3 * i + j)
                            + "' >"
                            + "<span class='num'>"
                            + (3 * i + j + 1)
                            + "</span>"
                            + "신문사명"
                            + "<img id='comimg1"
                            + Convert.ToString(3 * i + j)
                            + "' src='' />"
                            + "<em class='btn_pos btn_agry2' style='display:none;' id = 'btnCom1"
                            + Convert.ToString(3 * i + j)
                            + "'><a style='cursor:pointer' onclick = 'DsetCom("
                            + Convert.ToString(3 * i + j)
                            + ")'>확인</a></em>"
                            + "</strong>"
                            + "<div class='ar_data'>"
                            + "<div class='dst mb10'>"
                            + "<em>취재</em>"
                            + "<ul class='on'>"
                            + "<li><input type = 'text' style='cursor:pointer' id='collector1"
                            + Convert.ToString(3 * i + j)
                            + "' onclick='showChangepopupC("
                            + Convert.ToString(3 * i + j)
                            + ")' value='"
                            + "체험자"
                            + "' readonly placeholder ='체험자' /></li>"
                            + "<li><input type = 'text' style='cursor:pointer' readonly id='c_email1"
                            + Convert.ToString(3 * i + j)
                            + "' onclick='showChangepopupC("
                            + Convert.ToString(3 * i + j)
                            + ")' placeholder='e-mail' /></li>"
                            + "</ul>"
                            + "<div class='btn_rgt btn_awhtln' style='cursor:pointer;' id='"
                            + "dvCol1"
                            + Convert.ToString(3 * i + j)
                            + "'><a id='btnCol1"
                            + Convert.ToString(3 * i + j)
                            + "' onclick='DsetCollector("
                            + Convert.ToString(3 * i + j)
                            + ")'>체험중</a></div>"
                            + "</div>"
                            + "<div class='dst'>"
                            + "<em>편집</em>"
                            + "<ul>"
                            + "<li><input type = 'text' style='cursor:pointer' id='editor1"
                            + Convert.ToString(3 * i + j)
                            + "' onclick='showChangepopupE("
                            + Convert.ToString(3 * i + j)
                            + ")' placeholder='체험자' value='"
                            + "체험자"
                            + "' readonly></li>"
                            + "<li><input type = 'text' style='cursor:pointer' readonly id='e_email1"
                            + Convert.ToString(3 * i + j)
                            + "' onclick='showChangepopupE("
                            + Convert.ToString(3 * i + j)
                            + ")' placeholder='e-mail'></li>"
                            + "</ul>"
                            + "<div class='btn_rgt btn_awhtln' style='cursor:pointer' id='"
                            + "dvEdi1"
                            + Convert.ToString(3 * i + j)
                            + "'><a id='btnEdi1"
                            + Convert.ToString(3 * i + j)
                            + "' onclick='DsetEditor("
                            + Convert.ToString(3 * i + j)
                            + ")'>체험중</a></div>"
                            + "</div>"
                            + "</div>"
                            + "</li>";

                        string statue = PageDataSource.Tables[0].Rows[3 * i + j][6].ToString();
                        if(statue == "3")
                        {
                            string id = PageDataSource.Tables[0].Rows[3 * i + j][0].ToString();
                            string c_email = PageDataSource.Tables[0].Rows[3 * i + j][8].ToString();
                            string e_email = PageDataSource.Tables[0].Rows[3 * i + j][11].ToString();
                            string place = PageDataSource.Tables[0].Rows[3 * i + j][7].ToString();
                            string newsType = PageDataSource.Tables[0].Rows[3 * i + j][9].ToString();
                            string savePath = PageDataSource.Tables[0].Rows[3 * i + j][12].ToString();

                            string emailAddress1 = c_email;
                            string emailAddress2 = e_email;

                            if (place.Length > 6)
                                place = place.Substring(0, 6);

                            string typeImage = "";

                            if (newsType == "0")
                                typeImage = "../images/ad_ic_i.png";
                            else if (newsType == "1")
                                typeImage = "../images/ad_ic_p.png";

                            string subject = "[한국잡월드] ‘신문사eNews’ 입니다.";
                            string body = "안녕하세요.%0d%0a%0d%0a한국잡월드를 방문해주셔서 대단히 감사합니다.%0d%0a%0d%0a신문사eNews 체험결과물을 첨부파일로 보내드립니다.%0d%0a%0d%0a첨부파일을 내컴퓨터에 다운로드 받아 확인하시기 바랍니다.%0d%0a%0d%0a감사합니다.";
                            //                            byte[] bytes = Encoding.Default.GetBytes(subject);
                            //                            subject = Encoding.UTF8.GetString(bytes);

                            //                            bytes = Encoding.Default.GetBytes(body);
                            //                            body = Encoding.UTF8.GetString(bytes);

                            experienceapp3.Text += "<li class='on'>"
                                + "<div class='topbtn'>"
                                + "<span style='cursor:pointer' onclick='printPage("
                                + id
                                + ")'>인쇄</span><span>|</span><span><a style='color: #4d98c1;' href='mailto:"
                                + emailAddress1
                                + ";"
                                + emailAddress2
                                + "?subject="
                                + subject
                                + "&body="
                                + body
                                + "'>이메일</a>"
                                + "</span>"
                                + "</div>"
                                + "<strong>"
                                + "<span class='num'>"
                                + id
                                + "</span>"
                                + company + "<span>" + place + "</span><img src='" + typeImage + "' />"
                                //                                + "<em class='btn_pos btn_agry2'><a style='cursor:pointer' onclick='window.open(\""
                                //                                + conPath + savePath.Replace(@"\", @"/")
                                //                                + "\", \"_blank\", \"toolbar=yes,scrollbars=yes,resizable=yes\");'>확인</a></em></strong>"
                                + "<em class='btn_pos btn_agry2'><a style='cursor:pointer' onclick='showpreview(\""
                                + conPath + savePath.Replace(@"\", @"/")
                                + "\")'>확인</a></em></strong>"
                                + "<div class='ar_data'>"
                                + "<div class='dst mb10'>"
                                + "<em>취재</em>"
                                + "<ul class='on'>"
                                + "<li style='width: 247px;'><input type = 'text' readonly placeholder='체험자' value='"
                                + collector
                                + "'></li>"
                                + "<li style='width: 247px;'><input type = 'text' style='width: 247px;' readonly placeholder='e-mail' value='"
                                + c_email
                                + "'></li>"
                                + "</ul></div>"
                                + "<div class='dst'>"
                                + "<em>편집</em><ul><li style='width: 247px;'><input type = 'text' readonly placeholder='체험자' value='"
                                + editor
                                + "'></li>"
                                + "<li style='width: 247px;'><input type = 'text' style='width: 247px;' readonly placeholder='e-mail' value='"
                                + e_email
                                + "'></li>"
                                + "</ul></div></div></li>";
                        }
                    }
                }
            }
        }
    }
}
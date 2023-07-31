using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Diagnostics;
using System.Web.UI.WebControls;
using System.Reflection;
using System.Runtime.InteropServices;
using Outlook = Microsoft.Office.Interop.Outlook;
using OutlookApp = Microsoft.Office.Interop.Outlook.Application;
using DataAccess;
using System.Net;
using jobworld.Common;

namespace jobworld.Account
{
    public partial class mailsender : Common.PageBase
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(Request.Params["id"]))
            {
                return;
            }
            string id = Request.Params["id"];
            PageDataSource = DBConn.RunSelectQuery("select * from news_setting where id=" + id);
            if(PageDataSource.Tables[0].Rows.Count > 0)
            {
                string c_email = PageDataSource.Tables[0].Rows[0][8].ToString();
                string e_email = PageDataSource.Tables[0].Rows[0][11].ToString();
                try
                {
                    Outlook.Application oApp = new Outlook.Application();
                    Outlook._MailItem oMailItem = (Outlook._MailItem)oApp.CreateItem(Outlook.OlItemType.olMailItem);
                    oMailItem.To = c_email + ";" + e_email;
                    oMailItem.Subject = "[잡월드] eNEWS 체험 결과물을 보내 드립니다.";
                    oMailItem.Body = "안녕하세요, 한국잡월드에 방문해 주셔서 감사합니다.\n\n한국잡월드의 eNEWS 체험결과물을 첨부파일로 보내 드립니다.\n\n\n내 컴퓨터에 설치해서 사용하시면 됩니다.\n\n\n\n감사합니다.";
                    oMailItem.Display(true);
                }
                catch(Exception ex)
                {
                    Response.Write("");
                }
            }
        }
    }
}
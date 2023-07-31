using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using DataAccess;
using System.Text;
using System.Data;
using Spire.Pdf;
using Spire.Pdf.Annotations;
using Spire.Pdf.Widget;
using System.Windows.Forms;
using System.Drawing.Printing;
using System.Threading;

namespace jobworld.Account
{
    public partial class printArticle : Common.PageBase
    {
        private string savepath = "";
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.Params["id"]))
                return;
            string id = Request.Params["id"];
            PageDataSource = DBConn.RunSelectQuery("select * from news_setting where id=" + id);
            if(PageDataSource.Tables[0].Rows.Count > 0)
            {
                savepath = PageDataSource.Tables[0].Rows[0][12].ToString();
                string news_type = PageDataSource.Tables[0].Rows[0][9].ToString();
                try
                {
                    if (!System.IO.Directory.Exists(savepath))
                        System.IO.Directory.CreateDirectory(savepath);
                }
                catch (Exception)
                {

                }
                savepath = conPath + savepath;

                if (news_type == "1")
                {
                    try
                    {
                        using (Process printProcess = new Process())
                        {
                            string systemPath = Environment.GetFolderPath(Environment.SpecialFolder.System);
                            printProcess.StartInfo.FileName = systemPath + @"\rundll32.exe";
                            printProcess.StartInfo.Arguments = systemPath + @"\mshtml.dll,PrintHTML """ + savepath.Replace(".pdf", ".html") + @"""";
                            printProcess.Start();
                        }
                        var t = new Thread(MyThreadStartMethod);
                        t.SetApartmentState(ApartmentState.STA);
                        t.Start();
                    }
                    catch (Exception)
                    {
                        Response.Write("fail");
                    }
                }
                else if(news_type == "0")
                {
                    try
                    {
                        using (Process printProcess = new Process())
                        {
                            string systemPath = Environment.GetFolderPath(Environment.SpecialFolder.System);
                            printProcess.StartInfo.FileName = systemPath + @"\rundll32.exe";
                            printProcess.StartInfo.Arguments = systemPath + @"\mshtml.dll,PrintHTML """ + savepath + @"""";
                            printProcess.Start();
                        }
                        var t = new Thread(MyThreadStartMethod);
                        t.SetApartmentState(ApartmentState.STA);
                        t.Start();
                    }
                    catch(Exception)
                    {
                        Response.Write("fail");
                    }
                }
            }
        }

        private void MyThreadStartMethod()
        {
            WebBrowser webBrowserForPrinting = new WebBrowser();
            // Add an event handler that prints the document after it loads.
            webBrowserForPrinting.DocumentCompleted +=
                new WebBrowserDocumentCompletedEventHandler(PrintDocument);
            // Set the Url property to load the document.
            webBrowserForPrinting.Url = new Uri(savepath);
        }

        private void PrintDocument(object sender,
            WebBrowserDocumentCompletedEventArgs e)
        {
            // Print the document now that it is fully loaded.
            ((WebBrowser)sender).Print();

            // Dispose the WebBrowser now that the task is complete. 
            ((WebBrowser)sender).Dispose();
        }
    }
}
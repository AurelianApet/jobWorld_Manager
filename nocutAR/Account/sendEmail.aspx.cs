using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.IO;
using System.Net.Mime;

namespace jobworld.Account
{
    public partial class sendEmail : Common.PageBase
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            string title = "";
            string content = "";
            string receivers = "";
            string email_senders = "";

            if (!string.IsNullOrEmpty(Request.Params["receivers"]))
            {
                receivers = Request.Params["receivers"];
            }

            if (!string.IsNullOrEmpty(Request.Params["sender"]))
            {
                email_senders = Request.Params["sender"];
            }

            if (!string.IsNullOrEmpty(Request.Params["title"]))
            {
                title = Request.Params["title"];
            }

            if (!string.IsNullOrEmpty(Request.Params["content"]))
            {
                content = Request.Params["content"];
            }

            string[] receiver = receivers.Split(';');

            try
            {
                string senderPassword = "";
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                mail.From = new MailAddress(email_senders);
                mail.To.Add(receiver[0]);
                mail.To.Add(receiver[1]);
                mail.Subject = title;
                mail.Body = content;
                if(Request.Files["upfile"] != null)
                {
                    string fname = uploadFile(Request.Files["upfile"], "../efile", System.IO.Path.GetFileName(Request.Files["upfile"].FileName));
                    fname = AppDomain.CurrentDomain.BaseDirectory + "efile\\" + Path.GetFileName(fname);
                    mail.Attachments.Add(new Attachment(fname, MediaTypeNames.Application.Octet));
                }
                SmtpServer.Port = 587;
                SmtpServer.EnableSsl = true;
                SmtpServer.DeliveryMethod = SmtpDeliveryMethod.Network;
                SmtpServer.UseDefaultCredentials = true;
                SmtpServer.Credentials = new System.Net.NetworkCredential(email_senders, senderPassword);
                SmtpServer.Send(mail);
                Response.Write("이메일전송에 성공하였습니다.");
            }
            catch (Exception)
            {
                Response.Write("이메일전송시 알지 못할 오류가 발생하였습니다.");
            }
        }
    }
}
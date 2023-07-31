using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Drawing2D;
using DataAccess;
using System.Text;
using System.Data;
using System.IO;

namespace jobworld.Account
{
    public partial class PostUpload : Common.PageBase
    {
        public void Resize(string imageFile, int type)
        {
            string strPath = imageFile;
            var srcImage = System.Drawing.Image.FromFile(strPath);
            int newWidth = srcImage.Width;
            int newHeight = srcImage.Height;
            if (type == 0)
            {
                if(newWidth <= newHeight)
                {
                    newHeight = newWidth;
                }
                else
                {
                    newWidth = newHeight;
                }
            }
            else if(type == 1)
            {
                if(newWidth <= newHeight)
                {
                    newHeight = 3 / 7 * newWidth;
                }
                else
                {
                    newWidth = 7 / 3 * newHeight;
                }
            }
            else if(type == 2)
            {
                if (newWidth <= newHeight)
                {
                    newHeight = 3 / 5 * newWidth;
                }
                else
                {
                    newWidth = 5 / 3 * newHeight;
                }
            }
            /*
                        if (srcImage.Width > srcImage.Height)
                        {
                            if (srcImage.Width > WIDTH)
                            {
                                newWidth = WIDTH;
                                newHeight = srcImage.Height * WIDTH / srcImage.Width;
                            }
                        }
                        else
                        {
                            if (srcImage.Height > WIDTH)
                            {
                                newHeight = WIDTH;
                                newWidth = srcImage.Width * WIDTH / srcImage.Height;
                            }
                        }
            */
            var newImage = new Bitmap(newWidth, newHeight);
            var graphics = Graphics.FromImage(newImage);
            graphics.SmoothingMode = SmoothingMode.AntiAlias;
            graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
            graphics.PixelOffsetMode = PixelOffsetMode.HighQuality;
            graphics.DrawImage(srcImage, new Rectangle(0, 0, newWidth, newHeight));
            try
            {
                srcImage.Dispose();
                newImage.Save(strPath);
            }
            catch (Exception ex)
            {

            }
        }

        protected override void Page_Init(object sender, EventArgs e)
        {
            base.Page_Init(sender, e);
        }
        
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            int type = -1;
            if (Request.Params["type"] != null)
                type = Int32.Parse(Request.Params["type"]);

            if (type == -1)
                return;

            if (string.IsNullOrEmpty(Request.Params["id"]))
            {
                return;
            }
            string id = Request.Params["id"];

            HttpFileCollection uploadFiles = Request.Files;

            string strIconPath = null;
            if (type == 1)
            {
                if (string.IsNullOrEmpty(Request.Params["adv_type"]))
                {
                    return;
                }
                int adv_type = Convert.ToInt32(Request.Params["adv_type"]);

                strIconPath = uploadFile(Request.Files["upfile"], absAdvertisementPath,  System.IO.Path.GetFileName(Request.Files["upfile"].FileName));
                strIconPath = Path.GetFileName(strIconPath);
                //                Resize(strIconPath, adv_type);
                try
                {
                    string query = "update advertisement set imagepath='" + strIconPath + "' where id=" + id;
                    DBConn.RunUpdateQuery(query);
                    Response.Write("성공적으로 수정되었습니다.");
                }
                catch (Exception)
                {
                    Response.Write("광고이미지 수정중에 알지 못할 오류가 발생하였습니다.");
                }
            }
            else if (type == 2)
            {
                if (string.IsNullOrEmpty(Request.Params["adv_type"]))
                {
                    return;
                }
                string adv_type = Request.Params["adv_type"];

                strIconPath = uploadFile(Request.Files["upfile"], absAdvertisementPath, System.IO.Path.GetFileName(Request.Files["upfile"].FileName));
                strIconPath = Path.GetFileName(strIconPath);

//                Resize(strIconPath, Convert.ToInt32(adv_type));
                try
                {
                    string query = "insert into advertisement values('" + adv_type + "', '" + strIconPath + "')";
                    DBConn.RunInsertQuery(query);
                    Response.Write("성공적으로 등록되었습니다.");
                }
                catch (Exception)
                {
                    Response.Write("광고이미지 등록중에 알지 못할 오류가 발생하였습니다.");
                }
            }
            else if (type == 3)
            {
                strIconPath = uploadFile(Request.Files["upfile"], absContentPath, System.IO.Path.GetFileName(Request.Files["upfile"].FileName));
                strIconPath = Path.GetFileName(strIconPath);
                //                Resize(strIconPath);
                try
                {
                    string query = "update content set imagepath='" + strIconPath + "' where id=" + id;
                    DBConn.RunUpdateQuery(query);
                }
                catch (Exception)
                {
                }
            }
            else if (type == 4)
            {
                strIconPath = uploadFile(Request.Files["upfile"], absContentPath, System.IO.Path.GetFileName(Request.Files["upfile"].FileName));
                strIconPath = Path.GetFileName(strIconPath);
                //                Resize(strIconPath);
                try
                {
                    string query = "insert into content values('', '', '', '', '', '" + strIconPath + "', '', '"
                        + strCurDate
                        + "', '', '', '', '', '', '', '', '', '', 0, '')";
                    DBConn.RunInsertQuery(query);
                }
                catch (Exception)
                {
                }
            }
        }
    }
}

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
    public partial class deleteAdvContent : Common.PageBase
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.Params["id"]))
                return;
            string id = Request.Params["id"];
            try
            {
                DBConn.RunDeleteQuery("delete from advertisement where id=" + id);
                Response.Write("성공적으로 삭제되었습니다.");
            }
            catch(Exception)
            {
                Response.Write("실패했습니다.");
            }
        }
    }
}
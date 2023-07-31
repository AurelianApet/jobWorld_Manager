using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace jobworld.Common
{
    /// <summary>
    /// Summary description for AuthUser
    /// </summary>
    public class AuthUser
    {
        protected long _id = 0;
        public long ID
        {
            get { return _id; }
        }

        protected string _loginid = null;
        public string LoginID
        {
            get { return _loginid; }
        }

        protected string _loginpwd = null;
        public string LoginPwd
        {
            get { return _loginpwd; }
            set { _loginpwd = value; }
        }

        public AuthUser()
        {
            _id = 0;
            _loginid = null;
            _loginpwd = null;
        }

        public AuthUser(
            long lID,
            string strLoginID,
            string strLoginPwd
            )
        {
            _id = lID;
            _loginid = strLoginID;
            _loginpwd = strLoginPwd;
        }
    }
}
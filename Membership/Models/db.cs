using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Membership.Models
{
    public static class db
    {
        public static string getconnection()
        {
            return "Server=10.48.38.5;Database=Members;UID=ITUser;PWD=CentraliaIT;";
        }
    }
}
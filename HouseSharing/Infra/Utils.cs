using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HouseSharing.Infra
{
    public static class Utils
    {

        public static Models.User ConnectedUSer
        {
            get {
                //return (Models.User)HttpContext.Current.Session["User"];
                return HttpContext.Current.Session["User"] != null
                ? (Models.User)HttpContext.Current.Session["User"]
                : new Models.User();
            }

            set { HttpContext.Current.Session["User"] = value; }
        }

    }
}
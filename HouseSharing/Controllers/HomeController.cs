using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HouseSharing.Models;

namespace HouseSharing.Controllers
{
    public class HomeController : Controller
    {
        private HouseSharingEntities _db = new HouseSharingEntities();

        public ActionResult Index()
        {
            List<Bien> Last5 = _db.Biens
                .OrderByDescending(b => b.ID)
                .Take(5)
                .ToList();
            return View(Last5);
        }
    }
}
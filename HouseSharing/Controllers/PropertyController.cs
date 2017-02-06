using HouseSharing.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HouseSharing.Controllers
{
    public class PropertyController : Controller
    {
        private HouseSharingEntities _db = new HouseSharingEntities();

        // GET: Property
        public ActionResult Index()
        {
            Bien model = new Bien()
            {
                Countries = _db.Countries.ToList(),
                Categories = _db.Categories.ToList()
            };
            return View(model);
        }

        [HttpPost]
        public ActionResult Index(Bien p, IEnumerable<HttpPostedFileBase> uploads)
        {
            foreach (var photo in uploads)
            {
                string name = Guid.NewGuid().ToString() + photo.FileName;
                photo.SaveAs(HttpContext.Server.MapPath(string.Format("~/Content/Photos/{0}", name)));
                p.Photos.Add(new Photo() { Name = name });

            }
            p.UserID = Infra.Utils.ConnectedUSer.ID;
            _db.Options.Add(p.Option);
            _db.SaveChanges();
            _db.Biens.Add(p);
            _db.SaveChanges();
            
            return RedirectToAction("BienCreated");
        }

        public ActionResult BienCreated()
        {
            //ajout de commentaire
            return View();
        }

        public ActionResult Details(int ID)
        {
            Bien model = _db.Biens.Where(b => b.ID == ID).FirstOrDefault();
            return View(model);
        }
    }
}
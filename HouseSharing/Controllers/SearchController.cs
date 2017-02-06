using HouseSharing.Models;
using HouseSharing.Models.View;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HouseSharing.Controllers
{
    public class SearchController : Controller
    {
        private HouseSharingEntities _db = new HouseSharingEntities();

        
        [HttpGet]// GET: Search
        public ActionResult Index()
        {
            Search model = new Search()
            {
                Countries = _db.Countries.ToList(),
                Categories = _db.Categories.ToList()
            };
            return View(model);
        }

        [HttpPost]
        public ActionResult Index(Search model)
        {
            List<Bien> list;
            list = _db.Biens.Where(p => p.CountryID == model.CountryID && p.CategoryID == model.CategoryID)
                .Where(p=> model.PriceMin != 0 && model.PriceMax != 0 ? p.PricePerNight >= model.PriceMin && p.PricePerNight <= model.PriceMax : true)
                .Where(p => model.roomsMin != 0 && model.roomsMax != 0 ? p.Option.Rooms >= model.roomsMin && p.Option.Rooms <= model.roomsMax : true)
                .Where(b => model.BabyBed ? b.Option.BabyBed : true)
                .Where(b => model.DishWasher ? b.Option.DishWasher : true)
                .Where(b => model.DishWasher ? b.Option.Garage : true)
                .Where(b => model.DishWasher ? b.Option.Garden : true)
                .Where(b => model.DishWasher ? b.Option.Terrace : true)
                .Where(b => model.DishWasher ? b.Option.WashingMachine : true)
                .ToList();
            return View("Result", list);
        }
    }
}
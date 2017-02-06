using HouseSharing.Infra;
using HouseSharing.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HouseSharing.Controllers
{
    public class UserController : Controller
    {
        private HouseSharingEntities _db = new HouseSharingEntities();
        // GET: User
        [HttpGet]
        public ActionResult Index()
        {
            User model = new User() {
                Countries = _db.Countries.ToList()
            };
            return View(model);
        }


        [HttpPost]
        public ActionResult Index(Models.User u)
        {
            u.Password = Infra.Hashing.PassHashing(u.Password);
            _db.Users.Add(u);
            _db.SaveChanges();
            return RedirectToAction("UserCreated");
        }
        

        [HttpPost]
        public ActionResult Connect(Models.User u)
        {
            List<User> ListUsers = _db.Users.ToList();
            List<string> Logins = ListUsers.Select(user => user.Login).ToList();
            bool ok = false;

            foreach (var item in Logins)
            {
                if (u.Login == item)
                {
                    List<User> PassLogin = _db.Users.Where(user=>user.Login == u.Login).ToList();
                    List<string> passDB = PassLogin.Select(user => user.Password).ToList();
                    foreach (var passCheck in passDB) {
                        string pass = Infra.Hashing.PassHashing(u.Password);
                        if (pass == passCheck) {
                            ok = true;
                            Utils.ConnectedUSer = _db.Users.FirstOrDefault(us=>us.Login == u.Login);
                        }
                    }
                }
            }

            if (ok == true) {
                return RedirectToAction("MyProperties", "User");
            }
            else {
                ViewBag.ErrMsg = "Error Connection! Try again";
                return RedirectToAction("Index", "User");
            }
        }


        public ActionResult UserCreated()
        {
            return View();
        }


        public ActionResult Profil()
        {
            User model = new User()
            {
                Countries = _db.Countries.ToList()
            };
            return View(model);
        }


        [HttpPost]
        public ActionResult ChangeAdresse(string Adresse, string City, int ZipCode, int Country)
        {
            User u = _db.Users.FirstOrDefault(us=>us.ID == Infra.Utils.ConnectedUSer.ID);
            u.Adresse = Adresse;
            u.CountryID = Country;
            u.City = City;
            u.ZipCode = ZipCode;
            _db.SaveChanges();
            Utils.ConnectedUSer = u;
            return RedirectToAction("Profil", "User");
        }


        [HttpPost]
        public ActionResult ChangeEmail(string Email)
        {
            User u = _db.Users.FirstOrDefault(us => us.ID == Infra.Utils.ConnectedUSer.ID);
            u.Email = Email;
            _db.SaveChanges();
            Utils.ConnectedUSer = u;
            return RedirectToAction("Profil", "User");
        }



        [HttpPost]
        public ActionResult ChangeLogin(string Login)
        {
            User u = _db.Users.FirstOrDefault(us => us.ID == Infra.Utils.ConnectedUSer.ID);
            u.Login = Login;
            _db.SaveChanges();
            Utils.ConnectedUSer = u;
            return RedirectToAction("Profil", "User");
        }


        [HttpPost]
        public ActionResult ChangePassword(string NewPassword, string OldPassword)
        {
            User u = _db.Users.FirstOrDefault(us => us.ID == Infra.Utils.ConnectedUSer.ID);
            if (u.Password == Infra.Hashing.PassHashing(OldPassword) && NewPassword != "")
            {
                u.Password = Infra.Hashing.PassHashing(NewPassword);
            }
            _db.SaveChanges();
            Utils.ConnectedUSer = u;
            return RedirectToAction("Profil", "User");
        }



        public ActionResult MyProperties()
        {
            List<Bien> MesBiens = _db.Biens.Where(p => p.UserID == Infra.Utils.ConnectedUSer.ID).ToList();
            return View(MesBiens);
        }

    }
}
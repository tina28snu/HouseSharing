using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HouseSharing.Models.View
{
    public class Search
    {
        public int CountryID { get; set; }
        public int PriceMin { get; set; }
        public int PriceMax { get; set; }
        public int CategoryID { get; set; }
        public int roomsMin { get; set; }
        public int roomsMax { get; set; }
        public bool BabyBed { get; set; }
        public bool DishWasher { get; set; }
        public bool Garage { get; set; }
        public bool Garden { get; set; }
        public bool Terrace { get; set; }
        public bool WashingMachine { get; set; }
        public List<Country> Countries { get; set; }
        public List<Category> Categories { get; set; }

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HouseSharing.Models
{
    public partial class Bien
    {
        public List<Country> Countries { get; set; }
        public List<Category> Categories { get; set; }
    }
}
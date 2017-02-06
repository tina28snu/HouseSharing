using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace HouseSharing.Infra
{
    public static class Hashing
    {
        public static string PassHashing(string pass)
        {
            SHA512 sha = SHA512.Create();
            byte[] hashTab = sha.ComputeHash(Encoding.Default.GetBytes(pass));
            return Convert.ToBase64String(hashTab);
        }
    }
}
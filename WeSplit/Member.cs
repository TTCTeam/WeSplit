using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WeSplit
{
    class Member
    {
        public string Name_Mem { get; set; }
        public List<Pay> listPay { get; set; }
        public double Pay { get; set; }
        public Member(string name, double money)
        {
            Name_Mem = name;
            Pay = money;
            listPay = new List<Pay>();
        }
    }

    class Pay
    { 
        public string Name_Pay { get; set; }
        public double Cost { get; set; }
    }

    class Place
    {
        public string Place_Name { get; set; }
        public DateTime arriveTime { get; set; }
        public DateTime leaveTime { get; set; }
        public string ImageCover { get; set; }

        public Place(string name, DateTime ar, DateTime le, string img)
        {
            Place_Name = name;
            arriveTime = ar;
            leaveTime = le;
            ImageCover = img;
        }
    }
}

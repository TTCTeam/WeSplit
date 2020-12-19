using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WeSplit.DAO
{
    class TripDAO
    {
        private static TripDAO instance = null;

        public static TripDAO Instance
        {
            get
            {
                if (instance == null)
                    instance = new TripDAO();
                return instance;
            }

            set => instance = value;
        }

        private TripDAO() { }

        public List<Trip> GetTrips(int status, string keyword, WeSplitEntities DB)
        {
            List<Trip> listTrips = null;

            //var query = from p in DB.Members
            //            where (p.Trip.Status == status && (p.Name.Contains(keyword) || p.Trip.Name.Contains(keyword)))
            //            select p.Trip;

            if (status==0)
            {
                listTrips = DB.Trips.Where(p => p.Status==0 && (p.Name.Contains(keyword) || (p.Members.Where(m => m.Name.Contains(keyword))).Count()!=0)).ToList();
            }
            else if (status==1)
            {
                listTrips = DB.Trips.Where(p => (p.Status == 1)||(p.Status==2) && (p.Name.Contains(keyword) || (p.Members.Where(m => m.Name.Contains(keyword))).Count()!=0)).ToList();
            }
            
            return listTrips;
        }

        public void SetStatus(Trip info, WeSplitEntities DB)
        {
            var trip = DB.Trips.Find(info.ID);

            trip.Status = info.Status;
            DB.SaveChanges();
        }
    }
}

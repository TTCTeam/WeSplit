using LiveCharts;
using LiveCharts.Wpf;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WeSplit
{
    /// <summary>
    /// Interaction logic for DetailScreen.xaml
    /// </summary>
    public partial class DetailScreen : UserControl
    {
        Trip trip;

        BindingList<Waypoint> places = new BindingList<Waypoint>();
        List<Waypoint> waypoints;

        DetailUi detail = new DetailUi();
        public DetailScreen()
        {
            int TripID = 1;
            InitializeComponent();

            using (WeSplitEntities db = new WeSplitEntities())
            {
                trip = db.Trips.Where(x => x.ID == TripID).FirstOrDefault();

                listLocation.ItemsSource = db.Waypoints.Where(x => x.TripID == TripID).ToList<Waypoint>();
                detail.Name = trip.Name;
                listImages.ItemsSource = db.Images.Where(x => x.TripID == TripID).ToList<Image>();
                detail.ImageCover = db.Images.Where(x => x.TripID == TripID).FirstOrDefault().ImagePath;
                var status = db.Trips.Where(x => x.ID == TripID).FirstOrDefault().Status;

                detail.Status = db.StatusDescriptions.Where(x => x.Status == status).FirstOrDefault().Description;

                #region SUM and AVERAGE
                var payments = from m in db.Members
                               join p in db.Payments
                               on m.ID equals p.MemberID
                               into emp from payment in emp.DefaultIfEmpty()
                               select new
                               {
                                   MemberID = m.ID,
                                   MemberName = m.Name,
                                   PaymentName = payment.Name,
                                   PaymentCost = payment.Cost
                               };
                   
                //var payments = db.Payments
                //   .Join(
                //   db.Members.Where(x => x.TripID == TripID),
                //   payment => payment.MemberID,
                //   member => member.ID,
                //   (payment, member) => new
                //   {
                //       MemberID = member.ID,
                //       MemberName = member.Name,
                //       PaymentName = payment.Name,
                //       PaymentCost = payment.Cost
                //   }
                //   );
               
                var payment_gb = payments
                    .GroupBy(g => g.MemberID)
                    .Select(s => new
                    {
                        MemberID = s.Key,
                        Sum = s.Sum(a => a.PaymentCost)
                    });

                var memberPerPay = db.Members
                    .Join(
                    payment_gb,
                    member => member.ID,
                    payment => payment.MemberID,
                    (member, payment) => new
                    {
                        MemberName = member.Name,
                        PayCost = payment.Sum
                    }
                    );



                var sum = payments.Sum(s => s.PaymentCost);
                var tong = payment_gb.Sum(s => s.Sum);
                var average = sum / db.Members.Select(s => s.ID).Distinct().Count();

                var member_AfterSplit = memberPerPay.Select(s => new
                {
                    MemberName = s.MemberName,
                    Pay = (s.PayCost==null?0 : s.PayCost) - average
                });


                #endregion

                listMem.ItemsSource = member_AfterSplit.ToList();

                detail.Sum = sum.ToString() + " VND";
                detail.Average = average.ToString() + " VND";



                foreach (var i in memberPerPay)
                {
                    listMember.Add(new MemberPaymentChart(i.MemberName, i.PayCost==null?0: (float)i.PayCost));
                }

                foreach (var i in payments)
                {
                    if (i.PaymentName != null&&i.PaymentCost!=null)
                    {
                        listPayChart.Add(new PaymentChart(i.PaymentName, (float)i.PaymentCost));
                    }    
                    
                }

            }

        }


        public class MemberPaymentChart
        {
            public string MemberName { get; set; }
            public float PayCost { get; set; }
            public MemberPaymentChart(string mem, float f)
            {
                MemberName = mem;
                PayCost = f;
            }
        }

        public class PaymentChart
        {
            public string NamePayment { get; set; }
            public float PayCost { get; set; }
            public PaymentChart(string namePayment, float cost)
            {
                NamePayment = namePayment;
                PayCost = cost;
            }
        }


        public class DetailUi
        {
            public string Update { get; set; }
            public string Update_MouseOver { get; set; }
            public string Delete { get; set; }
            public string Delete_MouseOver { get; set; }
            public string ImageCover { get; set; }
            public string Name { get; set; }
            public string Status { get; set; }
            public string Sum { get; set; }
            public string Average { get; set; }
            public SeriesCollection SeriesCollection { get; set; }
            public SeriesCollection PieSeries { get; set; }


            public DetailUi()
            {
                Update = "Images/DetailScreen/update.png";
                Update_MouseOver = "Images/DetailScreen/update_mouseOver.png";
                Delete = "Images/DetailScreen/delete.png";
                Delete_MouseOver = "Images/DetailScreen/delete_mouseOver.png";
            }


        }

        private void updateBtn_Click(object sender, RoutedEventArgs e)
        {

        }

        private void deleteBtn_Click(object sender, RoutedEventArgs e)
        {

        }

        BindingList<string> listImage = new BindingList<string>();
        List<MemberPaymentChart> listMember = new List<MemberPaymentChart>();
        List<PaymentChart> listPayChart = new List<PaymentChart>();
        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {

            detail.SeriesCollection = new SeriesCollection();

            for (int i = 0; i < listPayChart.Count(); i++)
            {
                List<double> values = new List<double> { (listPayChart.ElementAt(i).PayCost < 0) ? (listPayChart.ElementAt(i).PayCost * (-1)) : listPayChart.ElementAt(i).PayCost };
                ChartValues<double> _ys = new ChartValues<double>(values);
                detail.SeriesCollection.Add(
                    new ColumnSeries()
                    {
                        Values = _ys,
                        Title = listPayChart.ElementAt(i).NamePayment,
                        DataLabels = true
                    }
                    );
            }

            detail.PieSeries = new SeriesCollection();
            for (int i = 0; i < listMember.Count(); i++)
            {
                List<double> values = new List<double> { (listMember.ElementAt(i).PayCost < 0) ? (listMember.ElementAt(i).PayCost * (-1)) : listMember.ElementAt(i).PayCost };
                ChartValues<double> _ys = new ChartValues<double>(values);
                detail.PieSeries.Add(
                    new PieSeries()
                    {
                        Values = _ys,
                        Title = listMember.ElementAt(i).MemberName,
                        DataLabels = true
                    }
                    );
            }



            DataContext = detail;
        }

        private void pieChartExpenditure_DataClick(object sender, LiveCharts.ChartPoint chartPoint)
        {
            var chart = chartPoint.ChartView as PieChart;

            foreach (PieSeries series in chart.Series)
                series.PushOut = 0;

            var seletedSeries = chartPoint.SeriesView as PieSeries;
            seletedSeries.PushOut = 15;
        }
    }
}

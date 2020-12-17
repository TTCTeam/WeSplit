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
        public DetailScreen()
        {
            InitializeComponent();
        }

        public SeriesCollection SeriesCollection => new SeriesCollection
        {
            new LineSeries
            {
                Values = new ChartValues<double> { 3, 5, 7, 4 }
            },
            new ColumnSeries
            {
                Values = new ChartValues<decimal> { 5, 6, 2, 7 }
            }
        };

        public string[] Labels => new[] { "Jan", "Feb", "Mar", "Apr" };
        public class DetailUi
        {
            public string Update { get; set; }
            public string Update_MouseOver { get; set; }
            public string Delete { get; set; }
            public string Delete_MouseOver { get; set; }

            public string[] Labels { get; set; }

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
        List<Member> listMember = new List<Member>();

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            //DetailUi detail = new DetailUi();

            //BindingList<Place> Places = new BindingList<Place>() {
            //new Place("Vinh Ha Long",new DateTime(), new DateTime(),"./Images/PlaceImages/VinhHaLong.jpg"),
            //new Place("Ho Guom",new DateTime(), new DateTime(),"./Images/PlaceImages/HoGuom.jpg"),
            //new Place("Nha Hat Lon Ha Noi",new DateTime(), new DateTime(),"./Images/PlaceImages/NhaHatLonHaNoi.jpg"),
            //new Place("Pho Co Hoi An",new DateTime(), new DateTime(),"./Images/PlaceImages/PhoCoHoiAn.jpg"),
            //new Place("Phu Quoc",new DateTime(), new DateTime(),"./Images/PlaceImages/PhuQuoc.jpg"),
            //new Place("Ruong Bac Thang",new DateTime(), new DateTime(),"./Images/PlaceImages/RuongBacThang.jpg")
            //};

            //listLocation.ItemsSource = Places;

            //detail.Labels = new[] { "Jan", "Feb", "Mar", "Apr" };
          

            //listImage.Add("./Images/PlaceImages/HoGuom.jpg");
            //listImage.Add("./Images/PlaceImages/NhaHatLonHaNoi.jpg");
            //listImage.Add("./Images/PlaceImages/PhuQuoc.jpg");
            //listImage.Add("./Images/PlaceImages/QuangTruongBaDinh.jpg");
            //listImage.Add("./Images/PlaceImages/RuongbacThang.jpg");
            //listImage.Add("./Images/PlaceImages/VinhHaLong.jpg");
            //listImage.Add("./Images/PlaceImages/DongBangSongCuuLong.jpg");
            //listImage.Add("./Images/PlaceImages/HoGuom.jpg");
            //listImage.Add("./Images/PlaceImages/HoGuom.jpg");
            //listImage.Add("./Images/PlaceImages/HoGuom.jpg");
            //listImage.Add("./Images/PlaceImages/HoGuom.jpg");

            //listImages.ItemsSource = listImage;

            //listMember.Add(new Member("Khắc Tây", 316.67));
            //listMember.Add(new Member("Túc Hạo", 317.67));
            //listMember.Add(new Member("Tử Tửu", -316.67));
            //listMember.Add(new Member("Minh Tuệ", -416.67));
            //listMember.Add(new Member("Khắc Luân", 306.67));

            //listMem.ItemsSource = listMember;

            
            //detail.PieSeries = new SeriesCollection();
            //for(int i = 0; i < listMember.Count(); i++)
            //{
            //    List<double> values = new List<double> { (listMember.ElementAt(i).Pay<0)?(listMember.ElementAt(i).Pay*(-1)): listMember.ElementAt(i).Pay };
            //    ChartValues<double> _ys = new ChartValues<double>(values);
            //    detail.PieSeries.Add(
            //        new PieSeries()
            //        {
            //            Values = _ys,
            //            Title = listMember.ElementAt(i).Name_Mem,
            //            DataLabels = true
            //        }
            //        ) ;
            //}

            //detail.SeriesCollection = new SeriesCollection();

            //for (int i = 0; i < listMember.Count(); i++)
            //{
            //    List<double> values = new List<double> { (listMember.ElementAt(i).Pay < 0) ? (listMember.ElementAt(i).Pay * (-1)) : listMember.ElementAt(i).Pay };
            //    ChartValues<double> _ys = new ChartValues<double>(values);
            //    detail.SeriesCollection.Add(
            //        new ColumnSeries()
            //        {
            //            Values = _ys,
            //            Title = listMember.ElementAt(i).Name_Mem,
            //            DataLabels = true
            //        }
            //        );
            //}


            //DataContext = detail;
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

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
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        class Place // DTO = Data transfer object - Entity
        {
            public string Name { get; set; }
            public string Thumbnail { get; set; }
        }

        // DAO - Data access object

        class PlaceDao
        {
            public static BindingList<Place> GetAll()
            {
                var result = new BindingList<Place>()
                {
                    new Place() { Name="Đồng bằng sông Cửu Long", Thumbnail="/Images/PlaceImages/DongBangSongCuuLong.jpg" },
                    new Place() { Name="Hồ Gươm", Thumbnail="/Images/PlaceImages/HoGuom.jpg" },
                    new Place() { Name="Nhà hát lớn Hà Nội", Thumbnail="/Images/PlaceImages/NhaHatLonHaNoi.jpg" },
                    new Place() { Name="Phố cổ Hội An", Thumbnail="/Images/PlaceImages/PhoCoHoiAn.jpg" },
                    new Place() { Name="Phú Quốc", Thumbnail="/Images/PlaceImages/PhuQuoc.jpg" },
                    new Place() { Name="Quảng trường Ba Đình", Thumbnail="/Images/PlaceImages/QuangTruongBaDinh.jpg" },
                    new Place() { Name="Ruộng Bậc Thang", Thumbnail="/Images/PlaceImages/RuongBacThang.jpg" },
                    new Place() { Name="Vịnh Hạ Long", Thumbnail="/Images/PlaceImages/VinhHaLong.jpg" },
                };

                return result;
            }
        }

        BindingList<Place> _list = new BindingList<Place>();

        Place selected;
        List<Place> list;

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            _list = PlaceDao.GetAll();
            dataListView.ItemsSource = _list;
        }

        private void dataListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            selected = dataListView.SelectedItem as Place;

            MessageBox.Show(selected.Name);
        }

        private void DetailButton_Click(object sender, RoutedEventArgs e)
        {
            selected = (sender as Button).DataContext as Place;

            MessageBox.Show(selected.Name);
        }

        private void UpdateButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void FlagButton_Click(object sender, RoutedEventArgs e)
        {

        }

    }
}

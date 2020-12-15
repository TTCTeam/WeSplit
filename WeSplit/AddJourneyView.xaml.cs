using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
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

namespace TestUserControl
{
    /// <summary>
    /// Interaction logic for View1.xaml
    /// </summary>
    public partial class AddJourneyView : UserControl
    {

        BindingList<Member> members;
        BindingList<Image> images;
        public AddJourneyView()
        {
            InitializeComponent();
            
            
        }

        class Image
        {
            public String ImagePath { get; set; }
        }

        class Paying
        {
            public String PayingFor { get; set; }
            public int Cost { get; set; }
        }

        class Member
        {
            public int ID { get; set; }
            public String Name { get; set; }
            public BindingList<Paying> PayingList { get; set; }
        }

        private void ListView_LostFocus(object sender, RoutedEventArgs e)
        {
            (sender as ListView).SelectedIndex = -1;
        }

        private void addPayingButton_Click(object sender, RoutedEventArgs e)
        {
            Member member = (Member)(sender as Button).Tag;
            member.PayingList.Add(new Paying());
            
        }

        private void addMemberButton_Click(object sender, RoutedEventArgs e)
        {
            members.Add(new Member { ID = members.Count, Name = "", PayingList = new BindingList<Paying>() });
        }

        private void removeImageButton_Click(object sender, RoutedEventArgs e)
        {
            BindingList<Image> images = imagesListView.ItemsSource as BindingList<Image>;
            Image thisImage = (Image)(sender as Button).DataContext;
            images.Remove(thisImage);
        }

        private void removePayingButton_Click(object sender, RoutedEventArgs e)
        {
            int memberID =(int) ((sender as Button).Parent as StackPanel).Tag;
            Paying thisPaying = (Paying)(sender as Button).DataContext;
            members[memberID].PayingList.Remove(thisPaying);
        }

        
        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            images = new BindingList<Image> { new Image { ImagePath = "Images/avt.jpg" }, new Image { ImagePath = "Images/avt.jpg" }, new Image { ImagePath = "Images/avt.jpg" }, new Image { ImagePath = "Images/avt.jpg" }, new Image { ImagePath = "Images/avt.jpg" }, new Image { ImagePath = "Images/avt.jpg" }, new Image { ImagePath = "Images/avt.jpg" }, new Image { ImagePath = "Images/avt.jpg" }, new Image { ImagePath = "Images/avt.jpg" }, new Image { ImagePath = "Images/avt.jpg" } };
            imagesListView.ItemsSource = images;

            List<Paying> payings = new List<Paying> { new Paying { PayingFor = "Kem Đánh Răng", Cost = 20000 }, new Paying { PayingFor = "Kem Đánh Răng", Cost = 20000 }, new Paying { PayingFor = "Kem Đánh Răng", Cost = 20000 }, new Paying { PayingFor = "Kem Đánh Răng", Cost = 20000 } };
            List<Paying> payings1 = new List<Paying> { new Paying { PayingFor = "Kem Đánh Răng", Cost = 20000 }, new Paying { PayingFor = "Kem Đánh Răng", Cost = 20000 }, new Paying { PayingFor = "Kem Đánh Răng", Cost = 20000 }, new Paying { PayingFor = "Kem Đánh Răng", Cost = 20000 } };
            members = new BindingList<Member> { new Member { ID = 0, Name = "Đoàn Minh Tân", PayingList = new BindingList<Paying>(payings) }, new Member { ID = 1, Name = "dmt", PayingList = new BindingList<Paying>(payings1) } };
            memberListView.ItemsSource = members;
            string[] status = new string[] { "Đang đi", "Đã đi", "Đã thanh toán", "Đã đi", "Đã thanh toán", "Đã đi", "Đã thanh toán", "Đã đi", "Đã thanh toán" };
            statusComboBox.ItemsSource = status;
           
        }

        private void routeDataGrid_Loaded(object sender, RoutedEventArgs e)
        {
            DataTable route = new DataTable();
            route.Columns.Add("StopPoint");
            route.Columns.Add("ArrivalTime");
            route.Columns.Add("LeavingTime");
            route.Rows.Add(new object[] { "Vĩnh Kim", "12/12/2020", "13/12/2020" });
            route.Rows.Add(new object[] { "Vĩnh Kim", "12/12/2020", "13/12/2020" });
            route.Rows.Add(new object[] { "Vĩnh Kim", "12/12/2020", "13/12/2020" });
            route.Rows.Add(new object[] { "Vĩnh Kim", "12/12/2020", "13/12/2020" });
            route.Rows.Add(new object[] { "Vĩnh Kim", "12/12/2020", "13/12/2020" });
            route.Rows.Add(new object[] { "Vĩnh Kim", "12/12/2020", "13/12/2020" });
            route.Rows.Add(new object[] { "Vĩnh Kim", "12/12/2020", "13/12/2020" });
            route.Rows.Add(new object[] { "Vĩnh Kim", "12/12/2020", "13/12/2020" });
            route.Rows.Add(new object[] { "Vĩnh Kim", "12/12/2020", "13/12/2020" });
            route.Rows.Add(new object[] { "Vĩnh Kim", "12/12/2020", "13/12/2020" });
            route.Rows.Add(new object[] { "Vĩnh Kim", "12/12/2020", "13/12/2020" });
            route.Rows.Add(new object[] { "Vĩnh Kim", "12/12/2020", "13/12/2020" });
            routeDataGrid.ItemsSource = route.DefaultView;
        }

        private void imagesListView_Drop(object sender, DragEventArgs e)
        {
            string[] filePaths = (string[])e.Data.GetData(DataFormats.FileDrop, false);

            if (images == null)
            {
                images = new BindingList<Image>();
            }

            foreach (var filePath in filePaths)
            {
                images.Add(new Image { ImagePath = filePath });
            }
        }

        private void imagesListView_DragOver(object sender, DragEventArgs e)
        {
            bool dropEnabled = true;
            if (e.Data.GetDataPresent(DataFormats.FileDrop, true))
            {
                string[] filenames = e.Data.GetData(DataFormats.FileDrop, true) as string[];
                string[] fileExtensions = new string[] { ".jpg", ".jpeg", ".jpe", ".png" };

                foreach (string filename in filenames)
                {
                    if (!fileExtensions.Contains(System.IO.Path.GetExtension(filename).ToLowerInvariant()))
                    {
                        dropEnabled = false;
                        break;
                    }
                }
            }
            else
            {
                dropEnabled = false;
            }

            if (!dropEnabled)
            {
                e.Effects = DragDropEffects.None;
                e.Handled = true;
            }
        }


        private void addImageButton_Click(object sender, RoutedEventArgs e)
        {
            var openFileDialog = new OpenFileDialog();
            openFileDialog.Multiselect = true;
            openFileDialog.Filter = "Image files (*.jpg, *.jpeg, *.jpe, *.png) | *.jpg; *.jpeg; *.jpe; *.png";

            if (openFileDialog.ShowDialog() == true)
            {
                var files = openFileDialog.FileNames;
                if (images == null)
                {
                    images = new BindingList<Image>();
                }

                foreach (var file in files)
                {
                    images.Add(new Image { ImagePath = file });
                }

            }
        }

    }
}

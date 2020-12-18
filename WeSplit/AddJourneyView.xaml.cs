using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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

namespace WeSplit
{
    /// <summary>
    /// Interaction logic for AddJourneyView.xaml
    /// </summary>
    public partial class AddJourneyView : UserControl
    {

        private Trip Trip { get; set; }
        private WeSplitEntities DB { get; set; }

        private int TripIdUpdate { get; set; }

        public delegate void SwitchViewCallback(int index);
        public event SwitchViewCallback Handler;

        public AddJourneyView()
        {
            InitializeComponent();
            TripIdUpdate = -1;
            contentLable.Content = "THÊM CHUYẾN ĐI";
        }

        public AddJourneyView(int tripID)
        {
            InitializeComponent();
            TripIdUpdate = tripID;
            contentLable.Content = "CẬP NHẬT CHUYẾN ĐI";
        }

        private void ListView_LostFocus(object sender, RoutedEventArgs e)
        {
            (sender as ListView).SelectedIndex = -1;
        }

        private void addPaymentButton_Click(object sender, RoutedEventArgs e)
        {
            Member member = (Member)(((sender as Button).Parent) as StackPanel).DataContext;
            member.Payments.Add(new Payment());

        }

        private void addMemberButton_Click(object sender, RoutedEventArgs e)
        {
            Trip.Members.Add(new Member { Payments = new ObservableCollection<Payment>() });
        }

        private void removeImageButton_Click(object sender, RoutedEventArgs e)
        {
            ObservableCollection<Image> images = imagesListView.ItemsSource as ObservableCollection<Image>;
            Image thisImage = (Image)(sender as Button).DataContext;
            images.Remove(thisImage);
        }

        private void removePayingButton_Click(object sender, RoutedEventArgs e)
        {
            Member member = (Member)(((sender as Button).Parent) as StackPanel).Tag;
            Payment thisPayment = (Payment)(sender as Button).DataContext;
            member.Payments.Remove(thisPayment);
        }


        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {

            DB = new WeSplitEntities();
            var statusDescriptions = DB.StatusDescriptions.Select((s) => s.Description).ToList();
            statusComboBox.ItemsSource = statusDescriptions;

            if (TripIdUpdate == -1)
            {
                Trip = new Trip { Status = 0, Members = new ObservableCollection<Member>(), Images = new ObservableCollection<Image>(), Waypoints = new ObservableCollection<Waypoint>() };
            }
            else
            {
                Trip = DB.Trips.Find(TripIdUpdate);

            }
            this.DataContext = Trip;
        }

        private void imagesListView_Drop(object sender, DragEventArgs e)
        {
            string[] filePaths = (string[])e.Data.GetData(DataFormats.FileDrop, false);

            if (Trip.Images == null)
            {
                Trip.Images = new ObservableCollection<Image>();
            }

            foreach (var filePath in filePaths)
            {
                Trip.Images.Add(new Image { ImagePath = filePath });
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
                if (Trip.Images == null)
                {
                    Trip.Images = new ObservableCollection<Image>();
                }

                foreach (var file in files)
                {
                    Trip.Images.Add(new Image { ImagePath = file });
                }

            }
        }

        private void showRouteToggleButton_Checked(object sender, RoutedEventArgs e)
        {
            imagesListView.Visibility = Visibility.Collapsed;
            addImageButton.Visibility = Visibility.Hidden;
            imagesStackPanel.Background = Brushes.Transparent;
            showRouteDataGridEffect.Visibility = Visibility.Visible;
        }

        private void showRouteToggleButton_Unchecked(object sender, RoutedEventArgs e)
        {
            imagesListView.Visibility = Visibility.Visible;
            addImageButton.Visibility = Visibility.Visible;
            imagesStackPanel.Background = Brushes.DarkSlateGray;
            showRouteDataGridEffect.Visibility = Visibility.Collapsed;
        }

        private void saveButton_Click(object sender, RoutedEventArgs e)
        {
            if (TripIdUpdate == -1)
            {
                //save Images
                DB.Trips.Add(Trip);
                DB.SaveChanges();
            }
            else
            {
                DB.SaveChanges();
            }


            //return to homescreen
            Handler?.Invoke(0);

        }

        private void cancelButton_Click(object sender, RoutedEventArgs e)
        {
            //return to homescreen
            Handler?.Invoke(0);


        }


        private void removeMemberButton_Click(object sender, RoutedEventArgs e)
        {
            var result = MessageBox.Show("Bạn có muốn xoá thành viên đã chọn?", "Cảnh báo", MessageBoxButton.YesNo, MessageBoxImage.Warning);

            if (result==MessageBoxResult.Yes)
            {
                Member member = (Member)memberListView.SelectedItem;
                Trip.Members.Remove(member);
            }
        }
    }
}

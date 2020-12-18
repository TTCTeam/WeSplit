﻿using System;
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
using WeSplit.DAO;

namespace WeSplit
{
    /// <summary>
    /// Interaction logic for HomeScreenUserControl.xaml
    /// </summary>
    public partial class HomeScreenUserControl : UserControl, INotifyPropertyChanged
    {
        public HomeScreenUserControl()
        {
            InitializeComponent();
        }

        WeSplitEntities DB = new WeSplitEntities();

        List<Trip> _oldTrips;

        List<Trip> _newTrips;

        Trip selected;

        public event PropertyChangedEventHandler PropertyChanged;

        void displayTrip()
        {
            var keyword = SearchBox.Text;

            _oldTrips = TripDAO.Instance.GetTrips(1, keyword, DB);
            _newTrips = TripDAO.Instance.GetTrips(0, keyword, DB);
            oldDataListView.ItemsSource = _oldTrips;
            newDataListView.ItemsSource = _newTrips;
        }

        private void SearchBox_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                displayTrip();
            }
        }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            displayTrip();
        }

        private void oldDataListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            //selected = oldDataListView.SelectedItem as Place;

            //MessageBox.Show(selected.Name);
        }

        private void newDataListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            //selected = newDataListView.SelectedItem as Place;

            //MessageBox.Show(selected.Name);
        }

        private void OldDetailButton_Click(object sender, RoutedEventArgs e)
        {
            //selected = (sender as Button).DataContext as Place;

            //MessageBox.Show(selected.Name);
        }

        private void NewDetailButton_Click(object sender, RoutedEventArgs e)
        {
            //selected = (sender as Button).DataContext as Place;

            //MessageBox.Show(selected.Name);
        }

        private void OldUpdateButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void NewUpdateButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void OldFlagButton_Click(object sender, RoutedEventArgs e)
        {
            var bt = sender as Button;
            var item = bt.DataContext;

            selected = item as Trip;
            selected.Status = 0;

            TripDAO.Instance.SetStatus(selected, DB);
            displayTrip();
        }

        private void NewFlagButton_Click(object sender, RoutedEventArgs e)

        {
            var bt = sender as Button;
            var item = bt.DataContext;

            selected = item as Trip;
            selected.Status = 1;

            TripDAO.Instance.SetStatus(selected, DB);
            displayTrip();
        }
    }
}

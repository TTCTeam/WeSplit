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

namespace WeSplit
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        int TripID_detail;
        bool isDetailView = false;
        HomeScreenUserControl homeScreen;
        public MainWindow()
        {
            InitializeComponent();
        }

        
        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            var mess = MessageBox.Show("Do you want to exit ?", "Notification", MessageBoxButton.YesNo, MessageBoxImage.Question, MessageBoxResult.No);
            if (mess == MessageBoxResult.Yes)
            {
                Application.Current.Shutdown();
            }
        }

        private void Sleep(int v)
        {
            throw new NotImplementedException();
        }

        private void Grid_MouseDown(object sender, MouseButtonEventArgs e)
        {
            DragMove();
        }

        private void ListViewMenu_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            int index = ListViewMenu.SelectedIndex;
            
            switch (index)
            {
                case 0:
                    if (isDetailView == true)
                    {
                        GridPrincipal.Children.Clear();
                        DetailScreen detailScreen = new DetailScreen(TripID_detail);
                        detailScreen.Handler += switchDetailView;
                        GridPrincipal.Children.Add(detailScreen);
                    }
                    else
                    {
                        GridPrincipal.Children.Clear();
                        homeScreen = new HomeScreenUserControl();
                        homeScreen.Handler += callDetailView;
                        homeScreen.Handler1 += switchView;
                        GridPrincipal.Children.Add(homeScreen);
                    }
                    break;
                case 1:
                    GridPrincipal.Children.Clear();
                    AddJourneyView addJourneyView = new AddJourneyView();
                    addJourneyView.Handler += switchView;
                    GridPrincipal.Children.Add(addJourneyView);
                    break;
                case 4:
                    GridPrincipal.Children.Clear();
                    GridPrincipal.Children.Add(new AboutScreen());
                    break;
                default:
                    ListViewMenu.SelectedIndex = 0;
                    break;
            }
        }

        private void callDetailView(int TripID, int index, bool isDetail)
        {
            TripID_detail = TripID;
            this.isDetailView = isDetail;
            ListViewMenu.SelectedIndex = index;
        }

        private void switchDetailView(int index, bool isDetail)
        {
            isDetailView = isDetail;
            ListViewMenu.SelectedIndex = index;

        }

        private void switchView(int index, bool isChangeData)
        {

            if (isChangeData)
            {
                homeScreen = null;
            }
            ListViewMenu.SelectedIndex = 0;
        }

        private void switchView(int viewIndex, int tripID)
        {
            
            switch (viewIndex)
            {
                case 3:
                    GridPrincipal.Children.Clear();
                    AddJourneyView updateJourneyView = new AddJourneyView(tripID);
                    updateJourneyView.Handler += switchView;
                    GridPrincipal.Children.Add(updateJourneyView);
                    break;
                default:
                    break;
            }
        }

        private void ButtonOpenMenu_Click(object sender, RoutedEventArgs e)
        {
            ButtonCloseMenu.Visibility = Visibility.Visible;
            ButtonOpenMenu.Visibility = Visibility.Collapsed;
        }

        private void ButtonCloseMenu_Click(object sender, RoutedEventArgs e)
        {
            ButtonCloseMenu.Visibility = Visibility.Collapsed;
            ButtonOpenMenu.Visibility = Visibility.Visible;
        }

        private void MinimizeButton_Click(object sender, RoutedEventArgs e)
        {
            WindowState = WindowState.Minimized;
        }

        private void MaximizeButton_Click(object sender, RoutedEventArgs e)
        {
            if (WindowState == WindowState.Maximized)
            {
                WindowState = WindowState.Normal;
                Maximize.Kind = MaterialDesignThemes.Wpf.PackIconKind.WindowMaximize;
            }
            else
            {
                WindowState = WindowState.Maximized;
                Maximize.Kind = MaterialDesignThemes.Wpf.PackIconKind.WindowRestore;
            }
        }
    }
}

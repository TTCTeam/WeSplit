using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace WeSplit
{
    class FlagConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            const string redFlagPath = "Images\\red-flag.png";
            const string whiteFlagPath = "Images\\white-flag.png";
            string folder = AppDomain.CurrentDomain.BaseDirectory;
            string absolutePath = "";

            int status = (int)value;

            if (status == 1)
            {
                absolutePath = $"{folder}{whiteFlagPath}";
            }
            else if (status == 2)
            {
                absolutePath = $"{folder}{redFlagPath}";
            }

            return absolutePath;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}

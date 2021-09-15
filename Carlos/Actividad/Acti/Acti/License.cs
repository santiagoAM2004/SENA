using System;
using System.Collections.Generic;
using System.Text;

namespace Acti
{
    class License : User
    {
        public string photo { get; set; }
        public string barcode { get; set; }


        public License(string Name, string Id, string Last_name, string Gender, string Role, string Id_type, string RH, string Photo, string Barcode)
        {
            name = Name;
            id = Id;
            last_name = Last_name;
            gender = Gender;
            role = Role;
            id_type = Id_type;
            rh = RH;
            photo = Photo;
            barcode = Barcode;
        }
    }
}

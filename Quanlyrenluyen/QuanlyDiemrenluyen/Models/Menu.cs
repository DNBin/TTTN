using System;
using System.Collections.Generic;

namespace QuanlyDiemrenluyen.Models
{
    public partial class Menu
    {
        public Menu()
        {
            QuyenMenu = new HashSet<QuyenMenu>();
        }

        public int MenuId { get; set; }
        public string TenMenu { get; set; }
        public long? ParentId { get; set; }
        public int? OrderKey { get; set; }
        public bool? IsDelete { get; set; }
        public string Path { get; set; }

        public virtual ICollection<QuyenMenu> QuyenMenu { get; set; }
    }
}

using System;
using System.Collections.Generic;

namespace QuanlyDiemrenluyen.Models
{
    public partial class Quyen
    {
        public Quyen()
        {
            QuyenMenu = new HashSet<QuyenMenu>();
            TaiKhoanQuyen = new HashSet<TaiKhoanQuyen>();

        }

        public int MaQuyen { get; set; }
        public string TenQuyen { get; set; }
        public string MoTa { get; set; }
        public bool? IsDelete { get; set; }

        public virtual ICollection<QuyenMenu> QuyenMenu { get; set; }
        public virtual ICollection<TaiKhoanQuyen> TaiKhoanQuyen { get; set; }


    }
}

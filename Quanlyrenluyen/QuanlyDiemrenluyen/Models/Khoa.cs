using System;
using System.Collections.Generic;

namespace QuanlyDiemrenluyen.Models
{
    public partial class Khoa
    {
        public Khoa()
        {
            Lop = new HashSet<Lop>();
            TaiKhoan = new HashSet<TaiKhoan>();
        }

        public int MaKhoa { get; set; }
        public string TenKhoa { get; set; }
        public bool? IsDelete { get; set; }

        public virtual ICollection<Lop> Lop { get; set; }
        public virtual ICollection<TaiKhoan> TaiKhoan { get; set; }
    }
}

using System;
using System.Collections.Generic;

namespace QuanlyDiemrenluyen.Models
{
    public partial class Lop
    {
        public Lop()
        {
            TaiKhoan = new HashSet<TaiKhoan>();
            LopKyDangKy = new HashSet<LopKyDangKy>();

        }

        public int MaLop { get; set; }
        public string TenLop { get; set; }
        public int? MaKhoa { get; set; }
        public bool? IsDelete { get; set; }

        public virtual Khoa MaKhoaNavigation { get; set; }
        public virtual ICollection<LopKyDangKy> LopKyDangKy { get; set; }
        public virtual ICollection<TaiKhoan> TaiKhoan { get; set; }
    }
}

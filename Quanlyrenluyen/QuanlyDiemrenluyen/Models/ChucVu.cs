using System;
using System.Collections.Generic;

namespace QuanlyDiemrenluyen.Models
{
    public partial class ChucVu
    {
        public ChucVu()
        {
            TaiKhoan = new HashSet<TaiKhoan>();
        }

        public int ChucVuId { get; set; }
        public string TenChucVu { get; set; }
        public bool? IsDelete { get; set; }
        public bool? Loai { get; set; }

        public virtual ICollection<TaiKhoan> TaiKhoan { get; set; }

    }
}

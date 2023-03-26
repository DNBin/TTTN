using System;
using System.Collections.Generic;

namespace QuanlyDiemrenluyen.Models
{
    public partial class TaiKhoanThongBao
    {
        public int Id { get; set; }
        public int? TaiKhoanId { get; set; }
        public int? ThongBaoId { get; set; }
        public int? TrangThai { get; set; }
        public bool? IsDelete { get; set; }

        public virtual TaiKhoan TaiKhoan { get; set; }
        public virtual ThongBao ThongBao { get; set; }
    }
}

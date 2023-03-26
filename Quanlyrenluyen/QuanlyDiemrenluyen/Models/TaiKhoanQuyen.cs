using System;
using System.Collections.Generic;

namespace QuanlyDiemrenluyen.Models
{
    public partial class TaiKhoanQuyen
    {
        public int Id { get; set; }
        public int? TaiKhoanId { get; set; }
        public int? MaQuyen { get; set; }
        public bool? IsDelete { get; set; }

        public virtual Quyen MaQuyenNavigation { get; set; }
        public virtual TaiKhoan TaiKhoan { get; set; }
    }
}

using System;
using System.Collections.Generic;

namespace QuanlyDiemrenluyen.Models
{
    public partial class ThongBao
    {
        public ThongBao()
        {
            TaiKhoanThongBao = new HashSet<TaiKhoanThongBao>();
        }

        public int ThongBaoId { get; set; }
        public DateTime? NgayThongBao { get; set; }
        public string NoiDungTb { get; set; }
        public string TieuDe { get; set; }
        public int? KyDkid { get; set; }
        public bool? IsDelete { get; set; }

        public virtual KyDangKy KyDk { get; set; }
        public virtual ICollection<TaiKhoanThongBao> TaiKhoanThongBao { get; set; }
    }
}

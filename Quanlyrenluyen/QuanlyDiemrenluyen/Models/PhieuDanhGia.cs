using System;
using System.Collections.Generic;

namespace QuanlyDiemrenluyen.Models
{
    public partial class PhieuDanhGia
    {
        public PhieuDanhGia()
        {
            Diem = new HashSet<Diem>();
        }

        public int PhieuId { get; set; }
        public int? SinhVienId { get; set; }
        public int? CanBoLopId { get; set; }
        public int? CanBoId { get; set; }
        public DateTime? NgayDanhGia { get; set; }
        public int? KyDkid { get; set; }
        public string TenPhieu { get; set; }
        public bool? IsDelete { get; set; }
        public int? DiemTong { get; set; }
        public int? DiemTongSV { get; set; }
        public int? DiemTongCBL { get; set; }

        public virtual TaiKhoan SinhVien { get; set; }
        public virtual KyDangKy KyDangKy { get; set; }
        public virtual ICollection<Diem> Diem { get; set; }

    }
}

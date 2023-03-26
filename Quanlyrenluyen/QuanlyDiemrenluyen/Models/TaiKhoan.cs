using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace QuanlyDiemrenluyen.Models
{
    public partial class TaiKhoan
    {
        public TaiKhoan()
        {
            TaiKhoanQuyen = new HashSet<TaiKhoanQuyen>();
            TaiKhoanThongBao = new HashSet<TaiKhoanThongBao>();
            PhieuDanhGia = new HashSet<PhieuDanhGia>();
        }
        public int TaiKhoanId { get; set; }
        public string TenTaiKhoan { get; set; }
        public string MatKhau { get; set; }
        public bool? IsDelete { get; set; }
        public DateTime? NgayTao { get; set; }
        public string HoTen { get; set; }
        public string SoDienThoai { get; set; }
        public string Email { get; set; }
        public string DiaChi { get; set; }
        public string HinhAnh { get; set; }
        public string MaTaiKhoan { get; set; }
        public int? ChucVuId { get; set; }
        public int? MaLop { get; set; }
        public int? MaKhoa { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime? NgaySinh { get; set; }

        public virtual ChucVu ChucVu { get; set; }
        public virtual Khoa MaKhoaNavigation { get; set; }
        public virtual Lop MaLopNavigation { get; set; }
        public virtual ICollection<TaiKhoanQuyen> TaiKhoanQuyen { get; set; }
        public virtual ICollection<TaiKhoanThongBao> TaiKhoanThongBao { get; set; }
        public virtual ICollection<PhieuDanhGia> PhieuDanhGia { get; set; }
    }
}

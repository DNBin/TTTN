using QuanlyDiemrenluyen.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.ViewModels
{
    public class TaiKhoanVM
    {
        public int TaiKhoanID { get; set; }
        public string TenTaiKhoan { get; set; }
        public string MatKhau { get; set; }
        public bool? IsDelete { get; set; }
        public DateTime? NgayTao { get; set; }
        public string HoTen { get; set; }
        public string SoDienThoai { get; set; }
        public string Email { get; set; }
        public string DiaChi { get; set; }
        public int? PhieuId { get; set; }
        public string HinhAnh { get; set; }
        public string MaTaiKhoan { get; set; }
        public int? ChucVuId { get; set; }
        public int? MaLop { get; set; }
        public string TenLop { get; set; }
        public int? MaKhoa { get; set; }
        public string TenKhoa { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime? NgaySinh { get; set; }
        public int MaQuyen { get; set; }
        public string TenQuyen { get; set; }
        public string[] MaQuyenList { get; set; }
        public List<Quyen> DsQuyen { get; set; }
    }
}
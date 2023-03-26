using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.ViewModels
{
    public class DanhSachSinhVienVM
    {
        public int TaiKhoanId { get; set; }
        public string HoTen { get; set; }
        public int? TrangThai { get; set; }
        public string MaTaiKhoan { get; set; }
        public int PhieuId { get; set; }
        public string TenPhieu { get; set; }
        public int DiemId { get; set; }
        public int? DiemSv { get; set; }
        public int? DiemCbl { get; set; }
        public int? DiemCbk { get; set; }
        public int? TieuChiId { get; set; }
        public string HocKyXet { get; set; }
        public string NamXet { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime? NgayDanhGia { get; set; }
        public int? MaLop { get; set; }
        public string TenLop { get; set; }
        public int? DiemTong { get; set; }
        public int? DiemTongSV { get; set; }
        public int? DiemTongCBL { get; set; }
        public int? KyDKID { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime? NgaySinh { get; set; }

    }
}
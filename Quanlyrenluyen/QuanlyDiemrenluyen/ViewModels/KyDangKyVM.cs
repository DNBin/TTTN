using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using System.Web;

namespace QuanlyDiemrenluyen.ViewModels
{
    public class KyDangKyVM
    {
        public int Id { get; set; }
        public string HocKyXet { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime? NgayBD { get; set; }
        public DateTime? NgayKT { get; set; }
        public string NamXet { get; set; }
        public string TrangThai { get; set; }
        public string TieuDe { get; set; }
        public string NoiDung { get; set; }
        public int MaLop { get; set; }
        public string TenLop { get; set; }
        public int MaKhoa { get; set; }
        public int ThongBaoID { get; set; }
        public string TrangThaiTB { get; set; }
        public int TaiKhoanID { get; set; }
        public List<KyDangKyVM> GetLopByKhoa { get; set; }
        public string[] MaLopList { get; set; }
    }
}
using QuanlyDiemrenluyen.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.ViewModels
{
    public class DuyetDanhSachLopVM
    {
        public int MaLop { get; set; }
        public string TenLop { get; set; }
        public List<DanhSachSinhVienVM> DiemTong { get; set; }
        public List<TaiKhoan> TongSV { get; set; }
        public string TyLe { get; set; }


    }
}
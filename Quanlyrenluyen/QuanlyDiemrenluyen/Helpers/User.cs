using QuanlyDiemrenluyen.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.Helpers
{
    public class User
    {
        public int Id { get; set; }
        public string MaSV { get; set; }
        public string TenTaiKhoan { get; set; }
        public string HoTen { get; set; }
        public string HinhAnh { get; set; }
        public List<Quyen> DsQuyen { get; set; }
        public int? MaQuyen { get; set; }
        public string TenQuyen { get; set; }
        public int ChucVuID { get; set; }
        public string TenChucVu { get; set; }
        public int MaLop { get; set; }
        public string TenLop { get; set; }
        public int MaKhoa { get; set; }
        public string TenKhoa { get; set; }
        public string MaGV { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime? NgaySinh { get; set; }
        public string Email { set; get; }
        public string SDT { get; set; }
        public string Diachi { get; set; }
    }
}
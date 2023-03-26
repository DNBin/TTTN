using QuanlyDiemrenluyen.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.ViewModels
{
    public class PhieuDanhGiaVM
    {
        public int PhieuId { get; set; }
        public int? SinhVienId { get; set; }
        public int? CanBoLopId { get; set; }
        public int? CanBoId { get; set; }
        public DateTime? NgayDanhGia { get; set; }
        public int? KyDkid { get; set; }
        public string TenPhieu { get; set; }
        public int DiemId { get; set; }
        public int? DiemSv { get; set; }
        public int? DiemCbl { get; set; }
        public int? DiemCbk { get; set; }
        public int? TieuChiId { get; set; }
        public string TenTieuChi { get; set; }
        public long? ParentId { get; set; }
        public int? DiemTieuChi { get; set; }
        public int? OrderKey { get; set; }
        public string HocKyXet { get; set; }
        public string NamXet { get; set; }
        public List<PhieuDanhGiaVM> NhapDiemSV { get; set; }
        public List<TieuChi> TieuChis { get; set; }
    }
}
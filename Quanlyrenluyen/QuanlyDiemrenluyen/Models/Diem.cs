using System;
using System.Collections.Generic;

namespace QuanlyDiemrenluyen.Models
{
    public partial class Diem
    {
        public int DiemId { get; set; }
        public int? PhieuId { get; set; }
        public int? DiemSv { get; set; }
        public int? DiemCbl { get; set; }
        public int? DiemCbk { get; set; }
        public int? TieuChiId { get; set; }
        public bool? IsDelete { get; set; }

        public virtual PhieuDanhGia Phieu { get; set; }
        public virtual TieuChi TieuChi { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace QuanlyDiemrenluyen.Models
{
    public partial class KyDangKy
    {
        public KyDangKy()
        {
            LopKyDangKy = new HashSet<LopKyDangKy>();
            ThongBao = new HashSet<ThongBao>();
            PhieuDanhGia = new HashSet<PhieuDanhGia>();
        }

        public int KyDkid { get; set; }
        public string HocKyXet { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime? NgayBd { get; set; }
        public DateTime? NgayKt { get; set; }
        public string NamXet { get; set; }
        public int TrangThai { get; set; }
        public string TieuDeDk { get; set; }
        public bool? IsDelete { get; set; }
        public string NoiDungDk { get; set; }
        public virtual ICollection<LopKyDangKy> LopKyDangKy { get; set; }
        public virtual ICollection<ThongBao> ThongBao { get; set; }
        public virtual ICollection<PhieuDanhGia> PhieuDanhGia { get; set; }

    }
}

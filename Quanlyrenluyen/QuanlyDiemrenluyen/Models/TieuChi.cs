using System;
using System.Collections.Generic;

namespace QuanlyDiemrenluyen.Models
{
    public partial class TieuChi
    {
        public TieuChi()
        {
            Diem = new HashSet<Diem>();
        }

        public int TieuChiId { get; set; }
        public string TenTieuChi { get; set; }
        public long? ParentId { get; set; }
        public int? DiemTieuChi { get; set; }
        public int? OrderKey { get; set; }
        public bool? IsDelete { get; set; }

        public virtual ICollection<Diem> Diem { get; set; }
    }
}

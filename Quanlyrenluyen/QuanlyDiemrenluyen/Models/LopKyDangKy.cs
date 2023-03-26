using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanlyDiemrenluyen.Models
{
    public partial class LopKyDangKy
    {
        public int Id { get; set; }
        public int? MaLop { get; set; }
        public int? KyDkid { get; set; }
        public int? MaKhoa { get; set; }
        public bool? IsDelete { get; set; }

        public virtual KyDangKy KyDk { get; set; }
        public virtual Lop MaLopNavigation { get; set; }
    }
}

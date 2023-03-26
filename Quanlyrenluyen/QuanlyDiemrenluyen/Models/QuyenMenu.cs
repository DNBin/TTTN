using System;
using System.Collections.Generic;

namespace QuanlyDiemrenluyen.Models
{
    public partial class QuyenMenu
    {
        public int QuyenMenuId { get; set; }
        public int? MaQuyen { get; set; }
        public int? MenuId { get; set; }
        public bool? IsDelete { get; set; }

        public virtual Quyen MaQuyenNavigation { get; set; }
        public virtual Menu Menu { get; set; }
    }
}

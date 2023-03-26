using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.Helpers
{
    public enum EnumThongBao
    {
        [Display(Name = "Chưa khởi tạo")]
        KhoiTao = 1,
        [Display(Name = "Đang xử lý")]
        DangXuLy = 2,
        [Display(Name = "Cán bộ lớp đang chấm điểm")]
        CanBoLopXet = 3,
        [Display(Name = "Cán bộ khoa đang chấm điểm")]
        CanboKhoaXet = 4,
        [Display(Name = "Hoàn thành")]
        HoanThanh = 5,
    }
    public enum EnumKyDangKy
    {
        [Display(Name = "Đã mở")]
        DaMo = 1,
        [Display(Name = "Đã kết thúc")]
        DaKetThuc = 2
    }
}
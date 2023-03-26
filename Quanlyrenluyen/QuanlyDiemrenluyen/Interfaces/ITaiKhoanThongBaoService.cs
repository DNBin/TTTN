using QuanlyDiemrenluyen.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.Interfaces
{
    public interface ITaiKhoanThongBaoService
    {
        List<DuyetDanhSachLopVM> GetLopByCBK(int KyDKID, int MaKhoa);
        List<DanhSachSinhVienVM> GetSVByCBK(int KyDKID, int MaLop);
    }
}
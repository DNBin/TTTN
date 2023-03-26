using QuanlyDiemrenluyen.Models;
using QuanlyDiemrenluyen.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.Interfaces
{
    public interface IThongBaoService
    {
        //List<ThongBao> Get();
        //ThongBao GetById(int id);
        //void Create(ThongBao model);
        //void Update(ThongBao model);
        //void Delete(ThongBao model);
        void UpdateTrangThai(KyDangKyVM model);
        void TrangThaiXetDuyet(List<PhieuDanhGiaVM> model, int TaiKhoanID);
        void TrangThaiCanBoDuyet(List<PhieuDanhGiaVM> model);
    }
}
using QuanlyDiemrenluyen.Models;
using QuanlyDiemrenluyen.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.Interfaces
{
    public interface IDiemService
    {
        List<Diem> Get();
        List<Diem> GetByDiem(int id);
        Diem GetById(int id);
        void Create(KyDangKyVM model, int idPhieu);
        void UpdateDiem(List<PhieuDanhGiaVM> model);
        void UpdateDiemTongCBL(List<PhieuDanhGiaVM> model);
        void UpdateDiemTongSV(List<PhieuDanhGiaVM> model);
        //void Delete(Diem model);
    }
}
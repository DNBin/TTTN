using QuanlyDiemrenluyen.Models;
using QuanlyDiemrenluyen.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.Interfaces
{
    public interface ILopService
    {
        List<Lop> Get();
        List<Lop> GetLopByKhoa(int? MaKhoa);
        Lop GetById(int id);
        void Create(Lop model);
        void Update(Lop model);
        void Delete(Lop model);
        List<Lop> GetLop(int MaKhoa);
        List<DuyetDanhSachLopVM> XuatPhieu(int KyDKID, int MaKhoa);
        string hocky(int KyDKID);
        string namxet(int KyDKID);
        List<DuyetDanhSachLopVM> XepLoai(int MaKhoa);
    }
}
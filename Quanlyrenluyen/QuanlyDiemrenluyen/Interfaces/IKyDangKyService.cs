using QuanlyDiemrenluyen.Models;
using QuanlyDiemrenluyen.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.Interfaces
{
    public interface IKyDangKyService
    {
        List<KyDangKy> Get();
        KyDangKy GetById(int id);
        int Create(KyDangKyVM model,int MaKhoa);
        int AddThongBao(KyDangKyVM model, int KyDKID);
        void AddThongBaoToTaiKhoan(KyDangKyVM model, int TBID);
        void Update(KyDangKy model);
        int Delete(KyDangKy model);
        int DeleteThongBao(int id);
        void DeleteThongBaoToTaiKhoan(int id);
        List<KyDangKy> GetByCanBoLop(int MaLop);
        List<KyDangKy> GetByCanBoKhoa(int MaKhoa);
        List<DanhSachSinhVienVM> GetBySinhVien(int MaLop, int TaiKhoanID);
        List<KyDangKy> GetByKhoa(int MaKhoa);
    }
}
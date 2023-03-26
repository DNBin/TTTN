using QuanlyDiemrenluyen.Helpers;
using QuanlyDiemrenluyen.Models;
using QuanlyDiemrenluyen.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.Interfaces
{
    public interface ITaiKhoanService
    {
        List<TaiKhoan> Get();
        List<TaiKhoan> GetByKhoa(int MaKhoa);
        TaiKhoan GetById(int id);
        int Create(TaiKhoanVM model);
        void SetPassword(int id);
        void AddTaiKhoanQuyen(TaiKhoanVM model,int id);
        void Update(TaiKhoanVM model);
        void UpdateTaiKhoanQuyen(TaiKhoanVM model);
        void Delete(TaiKhoanVM model);
        User SignIn(TaiKhoan model);
        ThongBao RequiredThongBao(int id);
        List<DanhSachSinhVienVM> GetSVByCBL(int KyDKID, int MaLop);
        List<TaiKhoanVM> GetTaiKhoan(int MaKhoa);
        TaiKhoanVM GetByIds(int id);
        List<DanhSachSinhVienVM> XuatPhieu(int KyDKID, int MaLop);
        List<TaiKhoan> GetSV(int MaKhoa);
        List<TaiKhoan> GetSVByLop(int MaLop);
        User QuyenSign(TaiKhoan model);
        void UpdatePassWord(TaiKhoan model);
        List<DanhSachSinhVienVM> XepLoai(int MaLop);
        void UploadImage(int TaiKhoanID, string fileName);
    }
}
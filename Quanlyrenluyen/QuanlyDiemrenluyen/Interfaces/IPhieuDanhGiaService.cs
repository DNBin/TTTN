using QuanlyDiemrenluyen.Models;
using QuanlyDiemrenluyen.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.Interfaces
{
    public interface IPhieuDanhGiaService
    {
        List<PhieuDanhGia> Get();
        List<PhieuDanhGia> GetByPhieu(int id);
        List<PhieuDanhGiaVM> GetPhieu(int MaKhoa, int TaiKhoanID);
        PhieuDanhGia GetById(int TaiKhoanID, int MaLop);
        int Create(KyDangKyVM model);
        PhieuDanhGia TimPhieu(KyDangKyVM model);
        void Update(KyDangKyVM model);
        string hocky(int MaKhoa, int TaiKhoanID);
        string namxet(int MaKhoa, int TaiKhoanID);
        void AddNgayDanhGia(List<PhieuDanhGiaVM> model);
        List<PhieuDanhGiaVM> GetPhieuByCBL(int MaLop, int TaiKhoanID);
        int kyid(int MaKhoa, int TaiKhoanID);
        List<PhieuDanhGiaVM> GetPhieuByCBK(int MaLop, int TaiKhoanID);
        void AddNguoiDuyet(List<PhieuDanhGiaVM> model, int TaiKhoanID);
        void AddCBKDuyet(List<PhieuDanhGiaVM> model, int TaiKhoanID);
        List<PhieuDanhGiaVM> GetPhieuHoanThanh(int MaLop, int TaiKhoanID);
        List<PhieuDanhGia> GetPhieuDuyet(int MaKhoa);
        List<PhieuDanhGia> GetPhieuChuaDuyet(int MaKhoa);
        List<PhieuDanhGia> GetPhieuDuyetByLop(int MaLop);
        List<PhieuDanhGia> GetPhieuChuaDuyetByLop(int MaLop);
        int KyDKMax(int MaLop);
        //void XuatExcelPhieu(int KyDKID, int TaiKhoanID, String fileName);
        //List<DanhSachSinhVienVM> ThongTinTongQuat(int KyDKID, int MaLop);
    }
}
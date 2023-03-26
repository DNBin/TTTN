using QuanlyDiemrenluyen.Data;
using QuanlyDiemrenluyen.Helpers;
using QuanlyDiemrenluyen.Interfaces;
using QuanlyDiemrenluyen.ViewModels;
using System;
using System.Data.Entity;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.Services
{
    public class ThongBaoService: IThongBaoService
    {
        private DataContext _context;
        public ThongBaoService(DataContext context)
        {
            _context = context;
        }
        public void UpdateTrangThai(KyDangKyVM model)
        {
            var kydkid = _context.LopKyDangKys.Where(x => x.MaKhoa == model.MaKhoa && x.IsDelete != true).Max(x => x.KyDkid);
            var entity = _context.TaiKhoanThongBaos.Include(x=>x.ThongBao).Where(x => x.TaiKhoanId == model.TaiKhoanID && x.ThongBao.KyDkid== kydkid /*&& x.TrangThai == (int)EnumThongBao.KhoiTao*/ && x.IsDelete != true).FirstOrDefault();
            if (entity == default)
                throw new Exception("Không tìm thấy dữ liệu.");
            entity.TrangThai = (int)EnumThongBao.DangXuLy;
            _context.SaveChanges();
        }

        public void TrangThaiXetDuyet(List<PhieuDanhGiaVM> model, int TaiKhoanID)
        {
            var phieu = model[0];
            var entity = _context.PhieuDanhGias.Where(x => x.PhieuId == phieu.PhieuId && x.IsDelete != true).FirstOrDefault();
            var kydkid = entity.KyDkid;
            var thongbaos = _context.ThongBaos.Where(x => x.KyDkid == kydkid && x.IsDelete != true).FirstOrDefault();
            var thongbaoid = thongbaos.ThongBaoId;
            var taikhoanthongbaos = _context.TaiKhoanThongBaos.Where(x => x.ThongBaoId == thongbaoid && x.IsDelete != true && x.TaiKhoanId == TaiKhoanID).FirstOrDefault();
            taikhoanthongbaos.TrangThai = (int)EnumThongBao.CanBoLopXet;
            _context.SaveChanges();
        }
        public void TrangThaiCanBoDuyet(List<PhieuDanhGiaVM> model)
        {
            var phieu = model[0];
            var sinhvien = _context.PhieuDanhGias.Where(x => x.PhieuId == phieu.PhieuId && x.IsDelete != true).FirstOrDefault().SinhVienId;
            var entity = _context.PhieuDanhGias.Where(x => x.PhieuId == phieu.PhieuId && x.IsDelete != true).FirstOrDefault();
            var kydkid = entity.KyDkid;
            var thongbaos = _context.ThongBaos.Where(x => x.KyDkid == kydkid && x.IsDelete != true).FirstOrDefault();
            var thongbaoid = thongbaos.ThongBaoId;
            var taikhoanthongbaos = _context.TaiKhoanThongBaos.Where(x => x.ThongBaoId == thongbaoid && x.IsDelete != true && x.TaiKhoanId == sinhvien).FirstOrDefault();
            if (phieu.DiemCbl != default)
            {
                taikhoanthongbaos.TrangThai = (int)EnumThongBao.CanboKhoaXet;
                _context.SaveChanges();
            }
            else if (phieu.DiemCbk != default)
            {
                taikhoanthongbaos.TrangThai = (int)EnumThongBao.HoanThanh;
                _context.SaveChanges();
            }
        }
    }
}
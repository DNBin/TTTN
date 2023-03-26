using QuanlyDiemrenluyen.Data;
using QuanlyDiemrenluyen.Helpers;
using QuanlyDiemrenluyen.Interfaces;
using QuanlyDiemrenluyen.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.Services
{
    public class TaiKhoanThongBaoService : ITaiKhoanThongBaoService
    {
        private DataContext _context;
        public TaiKhoanThongBaoService(DataContext context)
        {
            _context = context;
        }

        public List<DuyetDanhSachLopVM> GetLopByCBK(int KyDKID, int MaKhoa)
        {
            var data = new List<DuyetDanhSachLopVM>();
            var lops = _context.LopKyDangKys.Where(x => x.KyDkid == KyDKID && x.MaKhoa == MaKhoa && x.IsDelete != true).ToList();
            foreach (var item in lops)
            {
                var dslop = _context.Lops.Where(x => x.MaLop == item.MaLop && x.IsDelete != true).Select(x => new DuyetDanhSachLopVM()
                {
                    MaLop = x.MaLop,
                    TenLop = x.TenLop,
                }).FirstOrDefault();
                if (dslop != default)
                {
                    data.Add(dslop);
                }
            }
            return data;
        }

        public List<DanhSachSinhVienVM> GetSVByCBK(int KyDKID, int MaLop)
        {
            var data = new List<DanhSachSinhVienVM>();
            var thongbaos = _context.ThongBaos.Where(x => x.KyDkid == KyDKID && x.IsDelete != true).FirstOrDefault().ThongBaoId;
            var taikhoan = _context.TaiKhoans.Where(x => x.MaLop == MaLop && x.IsDelete != true).OrderBy(x => x.MaTaiKhoan).ToList();
            foreach (var item in taikhoan)
            {
                var taikhoanthongbao = _context.TaiKhoanThongBaos.Where(x => x.TaiKhoanId == item.TaiKhoanId && x.ThongBaoId == thongbaos && x.IsDelete != true).FirstOrDefault();
                var taikhoanTBID = 0;
                if (taikhoanthongbao != null)
                {
                    taikhoanTBID = (int)taikhoanthongbao.TaiKhoanId;
                }

                if (item.TaiKhoanId == taikhoanTBID)
                {
                    var dstaikhoan = _context.TaiKhoans.Where(x => x.MaLop == MaLop && x.TaiKhoanId == item.TaiKhoanId && x.IsDelete != true).Select(x => new DanhSachSinhVienVM()
                    {
                        TaiKhoanId = x.TaiKhoanId,
                        HoTen = x.HoTen,
                        MaTaiKhoan = x.MaTaiKhoan,
                        TrangThai = taikhoanthongbao.TrangThai
                    }).FirstOrDefault();
                    if (dstaikhoan != default)
                    {
                        data.Add(dstaikhoan);
                    }
                }
                else
                {
                    var dstaikhoan = _context.TaiKhoans.Where(x => x.MaLop == MaLop && x.IsDelete != true).Select(x => new DanhSachSinhVienVM()
                    {
                        TaiKhoanId = item.TaiKhoanId,
                        HoTen = item.HoTen,
                        MaTaiKhoan = item.MaTaiKhoan,
                        TrangThai = (int)EnumThongBao.KhoiTao
                    }).FirstOrDefault();
                    if (dstaikhoan != default)
                    {
                        data.Add(dstaikhoan);
                    }
                }

            }
            return data;
        }

        public List<DuyetDanhSachLopVM> ThongKe(int KyDKID, int MaKhoa)
        {
            var data = new List<DuyetDanhSachLopVM>();
            var lops = _context.LopKyDangKys.Where(x => x.KyDkid == KyDKID && x.MaKhoa == MaKhoa && x.IsDelete != true).ToList();
            foreach (var item in lops)
            {
                var dslop = _context.Lops.Where(x => x.MaLop == item.MaLop && x.IsDelete != true).Select(x => new DuyetDanhSachLopVM()
                {
                    MaLop = x.MaLop,
                    TenLop = x.TenLop,
                }).FirstOrDefault();
                if (dslop != default)
                {
                    data.Add(dslop);
                }
            }
            return data;
        }
    }
}
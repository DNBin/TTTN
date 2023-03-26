using QuanlyDiemrenluyen.Data;
using QuanlyDiemrenluyen.Helpers;
using QuanlyDiemrenluyen.Interfaces;
using QuanlyDiemrenluyen.Models;
using QuanlyDiemrenluyen.ViewModels;
using System;
using System.Data.Entity;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OfficeOpenXml;
using QuanlyDiemrenluyen.Controllers;

namespace QuanlyDiemrenluyen.Services
{
    public class PhieuDanhGiaService : IPhieuDanhGiaService
    {
        private DataContext _context;
        public PhieuDanhGiaService(DataContext context)
        {
            _context = context;
        }
        public PhieuDanhGia TimPhieu(KyDangKyVM model)
        {
            var kydkid= _context.LopKyDangKys.Where(x => x.MaKhoa == model.MaKhoa && x.IsDelete != true).Max(x => x.KyDkid);
            var phieus = _context.PhieuDanhGias.Where(x => x.SinhVienId == model.TaiKhoanID && x.KyDkid == kydkid).FirstOrDefault();
            return phieus;
        }

        public int Create(KyDangKyVM model)
        {
            var KyDKID = _context.LopKyDangKys.Where(x=>x.MaKhoa == model.MaKhoa && x.IsDelete != true).Max(x => x.KyDkid);
            var entity = new PhieuDanhGia();
            entity.SinhVienId = model.TaiKhoanID;
            entity.KyDkid = KyDKID;
            entity.TenPhieu = model.TieuDe;
            entity.IsDelete = false;
            _context.PhieuDanhGias.Add(entity);
            _context.SaveChanges();
            return entity.PhieuId;
        }



        public string hocky(int KyDKID, int TaiKhoanID)
        {
            var phieudanhgias = _context.PhieuDanhGias.Where(x => x.KyDkid == KyDKID && x.SinhVienId == TaiKhoanID && x.IsDelete != true).FirstOrDefault();
            return phieudanhgias.KyDangKy.HocKyXet;
        }
        public string namxet(int KyDKID, int TaiKhoanID)
        {
            var phieudanhgias = _context.PhieuDanhGias.Where(x => x.KyDkid == KyDKID && x.SinhVienId == TaiKhoanID && x.IsDelete != true).FirstOrDefault();
            return phieudanhgias.KyDangKy.NamXet;
        }

        public int kyid(int MaKhoa, int TaiKhoanID)
        {
            var KyDKID = _context.LopKyDangKys.Where(x => x.MaKhoa == MaKhoa && x.IsDelete != true).Max(x => x.KyDkid);
            return (int)KyDKID;
        }
        public List<PhieuDanhGia> Get()
        {
            return _context.PhieuDanhGias.Where(x => x.IsDelete != true).ToList();
        }

        public PhieuDanhGia GetById(int TaiKhoanID, int MaLop)
        {
            var data = new List<PhieuDanhGia>();
            var KyDkIds = _context.LopKyDangKys.Where(x => x.MaLop == MaLop && x.IsDelete != true).ToList();
            foreach (var item in KyDkIds)
            {
                var check = _context.PhieuDanhGias.Where(x => x.KyDkid == item.KyDkid && x.IsDelete != true && x.SinhVienId == TaiKhoanID).OrderByDescending(x => x.PhieuId).FirstOrDefault();
                if (check != default)
                {
                    data.Add(check);
                }
            }
            return data.FirstOrDefault();
            //return _context.PhieuDanhGias.Include(x=>x.KyDangKy).Where(x => x.KyDkid == KyDKID && x.SinhVienId==TaiKhoanID && x.IsDelete != true).FirstOrDefault();
        }

        public List<PhieuDanhGia> GetByPhieu(int id)
        {
            return _context.PhieuDanhGias.Where(x => x.PhieuId == id && x.IsDelete != true).ToList();
        }

        public void AddNgayDanhGia(List<PhieuDanhGiaVM> model)
        {
            var phieu = model[0];
            if(phieu.DiemSv != default)
            {
                var entity = _context.PhieuDanhGias.Where(x => x.PhieuId == phieu.PhieuId && x.IsDelete != true).FirstOrDefault();
                if (entity == default)
                    throw new Exception("Không tìm thấy dữ liệu.");
                entity.NgayDanhGia = DateTime.Now;
                _context.SaveChanges();
            } 
        }
        

        public void Update(KyDangKyVM model)
        {
            var KyDKID = _context.LopKyDangKys.Where(x => x.MaKhoa == model.MaKhoa && x.IsDelete != true).Max(x => x.KyDkid);
            var entity = _context.PhieuDanhGias.Where(x => x.SinhVienId==model.TaiKhoanID && x.KyDkid == KyDKID && x.IsDelete != true).FirstOrDefault();
            if (entity == default)
                throw new Exception("Không tìm thấy dữ liệu.");
            entity.IsDelete = false;
            _context.SaveChanges();
        }
        public List<PhieuDanhGiaVM> GetPhieu(int MaKhoa,int TaiKhoanID)
        {
            var KyDKID = _context.LopKyDangKys.Where(x => x.MaKhoa == MaKhoa && x.IsDelete != true).Max(x => x.KyDkid);
            var data = new List<PhieuDanhGiaVM>();
            var phieudanhgias = _context.PhieuDanhGias.Include(x=>x.Diem).Where(x => x.KyDkid == KyDKID && x.SinhVienId == TaiKhoanID && x.IsDelete != true).FirstOrDefault();
            var phieudiem = _context.Diems.Include(x=>x.TieuChi).Include(x=>x.Phieu.KyDangKy).Where(x => x.PhieuId == phieudanhgias.PhieuId && x.IsDelete!=true).OrderBy(x=>x.TieuChi.OrderKey).ToList();
            
            foreach(var item in phieudiem)
            {
                var diems = _context.Diems.Include(x=>x.Phieu).Include(x=>x.Phieu.KyDangKy).Include(x=>x.TieuChi).Where(x => x.PhieuId == item.PhieuId && x.DiemId == item.DiemId && x.IsDelete != true)
                            .Select(x => new PhieuDanhGiaVM()
                            {
                                PhieuId = (int)x.PhieuId,
                                TieuChiId = x.TieuChiId,
                                DiemId=x.DiemId,
                                SinhVienId=x.Phieu.SinhVienId,
                                KyDkid=x.Phieu.KyDkid,
                                TenPhieu=x.Phieu.TenPhieu,
                                TenTieuChi=x.TieuChi.TenTieuChi,
                                DiemTieuChi=x.TieuChi.DiemTieuChi,
                                HocKyXet=x.Phieu.KyDangKy.HocKyXet,
                                NamXet=x.Phieu.KyDangKy.NamXet
                            }).FirstOrDefault();
                if (diems != default)
                {
                    data.Add(diems);
                }
            }
            return data;
        }


        public List<PhieuDanhGiaVM> GetPhieuByCBL(int KyDKID, int TaiKhoanID)
        {
            var data = new List<PhieuDanhGiaVM>();
            var phieudanhgias = _context.PhieuDanhGias.Include(x => x.Diem).Where(x => x.KyDkid == KyDKID && x.SinhVienId == TaiKhoanID && x.IsDelete != true).FirstOrDefault();
            var phieudiem = _context.Diems.Include(x => x.TieuChi).Include(x => x.Phieu.KyDangKy).Where(x => x.PhieuId == phieudanhgias.PhieuId && x.IsDelete != true).OrderBy(x => x.TieuChi.OrderKey).ToList();
            foreach (var item in phieudiem)
            {
                var diems = _context.Diems.Include(x => x.Phieu).Include(x => x.Phieu.KyDangKy).Include(x => x.TieuChi).Where(x => x.PhieuId == item.PhieuId && x.DiemId == item.DiemId && x.IsDelete != true)
                            .Select(x => new PhieuDanhGiaVM()
                            {
                                PhieuId = (int)x.PhieuId,
                                TieuChiId = x.TieuChiId,
                                DiemId = x.DiemId,
                                SinhVienId = x.Phieu.SinhVienId,
                                KyDkid = x.Phieu.KyDkid,
                                TenPhieu = x.Phieu.TenPhieu,
                                TenTieuChi = x.TieuChi.TenTieuChi,
                                DiemTieuChi = x.TieuChi.DiemTieuChi,
                                DiemSv = x.DiemSv,
                                HocKyXet = x.Phieu.KyDangKy.HocKyXet,
                                NamXet = x.Phieu.KyDangKy.NamXet
                            }).FirstOrDefault();
                if (diems != default)
                {
                    data.Add(diems);
                }
            }
            return data;
        }
        public List<PhieuDanhGiaVM> GetPhieuByCBK(int KyDkid, int TaiKhoanID)
        {
            var data = new List<PhieuDanhGiaVM>();
            var phieudanhgias = _context.PhieuDanhGias.Include(x => x.Diem).Where(x => x.KyDkid == KyDkid && x.SinhVienId == TaiKhoanID && x.IsDelete != true).FirstOrDefault();
            var phieudiem = _context.Diems.Include(x => x.TieuChi).Include(x => x.Phieu.KyDangKy).Where(x => x.PhieuId == phieudanhgias.PhieuId && x.IsDelete != true).OrderBy(x => x.TieuChi.OrderKey).ToList();
            foreach (var item in phieudiem)
            {
                var diems = _context.Diems.Include(x => x.Phieu).Include(x => x.Phieu.KyDangKy).Include(x => x.TieuChi).Where(x => x.PhieuId == item.PhieuId && x.DiemId == item.DiemId && x.IsDelete != true)
                            .Select(x => new PhieuDanhGiaVM()
                            {
                                PhieuId = (int)x.PhieuId,
                                TieuChiId = x.TieuChiId,
                                DiemId = x.DiemId,
                                SinhVienId = x.Phieu.SinhVienId,
                                KyDkid = x.Phieu.KyDkid,
                                TenPhieu = x.Phieu.TenPhieu,
                                TenTieuChi = x.TieuChi.TenTieuChi,
                                DiemTieuChi = x.TieuChi.DiemTieuChi,
                                DiemSv = x.DiemSv,
                                DiemCbl=x.DiemCbl,
                                HocKyXet = x.Phieu.KyDangKy.HocKyXet,
                                NamXet = x.Phieu.KyDangKy.NamXet
                            }).FirstOrDefault();
                if (diems != default)
                {
                    data.Add(diems);
                }
            }
            return data;
        }

        public List<PhieuDanhGiaVM> GetPhieuHoanThanh(int KyDKID, int TaiKhoanID)
        {
            var data = new List<PhieuDanhGiaVM>();
            var phieudanhgias = _context.PhieuDanhGias.Include(x => x.Diem).Where(x => x.KyDkid == KyDKID && x.SinhVienId == TaiKhoanID && x.IsDelete != true).FirstOrDefault();
            var phieudiem = _context.Diems.Include(x => x.TieuChi).Include(x => x.Phieu.KyDangKy).Where(x => x.PhieuId == phieudanhgias.PhieuId && x.IsDelete != true).OrderBy(x => x.TieuChi.OrderKey).ToList();
            foreach (var item in phieudiem)
            {
                var diems = _context.Diems.Include(x => x.Phieu).Include(x => x.Phieu.KyDangKy).Include(x => x.TieuChi).Where(x => x.PhieuId == item.PhieuId && x.DiemId == item.DiemId && x.IsDelete != true)
                            .Select(x => new PhieuDanhGiaVM()
                            {
                                PhieuId = (int)x.PhieuId,
                                TieuChiId = x.TieuChiId,
                                DiemId = x.DiemId,
                                SinhVienId = x.Phieu.SinhVienId,
                                KyDkid = x.Phieu.KyDkid,
                                TenPhieu = x.Phieu.TenPhieu,
                                TenTieuChi = x.TieuChi.TenTieuChi,
                                DiemTieuChi = x.TieuChi.DiemTieuChi,
                                DiemSv = x.DiemSv,
                                DiemCbl = x.DiemCbl,
                                DiemCbk = x.DiemCbk,
                                HocKyXet = x.Phieu.KyDangKy.HocKyXet,
                                NamXet = x.Phieu.KyDangKy.NamXet
                            }).FirstOrDefault();
                if (diems != default)
                {
                    data.Add(diems);
                }
            }
            return data;
        }
        public void AddNguoiDuyet(List<PhieuDanhGiaVM> model, int TaiKhoanID)
        {
            var phieu = model[0];
            var entity = _context.PhieuDanhGias.Where(x => x.PhieuId == phieu.PhieuId && x.IsDelete != true).FirstOrDefault();
            if (entity != default)
            {
                entity.CanBoLopId = TaiKhoanID;
                _context.SaveChanges();
            }
        }
        public void AddCBKDuyet(List<PhieuDanhGiaVM> model, int TaiKhoanID)
        {
            var phieu = model[0];
            var entity = _context.PhieuDanhGias.Where(x => x.PhieuId == phieu.PhieuId && x.IsDelete != true).FirstOrDefault();
            if (entity != default)
            {
                entity.CanBoId = TaiKhoanID;
                _context.SaveChanges();
            }
        }

        //public void XuatExcelPhieu(int KyDKID, int TaiKhoanID, String fileName)
        //{
        //    var data = new List<PhieuDanhGiaVM>();
        //    var phieudanhgias = _context.PhieuDanhGias.Include(x => x.Diem).Where(x => x.KyDkid == KyDKID && x.SinhVienId == TaiKhoanID && x.IsDelete != true).FirstOrDefault();
        //    var phieudiem = _context.Diems.Include(x => x.TieuChi).Include(x => x.Phieu.KyDangKy).Where(x => x.PhieuId == phieudanhgias.PhieuId && x.IsDelete != true).OrderBy(x => x.TieuChi.OrderKey).ToList();
        //    foreach (var item in phieudiem)
        //    {
        //        var diems = _context.Diems.Include(x => x.Phieu).Include(x => x.Phieu.KyDangKy).Include(x => x.TieuChi).Where(x => x.PhieuId == item.PhieuId && x.DiemId == item.DiemId && x.IsDelete != true)
        //                    .Select(x => new PhieuDanhGiaVM()
        //                    {
        //                        PhieuId = (int)x.PhieuId,
        //                        TieuChiId = x.TieuChiId,
        //                        DiemId = x.DiemId,
        //                        SinhVienId = x.Phieu.SinhVienId,
        //                        KyDkid = x.Phieu.KyDkid,
        //                        TenPhieu = x.Phieu.TenPhieu,
        //                        TenTieuChi = x.TieuChi.TenTieuChi,
        //                        DiemTieuChi = x.TieuChi.DiemTieuChi,
        //                        DiemSv = x.DiemSv,
        //                        DiemCbl = x.DiemCbl,
        //                        DiemCbk = x.DiemCbk,
        //                        HocKyXet = x.Phieu.KyDangKy.HocKyXet,
        //                        NamXet = x.Phieu.KyDangKy.NamXet,    
        //                    }).FirstOrDefault();
        //        if (diems != default)
        //        {
        //            data.Add(diems);
        //        }
        //    }

        //    ExcelPackage ep = new ExcelPackage(new System.IO.FileInfo(fileName));
        //    ExcelWorksheet Sheet = ep.Workbook.Worksheets.Add("Report");
        //    Sheet.Cells["A1"].Value = "TRƯỜNG ĐẠI HỌC ĐỒNG THÁP ";
        //    Sheet.Cells["A2"].Value = "KHOA "+ phieudanhgias.SinhVien.MaKhoaNavigation.TenKhoa;
        //    Sheet.Cells["C4"].Value = "PHIẾU ĐÁNH GIÁ ĐIỂM RÈN LUYỆN ";
        //    Sheet.Cells["B5"].Value = "Họ và tên: "+phieudanhgias.SinhVien.HoTen;
        //    Sheet.Cells["C5"].Value = "Ngày tháng năm sinh: " + phieudanhgias.SinhVien.NgaySinh;
        //    Sheet.Cells["D5"].Value = "MSSV: " + phieudanhgias.SinhVien.MaTaiKhoan;
        //    Sheet.Cells["B6"].Value = "Lớp: " + phieudanhgias.SinhVien.MaLopNavigation.TenLop;
        //    Sheet.Cells["C6"].Value = "Khoa: " + phieudanhgias.SinhVien.MaKhoaNavigation.TenKhoa;
        //    Sheet.Cells["D6"].Value = "Năm học: " + phieudanhgias.KyDangKy.NamXet;
        //    Sheet.Cells["A8"].Value = "Nội dung đánh giá";
        //    Sheet.Cells["B8"].Value = "Điểm tối đa";
        //    Sheet.Cells["C8"].Value = "Sinh viên tự đánh giá";
        //    Sheet.Cells["D8"].Value = "Tập thể lớp đánh giá";
        //    Sheet.Cells["E8"].Value = "Khoa đánh giá";
        //    int row = 2;// dòng bắt đầu ghi dữ liệu
        //    foreach (var item in data)
        //    {
        //        Sheet.Cells[string.Format("A{0}", row)].Value = item.TenTieuChi;
        //        Sheet.Cells[string.Format("B{0}", row)].Value = item.DiemTieuChi;
        //        Sheet.Cells[string.Format("C{0}", row)].Value = item.DiemSv;
        //        Sheet.Cells[string.Format("D{0}", row)].Value = item.DiemCbl;
        //        Sheet.Cells[string.Format("E{0}", row)].Value = item.DiemCbk;
        //        row++;
        //    }
        //    Sheet.Cells["A:AZ"].AutoFitColumns();
        //    ep.Save();

        //}
        public List<PhieuDanhGia> GetPhieuDuyet(int MaKhoa)
        {
            var data = new List<PhieuDanhGia>();
            var kydkid = _context.LopKyDangKys.Where(x => x.MaKhoa == MaKhoa && x.IsDelete != true).Max(x => x.KyDkid);
            var taikhoan = _context.TaiKhoans.Where(x => x.MaKhoa == MaKhoa && x.MaLop != null && x.IsDelete != true).ToList();
            foreach(var item in taikhoan)
            {
                var phieu= _context.PhieuDanhGias.Include(x => x.SinhVien).Where(x => x.SinhVienId == item.TaiKhoanId && x.KyDkid == kydkid && x.DiemTong != null && x.IsDelete != true).FirstOrDefault();
                if (phieu != default)
                {
                    data.Add(phieu);
                }
            }
            return data;
        }

        public List<PhieuDanhGia> GetPhieuChuaDuyet(int MaKhoa)
        {
            var data = new List<PhieuDanhGia>();
            var kydkid = _context.LopKyDangKys.Where(x => x.MaKhoa == MaKhoa && x.IsDelete != true).Max(x => x.KyDkid);
            var taikhoan = _context.TaiKhoans.Where(x => x.MaKhoa == MaKhoa && x.MaLop != null && x.IsDelete != true).ToList();
            foreach (var item in taikhoan)
            {
                var phieu = _context.PhieuDanhGias.Include(x => x.SinhVien).Where(x => x.SinhVienId == item.TaiKhoanId && x.KyDkid == kydkid && x.DiemTong == null && x.IsDelete != true).FirstOrDefault();
                if (phieu != default)
                {
                    data.Add(phieu);
                }
            }
            return data;
        }

        public List<PhieuDanhGia> GetPhieuDuyetByLop(int MaLop)
        {
            var data = new List<PhieuDanhGia>();
            var kydkid = _context.LopKyDangKys.Where(x => x.MaLop == MaLop && x.IsDelete != true).Max(x => x.KyDkid);
            var taikhoan = _context.TaiKhoans.Where(x => x.MaLop == MaLop && x.IsDelete != true).ToList();
            foreach (var item in taikhoan)
            {
                var phieu = _context.PhieuDanhGias.Include(x => x.SinhVien).Where(x => x.SinhVienId == item.TaiKhoanId && x.KyDkid == kydkid && x.DiemTongCBL != null && x.IsDelete != true).FirstOrDefault();
                if (phieu != default)
                {
                    data.Add(phieu);
                }
            }
            return data;
        }

        public List<PhieuDanhGia> GetPhieuChuaDuyetByLop(int MaLop)
        {
            var data = new List<PhieuDanhGia>();
            var kydkid = _context.LopKyDangKys.Where(x => x.MaLop == MaLop && x.IsDelete != true).Max(x => x.KyDkid);
            var taikhoan = _context.TaiKhoans.Where(x => x.MaLop == MaLop && x.IsDelete != true).ToList();
            foreach (var item in taikhoan)
            {
                var phieu = _context.PhieuDanhGias.Include(x => x.SinhVien).Where(x => x.SinhVienId == item.TaiKhoanId && x.KyDkid == kydkid && x.DiemTongCBL == null && x.IsDelete != true).FirstOrDefault();
                if (phieu != default)
                {
                    data.Add(phieu);
                }
            }
            return data;
        }
        public int KyDKMax(int MaLop)
        {
            var kydkid = _context.LopKyDangKys.Where(x => x.MaLop == MaLop && x.IsDelete != true).Max(x => x.KyDkid);
            return (int)kydkid;
        }
    }
}
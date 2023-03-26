using QuanlyDiemrenluyen.Data;
using QuanlyDiemrenluyen.Interfaces;
using QuanlyDiemrenluyen.Models;
using QuanlyDiemrenluyen.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.Services
{
    public class LopService:ILopService
    {
        private DataContext _context;
        public LopService(DataContext context)
        {
            _context = context;
        }
        public void Create(Lop model)
        {
            var check = _context.Lops.Where(x => x.TenLop == model.TenLop && x.IsDelete != true).FirstOrDefault();
            if (check != default(Lop))
                throw new Exception("Lớp đã tồn tại.");
            var entity = new Lop();
            entity.TenLop = model.TenLop;
            entity.MaKhoa = model.MaKhoa;
            entity.IsDelete = false;
            _context.Lops.Add(entity);
            _context.SaveChanges();
        }

        public void Delete(Lop model)
        {
            var entity = _context.Lops.Where(x => x.MaLop == model.MaLop && x.IsDelete != true).FirstOrDefault();
            if (entity == default)
                throw new Exception("Không tìm thấy dữ liệu.");
            entity.IsDelete = true;
            _context.SaveChanges();
        }

        public List<Lop> Get()
        {
            return _context.Lops.Where(x => x.IsDelete != true).OrderByDescending(x => x.MaLop).ToList();
        }

        

        public List<Lop> GetLopByKhoa(int? MaKhoa)
        {
            return _context.Lops.Where(x => x.MaKhoa == MaKhoa && x.IsDelete != true).ToList();
        }

        public Lop GetById(int id)
        {
            return _context.Lops.Where(x => x.MaLop == id && x.IsDelete != true).FirstOrDefault();
        }

        public void Update(Lop model)
        {
            var entity = _context.Lops.Where(x => x.MaLop == model.MaLop && x.IsDelete != true).FirstOrDefault();
            if (entity == default)
                throw new Exception("Không tìm thấy dữ liệu.");
            entity.TenLop = model.TenLop;
            entity.MaKhoa = model.MaKhoa;
            entity.IsDelete = false;
            _context.SaveChanges();
        }
        public List<Lop> GetLop(int MaKhoa)
        {
            return _context.Lops.Where(x => x.MaKhoa == MaKhoa && x.IsDelete != true).OrderByDescending(x => x.MaLop).ToList();
        }

        public string hocky(int KyDKID)
        {
            var KyDK = _context.KyDangKys.Where(x => x.KyDkid == KyDKID && x.IsDelete != true).FirstOrDefault();
            return KyDK.HocKyXet;
        }
        public string namxet(int KyDKID)
        {
            var KyDK = _context.KyDangKys.Where(x => x.KyDkid == KyDKID && x.IsDelete != true).FirstOrDefault();
            return KyDK.NamXet;
        }

        public List<DuyetDanhSachLopVM> XuatPhieu(int KyDKID, int MaKhoa)
        {
            var data = new List<DuyetDanhSachLopVM>();
            var thongbaos = _context.ThongBaos.Where(x => x.KyDkid == KyDKID && x.IsDelete != true).FirstOrDefault().ThongBaoId;
            var lopkydangky = _context.LopKyDangKys.Where(x => x.MaKhoa == MaKhoa && x.KyDkid==KyDKID && x.IsDelete != true).ToList();
            foreach (var item in lopkydangky)
            {
                var lops = _context.Lops.Where(x => x.MaLop == item.MaLop && x.IsDelete != true).FirstOrDefault();
                var lop = new DuyetDanhSachLopVM()
                {
                    MaLop = lops.MaLop,
                    TenLop = lops.TenLop,
                    DiemTong = new List<DanhSachSinhVienVM>(),
                    TongSV = new List<TaiKhoan>()
                };
                var taikhoan = _context.TaiKhoans.Where(x => x.MaLop == item.MaLop && x.IsDelete != true).ToList();
                foreach (var tk in taikhoan)
                {
                    var taikhoanthongbao = _context.TaiKhoanThongBaos.Where(x => x.TaiKhoanId == tk.TaiKhoanId && x.ThongBaoId == thongbaos && x.IsDelete != true).FirstOrDefault();
                    var taikhoanTBID = 0;
                    if (taikhoanthongbao != null)
                    {
                        taikhoanTBID = (int)taikhoanthongbao.TaiKhoanId;
                    }

                    if (tk.TaiKhoanId == taikhoanTBID)
                    {
                        var phieus = _context.PhieuDanhGias.Where(x => x.KyDkid == KyDKID && x.SinhVienId == tk.TaiKhoanId && x.IsDelete != true).FirstOrDefault();
                        if (phieus != default)
                        {
                            var dstaikhoan = _context.TaiKhoans.Where(x => x.MaLop == item.MaLop && x.TaiKhoanId == tk.TaiKhoanId && x.IsDelete != true).Select(x => new DanhSachSinhVienVM()
                            {
                                TaiKhoanId=x.TaiKhoanId,
                                DiemTong = phieus.DiemTong
                            }).FirstOrDefault();
                            if (dstaikhoan != default)
                            {
                                lop.DiemTong.Add(dstaikhoan);
                            }
                        }
                        else
                        {
                            var dstaikhoan = _context.TaiKhoans.Where(x => x.MaLop ==item.MaLop && x.TaiKhoanId == tk.TaiKhoanId && x.IsDelete != true).Select(x => new DanhSachSinhVienVM()
                            {
                                TaiKhoanId = x.TaiKhoanId,
                                DiemTong = 0
                            }).FirstOrDefault();
                            if (dstaikhoan != default)
                            {
                                lop.DiemTong.Add(dstaikhoan);
                            }
                        }

                    }
                    else
                    {
                        var dstaikhoan = _context.TaiKhoans.Where(x => x.MaLop == item.MaLop && x.IsDelete != true).Select(x => new DanhSachSinhVienVM()
                        {
                            TaiKhoanId = x.TaiKhoanId,
                            DiemTong = 0
                        }).FirstOrDefault();
                        if (dstaikhoan != default)
                        {
                            lop.DiemTong.Add(dstaikhoan);
                        }
                    }
                }
                data.Add(lop);
            }
            return data;
        }

        public List<DuyetDanhSachLopVM> XepLoai(int MaKhoa)
        {
            var KyDKID = _context.LopKyDangKys.Where(x => x.MaKhoa == MaKhoa && x.IsDelete != true).GroupBy(x => x.KyDkid).Max(x => x.Key);
            if (KyDKID != null)
            {
                var data = new List<DuyetDanhSachLopVM>();
                var thongbaos = _context.ThongBaos.Where(x => x.KyDkid == KyDKID && x.IsDelete != true).FirstOrDefault().ThongBaoId;
                var lopkydangky = _context.LopKyDangKys.Where(x => x.MaKhoa == MaKhoa && x.KyDkid == KyDKID && x.IsDelete != true).ToList();
                foreach (var item in lopkydangky)
                {
                    var lops = _context.Lops.Where(x => x.MaLop == item.MaLop && x.IsDelete != true).FirstOrDefault();
                    var lop = new DuyetDanhSachLopVM()
                    {
                        MaLop = lops.MaLop,
                        TenLop = lops.TenLop,
                        DiemTong = new List<DanhSachSinhVienVM>(),
                        TongSV = new List<TaiKhoan>()
                    };
                    var taikhoan = _context.TaiKhoans.Where(x => x.MaLop == item.MaLop && x.IsDelete != true).ToList();
                    foreach (var tk in taikhoan)
                    {
                        var taikhoanthongbao = _context.TaiKhoanThongBaos.Where(x => x.TaiKhoanId == tk.TaiKhoanId && x.ThongBaoId == thongbaos && x.IsDelete != true).FirstOrDefault();
                        var taikhoanTBID = 0;
                        if (taikhoanthongbao != null)
                        {
                            taikhoanTBID = (int)taikhoanthongbao.TaiKhoanId;
                        }

                        if (tk.TaiKhoanId == taikhoanTBID)
                        {
                            var phieus = _context.PhieuDanhGias.Where(x => x.KyDkid == KyDKID && x.SinhVienId == tk.TaiKhoanId && x.IsDelete != true).FirstOrDefault();
                            if (phieus != default)
                            {
                                var dstaikhoan = _context.TaiKhoans.Where(x => x.MaLop == item.MaLop && x.TaiKhoanId == tk.TaiKhoanId && x.IsDelete != true).Select(x => new DanhSachSinhVienVM()
                                {
                                    TaiKhoanId = x.TaiKhoanId,
                                    DiemTong = phieus.DiemTong
                                }).FirstOrDefault();
                                if (dstaikhoan != default)
                                {
                                    lop.DiemTong.Add(dstaikhoan);
                                }
                            }
                            else
                            {
                                var dstaikhoan = _context.TaiKhoans.Where(x => x.MaLop == item.MaLop && x.TaiKhoanId == tk.TaiKhoanId && x.IsDelete != true).Select(x => new DanhSachSinhVienVM()
                                {
                                    TaiKhoanId = x.TaiKhoanId,
                                    DiemTong = 0
                                }).FirstOrDefault();
                                if (dstaikhoan != default)
                                {
                                    lop.DiemTong.Add(dstaikhoan);
                                }
                            }

                        }
                        else
                        {
                            var dstaikhoan = _context.TaiKhoans.Where(x => x.MaLop == item.MaLop && x.IsDelete != true).Select(x => new DanhSachSinhVienVM()
                            {
                                TaiKhoanId = x.TaiKhoanId,
                                DiemTong = 0
                            }).FirstOrDefault();
                            if (dstaikhoan != default)
                            {
                                lop.DiemTong.Add(dstaikhoan);
                            }
                        }
                    }
                    data.Add(lop);
                }
                return data;
            }
            else
                return null;
        }
    }
}

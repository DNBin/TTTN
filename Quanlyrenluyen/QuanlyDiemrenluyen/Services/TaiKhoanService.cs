using QuanlyDiemrenluyen.Data;
using QuanlyDiemrenluyen.Interfaces;
using QuanlyDiemrenluyen.Models;
using QuanlyDiemrenluyen.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Web;
using QuanlyDiemrenluyen.ViewModels;

namespace QuanlyDiemrenluyen.Services
{
    public class TaiKhoanService : ITaiKhoanService
    {
        private DataContext _context;
        public TaiKhoanService(DataContext context)
        {
            _context = context;
        }

        public int Create(TaiKhoanVM model)
        {
            if (string.IsNullOrEmpty(model.TenTaiKhoan))
                throw new Exception("Tên tài khoản không được để trống.");
            if (string.IsNullOrEmpty(model.HoTen))
                throw new Exception("Họ tên không được để trống.");
            var check = _context.TaiKhoans.Where(x => x.TenTaiKhoan == model.TenTaiKhoan && x.IsDelete != true).FirstOrDefault();
            if (check != default)
                throw new Exception("Tài khoản đã tồn tại.");
            var entity = new TaiKhoan();
            entity.IsDelete = false;
            entity.HinhAnh = "/Assets/images/users/no_image.png";
            entity.NgayTao = DateTime.Now;
            entity.NgaySinh = model.NgaySinh;
            entity.MaTaiKhoan = model.MaTaiKhoan;
            entity.HoTen = model.HoTen;
            entity.SoDienThoai = model.SoDienThoai;
            entity.ChucVuId = model.ChucVuId;
            entity.MaLop = model.MaLop;
            entity.MaKhoa = model.MaKhoa;
            entity.Email = model.Email;
            entity.DiaChi = model.DiaChi;
            entity.TenTaiKhoan = model.TenTaiKhoan;
            entity.MatKhau = Security.MD5("123456");
            _context.TaiKhoans.Add(entity);
            _context.SaveChanges();
            return entity.TaiKhoanId;
        }
        public void AddTaiKhoanQuyen(TaiKhoanVM model,int id)
        {
            var entity = new TaiKhoanQuyen();
            foreach(var item in model.DsQuyen)
            {
                entity.MaQuyen = item.MaQuyen;
                entity.TaiKhoanId = id;
                entity.IsDelete = false;
                _context.TaiKhoanQuyens.Add(entity);
            }
            _context.SaveChanges();
        }

        public void UploadImage(int TaiKhoanID, string fileName)
        {
            var entity = _context.TaiKhoans.Where(x => x.TaiKhoanId == TaiKhoanID && x.IsDelete != true).FirstOrDefault();
            if (entity != default)
            {
                entity.HinhAnh = "/Assets/images/users/" + fileName;
                _context.SaveChanges();
            }
        }

        public void Delete(TaiKhoanVM model)
        {
            var entity = _context.TaiKhoans.Where(x => x.TaiKhoanId == model.TaiKhoanID && x.IsDelete != true).FirstOrDefault();
            if (entity == default)
                throw new Exception("Không tìm thấy dữ liệu.");
            entity.IsDelete = true;
            _context.SaveChanges();
        }
        public List<TaiKhoan> GetSV(int MaKhoa)
        {
            var list = _context.TaiKhoans.Where(x => x.MaLop != null && x.MaKhoa == MaKhoa && x.IsDelete != true).OrderByDescending(x => x.TaiKhoanId).ToList();
            return list;
        }
        public List<TaiKhoan> GetSVByLop(int MaLop)
        {
            var list = _context.TaiKhoans.Where(x => x.MaLop == MaLop && x.IsDelete != true).OrderByDescending(x => x.TaiKhoanId).ToList();
            return list;
        }

        public List<TaiKhoan> Get()
        {
            var list = _context.TaiKhoans.Where(x => x.IsDelete != true).OrderByDescending(x => x.TaiKhoanId).ToList();
            return list;
        }

        public List<TaiKhoanVM> GetTaiKhoan(int MaKhoa)
        {
            var data = new List<TaiKhoanVM>();
            var list = _context.TaiKhoans.Include(x=>x.MaLopNavigation).Where(x => x.MaKhoa==MaKhoa && x.IsDelete != true).OrderByDescending(x => x.TaiKhoanId).ToList();
            foreach (var item in list)
            {
                if (item.MaLop != null) {
                    var tk = new TaiKhoanVM()
                    {
                        TaiKhoanID = item.TaiKhoanId,
                        MaTaiKhoan = item.MaTaiKhoan,
                        HoTen = item.HoTen,
                        TenTaiKhoan = item.TenTaiKhoan,
                        TenLop = item.MaLopNavigation.TenLop,
                        Email = item.Email,
                        DsQuyen = new List<Quyen>()
                    };
                    var quyenIds = _context.TaiKhoanQuyens.Where(x => x.TaiKhoanId == item.TaiKhoanId && x.IsDelete != true).OrderBy(x => x.MaQuyen).Select(x => x.MaQuyen).ToList();
                    foreach (var quyenId in quyenIds)
                    {
                        var quyen = _context.Quyens.Where(x => x.MaQuyen == quyenId).FirstOrDefault();
                        if (quyen != default)
                        {
                            tk.DsQuyen.Add(quyen);
                        }
                    }
                    data.Add(tk);
                }
                else
                {
                    var tk = new TaiKhoanVM()
                    {
                        TaiKhoanID = item.TaiKhoanId,
                        MaTaiKhoan = item.MaTaiKhoan,
                        HoTen = item.HoTen,
                        TenTaiKhoan = item.TenTaiKhoan,
                        Email = item.Email,
                        DsQuyen = new List<Quyen>()
                    };
                    var quyenIds = _context.TaiKhoanQuyens.Where(x => x.TaiKhoanId == item.TaiKhoanId && x.IsDelete != true).OrderBy(x => x.MaQuyen).Select(x => x.MaQuyen).ToList();
                    foreach (var quyenId in quyenIds)
                    {
                        var quyen = _context.Quyens.Where(x => x.MaQuyen == quyenId).FirstOrDefault();
                        if (quyen != default)
                        {
                            tk.DsQuyen.Add(quyen);
                        }
                    }
                    data.Add(tk);
                }
               
            }

            return data;
        }
        public List<TaiKhoan> GetByKhoa(int MaKhoa)
        {
            var list = _context.TaiKhoans.Include(x => x.TaiKhoanQuyen).Where(x => x.MaKhoa == MaKhoa && x.IsDelete != true).OrderByDescending(x => x.TaiKhoanId).ToList();
            return list;
        }
        public TaiKhoanVM GetByIds(int id)
        {
            var list = _context.TaiKhoans.Where(x => x.TaiKhoanId==id && x.IsDelete != true).FirstOrDefault();
                var tk = new TaiKhoanVM()
                {
                    TaiKhoanID = list.TaiKhoanId,
                    MaTaiKhoan = list.MaTaiKhoan,
                    HoTen = list.HoTen,
                    TenTaiKhoan = list.TenTaiKhoan,
                    Email = list.Email,
                    DiaChi=list.DiaChi,
                    SoDienThoai=list.SoDienThoai,
                    NgaySinh=list.NgaySinh,
                    MaLop=list.MaLop,
                    MaKhoa=list.MaKhoa,
                    ChucVuId=list.ChucVuId,
                    DsQuyen = new List<Quyen>()
                };
                var quyenIds = _context.TaiKhoanQuyens.Where(x => x.TaiKhoanId == id && x.IsDelete != true).Select(x => x.MaQuyen).ToList();
                foreach (var quyenId in quyenIds)
                {
                    var quyen = _context.Quyens.Where(x => x.MaQuyen == quyenId).FirstOrDefault();
                    if (quyen != default)
                    {
                        tk.DsQuyen.Add(quyen);
                    }
                }
            return tk;
        }

        //public TaiKhoanVM GetByTaiKhoanID(int id)
        //{
        //    return _context.TaiKhoans.Where(x => x.TaiKhoanId == id && x.IsDelete != true).FirstOrDefault();
        //}
        public TaiKhoan GetById(int id)
        {
            return _context.TaiKhoans.Where(x => x.TaiKhoanId == id && x.IsDelete != true).FirstOrDefault();
        }

        public void Update(TaiKhoanVM model)
        {
            if (string.IsNullOrEmpty(model.TenTaiKhoan))
                throw new Exception("Tên tài khoản không được để trống.");
            if (string.IsNullOrEmpty(model.HoTen))
                throw new Exception("Họ tên không được để trống.");
            var entity = _context.TaiKhoans.Where(x => x.TaiKhoanId == model.TaiKhoanID  && x.IsDelete != true).FirstOrDefault();
            if (entity == default)
                throw new Exception("Không tìm thấy dữ liệu.");
            var check = _context.TaiKhoans.Where(x => x.TenTaiKhoan == model.TenTaiKhoan && x.TaiKhoanId != model.TaiKhoanID && x.IsDelete != true).FirstOrDefault();
            if(check != default)
                throw new Exception("Tên tài khoản đã tồn tại");
            entity.TenTaiKhoan = model.TenTaiKhoan;
            entity.MaTaiKhoan = model.MaTaiKhoan;
            entity.HoTen = model.HoTen;
            entity.SoDienThoai = model.SoDienThoai;
            entity.ChucVuId = model.ChucVuId;
            entity.MaLop = model.MaLop;
            entity.MaKhoa = model.MaKhoa;
            entity.Email = model.Email;
            entity.DiaChi = model.DiaChi;
            entity.NgaySinh = model.NgaySinh;
            _context.SaveChanges();
        }

        public void UpdatePassWord(TaiKhoan model)
        {
            if (string.IsNullOrEmpty(model.TenTaiKhoan))
                throw new Exception("Tên tài khoản không được để trống.");
            var entity = _context.TaiKhoans.Where(x => x.TaiKhoanId == model.TaiKhoanId && x.IsDelete != true).FirstOrDefault();
            if (entity == default)
                throw new Exception("Không tìm thấy dữ liệu.");
            var check = _context.TaiKhoans.Where(x => x.TenTaiKhoan == model.TenTaiKhoan && x.TaiKhoanId != model.TaiKhoanId && x.IsDelete != true).FirstOrDefault();
            if (check != default)
                throw new Exception("Tên tài khoản đã tồn tại");
            entity.TenTaiKhoan = model.TenTaiKhoan;
            entity.MatKhau = Security.MD5(model.MatKhau);
            _context.SaveChanges();
        }

        public void SetPassword(int id)
        {
            var entity = _context.TaiKhoans.Where(x => x.TaiKhoanId == id && x.IsDelete != true).FirstOrDefault();
            if (entity == default)
                throw new Exception("Không tìm thấy dữ liệu.");
            entity.MatKhau = Security.MD5("123456");
            _context.SaveChanges();
        }

        public void UpdateTaiKhoanQuyen(TaiKhoanVM model)
        {
            var entity = new TaiKhoanQuyen();
            var check = _context.TaiKhoanQuyens.Where(x => x.TaiKhoanId == model.TaiKhoanID && x.IsDelete != true).FirstOrDefault();
            var quyens = _context.TaiKhoanQuyens.Where(x => x.TaiKhoanId == model.TaiKhoanID && x.IsDelete != true).ToList();
            var count = _context.TaiKhoanQuyens.Where(x => x.TaiKhoanId == model.TaiKhoanID && x.IsDelete != true).ToList().Count;
            if (check != default)
            {
                for (int i=0;i<model.MaQuyenList.Length;i++)
                {
                    foreach(var quyen in quyens)
                    {
                        var maquyen = int.Parse(model.MaQuyenList[i]);
                        if (model.MaQuyenList.Length < count)
                        {
                            if (maquyen != quyen.MaQuyen)
                            {
                                quyen.IsDelete = true;
                                _context.SaveChanges();
                            }
                        }
                        else if (model.MaQuyenList.Length > count)
                        {
                            if (maquyen != quyen.MaQuyen)
                            {
                                entity.MaQuyen = maquyen;
                                entity.TaiKhoanId = model.TaiKhoanID;
                                entity.IsDelete = false;
                                _context.TaiKhoanQuyens.Add(entity);
                                _context.SaveChanges();
                            }
                        }
                       
                    }
                    
                }
            }
            else
            {
                for (int i = 0; i < model.MaQuyenList.Length; i++)
                {
                    var maquyen = int.Parse(model.MaQuyenList[i]);
                    entity.MaQuyen = maquyen;
                    entity.TaiKhoanId = model.TaiKhoanID;
                    entity.IsDelete = false;
                    _context.TaiKhoanQuyens.Add(entity);
                }
                _context.SaveChanges();
            }
          
           
        }


        public ThongBao RequiredThongBao(int id)
        {
            var thongbao = _context.TaiKhoanThongBaos.Include(x => x.ThongBao).Where(x => x.TaiKhoanId == id && (x.TrangThai == (int)EnumThongBao.KhoiTao || x.TrangThai == (int)EnumThongBao.DangXuLy) && x.IsDelete != true).ToList();
            foreach (var item in thongbao) {
                var kydk = _context.ThongBaos.Where(x => x.ThongBaoId == item.ThongBaoId && x.IsDelete != true).FirstOrDefault();
                if (kydk.KyDk.TrangThai == (int)EnumKyDangKy.DaMo)
                {
                    var data = _context.ThongBaos.Where(x => x.KyDkid == kydk.KyDkid && x.IsDelete != true).FirstOrDefault();
                    if (data != null)
                    {
                        return data;
                    }
                }
                
            }
            return null;
        }

        public User SignIn(TaiKhoan model)
        {
            var AppUser = new User();
            string pass = Security.MD5(model.MatKhau);
            string user = model.TenTaiKhoan;
            var check = _context.TaiKhoans.Where(x => x.TenTaiKhoan == user && x.MatKhau == pass && x.IsDelete != true).FirstOrDefault();
            if (check != null && check.MaLop != null)
            {
                var query = from taikhoan in _context.TaiKhoans
                            join khoas in _context.Khoas on taikhoan.MaKhoa equals khoas.MaKhoa
                            join lops in _context.Lops on taikhoan.MaLop equals lops.MaLop
                            join chucvus in _context.ChucVus on taikhoan.ChucVuId equals chucvus.ChucVuId
                            join quyens in _context.TaiKhoanQuyens on taikhoan.TaiKhoanId equals quyens.TaiKhoanId
                            where taikhoan.TenTaiKhoan == user && taikhoan.MatKhau == pass
                            select new User()
                            {
                                Id = taikhoan.TaiKhoanId,
                                MaSV = taikhoan.MaTaiKhoan,
                                TenTaiKhoan = taikhoan.TenTaiKhoan,
                                HoTen = taikhoan.HoTen,
                                HinhAnh = taikhoan.HinhAnh,
                                MaLop = lops.MaLop,
                                TenLop = lops.TenLop,
                                MaKhoa = khoas.MaKhoa,
                                TenKhoa = khoas.TenKhoa,
                                NgaySinh = taikhoan.NgaySinh,
                                Email = taikhoan.Email,
                                Diachi = taikhoan.DiaChi,
                                SDT = taikhoan.SoDienThoai,
                                TenChucVu = chucvus.TenChucVu,
                                MaQuyen = quyens.MaQuyen
                            };
                AppUser = query.FirstOrDefault();
            }
            else if (check != null && check.MaLop == null)
            {
                var query = from taikhoan in _context.TaiKhoans
                            join khoas in _context.Khoas on taikhoan.MaKhoa equals khoas.MaKhoa
                            join chucvus in _context.ChucVus on taikhoan.ChucVuId equals chucvus.ChucVuId
                            join quyens in _context.TaiKhoanQuyens on taikhoan.TaiKhoanId equals quyens.TaiKhoanId
                            where taikhoan.TenTaiKhoan == user && taikhoan.MatKhau == pass
                            select new User()
                            {
                                Id = taikhoan.TaiKhoanId,
                                MaSV = taikhoan.MaTaiKhoan,
                                TenTaiKhoan = taikhoan.TenTaiKhoan,
                                HoTen = taikhoan.HoTen,
                                HinhAnh = taikhoan.HinhAnh,
                                MaKhoa = khoas.MaKhoa,
                                TenKhoa = khoas.TenKhoa,
                                NgaySinh = taikhoan.NgaySinh,
                                Email = taikhoan.Email,
                                Diachi = taikhoan.DiaChi,
                                SDT = taikhoan.SoDienThoai,
                                TenChucVu = chucvus.TenChucVu,
                                MaQuyen = quyens.MaQuyen
                            };
                AppUser = query.FirstOrDefault();
            }
            else
                return null;
            return AppUser;
        }

        public User QuyenSign(TaiKhoan model)
        {
            var AppUser = new User()
            {
                DsQuyen = new List<Quyen>()
            };
            string pass = Security.MD5(model.MatKhau);
            string user = model.TenTaiKhoan;
            var check = _context.TaiKhoans.Where(x => x.TenTaiKhoan == user && x.MatKhau == pass && x.IsDelete != true).FirstOrDefault();
            var quyenIds = _context.TaiKhoanQuyens.Where(x => x.TaiKhoanId == check.TaiKhoanId && x.IsDelete != true).Select(x => x.MaQuyen).ToList();
            foreach (var quyenId in quyenIds)
            {
                var quyen = _context.Quyens.Where(x => x.MaQuyen == quyenId).FirstOrDefault();
                if (quyen != default)
                {
                    AppUser.DsQuyen.Add(quyen);
                }
            }
            return AppUser;
        }
        public List<DanhSachSinhVienVM> GetSVByCBL(int KyDKID, int MaLop)
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
                        TrangThai = taikhoanthongbao.TrangThai,
                        
                        
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

        public List<DanhSachSinhVienVM> XuatPhieu(int KyDKID, int MaLop)
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
                    var phieus = _context.PhieuDanhGias.Where(x => x.KyDkid == KyDKID && x.SinhVienId == item.TaiKhoanId && x.IsDelete != true).FirstOrDefault();
                    if (phieus != default)
                    {
                        var dstaikhoan = _context.TaiKhoans.Where(x => x.MaLop == MaLop && x.TaiKhoanId == item.TaiKhoanId && x.IsDelete != true).Select(x => new DanhSachSinhVienVM()
                        {
                            TaiKhoanId = x.TaiKhoanId,
                            HoTen = x.HoTen,
                            MaTaiKhoan = x.MaTaiKhoan,
                            TrangThai = taikhoanthongbao.TrangThai,
                            DiemTongSV = phieus.DiemTongSV,
                            DiemTongCBL = phieus.DiemTongCBL,
                            DiemTong = phieus.DiemTong,
                            NgaySinh = x.NgaySinh

                        }).FirstOrDefault();
                        if (dstaikhoan != default)
                        {
                            data.Add(dstaikhoan);
                        }
                    }
                    else
                    {
                        var dstaikhoan = _context.TaiKhoans.Where(x => x.MaLop == MaLop && x.TaiKhoanId == item.TaiKhoanId && x.IsDelete != true).Select(x => new DanhSachSinhVienVM()
                        {
                            TaiKhoanId = x.TaiKhoanId,
                            HoTen = x.HoTen,
                            MaTaiKhoan = x.MaTaiKhoan,
                            TrangThai = taikhoanthongbao.TrangThai,
                            NgaySinh = x.NgaySinh

                        }).FirstOrDefault();
                        if (dstaikhoan != default)
                        {
                            data.Add(dstaikhoan);
                        }
                    }
                    
                }
                else
                {
                    var dstaikhoan = _context.TaiKhoans.Where(x => x.MaLop == MaLop && x.IsDelete != true).Select(x => new DanhSachSinhVienVM()
                    {
                        TaiKhoanId = item.TaiKhoanId,
                        HoTen = item.HoTen,
                        MaTaiKhoan = item.MaTaiKhoan,
                        TrangThai = (int)EnumThongBao.KhoiTao,
                        NgaySinh=item.NgaySinh
                        
                    }).FirstOrDefault();
                    if (dstaikhoan != default)
                    {
                        data.Add(dstaikhoan);
                    }
                }

            }
            return data;
        }
        public List<DanhSachSinhVienVM> XepLoai(int MaLop)
        {
            var data = new List<DanhSachSinhVienVM>();
            var KyDKID = _context.LopKyDangKys.Where(x => x.MaLop == MaLop && x.IsDelete != true).Max(x => x.KyDkid);
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
                    var phieus = _context.PhieuDanhGias.Where(x => x.KyDkid == KyDKID && x.SinhVienId == item.TaiKhoanId && x.IsDelete != true).FirstOrDefault();
                    if (phieus != default)
                    {
                        var dstaikhoan = _context.TaiKhoans.Where(x => x.MaLop == MaLop && x.TaiKhoanId == item.TaiKhoanId && x.IsDelete != true).Select(x => new DanhSachSinhVienVM()
                        {
                            TaiKhoanId = x.TaiKhoanId,
                            HoTen = x.HoTen,
                            MaTaiKhoan = x.MaTaiKhoan,
                            TrangThai = taikhoanthongbao.TrangThai,
                            DiemTongSV = phieus.DiemTongSV,
                            DiemTongCBL = phieus.DiemTongCBL,
                            DiemTong = phieus.DiemTong,
                            NgaySinh = x.NgaySinh

                        }).FirstOrDefault();
                        if (dstaikhoan != default)
                        {
                            data.Add(dstaikhoan);
                        }
                    }
                    else
                    {
                        var dstaikhoan = _context.TaiKhoans.Where(x => x.MaLop == MaLop && x.TaiKhoanId == item.TaiKhoanId && x.IsDelete != true).Select(x => new DanhSachSinhVienVM()
                        {
                            TaiKhoanId = x.TaiKhoanId,
                            HoTen = x.HoTen,
                            MaTaiKhoan = x.MaTaiKhoan,
                            TrangThai = taikhoanthongbao.TrangThai,
                            NgaySinh = x.NgaySinh

                        }).FirstOrDefault();
                        if (dstaikhoan != default)
                        {
                            data.Add(dstaikhoan);
                        }
                    }

                }
                else
                {
                    var dstaikhoan = _context.TaiKhoans.Where(x => x.MaLop == MaLop && x.IsDelete != true).Select(x => new DanhSachSinhVienVM()
                    {
                        TaiKhoanId = item.TaiKhoanId,
                        HoTen = item.HoTen,
                        MaTaiKhoan = item.MaTaiKhoan,
                        TrangThai = (int)EnumThongBao.KhoiTao,
                        NgaySinh=item.NgaySinh
                    }).FirstOrDefault();
                    if (dstaikhoan != default)
                    {
                        data.Add(dstaikhoan);
                    }
                }

            }
            return data;
        }

    }
}
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

namespace QuanlyDiemrenluyen.Services
{
    public class KyDangKyService: IKyDangKyService
    {
        private DataContext _context;
        public KyDangKyService(DataContext context)
        {
            _context = context;
        }
        public int Create(KyDangKyVM model,int MaKhoa)
        {
            var check = _context.LopKyDangKys.Include(x => x.KyDk).Where(x => x.MaKhoa == MaKhoa && x.KyDk.HocKyXet == model.HocKyXet && x.KyDk.NamXet == model.NamXet && x.IsDelete != true).FirstOrDefault();
            if (check != null)
                throw new Exception("Học kỳ trong năm học này đã dc tạo.");
            else
            {
                var entity = new KyDangKy();
                entity.HocKyXet = model.HocKyXet;
                entity.NgayBd = model.NgayBD;
                entity.NgayKt = model.NgayKT;
                entity.NamXet = model.NamXet;
                entity.TieuDeDk = model.TieuDe;
                entity.NoiDungDk = model.NoiDung;
                entity.TrangThai = 1;
                entity.IsDelete = false;
                _context.KyDangKys.Add(entity);
                _context.SaveChanges();
                return entity.KyDkid;
            }
        }
       public int AddThongBao(KyDangKyVM model, int KyDKID)
        {
            var entity = new ThongBao();
            entity.NgayThongBao = DateTime.Now;
            entity.NoiDungTb = model.NoiDung;
            entity.TieuDe = model.TieuDe;
            entity.KyDkid = KyDKID;
            _context.ThongBaos.Add(entity);
            _context.SaveChanges();
            return entity.ThongBaoId;
        }
        public void AddThongBaoToTaiKhoan(KyDangKyVM model, int TBID)
        {
            for (int i = 0; i < model.MaLopList.Length; i++)
            {
                int maLop = int.Parse(model.MaLopList[i]);
                var lops = _context.TaiKhoans.Where(x => x.MaLop == maLop).ToList();
                foreach(var item in lops)
                {
                    var entity = new TaiKhoanThongBao();
                    entity.TaiKhoanId = item.TaiKhoanId;
                    entity.ThongBaoId = TBID;
                    entity.TrangThai = (int)EnumThongBao.KhoiTao;
                    _context.TaiKhoanThongBaos.Add(entity);
                    _context.SaveChanges();
                }
            }
            
        }

        public int Delete(KyDangKy model)
        {
            var entity = _context.KyDangKys.Where(x => x.KyDkid == model.KyDkid && x.IsDelete != true).FirstOrDefault();
            if (entity == default)
                throw new Exception("Không tìm thấy dữ liệu.");
            entity.IsDelete = true;
            _context.SaveChanges();
            return entity.KyDkid;
        }

        public int DeleteThongBao(int id)
        {
            var entity = _context.ThongBaos.Where(x => x.KyDkid == id && x.IsDelete != true).FirstOrDefault();
            entity.IsDelete = true;
            _context.SaveChanges();
            return entity.ThongBaoId;
        }

        public void DeleteThongBaoToTaiKhoan(int idtb)
        {
            var entity = _context.TaiKhoanThongBaos.Where(x => x.ThongBaoId == idtb && x.IsDelete != true).ToList();
            foreach (var item in entity)
            {
                item.IsDelete = true;
            }
            _context.SaveChanges();
        }
        public void Update(KyDangKy model)
        {
            var entity = _context.KyDangKys.Where(x => x.KyDkid == model.KyDkid && x.IsDelete != true).FirstOrDefault();
            if (entity == default)
                throw new Exception("Không tìm thấy dữ liệu.");
            entity.TrangThai = (int)EnumKyDangKy.DaKetThuc;
            _context.SaveChanges();
        }

        public List<KyDangKy> Get()
        {
            return _context.KyDangKys.Where(x=>x.IsDelete != true).OrderByDescending(x=>x.KyDkid).ToList();
        }

        public List<KyDangKy> GetByKhoa(int MaKhoa)
        {
            var data = new List<KyDangKy>();
            var check = _context.LopKyDangKys.Include(x => x.KyDk).Where(x => x.MaKhoa == MaKhoa && x.IsDelete != true).GroupBy(x => x.KyDkid).OrderByDescending(x => x.Key).ToList();
            foreach (var item in check)
            {
                var kydk = _context.KyDangKys.Where(x => x.KyDkid == item.Key && x.IsDelete != true).OrderByDescending(x => x.KyDkid).FirstOrDefault();
                if (kydk != default)
                {
                    data.Add(kydk);
                }
            }
            return data;
        }
        public KyDangKy GetById(int id)
        {
            return _context.KyDangKys.Where(x => x.KyDkid == id && x.IsDelete != true ).FirstOrDefault();
        }

        public List<DanhSachSinhVienVM> GetBySinhVien(int MaLop, int TaiKhoanID)
        {
            var data = new List<DanhSachSinhVienVM>();
            var kydks = _context.LopKyDangKys.Where(x => x.MaLop == MaLop && x.IsDelete != true).OrderByDescending(x => x.KyDkid).ToList();
            foreach (var item in kydks)
            {
                var thongbao = _context.ThongBaos.Where(x => x.KyDkid == item.KyDkid && x.IsDelete != true).FirstOrDefault();
                var taikhoanthongbao = _context.TaiKhoanThongBaos.Where(x => x.ThongBaoId == thongbao.ThongBaoId && x.TaiKhoanId == TaiKhoanID && x.IsDelete != true).FirstOrDefault();
                if (taikhoanthongbao != default)
                {
                    var entity = _context.PhieuDanhGias.Include(x => x.KyDangKy).Where(x => x.KyDkid == item.KyDkid && x.SinhVienId==TaiKhoanID  && x.IsDelete != true).OrderByDescending(x => x.KyDkid)
                            .Select(x => new DanhSachSinhVienVM()
                            {
                                HocKyXet = x.KyDangKy.HocKyXet,
                                NamXet = x.KyDangKy.NamXet,
                                DiemTong = x.DiemTong,
                                NgayDanhGia = x.NgayDanhGia,
                                TrangThai = taikhoanthongbao.TrangThai,
                                KyDKID=x.KyDkid
                            }).FirstOrDefault();
                    if (entity != default)
                    {
                        data.Add(entity);
                    }
                }
                else
                {
                    return data;
                }
            }

            return data;
        }

        public List<KyDangKy> GetByCanBoLop(int MaLop)
        {
            var data = new List<KyDangKy>();
            var kydks = _context.LopKyDangKys.Where(x => x.MaLop == MaLop && x.IsDelete != true).OrderByDescending(x => x.KyDkid).ToList();
            foreach(var item in kydks)
            {
                var entity = _context.KyDangKys.Where(x => x.KyDkid == item.KyDkid && x.IsDelete != true).OrderByDescending(x => x.KyDkid).FirstOrDefault();
                if (entity != default)
                {
                    data.Add(entity);
                }
            }
            
            return data;
        }
        public List<KyDangKy> GetByCanBoKhoa(int MaKhoa)
        {
            var data = new List<KyDangKy>();
            var kydks = _context.LopKyDangKys.Where(x => x.MaKhoa == MaKhoa && x.IsDelete != true).OrderByDescending(x => x.KyDkid).GroupBy(x=>x.KyDkid).ToList();
            foreach (var item in kydks)
            {
                var entity = _context.KyDangKys.Where(x => x.KyDkid == item.Key && x.IsDelete != true).OrderByDescending(x => x.KyDkid).FirstOrDefault();
                if (entity != default)
                {
                    data.Add(entity);
                }
            }

            return data;
        }

    }
}
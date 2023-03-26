using QuanlyDiemrenluyen.Data;
using QuanlyDiemrenluyen.Interfaces;
using QuanlyDiemrenluyen.Models;
using QuanlyDiemrenluyen.ViewModels;
using System.Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.Services
{
    public class DiemService : IDiemService
    {
        private DataContext _context;
        public DiemService(DataContext context)
        {
            _context = context;
        }
        public void Create(KyDangKyVM model, int idPhieu)
        {
            var tieuchis = _context.TieuChis.Where(x => x.IsDelete != true).ToList();   
            foreach(var item in tieuchis)
            {
                var entity = new Diem();
                entity.PhieuId = idPhieu;
                entity.TieuChiId = item.TieuChiId;
                entity.IsDelete = false;
                _context.Diems.Add(entity);
                
            }
            _context.SaveChanges();

        }

        //public void Delete(Diem model)
        //{
        //    var entity = _context.Khoas.Where(x => x.MaKhoa == model.MaKhoa && x.IsDelete != true).FirstOrDefault();
        //    if (entity == default)
        //        throw new Exception("Không tìm thấy dữ liệu.");
        //    entity.IsDelete = true;
        //    _context.SaveChanges();
        //}

        public List<Diem> Get()
        {
            return _context.Diems.Where(x => x.IsDelete != true).ToList();
        }

        public Diem GetById(int id)
        {
            return _context.Diems.Where(x => x.DiemId == id && x.IsDelete != true).FirstOrDefault();
        }

        public List<Diem> GetByDiem(int id)
        {
            return _context.Diems.Where(x => x.PhieuId == id && x.IsDelete != true).ToList();
        }

        public void UpdateDiem(List<PhieuDanhGiaVM> model)
        {
            var phieu = model[0];
            var tongdiem = 0;
            foreach(var item in model)
            {
                var entity = _context.Diems.Include(x=>x.Phieu).Where(x => x.DiemId == item.DiemId  && x.TieuChiId == item.TieuChiId && x.IsDelete != true).FirstOrDefault();
                if(item.DiemSv != null)
                    entity.DiemSv = item.DiemSv;
                else if(item.DiemCbl != null)
                    entity.DiemCbl = item.DiemCbl;
                else if(item.DiemCbk != null)
                {
                    entity.DiemCbk = item.DiemCbk;
                    tongdiem += (int)item.DiemCbk;
                }
                _context.SaveChanges();
            }
            var phieus = _context.PhieuDanhGias.Where(x => x.PhieuId == phieu.PhieuId && x.IsDelete != true).FirstOrDefault();
            phieus.DiemTong = tongdiem;
            _context.SaveChanges();
        }
        public void UpdateDiemTongCBL(List<PhieuDanhGiaVM> model)
        {
            var phieu = model[0];
            var tongdiem = 0;
            foreach (var item in model)
            {
                var entity = _context.Diems.Include(x => x.Phieu).Where(x => x.DiemId == item.DiemId && x.TieuChiId == item.TieuChiId && x.IsDelete != true).FirstOrDefault();
                if (item.DiemSv != null)
                    entity.DiemSv = item.DiemSv;
                else if (item.DiemCbl != null)
                {
                    entity.DiemCbl = item.DiemCbl;
                    tongdiem += (int)item.DiemCbl;
                }
                _context.SaveChanges();
            }
            var phieus = _context.PhieuDanhGias.Where(x => x.PhieuId == phieu.PhieuId && x.IsDelete != true).FirstOrDefault();
            phieus.DiemTongCBL = tongdiem;
            _context.SaveChanges();
        }
        public void UpdateDiemTongSV(List<PhieuDanhGiaVM> model)
        {
            var phieu = model[0];
            var tongdiem = 0;
            foreach (var item in model)
            {
                var entity = _context.Diems.Include(x => x.Phieu).Where(x => x.DiemId == item.DiemId && x.TieuChiId == item.TieuChiId && x.IsDelete != true).FirstOrDefault();
                if (item.DiemSv != null)
                {
                    entity.DiemSv = item.DiemSv;
                    tongdiem += (int)item.DiemSv;
                }
                _context.SaveChanges();
            }
            var phieus = _context.PhieuDanhGias.Where(x => x.PhieuId == phieu.PhieuId && x.IsDelete != true).FirstOrDefault();
            phieus.DiemTongSV = tongdiem;
            _context.SaveChanges();
        }
    }
}
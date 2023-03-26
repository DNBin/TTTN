using QuanlyDiemrenluyen.Data;
using QuanlyDiemrenluyen.Interfaces;
using QuanlyDiemrenluyen.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.Services
{
    public class TieuChiService: ITieuChiService
    {
        private DataContext _context;
        public TieuChiService(DataContext context)
        {
            _context = context;
        }

        public void Create(TieuChi model)
        {
            var check = _context.TieuChis.Where(x => x.TenTieuChi == model.TenTieuChi && x.IsDelete != true).FirstOrDefault();
            if (check != default(TieuChi))
                throw new Exception("Tiêu chí đã tồn tại.");
            var entity = new TieuChi();
            entity.IsDelete = false;
            entity.TenTieuChi = model.TenTieuChi;
            entity.ParentId = model.ParentId;
            entity.DiemTieuChi = model.DiemTieuChi;
            entity.OrderKey = model.OrderKey;
            _context.TieuChis.Add(entity);
            _context.SaveChanges();
        }

        public void Delete(TieuChi model)
        {
            var entity = _context.TieuChis.Where(x => x.TieuChiId == model.TieuChiId && x.IsDelete != true).FirstOrDefault();
            if (entity == default)
                throw new Exception("Không tìm thấy dữ liệu.");
            entity.IsDelete = true;
            _context.SaveChanges();
        }

        public List<TieuChi> Get()
        {
            return _context.TieuChis.Where(x => x.IsDelete != true).OrderByDescending(x=>x.OrderKey).ToList();
        }

        //public List<TieuChi> GetChild(int id)
        //{
        //    var parent = _context.TieuChis.Where(x => x.ParentId == 0 && x.IsDelete != true).OrderBy(x => x.OrderKey).ToList();
        //    foreach (var item in parent)
        //    {
        //        id = item.TieuChiId;
        //    }
        //    return _context.TieuChis.Where(x => x.ParentId != id && x.IsDelete != true).OrderBy(x => x.OrderKey).ToList();
        //}

        public TieuChi GetById(int id)
        {
            return _context.TieuChis.Where(x => x.TieuChiId == id && x.IsDelete != true).FirstOrDefault();
        }

        public void Update(TieuChi model)
        {
            var entity = _context.TieuChis.Where(x => x.TieuChiId == model.TieuChiId && x.IsDelete != true).FirstOrDefault();
            if (entity == default)
                throw new Exception("Không tìm thấy dữ liệu.");
            entity.IsDelete = false;
            entity.TenTieuChi = model.TenTieuChi;
            entity.ParentId = model.ParentId;
            entity.DiemTieuChi = model.DiemTieuChi;
            entity.OrderKey = model.OrderKey;
            _context.SaveChanges();
        }
    }
}
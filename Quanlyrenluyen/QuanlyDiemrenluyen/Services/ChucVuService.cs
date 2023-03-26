using QuanlyDiemrenluyen.Data;
using QuanlyDiemrenluyen.Interfaces;
using QuanlyDiemrenluyen.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.Services
{
    public class ChucVuService : IChucVuService
    {
        private DataContext _context;
        public ChucVuService(DataContext context)
        {
            _context = context;
        }
        public void Create(ChucVu model)
        {
            var check = _context.ChucVus.Where(x => x.TenChucVu == model.TenChucVu && x.IsDelete != true).FirstOrDefault();
            if (check != default(ChucVu))
                throw new Exception("Chức vụ đã tồn tại.");
            var entity = new ChucVu();
            entity.TenChucVu = model.TenChucVu;
            entity.IsDelete = false;
            entity.Loai = model.Loai;
            _context.ChucVus.Add(entity);
            _context.SaveChanges();
        }

        public void Delete(ChucVu model)
        {
            var entity = _context.ChucVus.Where(x => x.ChucVuId == model.ChucVuId && x.IsDelete != true).FirstOrDefault();
            if (entity == default)
                throw new Exception("Không tìm thấy dữ liệu.");
            entity.IsDelete = true;
            _context.SaveChanges();
        }

        public List<ChucVu> Get()
        {
            return _context.ChucVus.Where(x => x.IsDelete != true).OrderByDescending(x => x.ChucVuId).ToList();
        }

        public ChucVu GetById(int id)
        {
            return _context.ChucVus.Where(x => x.ChucVuId == id && x.IsDelete != true).FirstOrDefault();
        }

        public void Update(ChucVu model)
        {
            var entity = _context.ChucVus.Where(x => x.ChucVuId == model.ChucVuId && x.IsDelete != true).FirstOrDefault();
            if (entity == default)
                throw new Exception("Không tìm thấy dữ liệu.");
            entity.TenChucVu = model.TenChucVu;
            entity.IsDelete = false;
            entity.Loai = model.Loai;
            _context.SaveChanges();
        }
    }
}
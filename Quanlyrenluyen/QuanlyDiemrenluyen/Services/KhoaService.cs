using QuanlyDiemrenluyen.Data;
using QuanlyDiemrenluyen.Interfaces;
using QuanlyDiemrenluyen.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.Services
{
    public class KhoaService : IKhoaService
    {
        private DataContext _context;
        public KhoaService(DataContext context)
        {
            _context = context;
        }
        public void Create(Khoa model)
        {
            var check = _context.Khoas.Where(x => x.TenKhoa == model.TenKhoa && x.IsDelete != true).FirstOrDefault();
            if (check != default(Khoa))
                throw new Exception("Khoa đã tồn tại.");
            var entity = new Khoa();
            entity.TenKhoa = model.TenKhoa;
            entity.IsDelete = false;
            _context.Khoas.Add(entity);
            _context.SaveChanges();
        }

        public void Delete(Khoa model)
        {
            var entity = _context.Khoas.Where(x => x.MaKhoa == model.MaKhoa && x.IsDelete != true).FirstOrDefault();
            if (entity == default)
                throw new Exception("Không tìm thấy dữ liệu.");
            entity.IsDelete = true;
            _context.SaveChanges();
        }

        public List<Khoa> Get()
        {
            return _context.Khoas.Where(x => x.IsDelete != true).OrderByDescending(x => x.MaKhoa).ToList();
        }

        public Khoa GetById(int id)
        {
            return _context.Khoas.Where(x => x.MaKhoa == id && x.IsDelete != true).FirstOrDefault();
        }

        public void Update(Khoa model)
        {
            var entity = _context.Khoas.Where(x => x.MaKhoa == model.MaKhoa && x.IsDelete != true).FirstOrDefault();
            if (entity == default)
                throw new Exception("Không tìm thấy dữ liệu.");
            entity.TenKhoa = model.TenKhoa;
            entity.IsDelete = false;
            _context.SaveChanges();
        }
    }
}
using QuanlyDiemrenluyen.Data;
using QuanlyDiemrenluyen.Interfaces;
using QuanlyDiemrenluyen.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.Services
{
    public class QuyenService: IQuyenService
    {
        private DataContext _context;
        public QuyenService(DataContext context)
        {
            _context = context;
        }

        public void Create(Quyen model)
        {
            var check = _context.Quyens.Where(x => x.TenQuyen == model.TenQuyen && x.IsDelete != true).FirstOrDefault();
            if (check != default(Quyen))
                throw new Exception("Quyền đã tồn tại.");
            var entity = new Quyen();
            entity.TenQuyen = model.TenQuyen;
            entity.MoTa = model.MoTa;
            _context.Quyens.Add(entity);
            _context.SaveChanges();
        }

        public void Delete(Quyen model)
        {
            var check = _context.Quyens.Where(x => x.MaQuyen == model.MaQuyen && x.IsDelete != true).FirstOrDefault();
            if (check == default(Quyen))
                throw new Exception("Không tìm thấy dữ liệu.");
            _context.Quyens.Remove(check);
            _context.SaveChanges();
        }

        public List<Quyen> Get()
        {
            var list = _context.Quyens.Where(x=>x.IsDelete != true).OrderByDescending(x => x.MaQuyen).ToList();
            return list;
        }

        public Quyen GetById(int id)
        {
            return _context.Quyens.Where(x => x.MaQuyen == id && x.IsDelete != true ).FirstOrDefault();
        }

        public void Update(Quyen model)
        {
            var entity = _context.Quyens.Where(x => x.MaQuyen == model.MaQuyen && x.IsDelete != true).FirstOrDefault();
            if (entity == default)
                throw new Exception("Không tìm thấy dữ liệu.");
            entity.TenQuyen = model.TenQuyen;
            entity.MoTa = model.MoTa;
            _context.SaveChanges();
        }
    }
}
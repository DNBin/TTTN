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
    public class LopKyDangKyService:ILopKyDangKyService
    {
        private DataContext _context;
        public LopKyDangKyService(DataContext context)
        {
            _context = context;
        }
        public void Create(KyDangKyVM model,int KyDKID)
        {
            for(int i = 0; i < model.MaLopList.Length; i++)
            {
                var entity = new LopKyDangKy();
                entity.MaLop = int.Parse(model.MaLopList[i]);
                entity.KyDkid = KyDKID;
                entity.MaKhoa = model.MaKhoa;
                _context.LopKyDangKys.Add(entity);
                _context.SaveChanges();
            }
           
        }
        public List<LopKyDangKy> Get()
        {
            return _context.LopKyDangKys.ToList();
        }

        public LopKyDangKy GetById(int id)
        {
            return _context.LopKyDangKys.Where(x => x.Id == id).FirstOrDefault();
        }
        public void Delete(int id)
        {
            var entity = _context.LopKyDangKys.Where(x => x.KyDkid == id && x.IsDelete != true).ToList();
            foreach (var item in entity)
            {
                item.IsDelete = true;
            }
            _context.SaveChanges();
        }
    }
}
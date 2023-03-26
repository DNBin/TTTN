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
    public class MenuService : IMenuService
    {
        private DataContext _context;
        public MenuService(DataContext context)
        {
            _context = context;
        }

        public void Create(Menu model)
        {
            var check = _context.Menus.Where(x => x.TenMenu == model.TenMenu && x.IsDelete != true).FirstOrDefault();
            if (check != default(Menu))
                throw new Exception("Menu đã tồn tại.");
            var entity = new Menu();
            entity.IsDelete = false;
            entity.TenMenu = model.TenMenu;
            entity.Path = model.Path;
            entity.ParentId = model.ParentId;
            entity.OrderKey = model.OrderKey;
            _context.Menus.Add(entity);
            _context.SaveChanges();
        }

        public void Delete(Menu model)
        {
            var entity = _context.Menus.Where(x => x.MenuId == model.MenuId && x.IsDelete != true).FirstOrDefault();
            if (entity == default)
                throw new Exception("Không tìm thấy dữ liệu.");
            entity.IsDelete = true;
            _context.SaveChanges();
        }

        public List<Menu> Get()
        {
            var list = _context.Menus.Where(x => x.IsDelete != true).OrderByDescending(x => x.MenuId).ToList();
            return list;
        }

        public Menu GetById(int id)
        {
            return _context.Menus.Where(x => x.MenuId == id && x.IsDelete != true).FirstOrDefault();
        }

        public void Update(Menu model)
        {
            var entity = _context.Menus.Where(x => x.MenuId == model.MenuId && x.IsDelete != true).FirstOrDefault();
            if (entity == default)
                throw new Exception("Không tìm thấy dữ liệu.");
            entity.IsDelete = false;
            entity.TenMenu = model.TenMenu;
            entity.Path = model.Path;
            entity.ParentId = model.ParentId;
            entity.OrderKey = model.OrderKey;
            _context.SaveChanges();
        }
    }
}
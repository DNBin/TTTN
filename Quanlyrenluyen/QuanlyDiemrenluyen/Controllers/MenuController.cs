using QuanlyDiemrenluyen.Interfaces;
using QuanlyDiemrenluyen.Models;
using QuanlyDiemrenluyen.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanlyDiemrenluyen.Controllers
{
    public class MenuController : BaseController
    {
        private readonly IMenuService _menuService;
        public MenuController(IMenuService menuService)
        {
            _menuService = menuService;
        }
        // GET: Menu
        public ActionResult Index()
        {
            var entity = _menuService.Get();
            return View(entity);
        }
        public ActionResult GetMenuPartial(int id = 0)
        {
            ListMenu();
            if (id == 0)
            {
                var menu = new Menu();
                return PartialView("_AddEdit", menu);
            }
            else
            {
                var menu = _menuService.GetById(id);
                return PartialView("_AddEdit", menu);
            }

        }
        private void ListMenu(long? SelectMenu= null)
        {
            ViewBag.menus = new SelectList(_menuService.Get(), "MenuID", "TenMenu", SelectMenu);
        }

        public ActionResult GetInfo(int id)
        {
            var menu = _menuService.GetById(id);
            return PartialView("Details", menu);
        }

        // Post: TaiKhoans/AddOrEdit
        public ActionResult AddOrEdit(Menu model)
        {
            if (ModelState.IsValid)
            {
                if (model.MenuId > 0)
                {
                    _menuService.Update(model);
                    return Json(new MessageVM()
                    {
                        Status = true,
                        Message = $"Cập nhật danh mục thành công!",
                        MessageType = Messages.success
                    }, JsonRequestBehavior.AllowGet);
                }
                else
                    _menuService.Create(model);
                    return Json(new MessageVM()
                    {
                        Status = true,
                        Message = $"Thêm danh mục thành công!",
                        MessageType = Messages.success
                    }, JsonRequestBehavior.AllowGet);
            }
            return Json(new MessageVM()
            {
                Status = false,
                Message = $"Thất bại!",
                MessageType = Messages.error
            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetDelete(int id)
        {
            var menu = _menuService.GetById(id);
            return PartialView("_Delete", menu);

        }
        // Post: TaiKhoans/Delete

        public ActionResult Delete(Menu model)
        {
            _menuService.Delete(model);
            return Json(new MessageVM()
            {
                Status = true,
                Message = $"Xóa danh mục thành công!",
                MessageType = Messages.error
            }, JsonRequestBehavior.AllowGet);
        }
    }
}
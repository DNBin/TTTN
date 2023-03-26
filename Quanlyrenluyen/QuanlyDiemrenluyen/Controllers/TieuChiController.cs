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
    public class TieuChiController : BaseController
    {
        private readonly ITieuChiService _tieuChiService;
        public TieuChiController(ITieuChiService tieuChiService)
        {
            _tieuChiService = tieuChiService;
        }
        // GET: TieuChi
        public ActionResult Index()
        {
            var entity = _tieuChiService.Get();
            return View(entity);
        }
        public ActionResult GetPartial(int id = 0)
        {
            if (id == 0)
            {
                var menu = new TieuChi();
                return PartialView("_AddEdit", menu);
            }
            else
            {
                var menu = _tieuChiService.GetById(id);
                return PartialView("_AddEdit", menu);
            }
        }
        //private void ListMenu(long? SelectMenu = null)
        //{
        //    ViewBag.menus = new SelectList(_tieuChiService.Get(), "MenuID", "TenMenu", SelectMenu);
        //}

        //public ActionResult GetInfo(int id)
        //{
        //    var menu = _tieuChiService.GetById(id);
        //    return PartialView("Details", menu);
        //}

       
        public ActionResult AddOrEdit(TieuChi model)
        {
            if (ModelState.IsValid)
            {
                if (model.TieuChiId > 0)
                {
                    _tieuChiService.Update(model);
                    return Json(new MessageVM()
                    {
                        Status = true,
                        Message = $"Cập nhật tiêu chí thành công!",
                        MessageType = Messages.success
                    }, JsonRequestBehavior.AllowGet);
                }
                else
                    _tieuChiService.Create(model);
                return Json(new MessageVM()
                {
                    Status = true,
                    Message = $"Thêm tiêu chí thành công!",
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
            var menu = _tieuChiService.GetById(id);
            return PartialView("_Delete", menu);

        }
        

        public ActionResult Delete(TieuChi model)
        {
            _tieuChiService.Delete(model);
            return Json(new MessageVM()
            {
                Status = true,
                Message = $"Xóa tiêu chí thành công!",
                MessageType = Messages.error
            }, JsonRequestBehavior.AllowGet);
        }
    }
}
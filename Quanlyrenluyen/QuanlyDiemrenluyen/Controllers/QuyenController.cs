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
    public class QuyenController : BaseController
    {
        private readonly IQuyenService _quyenService;

        public QuyenController(IQuyenService quyenService)
        {
            _quyenService = quyenService;
        }
        // GET: Quyen
        public ActionResult Index()
        {
            var list = _quyenService.Get();
            return View(list);
        }

        // GET: TaiKhoans/GetUserPartial
        public ActionResult GetQuyenPartial(int id = 0)
        {
            if (id == 0)
            {
                var quyen = new Quyen();
                return PartialView("_AddEdit", quyen);
            }
            else
            {
                var user = _quyenService.GetById(id);
                return PartialView("_AddEdit", user);
            }

        }

        public ActionResult GetInfo(int id)
        {
            var user = _quyenService.GetById(id);
            return PartialView("Details", user);
        }

        // Post: TaiKhoans/AddOrEdit
        public ActionResult AddOrEdit(Quyen model)
        {
            if (ModelState.IsValid)
            {
                if (model.MaQuyen > 0)
                {
                    _quyenService.Update(model);
                    return Json(new MessageVM()
                    {
                        Status = true,
                        Message = $"Cập nhật quyền thành công!",
                        MessageType = Messages.success
                    }, JsonRequestBehavior.AllowGet);
                }
                else
                    _quyenService.Create(model);
                    return Json(new MessageVM()
                    {
                        Status = true,
                        Message = $"Thêm quyền thành công!",
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
            var user = _quyenService.GetById(id);
            return PartialView("_Delete", user);

        }
        // Post: TaiKhoans/Delete

        public ActionResult Delete(Quyen model)
        {
            _quyenService.Delete(model);
            return Json(new MessageVM()
            {
                Status = true,
                Message = $"Xóa quyền thành công!",
                MessageType = Messages.error
            }, JsonRequestBehavior.AllowGet);
        }
    }
}
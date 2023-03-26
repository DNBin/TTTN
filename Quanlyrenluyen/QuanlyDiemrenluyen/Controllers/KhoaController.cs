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
    public class KhoaController : BaseController
    {
        private readonly IKhoaService _khoaService;
        public KhoaController(IKhoaService khoaService)
        {
            _khoaService = khoaService;
        }
        // GET: Khoa
        public ActionResult Index()
        {
            var list = _khoaService.Get();
            return View(list);
        }

        public ActionResult GetKhoaPartial(int id = 0)
        {
            if (id == 0)
            {
                var khoa = new Khoa();
                return PartialView("_AddEdit", khoa);
            }
            else
            {
                var khoa = _khoaService.GetById(id);
                return PartialView("_AddEdit", khoa);
            }

        }

        // Post: TaiKhoans/AddOrEdit
        public ActionResult AddOrEdit(Khoa model)
        {
            if (ModelState.IsValid)
            {
                if (model.MaKhoa > 0)
                {
                    _khoaService.Update(model);
                    return Json(new MessageVM()
                    {
                        Status = true,
                        Message = $"Cập nhật khoa thành công!",
                        MessageType = Messages.success
                    }, JsonRequestBehavior.AllowGet);
                }
                else
                    _khoaService.Create(model);
                    return Json(new MessageVM()
                    {
                        Status = true,
                        Message = $"Thêm khoa thành công!",
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
            var entity = _khoaService.GetById(id);
            return PartialView("_Delete", entity);

        }
        // Post: TaiKhoans/Delete

        public ActionResult Delete(Khoa model)
        {
            _khoaService.Delete(model);
            return Json(new MessageVM()
            {
                Status = true,
                Message = $"Xóa khoa thành công!",
                MessageType = Messages.error
            }, JsonRequestBehavior.AllowGet);
        }

    }
}
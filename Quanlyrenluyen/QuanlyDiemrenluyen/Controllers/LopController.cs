using QuanlyDiemrenluyen.Helpers;
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
    public class LopController : BaseController
    {
        private readonly ILopService _lopService;
        private readonly IKhoaService _khoaService;


        public LopController(ILopService lopService,IKhoaService khoaService)
        {
            _khoaService = khoaService;
            _lopService = lopService;
        }
        // GET: Lop
        public ActionResult Index()
        {
            var session = (User)Session[Constants.USER_SESSION];
            var list = _lopService.GetLopByKhoa(session.MaKhoa);
            return View(list);
        }
        public ActionResult GetLopPartial(int id = 0)
        {
            ListKhoa();
            if (id == 0)
            {
                var lop = new Lop();
                return PartialView("_AddEdit", lop);
            }
            else
            {
                var lop = _lopService.GetById(id);
                return PartialView("_AddEdit", lop);
            }

        }

        public ActionResult GetInfo(int id)
        {
            var user = _lopService.GetById(id);
            return PartialView("Details", user);
        }

        // Post: TaiKhoans/AddOrEdit
        public ActionResult AddOrEdit(Lop model)
        {
            if (ModelState.IsValid)
            {
                if (model.MaLop > 0)
                {
                    _lopService.Update(model);
                    return Json(new MessageVM()
                    {
                        Status = true,
                        Message = $"Cập nhật lớp thành công!",
                        MessageType = Messages.success
                    }, JsonRequestBehavior.AllowGet);
                }
                else
                    _lopService.Create(model);
                    return Json(new MessageVM()
                    {
                        Status = true,
                        Message = $"Thêm lớp thành công!",
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

        private void ListKhoa(long? SelectKhoa = null)
        {
            ViewBag.khoas = new SelectList(_khoaService.Get(), "MaKhoa", "TenKhoa", SelectKhoa);
        }

        public ActionResult GetDelete(int id)
        {
            var entity = _lopService.GetById(id);
            return PartialView("_Delete", entity);

        }
        // Post: TaiKhoans/Delete

        public ActionResult Delete(Lop model)
        {
            _lopService.Delete(model);
            return Json(new MessageVM()
            {
                Status = true,
                Message = $"Xóa lớp thành công!",
                MessageType = Messages.error
            }, JsonRequestBehavior.AllowGet);
        }
    }
}
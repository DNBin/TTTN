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
    public class ChucVuController : BaseController
    {
        private readonly IChucVuService _chucvuService;
        public ChucVuController(IChucVuService chucvuService)
        {
            _chucvuService = chucvuService;
        }
        // GET: ChucVu
        public ActionResult Index()
        {
            var list = _chucvuService.Get();
            return View(list);
        }

        public ActionResult GetPartial(int id = 0)
        {
            List();
            if (id == 0)
            {
                var entity = new ChucVu();
                return PartialView("_AddEdit", entity);
            }
            else
            {
                var entity = _chucvuService.GetById(id);
                return PartialView("_AddEdit", entity);
            }

        }
        private void List(long? SelectCV = null)
        {
            ViewBag.menus = new SelectList(_chucvuService.Get(), "ChucVuID", "Loai", SelectCV);
        }
        // Post: TaiKhoans/AddOrEdit
        public ActionResult AddOrEdit(ChucVu model)
        {

                if (model.ChucVuId > 0)
                {
                    _chucvuService.Update(model);
                    return Json(new MessageVM()
                    {
                        Status = true,
                        Message = $"Cập nhật chức vụ thành công!",
                        MessageType = Messages.success
                    }, JsonRequestBehavior.AllowGet);
            }
                else
                    _chucvuService.Create(model);
                    return Json(new MessageVM()
                    {
                        Status = true,
                        Message = $"Thêm chức vụ thành công!",
                        MessageType = Messages.success
                    }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetDelete(int id)
        {
            var entity = _chucvuService.GetById(id);
            return PartialView("_Delete", entity);

        }
        // Post: TaiKhoans/Delete

        public ActionResult Delete(ChucVu model)
        {
            _chucvuService.Delete(model);
            return Json(new MessageVM()
            {
                Status = true,
                Message = $"Xóa chức vụ thành công!",
                MessageType = Messages.error
            }, JsonRequestBehavior.AllowGet);
        }
        
    }
}
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
    public class KyDanhGiaController : BaseController
    {
        private readonly IKyDangKyService _kyDangKyService;
        private readonly ILopKyDangKyService _lopKyDangKyService;

        public KyDanhGiaController(IKyDangKyService kyDangKyService, ILopKyDangKyService lopKyDangKyService)
        {
            _kyDangKyService = kyDangKyService;
            _lopKyDangKyService = lopKyDangKyService;
        }
        // GET: KyDanhGia
        public ActionResult Index()
        {
            var session = (User)Session[Constants.USER_SESSION];
            var list = _kyDangKyService.GetByKhoa(session.MaKhoa);
            return View(list);
        }
        public ActionResult GetDelete(int id)
        {
            var entity = _kyDangKyService.GetById(id);
            return PartialView("_Delete", entity);

        }
        // Post: TaiKhoans/Delete

        public ActionResult Delete(KyDangKy model)
        {
            var id = _kyDangKyService.Delete(model);
            _lopKyDangKyService.Delete(id);
            var idtb = _kyDangKyService.DeleteThongBao(id);
            _kyDangKyService.DeleteThongBaoToTaiKhoan(idtb);
            return Json(new MessageVM()
            {
                Status = true,
                Message = $"Xóa kỳ đánh giá thành công!",
                MessageType = Messages.success
            }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetUpdate(int id)
        {
            var entity = _kyDangKyService.GetById(id);
            return PartialView("_Update", entity);
        }

        public ActionResult Update(KyDangKy model)
        {
            _kyDangKyService.Update(model);
            return Json(new MessageVM()
            {
                Status = true,
                Message = $"Cập nhật thành công!",
                MessageType = Messages.success
            }, JsonRequestBehavior.AllowGet);
        }
    }
}
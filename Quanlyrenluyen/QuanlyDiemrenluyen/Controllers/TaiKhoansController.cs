using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using QuanlyDiemrenluyen.Data;
using QuanlyDiemrenluyen.Helpers;
using QuanlyDiemrenluyen.Interfaces;
using QuanlyDiemrenluyen.Models;
using QuanlyDiemrenluyen.ViewModels;

namespace QuanlyDiemrenluyen.Controllers
{
    public class TaiKhoansController : BaseController
    {
        private readonly ITaiKhoanService _tkService;
        private readonly IQuyenService _quyenService;
        private readonly ILopService _lopService;
        private readonly IKhoaService _khoaService;
        private readonly IChucVuService _chucVuService;


        public TaiKhoansController(ITaiKhoanService tkService, IQuyenService quyenService, ILopService lopService,IKhoaService khoaService,IChucVuService chucVuService)
        {
            _tkService = tkService;
            _quyenService = quyenService;
            _lopService = lopService;
            _khoaService = khoaService;
            _chucVuService = chucVuService;
        }

        // GET: TaiKhoans
        public ActionResult Index()
        {
            var session = (User)Session[Constants.USER_SESSION];
            var entity = _tkService.GetTaiKhoan(session.MaKhoa);
            return View(entity);

        }
        public ActionResult ProfileUser()
        {
            var session = (User)Session[Constants.USER_SESSION];
            var entity = _tkService.GetById(session.Id);
            return View(entity);
        }
        public JsonResult UploadImage(int TaiKhoanID, HttpPostedFileBase file)
        {
            file.SaveAs(Server.MapPath("~/Assets/images/users/"+file.FileName));
            if (file != null)
            {
                _tkService.UploadImage(TaiKhoanID, file.FileName);
            }
            return Json(new MessageVM()
            {
                Status = true,
                Message = $"Thay đổi hình ảnh thành công!",
                MessageType = Messages.success
            }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult EditProfile(TaiKhoan model)
        {
            _tkService.UpdatePassWord(model);
            return Json(new MessageVM()
            {
                Status = true,
                Message = $"Cập nhật mật khẩu thành công!",
                MessageType = Messages.success
            }, JsonRequestBehavior.AllowGet);
        }


            // GET: TaiKhoans/GetUserPartial
        public ActionResult GetUserPartial(int id=0)
        {
            ListKhoa();
            ListQuyen();
            ListCV();
            ViewBag.Quyen = _quyenService.Get();
            if (id == 0)
            {
                var user = new TaiKhoanVM();
                return PartialView("_AddEdit", user);
            }
            else
            {
                var user = _tkService.GetByIds(id);
                return PartialView("_AddEdit", user);
            }
        }
        public ActionResult GetPhanQuyen(int id = 0)
        {
            ListQuyen();
            ViewBag.Quyen = _quyenService.Get();
            if (id == 0)
            {
                var user = new TaiKhoanVM();
                return PartialView("_AddQuyen", user);
            }
            else
            {
                var user = _tkService.GetByIds(id);
                return PartialView("_AddQuyen", user);
            }
        }

        public ActionResult DefaultPassword(int id)
        {
            _tkService.SetPassword(id);
            return Json(new MessageVM()
            {
                Status = true,
                Message = $"Cập nhật mật khẩu mặc định thành công!",
                MessageType = Messages.success
            }, JsonRequestBehavior.AllowGet);
            
        }
        public ActionResult AddQuyen(TaiKhoanVM model)
        {
            if (model.TaiKhoanID > 0)
            {
                _tkService.UpdateTaiKhoanQuyen(model);
                return Json(new MessageVM()
                {
                    Status = true,
                    Message = $"Cập nhật quyền thành công!",
                    MessageType = Messages.success
                }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(new MessageVM()
                {
                    Status = false,
                    Message = $"Thất bại!",
                    MessageType = Messages.error
                }, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult GetUserPartialProfile(int id)
        {
            var user = _tkService.GetById(id);
            return PartialView("_EditProfile", user);
        }

        public ActionResult GetInfo(int id)
        {
                var user = _tkService.GetById(id);
                return PartialView("Details", user);
        }
        // Post: TaiKhoans/AddOrEdit
        public ActionResult AddOrEdit(TaiKhoanVM model)
        {
            if (ModelState.IsValid)
            {
                if (model.TaiKhoanID > 0)
                {
                    _tkService.Update(model);
                    //_tkService.UpdateTaiKhoanQuyen(model);
                    return Json(new MessageVM()
                    {
                        Status = true,
                        Message = $"Cập nhật tài khoản thành công!",
                        MessageType = Messages.success
                    }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    _tkService.Create(model);
                    //_tkService.AddTaiKhoanQuyen(model,id);
                    return Json(new MessageVM()
                    {
                        Status = true,
                        Message = $"Thêm tài khoản thành công!",
                        MessageType = Messages.success
                    }, JsonRequestBehavior.AllowGet);
                }
                
            }
            return Json(new MessageVM()
            {
                Status = false,
                Message = $"Thất bại!",
                MessageType = Messages.error
            }, JsonRequestBehavior.AllowGet);
        }
        private void ListKhoa(long? SelectKhoa = null, long? SelectLop = null)
        {
            ViewBag.lops = new SelectList(_lopService.Get(), "MaLop", "TenLop", SelectLop);
            ViewBag.khoas = new SelectList(_khoaService.Get(), "MaKhoa", "TenKhoa", SelectKhoa);   

        }
        private void ListQuyen(long? SelectQuyen = null, long? SelectCV = null)
        {
            ViewBag.cv = new SelectList(_chucVuService.Get(), "ChucVuID", "TenChucVu", SelectCV);

            ViewBag.quyens = new SelectList(_quyenService.Get(), "MaQuyen", "TenQuyen", SelectQuyen);
        }
        private void ListCV(long? SelectCV = null)
        {
            ViewBag.cv = new SelectList(_chucVuService.Get(), "ChucVuID", "TenChucVu", SelectCV);
        }

        public ActionResult GetDelete(int id)
        {
            var user = _tkService.GetByIds(id);
            return PartialView("_Delete", user);
        }
        // Post: TaiKhoans/Delete

        public ActionResult Delete(TaiKhoanVM model)
        {
            _tkService.Delete(model);
            return Json(new MessageVM()
            {
                Status = true,
                Message = $"Xóa tài khoản thành công!",
                MessageType = Messages.error
            }, JsonRequestBehavior.AllowGet);
        }
    }
}

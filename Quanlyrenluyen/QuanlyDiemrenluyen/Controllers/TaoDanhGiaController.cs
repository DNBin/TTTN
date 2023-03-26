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
    public class TaoDanhGiaController : BaseController
    {
        private readonly IKhoaService _khoaService;
        private readonly ILopService _lopService;
        private readonly IKyDangKyService _kdkService;
        private readonly ILopKyDangKyService _lkdkService;
        private readonly IDiemService _diemService;
        private readonly IPhieuDanhGiaService _phieuDanhGiaService;
        private readonly IThongBaoService _thongBaoService;
        private readonly ITaiKhoanService _taiKhoanService;


        public TaoDanhGiaController(IKhoaService khoaService,ILopService lopService, IKyDangKyService kdkService,ILopKyDangKyService lkdkService, IDiemService diemService, IPhieuDanhGiaService phieuDanhGiaService, IThongBaoService thongBaoService, ITaiKhoanService taiKhoanService)
        {
            _khoaService = khoaService;
            _lopService = lopService;
            _kdkService = kdkService;
            _lkdkService = lkdkService;
            _diemService = diemService;
            _phieuDanhGiaService = phieuDanhGiaService;
            _thongBaoService = thongBaoService;
            _taiKhoanService = taiKhoanService;
        }
        // GET: TaoDanhGia
        public ActionResult Index(long? SelectLop = null)
        {
            var session = (User)Session[Constants.USER_SESSION];
            ViewBag.lops = new SelectList(_lopService.GetLopByKhoa(session.MaKhoa), "MaLop", "TenLop", SelectLop);
            
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Index(KyDangKyVM model)
        {
            if (ModelState.IsValid)
            {
                var session = (User)Session[Constants.USER_SESSION];
                var id = _kdkService.Create(model,session.MaKhoa);
                _lkdkService.Create(model, id);
                var IDTB=_kdkService.AddThongBao(model, id);
                _kdkService.AddThongBaoToTaiKhoan(model, IDTB);
                
                return RedirectToAction("Index", "KyDanhGia");
            }
            return View();
        }
       

        public ActionResult ModalThongBao(int TaiKhoanID)
        {
            var entity = _taiKhoanService.RequiredThongBao(TaiKhoanID);
            if (entity != null)
                return PartialView("_ModalThongBao", entity);
            else
                return PartialView("_ModalThongBaoEmpty");
        }
    }
}
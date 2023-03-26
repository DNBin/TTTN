using QuanlyDiemrenluyen.Helpers;
using QuanlyDiemrenluyen.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanlyDiemrenluyen.Controllers
{
    public class DashboardController : BaseController
    {
        private readonly ILopService _lopService;
        private readonly ITaiKhoanService _taiKhoanService;
        private readonly IPhieuDanhGiaService _phieuDanhGiaService;

        public DashboardController(ILopService lopService, ITaiKhoanService taiKhoanService,IPhieuDanhGiaService phieuDanhGiaService)
        {
            _lopService = lopService;
            _taiKhoanService = taiKhoanService;
            _phieuDanhGiaService = phieuDanhGiaService;
        }
        // GET: Dashboard
        public ActionResult Index()
        {
            var session = (User)Session[Constants.USER_SESSION];
            ViewBag.tonglop = _lopService.GetLop(session.MaKhoa).Count();
            ViewBag.tongsv = _taiKhoanService.GetSV(session.MaKhoa).Count();
            ViewBag.phieuduyet = _phieuDanhGiaService.GetPhieuDuyet(session.MaKhoa).Count();
            ViewBag.phieuchuaduyet = _phieuDanhGiaService.GetPhieuChuaDuyet(session.MaKhoa).Count();
            ViewBag.xeploai = _lopService.XepLoai(session.MaKhoa);
            return View();
        }

        public ActionResult DashboardLop()
        {
            var session = (User)Session[Constants.USER_SESSION];
            ViewBag.tongsv = _taiKhoanService.GetSVByLop(session.MaLop).Count();
            ViewBag.phieuduyet = _phieuDanhGiaService.GetPhieuDuyetByLop(session.MaLop).Count();
            ViewBag.phieuchuaduyet = _phieuDanhGiaService.GetPhieuChuaDuyetByLop(session.MaLop).Count();
            ViewBag.thongke = _phieuDanhGiaService.KyDKMax(session.MaLop);
            ViewBag.xeploai = _taiKhoanService.XepLoai(session.MaLop);
            return View();
        }
    }
}
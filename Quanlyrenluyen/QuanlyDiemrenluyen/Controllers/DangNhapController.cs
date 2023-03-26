using QuanlyDiemrenluyen.Interfaces;
using QuanlyDiemrenluyen.Models;
using System;
using System.Web.Security;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanlyDiemrenluyen.Helpers;

namespace QuanlyDiemrenluyen.Controllers
{
    public class DangNhapController : Controller
    {
        private readonly ITaiKhoanService _tkService;
        private readonly IQuyenService _quyenService;
        private readonly IMenuService _menuService;


        public DangNhapController(ITaiKhoanService tkService, IQuyenService quyenService,IMenuService menuService)
        {
            _menuService = menuService;
            _tkService = tkService;
            _quyenService = quyenService;
        }
        // GET: DangNhap
        public ActionResult Index(string error=null)
        {
            var session = (User)Session[Constants.USER_SESSION];
            if (session == null)
            {
                if (error != null)
                    ViewBag.Error = error;
                return View();
            }
            else
                return View();
        }
        [HttpPost]
        public ActionResult SignIn(TaiKhoan model)
        {
            try
            {
                var user = _tkService.SignIn(model);

                if (user != null)
                {
                    var quyen = _tkService.QuyenSign(model);
                    if (quyen != null)
                    {
                        FormsAuthentication.SetAuthCookie(user.TenTaiKhoan, true);
                        var userSession = new User();
                        userSession.TenTaiKhoan = user.TenTaiKhoan;
                        userSession.Id = user.Id;
                        userSession.MaSV = user.MaSV;
                        userSession.MaLop = user.MaLop;
                        userSession.TenLop = user.TenLop;
                        userSession.MaKhoa = user.MaKhoa;
                        userSession.TenKhoa = user.TenKhoa;
                        userSession.HinhAnh = user.HinhAnh;
                        userSession.HoTen = user.HoTen;
                        userSession.TenQuyen = user.TenQuyen;
                        userSession.NgaySinh = user.NgaySinh;
                        userSession.Email = user.Email;
                        userSession.Diachi = user.Diachi;
                        userSession.SDT = user.SDT;
                        userSession.DsQuyen = quyen.DsQuyen;
                        Session.Add(Constants.USER_SESSION, userSession);
                        var khoa = 0;
                        var lop = 0;
                        var sv = 0;
                        foreach (var item in quyen.DsQuyen)
                        {
                            if (item.MaQuyen == 3)
                            {
                                khoa++;
                            }
                            if (item.MaQuyen == 2 || item.MaQuyen == 1)
                            {
                                lop++;
                            }
                            if(item.MaQuyen == 1)
                            {
                                sv++;
                            }
                        }
                        if (khoa == 1)
                        {
                            return RedirectToAction("Index", "Dashboard");
                        }else if (lop == 2)
                        {
                            return RedirectToAction("DashboardLop", "Dashboard");
                        }
                        else
                        {
                            return RedirectToAction("ListKyDanhGia", "PhieuDanhGia");
                        }
                    }
                    
                }
               
            }
            catch (System.Exception)
            {
                
            }
            return RedirectToAction("Index", "DangNhap"/*, new { error = "Tài khoản hoặc mật khẩu không chính xác!" }*/);
        }
        public ActionResult SignOut()
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
            return RedirectToAction("Index", "DangNhap");
        }
        

    }
}
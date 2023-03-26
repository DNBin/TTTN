using OfficeOpenXml;
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
    public class PhieuDanhGiaController : BaseController
    {
        private readonly ITaiKhoanService _tkService;
        private readonly IQuyenService _quyenService;
        private readonly ILopService _lopService;
        private readonly IKhoaService _khoaService;
        private readonly IChucVuService _chucVuService;
        private readonly IDiemService _diemService;
        private readonly IThongBaoService _thongBaoService;
        private readonly ITieuChiService _tieuChiService;
        private readonly IPhieuDanhGiaService _phieuDanhGiaService;
        private readonly IKyDangKyService _kyDangKyService;


        public PhieuDanhGiaController(ITaiKhoanService tkService, IQuyenService quyenService, ILopService lopService, IKhoaService khoaService, IChucVuService chucVuService,ITieuChiService tieuChiService,IPhieuDanhGiaService phieuDanhGiaService, IDiemService diemService, IThongBaoService thongBaoService, IKyDangKyService kyDangKyService)
        {
            _tkService = tkService;
            _quyenService = quyenService;
            _lopService = lopService;
            _khoaService = khoaService;
            _chucVuService = chucVuService;
            _tieuChiService = tieuChiService;
            _phieuDanhGiaService = phieuDanhGiaService;
            _diemService = diemService;
            _thongBaoService = thongBaoService;
            _kyDangKyService = kyDangKyService;
        }

        // GET: PhieuDanhGia
        public ActionResult Index(int KyDKID)
        {
            var session = (User)Session[Constants.USER_SESSION];
            ViewBag.hocky = _phieuDanhGiaService.hocky(KyDKID, session.Id);
            ViewBag.namxet = _phieuDanhGiaService.namxet(KyDKID, session.Id);
            var list = _phieuDanhGiaService.GetPhieu(session.MaKhoa, session.Id);
            return View(list);
        }
        [HttpPost]
        public JsonResult AddDiem(List<PhieuDanhGiaVM> model)
        {
            var session = (User)Session[Constants.USER_SESSION];
            _phieuDanhGiaService.AddNgayDanhGia(model);
            _diemService.UpdateDiemTongSV(model);
            _thongBaoService.TrangThaiXetDuyet(model, session.Id);
            return Json(new MessageVM()
            {
                Status = true,
                Message = $"Xét điểm rèn luyện thành công!",
                MessageType = Messages.success
            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult AddPhieu(KyDangKyVM model)
        {
            if (ModelState.IsValid)
            {
                var timPhieu = _phieuDanhGiaService.TimPhieu(model);
                if (timPhieu == null)
                {
                    var idPhieu = _phieuDanhGiaService.Create(model);
                    _diemService.Create(model, idPhieu);
                    _thongBaoService.UpdateTrangThai(model);
                    return Json(true,JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return RedirectToAction("Index", "PhieuDanhGia",new { KyDKID=timPhieu.KyDkid});
                }

            }
            return View();
        }
        public ActionResult ListKyDanhGia()
        {
            var session = (User)Session[Constants.USER_SESSION];
            ViewBag.kydanhgia = _phieuDanhGiaService.GetById(session.Id, session.MaLop);
            var list = _kyDangKyService.GetBySinhVien(session.MaLop,session.Id);
            return View(list);
        }
        public ActionResult LoadPhieuDanhGia(int KyDKID)
        {
            var session = (User)Session[Constants.USER_SESSION];
            ViewBag.kydkid = KyDKID;
            ViewBag.hocky = _phieuDanhGiaService.hocky(KyDKID, session.Id);
            ViewBag.namxet = _phieuDanhGiaService.namxet(KyDKID, session.Id);
            var list = _phieuDanhGiaService.GetPhieuHoanThanh(KyDKID, session.Id);
            return View(list);
        }
        public void XuatExcelPhieu(int KyDKID)
        {
            var session = (User)Session[Constants.USER_SESSION];
            var list = _phieuDanhGiaService.GetPhieuHoanThanh(KyDKID, session.Id);
            var hocky = _phieuDanhGiaService.hocky(KyDKID, session.Id);
            var namhoc = _phieuDanhGiaService.namxet(KyDKID, session.Id);
            ExcelPackage ep = new ExcelPackage();
            ExcelWorksheet Sheet = ep.Workbook.Worksheets.Add("Report");
            Sheet.Cells["A1"].Value = "TRƯỜNG ĐẠI HỌC ĐỒNG THÁP ";
            Sheet.Cells["A2"].Value = "KHOA " + session.TenKhoa;
            Sheet.Cells["C4"].Value = "PHIẾU ĐÁNH GIÁ ĐIỂM RÈN LUYỆN ";
            Sheet.Cells["B5"].Value = "Họ và tên: " + session.HoTen;
            Sheet.Cells["C5"].Value = "Ngày tháng năm sinh: " + session.NgaySinh;
            Sheet.Cells["D5"].Value = "MSSV: " + session.MaSV;
            Sheet.Cells["B6"].Value = "Lớp: " + session.TenLop;
            Sheet.Cells["C6"].Value = "Khoa: " + session.TenKhoa;
            Sheet.Cells["D6"].Value = "Học kỳ: " + hocky;
            Sheet.Cells["F6"].Value = "Năm học: " + namhoc;
            Sheet.Cells["A8"].Value = "Nội dung đánh giá";
            Sheet.Cells["B8"].Value = "Điểm tối đa";
            Sheet.Cells["C8"].Value = "Sinh viên tự đánh giá";
            Sheet.Cells["D8"].Value = "Tập thể lớp đánh giá";
            Sheet.Cells["E8"].Value = "Khoa đánh giá";
            Sheet.Cells["A44"].Value = "Tổng";
            Sheet.Cells["B44"].Value = 100;
            
            var tongsv = 0;
            var tongcbl = 0;
            var tongkhoa = 0;
            int row = 9;// dòng bắt đầu ghi dữ liệu
            foreach (var item in list)
            {
                Sheet.Cells[string.Format("A{0}", row)].Value = item.TenTieuChi;
                Sheet.Cells[string.Format("B{0}", row)].Value = item.DiemTieuChi;
                Sheet.Cells[string.Format("C{0}", row)].Value = item.DiemSv;
                Sheet.Cells[string.Format("D{0}", row)].Value = item.DiemCbl;
                Sheet.Cells[string.Format("E{0}", row)].Value = item.DiemCbk;
                if(item.DiemSv!=null)
                    tongsv += (int)item.DiemSv;
                if (item.DiemCbl != null)
                    tongcbl += (int)item.DiemCbl;
                if (item.DiemCbk != null)
                    tongkhoa += (int)item.DiemCbk;
                row++;
            }
            Sheet.Cells["C44"].Value = tongsv;
            Sheet.Cells["D44"].Value = tongcbl;
            Sheet.Cells["E44"].Value = tongkhoa;
            Sheet.Cells["A:AZ"].AutoFitColumns();
            Response.Clear();
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment; filename=" + session.HoTen + ".xlsx");
            Response.BinaryWrite(ep.GetAsByteArray());
            Response.End();
        }
    }
}
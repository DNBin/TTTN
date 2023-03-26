using OfficeOpenXml;
using QuanlyDiemrenluyen.Helpers;
using QuanlyDiemrenluyen.Interfaces;
using QuanlyDiemrenluyen.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace QuanlyDiemrenluyen.Controllers
{
    public class DuyetCanBoLopController : BaseController
    {
        private readonly ITaiKhoanService _tkService;
        private readonly IKyDangKyService _kyDangKyService;
        private readonly IQuyenService _quyenService;
        private readonly ILopService _lopService;
        private readonly IKhoaService _khoaService;
        private readonly IChucVuService _chucVuService;
        private readonly IDiemService _diemService;
        private readonly IThongBaoService _thongBaoService;
        private readonly ITieuChiService _tieuChiService;
        private readonly IPhieuDanhGiaService _phieuDanhGiaService;


        public DuyetCanBoLopController(ITaiKhoanService tkService, IQuyenService quyenService, ILopService lopService, IKhoaService khoaService, IChucVuService chucVuService, ITieuChiService tieuChiService, IPhieuDanhGiaService phieuDanhGiaService, IDiemService diemService, IThongBaoService thongBaoService, IKyDangKyService kyDangKyService)
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
        // GET: DuyetCanBoLop
        public ActionResult Index()
        {
            var session = (User)Session[Constants.USER_SESSION];
            var list = _kyDangKyService.GetByCanBoLop(session.MaLop);
            return View(list);
        }
        public ActionResult ListSV(int KyDkid)
        {
            ViewBag.kydkid = KyDkid;
            var session = (User)Session[Constants.USER_SESSION];
            var list = _tkService.GetSVByCBL(KyDkid, session.MaLop);
            return View(list);
        }
        public ActionResult LoadListSV(int KyDkid)
        {
            ViewBag.kydkid = KyDkid;
            var session = (User)Session[Constants.USER_SESSION];
            var list = _tkService.GetSVByCBL(KyDkid, session.MaLop);
            return View(list);
        }
        public ActionResult DuyetPhieu(int KyDKID, int TaiKhoanID)
        {
            var session = (User)Session[Constants.USER_SESSION];
            ViewBag.kydkid = KyDKID;
            ViewBag.hocky = _phieuDanhGiaService.hocky(KyDKID, TaiKhoanID);
            ViewBag.namxet = _phieuDanhGiaService.namxet(KyDKID, TaiKhoanID);
            var taikhoan = _tkService.GetById(TaiKhoanID);
            ViewBag.tensv = taikhoan.HoTen;
            ViewBag.ngaysinh = taikhoan.NgaySinh;
            ViewBag.mssv = taikhoan.MaTaiKhoan;
            var list = _phieuDanhGiaService.GetPhieuByCBL(KyDKID, TaiKhoanID);
            return View(list);
        }

        public ActionResult LoadPhieu(int KyDKID, int TaiKhoanID)
{
            var session = (User)Session[Constants.USER_SESSION];
            ViewBag.kydkid = KyDKID;
            ViewBag.hocky = _phieuDanhGiaService.hocky(KyDKID, TaiKhoanID);
            ViewBag.namxet = _phieuDanhGiaService.namxet(KyDKID, TaiKhoanID);
            var taikhoan = _tkService.GetById(TaiKhoanID);
            ViewBag.tensv = taikhoan.HoTen;
            ViewBag.ngaysinh = taikhoan.NgaySinh;
            ViewBag.mssv = taikhoan.MaTaiKhoan;
            var list = _phieuDanhGiaService.GetPhieuHoanThanh(KyDKID, TaiKhoanID);
            return View(list);
        }
        public JsonResult AddDiemByCBL(List<PhieuDanhGiaVM> model)
        {
            var session = (User)Session[Constants.USER_SESSION];
            _diemService.UpdateDiemTongCBL(model);
            _thongBaoService.TrangThaiCanBoDuyet(model);
            _phieuDanhGiaService.AddNguoiDuyet(model, session.Id);
            return Json(new MessageVM()
            {
                Status = true,
                Message = $"Duyệt điểm rèn luyện thành công!",
                MessageType = Messages.success
            }, JsonRequestBehavior.AllowGet);
        }
        public void XuatThongKeLop(int KyDKID)
        {
            var id = 0;
            var session = (User)Session[Constants.USER_SESSION];
            var list = _tkService.XuatPhieu(KyDKID, session.MaLop).OrderByDescending(x => x.DiemTong);
            var hocky = _phieuDanhGiaService.hocky(KyDKID, session.Id);
            var namxet = _phieuDanhGiaService.namxet(KyDKID, session.Id);
            ExcelPackage ep = new ExcelPackage();
            ExcelWorksheet Sheet = ep.Workbook.Worksheets.Add("Report");
            Sheet.Cells["A1"].Value = "TRƯỜNG ĐẠI HỌC ĐỒNG THÁP ";
            Sheet.Cells["A2"].Value = "KHOA " + session.TenKhoa;
            Sheet.Cells["C4"].Value = "KẾT QUẢ RÈN LUYỆN HỌC KỲ "+ hocky+" NĂM HỌC "+namxet;
            Sheet.Cells["C5"].Value = "LỚP: " + session.TenLop;
            Sheet.Cells["A8"].Value = "STT";
            Sheet.Cells["B8"].Value = "MSSV";
            Sheet.Cells["C8"].Value = "Họ và tên";
            Sheet.Cells["D8"].Value = "Năm sinh";
            Sheet.Cells["E8"].Value = "Điểm";
            Sheet.Cells["F8"].Value = "Xếp loại";
            Sheet.Cells["J5"].Value = "Thống kê kết quả rèn luyện";
            Sheet.Cells["I8"].Value = "Xếp loại";
            Sheet.Cells["J8"].Value = "Số lượng";
            Sheet.Cells["K8"].Value = "Tỷ lệ";
            Sheet.Cells["I9"].Value = "Xuất sắc";
            Sheet.Cells["I10"].Value = "Tốt";
            Sheet.Cells["I11"].Value = "Khá";
            Sheet.Cells["I12"].Value = "Trung bình khá";
            Sheet.Cells["I13"].Value = "Trung bình";
            Sheet.Cells["I14"].Value = "Yếu";
            Sheet.Cells["I15"].Value = "Kém";
            Sheet.Cells["I16"].Value = "Tổng";

            Sheet.Cells["A1"].Style.Font.Bold = true;
            Sheet.Cells["A2"].Style.Font.Bold = true;
            Sheet.Cells["C4"].Style.Font.Bold = true;
            Sheet.Cells["C5"].Style.Font.Bold = true;
            Sheet.Cells["A8"].Style.Font.Bold = true;
            Sheet.Cells["B8"].Style.Font.Bold = true;
            Sheet.Cells["C8"].Style.Font.Bold = true;
            Sheet.Cells["D8"].Style.Font.Bold = true;
            Sheet.Cells["E8"].Style.Font.Bold = true;
            Sheet.Cells["F8"].Style.Font.Bold = true;
            Sheet.Cells["J5"].Style.Font.Bold = true;
            Sheet.Cells["I8"].Style.Font.Bold = true;
            Sheet.Cells["J8"].Style.Font.Bold = true;
            Sheet.Cells["K8"].Style.Font.Bold = true;
            Sheet.Cells["I9"].Style.Font.Bold = true;
            Sheet.Cells["I10"].Style.Font.Bold = true;
            Sheet.Cells["I11"].Style.Font.Bold = true;
            Sheet.Cells["I12"].Style.Font.Bold = true;
            Sheet.Cells["I13"].Style.Font.Bold = true;
            Sheet.Cells["I14"].Style.Font.Bold = true;
            Sheet.Cells["I15"].Style.Font.Bold = true;
            Sheet.Cells["I16"].Style.Font.Bold = true;
            var xs = 0;
            var tot = 0;
            var kha = 0;
            var tbk = 0;
            var tb = 0;
            var yeu = 0;
            var kem = 0;
            int row = 9;// dòng bắt đầu ghi dữ liệu
            foreach (var item in list)
            {
                id++;
                Sheet.Cells[string.Format("A{0}", row)].Value = id;
                Sheet.Cells[string.Format("B{0}", row)].Value = item.MaTaiKhoan;
                Sheet.Cells[string.Format("C{0}", row)].Value = item.HoTen;
                Sheet.Cells[string.Format("D{0}", row)].Value = Convert.ToDateTime((item.NgaySinh).ToString()).ToString("dd-MM-yyyy");
                if (item.DiemTong != null)
                {
                    Sheet.Cells[string.Format("E{0}", row)].Value = item.DiemTong;
                }
                else
                {
                    Sheet.Cells[string.Format("E{0}", row)].Value = 0;
                }
                
                if (item.DiemTong > 90)
                {
                    xs += 1;
                    Sheet.Cells[string.Format("F{0}", row)].Value = "Xuất sắc";
                }
                else if (item.DiemTong > 80 && item.DiemTong < 90)
                {
                    tot += 1;
                    Sheet.Cells[string.Format("F{0}", row)].Value = "Tốt";
                }
                else if (item.DiemTong > 70 && item.DiemTong < 80)
                {
                    kha += 1;
                    Sheet.Cells[string.Format("F{0}", row)].Value = "Khá";
                }
                else if (item.DiemTong > 60 && item.DiemTong < 70)
                {
                    tbk += 1;
                    Sheet.Cells[string.Format("F{0}", row)].Value = "Trung bình khá";
                }
                else if (item.DiemTong > 50 && item.DiemTong < 60)
                {
                    tb += 1;
                    Sheet.Cells[string.Format("F{0}", row)].Value = "Trung bình";
                }
                else if (item.DiemTong > 30 && item.DiemTong < 50)
                {
                    yeu += 1;
                    Sheet.Cells[string.Format("F{0}", row)].Value = "Yếu";
                }
                else
                {
                    kem += 1;
                    Sheet.Cells[string.Format("F{0}", row)].Value = "Kém";
                }
                
              
                row++;
            }
            float tongxs = (float)xs / (float)id * 100;
            float tongtot = (float)tot / (float)id * 100;
            float tongkha = (float)kha / (float)id * 100;
            float tongtbk = (float)tbk / (float)id * 100;
            float tongtb = (float)tb / (float)id * 100;
            float tongyeu = (float)yeu / (float)id * 100;
            float tongkem = (float)kem / (float)id * 100;

            Sheet.Cells["J9"].Value = xs;
            Sheet.Cells["J10"].Value = tot;
            Sheet.Cells["J11"].Value = kha;
            Sheet.Cells["J12"].Value = tbk;
            Sheet.Cells["J13"].Value = tb;
            Sheet.Cells["J14"].Value = yeu;
            Sheet.Cells["J15"].Value = kem;
            Sheet.Cells["J16"].Value = id;
            Sheet.Cells["K9"].Value = tongxs + "%";
            Sheet.Cells["K10"].Value = tongtot + "%";
            Sheet.Cells["K11"].Value = tongkha + "%";
            Sheet.Cells["K12"].Value = tongtbk + "%";
            Sheet.Cells["K13"].Value = tongtb + "%";
            Sheet.Cells["K14"].Value = tongyeu + "%";
            Sheet.Cells["K15"].Value = tongkem + "%";
            Sheet.Cells["K16"].Value = 100 + "%";
            Sheet.Cells["A:AZ"].AutoFitColumns();
            Response.Clear();
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment; filename=" + session.TenLop + ".xlsx");
            Response.BinaryWrite(ep.GetAsByteArray());
            Response.End();
        }
    }
}
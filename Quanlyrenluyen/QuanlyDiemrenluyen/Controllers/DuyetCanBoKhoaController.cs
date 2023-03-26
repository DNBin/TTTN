using OfficeOpenXml;
using QuanlyDiemrenluyen.Helpers;
using QuanlyDiemrenluyen.Interfaces;
using QuanlyDiemrenluyen.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanlyDiemrenluyen.Controllers
{
    public class DuyetCanBoKhoaController : BaseController
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
        private readonly ITaiKhoanThongBaoService _taiKhoanThongBaoService;


        public DuyetCanBoKhoaController(ITaiKhoanService tkService, IQuyenService quyenService, ILopService lopService, IKhoaService khoaService, IChucVuService chucVuService, ITieuChiService tieuChiService, IPhieuDanhGiaService phieuDanhGiaService, IDiemService diemService, IThongBaoService thongBaoService, IKyDangKyService kyDangKyService,ITaiKhoanThongBaoService taiKhoanThongBaoService)
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
            _taiKhoanThongBaoService = taiKhoanThongBaoService;
        }
        // GET: DuyetCanBoKhoa
        public ActionResult Index()
        {
            var session = (User)Session[Constants.USER_SESSION];
            var list = _kyDangKyService.GetByCanBoKhoa(session.MaKhoa);
            return View(list);
        }
        public ActionResult ListClass(int KyDkid)
        {

            var session = (User)Session[Constants.USER_SESSION];
            var list = _taiKhoanThongBaoService.GetLopByCBK(KyDkid, session.MaKhoa);
            ViewBag.KydkID = KyDkid;
            return View(list);
        }
        public ActionResult LoadListClass(int KyDkid)
        {

            var session = (User)Session[Constants.USER_SESSION];
            var list = _taiKhoanThongBaoService.GetLopByCBK(KyDkid, session.MaKhoa);
            ViewBag.KydkID = KyDkid;
            return View(list);
        }

        public ActionResult ListSVThuocLop(int KyDkid, int MaLop)
        {
            ViewBag.KydkID = KyDkid;
            var list = _tkService.GetSVByCBL(KyDkid, MaLop);
            return View(list);
        }
        public ActionResult LoadListSVThuocLop(int KyDkid, int MaLop)
        {
            ViewBag.KydkID = KyDkid;
            var list = _tkService.GetSVByCBL(KyDkid, MaLop);
            return View(list);
        }
        public ActionResult DuyetPhieuDiem(int KyDKID,int TaiKhoanID)
        {
            var session = (User)Session[Constants.USER_SESSION];
            ViewBag.kydkid = KyDKID;
            ViewBag.hocky = _phieuDanhGiaService.hocky(KyDKID, TaiKhoanID);
            ViewBag.namxet = _phieuDanhGiaService.namxet(KyDKID, TaiKhoanID);
            var taikhoan = _tkService.GetById(TaiKhoanID);
            ViewBag.tensv = taikhoan.HoTen;
            ViewBag.ngaysinh = taikhoan.NgaySinh;
            ViewBag.mssv = taikhoan.MaTaiKhoan;
            ViewBag.malop = taikhoan.MaLop;
            ViewBag.tenlop = taikhoan.MaLopNavigation.TenLop;
            var list = _phieuDanhGiaService.GetPhieuByCBK(KyDKID, TaiKhoanID);
            return View(list);
        }

        public JsonResult AddDiemByCBK(List<PhieuDanhGiaVM> model)
        {
            var session = (User)Session[Constants.USER_SESSION];
            _diemService.UpdateDiem(model);
            _thongBaoService.TrangThaiCanBoDuyet(model);
            _phieuDanhGiaService.AddCBKDuyet(model, session.Id);
            return Json(new MessageVM()
            {
                Status = true,
                Message = $"Duyệt điểm rèn luyện thành công!",
                MessageType = Messages.success
            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult LoadPhieuDiem(int KyDKID, int TaiKhoanID)
        {
            var session = (User)Session[Constants.USER_SESSION];
            ViewBag.kydkid = KyDKID;
            ViewBag.hocky = _phieuDanhGiaService.hocky(KyDKID, TaiKhoanID);
            ViewBag.namxet = _phieuDanhGiaService.namxet(KyDKID, TaiKhoanID);
            var taikhoan = _tkService.GetById(TaiKhoanID);
            ViewBag.tensv = taikhoan.HoTen;
            ViewBag.ngaysinh = taikhoan.NgaySinh;
            ViewBag.mssv = taikhoan.MaTaiKhoan;
            ViewBag.malop = taikhoan.MaLop;
            ViewBag.tenlop = taikhoan.MaLopNavigation.TenLop;
            var list = _phieuDanhGiaService.GetPhieuHoanThanh(KyDKID, TaiKhoanID);
            return View(list);
        }
        public void XuatThongKeKhoa(int KyDKID)
        {
            var id = 0;
            var session = (User)Session[Constants.USER_SESSION];
            var list = _lopService.XuatPhieu(KyDKID, session.MaKhoa);
            var hocky = _lopService.hocky(KyDKID);
            var namxet = _lopService.namxet(KyDKID);
            ExcelPackage ep = new ExcelPackage();
            ExcelWorksheet Sheet = ep.Workbook.Worksheets.Add("Report");
            Sheet.Cells["A1"].Value = "TRƯỜNG ĐẠI HỌC ĐỒNG THÁP ";
            Sheet.Cells["A2"].Value = "KHOA " + session.TenKhoa;
            Sheet.Cells["C4"].Value = "KẾT QUẢ RÈN LUYỆN HỌC KỲ " + hocky + " NĂM HỌC " + namxet;
            Sheet.Cells["C5"].Value = "KHOA: " + session.TenKhoa;
            Sheet.Cells["A8"].Value = "STT";
            Sheet.Cells["B8"].Value = "Tên lớp";
            Sheet.Cells["C8"].Value = "Số lượng";
            Sheet.Cells["D8"].Value = "Điểm thấp nhất";
            Sheet.Cells["E8"].Value = "Điểm cao nhất";
            Sheet.Cells["F8"].Value = "Xuất sắc";
            Sheet.Cells["G8"].Value = "Tốt";
            Sheet.Cells["H8"].Value = "Khá";
            Sheet.Cells["I8"].Value = "Trung bình khá";
            Sheet.Cells["J8"].Value = "Trung bình";
            Sheet.Cells["K8"].Value = "Yếu";
            Sheet.Cells["L8"].Value = "Kém";
            Sheet.Cells["M8"].Value = "Tổng";

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
            Sheet.Cells["G8"].Style.Font.Bold = true;
            Sheet.Cells["H8"].Style.Font.Bold = true;
            Sheet.Cells["I8"].Style.Font.Bold = true;
            Sheet.Cells["J8"].Style.Font.Bold = true;
            Sheet.Cells["K8"].Style.Font.Bold = true;
            Sheet.Cells["L8"].Style.Font.Bold = true;
            Sheet.Cells["M8"].Style.Font.Bold = true;
            int row = 9;// dòng bắt đầu ghi dữ liệu
            foreach (var item in list)
            {
                var sl = 0;
                var xs = 0;
                var tot = 0;
                var kha = 0;
                var tbk = 0;
                var tb = 0;
                var yeu = 0;
                var kem = 0;
                id++;
                Sheet.Cells[string.Format("A{0}", row)].Value = id;
                Sheet.Cells[string.Format("B{0}", row)].Value = item.TenLop;
                foreach(var soluong in item.DiemTong)
                {
                    sl++;
                }
                Sheet.Cells[string.Format("C{0}", row)].Value = sl;
                if (item.DiemTong != null)
                {
                    var nhonhat = item.DiemTong.OrderBy(x => x.DiemTong).Take(1).Select(x=>x.DiemTong);
                    if (nhonhat != default)
                    {
                        Sheet.Cells[string.Format("D{0}", row)].Value = nhonhat;
                    }
                    else
                    {
                        Sheet.Cells[string.Format("D{0}", row)].Value = 0;
                    }
                   
                }
                if (item.DiemTong != null)
                {
                    var lonnhat = item.DiemTong.OrderByDescending(x => x.DiemTong).Take(1).Select(x => x.DiemTong);
                    if (lonnhat != default)
                    {
                        Sheet.Cells[string.Format("E{0}", row)].Value = lonnhat;
                    }
                    else
                    {
                        Sheet.Cells[string.Format("E{0}", row)].Value = 0;
                    }
                    
                }
                foreach(var xeploai in item.DiemTong)
                {
                    if (xeploai.DiemTong > 90)
                    {
                        xs += 1;
                    }
                    else if (xeploai.DiemTong > 80 && xeploai.DiemTong < 90)
                    {
                        tot += 1;
                    }
                    else if (xeploai.DiemTong > 70 && xeploai.DiemTong < 80)
                    {
                        kha += 1;
                    }
                    else if (xeploai.DiemTong > 60 && xeploai.DiemTong < 70)
                    {
                        tbk += 1;  
                    }
                    else if (xeploai.DiemTong > 50 && xeploai.DiemTong < 60)
                    {
                        tb += 1; 
                    }
                    else if (xeploai.DiemTong > 30 && xeploai.DiemTong < 50)
                    {
                        yeu += 1;
                    }
                    else
                    {
                        kem += 1;
                    }
                }

                float tongxs = (float)xs / (float)sl * 100;
                float tongtot = (float)tot / (float)sl * 100;
                float tongkha = (float)kha / (float)sl * 100;
                float tongtbk = (float)tbk / (float)sl * 100;
                float tongtb = (float)tb / (float)sl * 100;
                float tongyeu = (float)yeu / (float)sl * 100;
                float tongkem = (float)kem / (float)sl * 100;
                Sheet.Cells[string.Format("F{0}", row)].Value = tongxs + "%";
                Sheet.Cells[string.Format("G{0}", row)].Value = tongtot + "%";
                Sheet.Cells[string.Format("H{0}", row)].Value = tongkha + "%";
                Sheet.Cells[string.Format("I{0}", row)].Value = tongtbk + "%";
                Sheet.Cells[string.Format("J{0}", row)].Value = tongtb + "%";
                Sheet.Cells[string.Format("K{0}", row)].Value = tongyeu + "%";
                Sheet.Cells[string.Format("L{0}", row)].Value = tongkem + "%";
                Sheet.Cells[string.Format("M{0}", row)].Value = 100 + "%";
                
                row++;
            }
          
            //Sheet.Cells["A:AZ"].AutoFitColumns();
            Response.Clear();
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment; filename=" + session.TenKhoa + ".xlsx");
            Response.BinaryWrite(ep.GetAsByteArray());
            Response.End();
        }
        public void XuatThongKeLop(int KyDKID, int MaLop)
        {
            var id = 0;
            var tenlop = _lopService.GetById(MaLop);
            var session = (User)Session[Constants.USER_SESSION];
            var list = _tkService.XuatPhieu(KyDKID, MaLop).OrderByDescending(x => x.DiemTong);
            var hocky = _lopService.hocky(KyDKID);
            var namxet = _lopService.namxet(KyDKID);
            ExcelPackage ep = new ExcelPackage();
            ExcelWorksheet Sheet = ep.Workbook.Worksheets.Add("Report");
            Sheet.Cells["A1"].Value = "TRƯỜNG ĐẠI HỌC ĐỒNG THÁP ";
            Sheet.Cells["A2"].Value = "KHOA " + session.TenKhoa;
            Sheet.Cells["C4"].Value = "KẾT QUẢ RÈN LUYỆN HỌC KỲ " + hocky + " NĂM HỌC " + namxet;
            Sheet.Cells["C5"].Value = "LỚP: " + tenlop.TenLop;
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
            Response.AddHeader("content-disposition", "attachment; filename=" + tenlop.TenLop + ".xlsx");
            Response.BinaryWrite(ep.GetAsByteArray());
            Response.End();
        }
    }
}
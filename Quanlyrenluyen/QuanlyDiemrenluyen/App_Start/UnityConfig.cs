using QuanlyDiemrenluyen.Interfaces;
using QuanlyDiemrenluyen.Services;
using System.Web.Mvc;
using Unity;
using Unity.Mvc5;

namespace QuanlyDiemrenluyen
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {
            var container = new UnityContainer();

            // register all your components with the container here
            // it is NOT necessary to register your controllers

            container.RegisterType<ITaiKhoanService, TaiKhoanService>();
            container.RegisterType<IQuyenService, QuyenService>();
            container.RegisterType<IChucVuService, ChucVuService>();
            container.RegisterType<IKhoaService, KhoaService>();
            container.RegisterType<ILopService, LopService>();
            container.RegisterType<IPhieuDanhGiaService, PhieuDanhGiaService>();
            container.RegisterType<IDiemService, DiemService>();
            container.RegisterType<ITieuChiService, TieuChiService>();
            container.RegisterType<IQuyenMenuService, QuyenMenuService>();
            container.RegisterType<IMenuService, MenuService>();
            container.RegisterType<IKyDangKyService, KyDangKyService>();
            container.RegisterType<ILopKyDangKyService, LopKyDangKyService>();
            container.RegisterType<IThongBaoService, ThongBaoService>();
            container.RegisterType<ITaiKhoanThongBaoService, TaiKhoanThongBaoService>();


            DependencyResolver.SetResolver(new UnityDependencyResolver(container));
        }
    }
}
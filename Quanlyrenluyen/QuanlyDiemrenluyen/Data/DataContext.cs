using System;
using System.Data.Entity;
using QuanlyDiemrenluyen.Models;

namespace QuanlyDiemrenluyen.Data
{
    public partial class DataContext : DbContext
    {
        public virtual DbSet<ChucVu> ChucVus { get; set; }
        public virtual DbSet<Diem> Diems { get; set; }
        public virtual DbSet<Khoa> Khoas { get; set; }
        public virtual DbSet<LopKyDangKy> LopKyDangKys { get; set; }
        public virtual DbSet<TaiKhoanQuyen> TaiKhoanQuyens { get; set; }
        public virtual DbSet<TaiKhoanThongBao> TaiKhoanThongBaos { get; set; }
        public virtual DbSet<KyDangKy> KyDangKys { get; set; }
        public virtual DbSet<Lop> Lops { get; set; }
        public virtual DbSet<Menu> Menus { get; set; }
        public virtual DbSet<PhieuDanhGia> PhieuDanhGias { get; set; }
        public virtual DbSet<Quyen> Quyens { get; set; }
        public virtual DbSet<QuyenMenu> QuyenMenus { get; set; }
        public virtual DbSet<TaiKhoan> TaiKhoans { get; set; }
        public virtual DbSet<ThongBao> ThongBaos { get; set; }
        public virtual DbSet<TieuChi> TieuChis { get; set; }

        public DataContext() : base("name=QLDRLConnectionString")
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ChucVu>().ToTable("ChucVu");
            modelBuilder.Entity<ChucVu>().Property(e => e.ChucVuId).HasColumnName("ChucVuID");
            modelBuilder.Entity<ChucVu>().Property(e => e.IsDelete).HasColumnName("isDelete");
            modelBuilder.Entity<ChucVu>().Property(e => e.Loai).HasColumnName("Loai");
            modelBuilder.Entity<ChucVu>().Property(e => e.TenChucVu).HasMaxLength(500);

            modelBuilder.Entity<Diem>().ToTable("Diem");
            modelBuilder.Entity<Diem>().Property(e => e.DiemId).HasColumnName("DiemID");
            modelBuilder.Entity<Diem>().Property(e => e.DiemCbk).HasColumnName("DiemCBK");
            modelBuilder.Entity<Diem>().Property(e => e.DiemCbl).HasColumnName("DiemCBL");
            modelBuilder.Entity<Diem>().Property(e => e.DiemSv).HasColumnName("DiemSV");
            modelBuilder.Entity<Diem>().Property(e => e.PhieuId).HasColumnName("PhieuID");
            modelBuilder.Entity<Diem>().Property(e => e.IsDelete).HasColumnName("isDelete");
            modelBuilder.Entity<Diem>().Property(e => e.TieuChiId).HasColumnName("TieuChiID");
            modelBuilder.Entity<Diem>().HasOptional(d => d.Phieu)
                    .WithMany(p => p.Diem)
                    .HasForeignKey(d => d.PhieuId)
                    .WillCascadeOnDelete(false);
            modelBuilder.Entity<Diem>().HasOptional(d => d.TieuChi)
                    .WithMany(p => p.Diem)
                    .HasForeignKey(d => d.TieuChiId)
                    .WillCascadeOnDelete(false);

            modelBuilder.Entity<Khoa>().ToTable("Khoa");
            modelBuilder.Entity<Khoa>().HasKey(e => e.MaKhoa);
            modelBuilder.Entity<Khoa>().Property(e => e.IsDelete).HasColumnName("isDelete");
            modelBuilder.Entity<Khoa>().Property(e => e.TenKhoa).HasMaxLength(500);

            modelBuilder.Entity<KyDangKy>().ToTable("KyDangKy");
            modelBuilder.Entity<KyDangKy>().HasKey(e => e.KyDkid);
            modelBuilder.Entity<KyDangKy>().Property(e => e.KyDkid).HasColumnName("KyDKID");
            modelBuilder.Entity<KyDangKy>().Property(e => e.HocKyXet).HasMaxLength(50);
            modelBuilder.Entity<KyDangKy>().Property(e => e.IsDelete).HasColumnName("isDelete");
            modelBuilder.Entity<KyDangKy>().Property(e => e.NamXet).HasMaxLength(500);
            modelBuilder.Entity<KyDangKy>().Property(e => e.NgayBd)
                    .HasColumnType("date")
                    .HasColumnName("NgayBD");
            modelBuilder.Entity<KyDangKy>().Property(e => e.NgayKt)
                    .HasColumnType("date")
                    .HasColumnName("NgayKT");
            modelBuilder.Entity<KyDangKy>().Property(e => e.NoiDungDk)
                    .HasColumnType("ntext")
                    .HasColumnName("NoiDungDK");
            modelBuilder.Entity<KyDangKy>().Property(e => e.TieuDeDk)
                    .HasMaxLength(500)
                    .HasColumnName("TieuDeDK");
            modelBuilder.Entity<KyDangKy>().Property(e => e.TrangThai).HasColumnName("TrangThai");
           

            modelBuilder.Entity<Lop>().ToTable("Lop");
            modelBuilder.Entity<Lop>().HasKey(e => e.MaLop);
            modelBuilder.Entity<Lop>().Property(e => e.IsDelete).HasColumnName("isDelete");
            modelBuilder.Entity<Lop>().Property(e => e.TenLop).HasMaxLength(50);
            modelBuilder.Entity<Lop>().HasOptional(d => d.MaKhoaNavigation)
                    .WithMany(p => p.Lop)
                    .HasForeignKey(d => d.MaKhoa)
                    .WillCascadeOnDelete(false);

            modelBuilder.Entity<LopKyDangKy>().ToTable("LopKyDangKy");
            modelBuilder.Entity<LopKyDangKy>().HasKey(e => e.Id);
            modelBuilder.Entity<LopKyDangKy>().Property(e => e.Id)
                    .HasColumnName("ID");
            modelBuilder.Entity<LopKyDangKy>().Property(e => e.IsDelete).HasColumnName("isDelete");
            modelBuilder.Entity<LopKyDangKy>().Property(e => e.KyDkid).HasColumnName("KyDKID");
            modelBuilder.Entity<LopKyDangKy>().HasOptional(d => d.KyDk)
                    .WithMany(p => p.LopKyDangKy)
                    .HasForeignKey(d => d.KyDkid)
                    .WillCascadeOnDelete(false);
            modelBuilder.Entity<LopKyDangKy>().HasOptional(d => d.MaLopNavigation)
                    .WithMany(p => p.LopKyDangKy)
                    .HasForeignKey(d => d.MaLop)
                    .WillCascadeOnDelete(false);



            modelBuilder.Entity<Menu>().ToTable("Menu");
            modelBuilder.Entity<Menu>().Property(e => e.MenuId).HasColumnName("MenuID");
            modelBuilder.Entity<Menu>().Property(e => e.IsDelete).HasColumnName("isDelete");
            modelBuilder.Entity<Menu>().Property(e => e.ParentId).HasColumnName("ParentID");
            modelBuilder.Entity<Menu>().Property(e => e.TenMenu).HasMaxLength(500);
            modelBuilder.Entity<Menu>().Property(e => e.Path).HasMaxLength(500);

            modelBuilder.Entity<PhieuDanhGia>().ToTable("PhieuDanhGia");
            modelBuilder.Entity<PhieuDanhGia>().HasKey(e => e.PhieuId);
            modelBuilder.Entity<PhieuDanhGia>().Property(e => e.PhieuId).HasColumnName("PhieuID");
            modelBuilder.Entity<PhieuDanhGia>().Property(e => e.TenPhieu).HasMaxLength(500);
            modelBuilder.Entity<PhieuDanhGia>().Property(e => e.CanBoId).HasColumnName("CanBoID");
            modelBuilder.Entity<PhieuDanhGia>().Property(e => e.CanBoLopId).HasColumnName("CanBoLopID");
            modelBuilder.Entity<PhieuDanhGia>().Property(e => e.KyDkid).HasColumnName("KyDKID");
            modelBuilder.Entity<PhieuDanhGia>().Property(e => e.DiemTong).HasColumnName("DiemTong");
            modelBuilder.Entity<PhieuDanhGia>().Property(e => e.DiemTongSV).HasColumnName("DiemTongSV");
            modelBuilder.Entity<PhieuDanhGia>().Property(e => e.DiemTongCBL).HasColumnName("DiemTongCBL");
            modelBuilder.Entity<PhieuDanhGia>().Property(e => e.NgayDanhGia).HasColumnType("date");
            modelBuilder.Entity<PhieuDanhGia>().Property(e => e.SinhVienId).HasColumnName("SinhVienID");
            modelBuilder.Entity<PhieuDanhGia>().Property(e => e.IsDelete).HasColumnName("isDelete");
            modelBuilder.Entity<PhieuDanhGia>().HasOptional(d => d.SinhVien)
                    .WithMany(p => p.PhieuDanhGia)
                    .HasForeignKey(d => d.SinhVienId)
                    .WillCascadeOnDelete(false);
            modelBuilder.Entity<PhieuDanhGia>().HasOptional(d => d.KyDangKy)
                    .WithMany(p => p.PhieuDanhGia)
                    .HasForeignKey(d => d.KyDkid)
                    .WillCascadeOnDelete(false);

            modelBuilder.Entity<Quyen>().ToTable("Quyen");
            modelBuilder.Entity<Quyen>().HasKey(e => e.MaQuyen);
            modelBuilder.Entity<Quyen>().Property(e => e.MoTa).HasMaxLength(500);
            modelBuilder.Entity<Quyen>().Property(e => e.IsDelete).HasColumnName("isDelete");
            modelBuilder.Entity<Quyen>().Property(e => e.TenQuyen).HasMaxLength(500);

            modelBuilder.Entity<QuyenMenu>().ToTable("QuyenMenu");
            modelBuilder.Entity<QuyenMenu>().Property(e => e.QuyenMenuId).HasColumnName("QuyenMenuID");
            modelBuilder.Entity<QuyenMenu>().Property(e => e.IsDelete).HasColumnName("isDelete");
            modelBuilder.Entity<QuyenMenu>().Property(e => e.MenuId).HasColumnName("MenuID");
            modelBuilder.Entity<QuyenMenu>().HasOptional(d => d.MaQuyenNavigation)
                    .WithMany(p => p.QuyenMenu)
                    .HasForeignKey(d => d.MaQuyen)
                    .WillCascadeOnDelete(false);
            modelBuilder.Entity<QuyenMenu>().HasOptional(d => d.Menu)
                    .WithMany(p => p.QuyenMenu)
                    .HasForeignKey(d => d.MenuId)
                    .WillCascadeOnDelete(false);

            modelBuilder.Entity<TaiKhoan>().ToTable("TaiKhoan");
            modelBuilder.Entity<TaiKhoan>().Property(e => e.TaiKhoanId).HasColumnName("TaiKhoanID");
            modelBuilder.Entity<TaiKhoan>().Property(e => e.ChucVuId).HasColumnName("ChucVuID");
            modelBuilder.Entity<TaiKhoan>().Property(e => e.DiaChi).HasColumnType("ntext");
            modelBuilder.Entity<TaiKhoan>().Property(e => e.Email).HasMaxLength(500);
            modelBuilder.Entity<TaiKhoan>().Property(e => e.HinhAnh).HasMaxLength(500);
            modelBuilder.Entity<TaiKhoan>().Property(e => e.HoTen).HasMaxLength(500);
            modelBuilder.Entity<TaiKhoan>().Property(e => e.IsDelete).HasColumnName("isDelete");
            modelBuilder.Entity<TaiKhoan>().Property(e => e.MaTaiKhoan).HasMaxLength(50);
            modelBuilder.Entity<TaiKhoan>().Property(e => e.MatKhau).HasMaxLength(500);
            modelBuilder.Entity<TaiKhoan>().Property(e => e.NgaySinh).HasColumnType("date");
            modelBuilder.Entity<TaiKhoan>().Property(e => e.NgayTao).HasColumnType("date");
            modelBuilder.Entity<TaiKhoan>().Property(e => e.SoDienThoai).HasMaxLength(50);
            modelBuilder.Entity<TaiKhoan>().Property(e => e.TenTaiKhoan).HasMaxLength(250);
            modelBuilder.Entity<TaiKhoan>().HasOptional(d => d.ChucVu)
                    .WithMany(p => p.TaiKhoan)
                    .HasForeignKey(d => d.ChucVuId)
                    .WillCascadeOnDelete(false);
            modelBuilder.Entity<TaiKhoan>().HasOptional(d => d.MaKhoaNavigation)
                    .WithMany(p => p.TaiKhoan)
                    .HasForeignKey(d => d.MaKhoa)
                    .WillCascadeOnDelete(false);
            modelBuilder.Entity<TaiKhoan>().HasOptional(d => d.MaLopNavigation)
                    .WithMany(p => p.TaiKhoan)
                    .WillCascadeOnDelete(false);

            modelBuilder.Entity<TaiKhoanQuyen>().ToTable("TaiKhoanQuyen");
            modelBuilder.Entity<TaiKhoanQuyen>().Property(e => e.Id)
                    .HasColumnName("ID");
            modelBuilder.Entity<TaiKhoanQuyen>().Property(e => e.TaiKhoanId).HasColumnName("TaiKhoanID");
            modelBuilder.Entity<TaiKhoanQuyen>().Property(e => e.IsDelete).HasColumnName("isDelete");
            modelBuilder.Entity<TaiKhoanQuyen>().HasOptional(d => d.MaQuyenNavigation)
                    .WithMany(p => p.TaiKhoanQuyen)
                    .HasForeignKey(d => d.MaQuyen)
                    .WillCascadeOnDelete(false);

            modelBuilder.Entity<TaiKhoanQuyen>().HasOptional(d => d.TaiKhoan)
                    .WithMany(p => p.TaiKhoanQuyen)
                    .HasForeignKey(d => d.TaiKhoanId)
                    .WillCascadeOnDelete(false);

            modelBuilder.Entity<TaiKhoanThongBao>().ToTable("TaiKhoanThongBao");
            modelBuilder.Entity<TaiKhoanThongBao>().Property(e => e.Id)
                    .HasColumnName("ID");
            modelBuilder.Entity<TaiKhoanThongBao>().Property(e => e.TaiKhoanId).HasColumnName("TaiKhoanID");
            modelBuilder.Entity<TaiKhoanThongBao>().Property(e => e.ThongBaoId).HasColumnName("ThongBaoID");
            modelBuilder.Entity<TaiKhoanThongBao>().Property(e => e.TrangThai).HasColumnName("TrangThai");
            modelBuilder.Entity<TaiKhoanThongBao>().Property(e => e.IsDelete).HasColumnName("isDelete");

            modelBuilder.Entity<TaiKhoanThongBao>().HasOptional(d => d.TaiKhoan)
                    .WithMany(p => p.TaiKhoanThongBao)
                    .HasForeignKey(d => d.TaiKhoanId)
                    .WillCascadeOnDelete(false);

            modelBuilder.Entity<TaiKhoanThongBao>().HasOptional(d => d.ThongBao)
                    .WithMany(p => p.TaiKhoanThongBao)
                    .HasForeignKey(d => d.ThongBaoId)
                    .WillCascadeOnDelete(false);



            modelBuilder.Entity<ThongBao>().ToTable("ThongBao");
            modelBuilder.Entity<ThongBao>().Property(e => e.ThongBaoId).HasColumnName("ThongBaoID");
            modelBuilder.Entity<ThongBao>().Property(e => e.KyDkid).HasColumnName("KyDKID");
            modelBuilder.Entity<ThongBao>().Property(e => e.NgayThongBao).HasColumnType("date");
            modelBuilder.Entity<ThongBao>().Property(e => e.IsDelete).HasColumnName("isDelete");
            modelBuilder.Entity<ThongBao>().Property(e => e.NoiDungTb)
                    .HasColumnType("ntext")
                    .HasColumnName("NoiDungTB");
            modelBuilder.Entity<ThongBao>().Property(e => e.TieuDe).HasMaxLength(500);
            modelBuilder.Entity<ThongBao>().HasOptional(d => d.KyDk)
                    .WithMany(p => p.ThongBao)
                    .HasForeignKey(d => d.KyDkid)
                    .WillCascadeOnDelete(false);


            modelBuilder.Entity<TieuChi>().ToTable("TieuChi");
            modelBuilder.Entity<TieuChi>().Property(e => e.TieuChiId).HasColumnName("TieuChiID");
            modelBuilder.Entity<TieuChi>().Property(e => e.IsDelete).HasColumnName("isDelete");
            modelBuilder.Entity<TieuChi>().Property(e => e.ParentId).HasColumnName("ParentID");
            modelBuilder.Entity<TieuChi>().Property(e => e.TenTieuChi).HasMaxLength(500);


            
        }
    }
}

USE [QLDiemRenLuyen]
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 4/6/2022 12:57:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[ChucVuID] [int] IDENTITY(1,1) NOT NULL,
	[TenChucVu] [nvarchar](500) NULL,
	[isDelete] [bit] NULL,
	[Loai] [bit] NULL,
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[ChucVuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diem]    Script Date: 4/6/2022 12:57:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diem](
	[DiemID] [int] IDENTITY(1,1) NOT NULL,
	[PhieuID] [int] NULL,
	[DiemSV] [int] NULL,
	[DiemCBL] [int] NULL,
	[DiemCBK] [int] NULL,
	[TieuChiID] [int] NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Diem] PRIMARY KEY CLUSTERED 
(
	[DiemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 4/6/2022 12:57:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[MaKhoa] [int] IDENTITY(1,1) NOT NULL,
	[TenKhoa] [nvarchar](500) NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Khoa] PRIMARY KEY CLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KyDangKy]    Script Date: 4/6/2022 12:57:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KyDangKy](
	[KyDKID] [int] IDENTITY(1,1) NOT NULL,
	[HocKyXet] [nvarchar](50) NULL,
	[NgayBD] [date] NULL,
	[NgayKT] [date] NULL,
	[NamXet] [nvarchar](500) NULL,
	[TieuDeDK] [nvarchar](500) NULL,
	[NoiDungDK] [ntext] NULL,
	[IsDelete] [bit] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_HocKy] PRIMARY KEY CLUSTERED 
(
	[KyDKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lop]    Script Date: 4/6/2022 12:57:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lop](
	[MaLop] [int] IDENTITY(1,1) NOT NULL,
	[TenLop] [nvarchar](50) NULL,
	[MaKhoa] [int] NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Lop] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LopKyDangKy]    Script Date: 4/6/2022 12:57:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LopKyDangKy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaLop] [int] NULL,
	[KyDKID] [int] NULL,
	[MaKhoa] [int] NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_LopKyDangKy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 4/6/2022 12:57:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[TenMenu] [nvarchar](500) NULL,
	[ParentID] [bigint] NULL,
	[OrderKey] [int] NULL,
	[isDelete] [bit] NULL,
	[Path] [nvarchar](500) NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuDanhGia]    Script Date: 4/6/2022 12:57:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuDanhGia](
	[PhieuID] [int] IDENTITY(1,1) NOT NULL,
	[SinhVienID] [int] NULL,
	[CanBoLopID] [int] NULL,
	[CanBoID] [int] NULL,
	[NgayDanhGia] [date] NULL,
	[KyDKID] [int] NULL,
	[TenPhieu] [nvarchar](500) NULL,
	[isDelete] [bit] NULL,
	[DiemTong] [int] NULL,
	[DiemTongSV] [int] NULL,
	[DiemTongCBL] [int] NULL,
 CONSTRAINT [PK_PhieuDanhGia] PRIMARY KEY CLUSTERED 
(
	[PhieuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 4/6/2022 12:57:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](500) NULL,
	[MoTa] [nvarchar](500) NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuyenMenu]    Script Date: 4/6/2022 12:57:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyenMenu](
	[QuyenMenuID] [int] IDENTITY(1,1) NOT NULL,
	[MaQuyen] [int] NULL,
	[MenuID] [int] NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_QuyenMenu] PRIMARY KEY CLUSTERED 
(
	[QuyenMenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 4/6/2022 12:57:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TaiKhoanID] [int] IDENTITY(1,1) NOT NULL,
	[TenTaiKhoan] [nvarchar](250) NULL,
	[MatKhau] [nvarchar](500) NULL,
	[isDelete] [bit] NULL,
	[NgayTao] [date] NULL,
	[HoTen] [nvarchar](500) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[Email] [nvarchar](500) NULL,
	[DiaChi] [ntext] NULL,
	[HinhAnh] [nvarchar](500) NULL,
	[MaTaiKhoan] [nvarchar](50) NULL,
	[ChucVuID] [int] NULL,
	[MaLop] [int] NULL,
	[MaKhoa] [int] NULL,
	[NgaySinh] [date] NULL,
 CONSTRAINT [PK_TaiKhoan_1] PRIMARY KEY CLUSTERED 
(
	[TaiKhoanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoanQuyen]    Script Date: 4/6/2022 12:57:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoanQuyen](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoanID] [int] NULL,
	[MaQuyen] [int] NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_TaiKhoanQuyen] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoanThongBao]    Script Date: 4/6/2022 12:57:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoanThongBao](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoanID] [int] NULL,
	[ThongBaoID] [int] NULL,
	[IsDelete] [bit] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_TaiKhoanThongBao] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongBao]    Script Date: 4/6/2022 12:57:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongBao](
	[ThongBaoID] [int] IDENTITY(1,1) NOT NULL,
	[NgayThongBao] [date] NULL,
	[NoiDungTB] [ntext] NULL,
	[TieuDe] [nvarchar](500) NULL,
	[KyDKID] [int] NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_ThongBao] PRIMARY KEY CLUSTERED 
(
	[ThongBaoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TieuChi]    Script Date: 4/6/2022 12:57:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TieuChi](
	[TieuChiID] [int] IDENTITY(1,1) NOT NULL,
	[TenTieuChi] [nvarchar](500) NULL,
	[ParentID] [bigint] NULL,
	[DiemTieuChi] [int] NULL,
	[OrderKey] [int] NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_TieuChi] PRIMARY KEY CLUSTERED 
(
	[TieuChiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChucVu] ON 

INSERT [dbo].[ChucVu] ([ChucVuID], [TenChucVu], [isDelete], [Loai]) VALUES (1, N'Sinh viên', 0, 0)
INSERT [dbo].[ChucVu] ([ChucVuID], [TenChucVu], [isDelete], [Loai]) VALUES (2, N'Lớp phó', 0, 0)
INSERT [dbo].[ChucVu] ([ChucVuID], [TenChucVu], [isDelete], [Loai]) VALUES (3, N'Lớp trưởng', 0, 0)
INSERT [dbo].[ChucVu] ([ChucVuID], [TenChucVu], [isDelete], [Loai]) VALUES (4, N'Bí thư', 0, 0)
INSERT [dbo].[ChucVu] ([ChucVuID], [TenChucVu], [isDelete], [Loai]) VALUES (5, N'Giảng viên', 0, 1)
SET IDENTITY_INSERT [dbo].[ChucVu] OFF
GO
SET IDENTITY_INSERT [dbo].[Diem] ON 

INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (401, 13, NULL, NULL, NULL, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (402, 13, NULL, NULL, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (403, 13, NULL, NULL, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (404, 13, NULL, NULL, NULL, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (405, 13, NULL, NULL, NULL, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (406, 13, NULL, NULL, NULL, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (407, 13, NULL, NULL, NULL, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (408, 13, NULL, NULL, NULL, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (409, 13, NULL, NULL, NULL, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (410, 13, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (411, 13, NULL, NULL, NULL, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (412, 13, NULL, NULL, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (413, 13, NULL, NULL, NULL, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (414, 13, NULL, NULL, NULL, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (415, 13, NULL, NULL, NULL, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (416, 13, NULL, NULL, NULL, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (417, 13, NULL, NULL, NULL, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (418, 13, NULL, NULL, NULL, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (419, 13, NULL, NULL, NULL, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (420, 13, NULL, NULL, NULL, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (421, 14, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (422, 14, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (423, 14, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (424, 14, NULL, NULL, NULL, 4, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (425, 14, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (426, 14, NULL, NULL, NULL, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (427, 14, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (428, 14, NULL, NULL, NULL, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (429, 14, NULL, NULL, NULL, 9, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (430, 14, NULL, NULL, NULL, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (431, 14, NULL, NULL, NULL, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (432, 14, NULL, NULL, NULL, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (433, 14, NULL, NULL, NULL, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (434, 14, NULL, NULL, NULL, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (435, 14, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (436, 14, NULL, NULL, NULL, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (437, 14, NULL, NULL, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (438, 14, NULL, NULL, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (439, 14, NULL, NULL, NULL, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (440, 14, NULL, NULL, NULL, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (441, 14, NULL, NULL, NULL, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (442, 14, NULL, NULL, NULL, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (443, 14, NULL, NULL, NULL, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (444, 14, NULL, NULL, NULL, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (445, 14, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (446, 14, NULL, NULL, NULL, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (447, 14, NULL, NULL, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (448, 14, NULL, NULL, NULL, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (449, 14, NULL, NULL, NULL, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (450, 14, NULL, NULL, NULL, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (451, 14, NULL, NULL, NULL, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (452, 14, NULL, NULL, NULL, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (453, 14, NULL, NULL, NULL, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (454, 14, NULL, NULL, NULL, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (455, 14, NULL, NULL, NULL, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (456, 15, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (457, 15, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (458, 15, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (459, 15, NULL, NULL, NULL, 4, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (460, 15, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (461, 15, 5, 5, NULL, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (462, 15, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (463, 15, 1, 1, NULL, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (464, 15, 1, 1, NULL, 9, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (465, 15, 1, 1, NULL, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (466, 15, 1, 1, NULL, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (467, 15, 1, 1, NULL, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (468, 15, 2, 2, NULL, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (469, 15, 2, 2, NULL, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (470, 15, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (471, 15, NULL, 3, NULL, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (472, 15, NULL, NULL, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (473, 15, 5, NULL, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (474, 15, NULL, NULL, NULL, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (475, 15, 5, 5, NULL, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (476, 15, 10, 10, NULL, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (477, 15, 10, 10, NULL, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (478, 15, 10, 10, NULL, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (479, 15, 5, 5, NULL, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (480, 15, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (481, 15, NULL, 3, NULL, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (482, 15, 5, NULL, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (483, 15, 5, 5, NULL, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (484, 15, 5, 5, NULL, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (485, 15, 5, 5, NULL, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (486, 15, 5, 5, NULL, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (487, 15, 5, 5, NULL, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (488, 15, 4, 4, NULL, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (489, 15, NULL, 0, NULL, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (490, 15, NULL, 10, NULL, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (491, 16, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (492, 16, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (493, 16, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (494, 16, NULL, NULL, NULL, 4, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (495, 16, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (496, 16, NULL, NULL, NULL, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (497, 16, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (498, 16, NULL, NULL, NULL, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (499, 16, NULL, NULL, NULL, 9, 0)
GO
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (500, 16, NULL, NULL, NULL, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (501, 16, NULL, NULL, NULL, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (502, 16, NULL, NULL, NULL, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (503, 16, NULL, NULL, NULL, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (504, 16, NULL, NULL, NULL, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (505, 16, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (506, 16, NULL, NULL, NULL, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (507, 16, NULL, NULL, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (508, 16, NULL, NULL, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (509, 16, NULL, NULL, NULL, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (510, 16, NULL, NULL, NULL, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (511, 16, NULL, NULL, NULL, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (512, 16, NULL, NULL, NULL, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (513, 16, NULL, NULL, NULL, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (514, 16, NULL, NULL, NULL, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (515, 16, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (516, 16, NULL, NULL, NULL, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (517, 16, NULL, NULL, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (518, 16, NULL, NULL, NULL, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (519, 16, NULL, NULL, NULL, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (520, 16, NULL, NULL, NULL, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (521, 16, NULL, NULL, NULL, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (522, 16, NULL, NULL, NULL, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (523, 16, NULL, NULL, NULL, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (524, 16, NULL, NULL, NULL, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (525, 16, NULL, NULL, NULL, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (526, 17, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (527, 17, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (528, 17, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (529, 17, NULL, NULL, NULL, 4, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (530, 17, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (531, 17, NULL, NULL, NULL, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (532, 17, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (533, 17, NULL, NULL, NULL, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (534, 17, NULL, NULL, NULL, 9, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (535, 17, NULL, NULL, NULL, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (536, 17, NULL, NULL, NULL, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (537, 17, NULL, NULL, NULL, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (538, 17, NULL, NULL, NULL, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (539, 17, NULL, NULL, NULL, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (540, 17, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (541, 17, NULL, NULL, NULL, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (542, 17, NULL, NULL, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (543, 17, NULL, NULL, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (544, 17, NULL, NULL, NULL, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (545, 17, NULL, NULL, NULL, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (546, 17, NULL, NULL, NULL, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (547, 17, NULL, NULL, NULL, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (548, 17, NULL, NULL, NULL, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (549, 17, NULL, NULL, NULL, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (550, 17, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (551, 17, NULL, NULL, NULL, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (552, 17, NULL, NULL, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (553, 17, NULL, NULL, NULL, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (554, 17, NULL, NULL, NULL, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (555, 17, NULL, NULL, NULL, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (556, 17, NULL, NULL, NULL, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (557, 17, NULL, NULL, NULL, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (558, 17, NULL, NULL, NULL, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (559, 17, NULL, NULL, NULL, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (560, 17, NULL, NULL, NULL, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (561, 18, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (562, 18, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (563, 18, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (564, 18, NULL, NULL, NULL, 4, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (565, 18, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (566, 18, NULL, NULL, NULL, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (567, 18, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (568, 18, NULL, NULL, NULL, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (569, 18, NULL, NULL, NULL, 9, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (570, 18, NULL, NULL, NULL, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (571, 18, NULL, NULL, NULL, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (572, 18, NULL, NULL, NULL, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (573, 18, NULL, NULL, NULL, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (574, 18, NULL, NULL, NULL, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (575, 18, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (576, 18, NULL, NULL, NULL, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (577, 18, NULL, NULL, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (578, 18, NULL, NULL, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (579, 18, NULL, NULL, NULL, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (580, 18, NULL, NULL, NULL, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (581, 18, NULL, NULL, NULL, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (582, 18, NULL, NULL, NULL, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (583, 18, NULL, NULL, NULL, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (584, 18, NULL, NULL, NULL, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (585, 18, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (586, 18, NULL, NULL, NULL, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (587, 18, NULL, NULL, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (588, 18, NULL, NULL, NULL, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (589, 18, NULL, NULL, NULL, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (590, 18, NULL, NULL, NULL, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (591, 18, NULL, NULL, NULL, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (592, 18, NULL, NULL, NULL, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (593, 18, NULL, NULL, NULL, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (594, 18, NULL, NULL, NULL, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (595, 18, NULL, NULL, NULL, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (596, 19, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (597, 19, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (598, 19, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (599, 19, NULL, NULL, NULL, 4, 0)
GO
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (600, 19, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (601, 19, 5, 5, 5, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (602, 19, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (603, 19, 1, 1, 1, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (604, 19, 1, 1, 1, 9, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (605, 19, 1, 1, 1, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (606, 19, 1, 1, 1, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (607, 19, 1, 1, 1, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (608, 19, 2, 2, 2, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (609, 19, 2, 2, 2, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (610, 19, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (611, 19, NULL, NULL, NULL, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (612, 19, NULL, NULL, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (613, 19, NULL, NULL, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (614, 19, 6, 6, 6, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (615, 19, 5, 5, 5, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (616, 19, 10, 10, 10, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (617, 19, 10, 10, 10, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (618, 19, 10, 10, 10, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (619, 19, 5, 5, 5, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (620, 19, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (621, 19, NULL, NULL, NULL, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (622, 19, 5, 5, 5, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (623, 19, 5, 5, 5, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (624, 19, 5, 5, 5, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (625, 19, 5, 5, 5, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (626, 19, 5, 5, 5, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (627, 19, 5, 5, 5, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (628, 19, NULL, NULL, NULL, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (629, 19, NULL, NULL, NULL, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (630, 19, 7, 6, 7, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (631, 20, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (632, 20, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (633, 20, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (634, 20, NULL, NULL, NULL, 4, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (635, 20, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (636, 20, 5, NULL, NULL, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (637, 20, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (638, 20, 1, NULL, NULL, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (639, 20, 1, NULL, NULL, 9, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (640, 20, 1, NULL, NULL, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (641, 20, 1, NULL, NULL, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (642, 20, 1, NULL, NULL, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (643, 20, 2, NULL, NULL, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (644, 20, 2, NULL, NULL, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (645, 20, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (646, 20, 3, NULL, NULL, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (647, 20, 4, NULL, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (648, 20, 5, NULL, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (649, 20, 5, NULL, NULL, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (650, 20, 5, NULL, NULL, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (651, 20, 5, NULL, NULL, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (652, 20, 5, NULL, NULL, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (653, 20, 5, NULL, NULL, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (654, 20, 5, NULL, NULL, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (655, 20, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (656, 20, 3, NULL, NULL, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (657, 20, 5, NULL, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (658, 20, 5, NULL, NULL, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (659, 20, 5, NULL, NULL, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (660, 20, 5, NULL, NULL, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (661, 20, 5, NULL, NULL, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (662, 20, 5, NULL, NULL, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (663, 20, 4, NULL, NULL, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (664, 20, 0, NULL, NULL, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (665, 20, 5, NULL, NULL, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (666, 21, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (667, 21, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (668, 21, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (669, 21, NULL, NULL, NULL, 4, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (670, 21, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (671, 21, 5, 5, 5, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (672, 21, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (673, 21, 1, 1, 1, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (674, 21, 1, 1, 1, 9, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (675, 21, 1, 1, 1, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (676, 21, 1, 1, 1, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (677, 21, 1, 1, 1, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (678, 21, 2, 2, 2, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (679, 21, 2, 2, 2, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (680, 21, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (681, 21, NULL, NULL, 3, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (682, 21, NULL, NULL, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (683, 21, NULL, NULL, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (684, 21, 6, 6, NULL, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (685, 21, 5, 5, 5, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (686, 21, 10, 10, 10, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (687, 21, 10, 10, 10, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (688, 21, 10, 10, 10, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (689, 21, 2, 5, 5, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (690, 21, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (691, 21, 3, 3, 3, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (692, 21, NULL, NULL, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (693, 21, 5, 5, 5, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (694, 21, 5, 5, 5, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (695, 21, 5, 5, 5, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (696, 21, 5, 5, 5, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (697, 21, 5, 5, 5, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (698, 21, 4, 2, 4, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (699, 21, 0, 0, 0, 34, 0)
GO
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (700, 21, 5, 10, 10, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (701, 22, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (702, 22, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (703, 22, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (704, 22, NULL, NULL, NULL, 4, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (705, 22, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (706, 22, 5, 5, 5, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (707, 22, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (708, 22, 1, 1, 1, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (709, 22, 1, 1, 1, 9, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (710, 22, 1, 1, 1, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (711, 22, 1, 1, 1, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (712, 22, 1, 1, 1, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (713, 22, 2, 2, 2, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (714, 22, 2, 2, 2, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (715, 22, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (716, 22, 3, 3, 3, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (717, 22, NULL, NULL, 4, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (718, 22, NULL, NULL, 5, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (719, 22, NULL, NULL, 5, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (720, 22, 5, 5, 5, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (721, 22, 10, 5, 5, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (722, 22, 10, 5, 5, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (723, 22, 10, 5, 5, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (724, 22, 5, 5, 5, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (725, 22, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (726, 22, NULL, NULL, 3, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (727, 22, 5, 5, 5, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (728, 22, 5, 5, 5, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (729, 22, 5, 5, 5, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (730, 22, 5, 5, 5, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (731, 22, 5, 5, 5, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (732, 22, 5, 5, 5, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (733, 22, 4, 4, 4, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (734, 22, 0, 0, 0, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (735, 22, 5, 0, 5, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (736, 23, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (737, 23, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (738, 23, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (739, 23, NULL, NULL, NULL, 4, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (740, 23, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (741, 23, 5, 5, NULL, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (742, 23, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (743, 23, 1, 1, NULL, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (744, 23, 1, 1, NULL, 9, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (745, 23, 1, 1, NULL, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (746, 23, 1, 1, NULL, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (747, 23, 1, 1, NULL, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (748, 23, 2, 2, NULL, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (749, 23, 2, 2, NULL, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (750, 23, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (751, 23, 2, NULL, NULL, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (752, 23, NULL, NULL, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (753, 23, NULL, 5, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (754, 23, NULL, NULL, NULL, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (755, 23, 2, 5, NULL, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (756, 23, 5, 5, NULL, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (757, 23, 5, 5, NULL, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (758, 23, 5, 5, NULL, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (759, 23, 5, 5, NULL, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (760, 23, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (761, 23, 3, 3, NULL, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (762, 23, NULL, 5, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (763, 23, 5, 5, NULL, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (764, 23, 5, 5, NULL, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (765, 23, 5, 5, NULL, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (766, 23, 5, 5, NULL, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (767, 23, 5, 5, NULL, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (768, 23, 4, 4, NULL, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (769, 23, NULL, 0, NULL, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (770, 23, 10, 5, NULL, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (771, 24, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (772, 24, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (773, 24, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (774, 24, NULL, NULL, NULL, 4, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (775, 24, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (776, 24, 5, NULL, NULL, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (777, 24, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (778, 24, 1, NULL, NULL, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (779, 24, 1, NULL, NULL, 9, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (780, 24, 1, NULL, NULL, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (781, 24, 1, NULL, NULL, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (782, 24, 1, NULL, NULL, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (783, 24, 2, NULL, NULL, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (784, 24, 2, NULL, NULL, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (785, 24, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (786, 24, NULL, NULL, NULL, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (787, 24, NULL, NULL, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (788, 24, 5, NULL, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (789, 24, NULL, NULL, NULL, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (790, 24, 5, NULL, NULL, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (791, 24, 10, NULL, NULL, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (792, 24, 10, NULL, NULL, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (793, 24, 10, NULL, NULL, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (794, 24, 5, NULL, NULL, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (795, 24, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (796, 24, 3, NULL, NULL, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (797, 24, NULL, NULL, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (798, 24, 5, NULL, NULL, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (799, 24, 5, NULL, NULL, 29, 0)
GO
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (800, 24, 5, NULL, NULL, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (801, 24, 5, NULL, NULL, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (802, 24, 5, NULL, NULL, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (803, 24, 4, NULL, NULL, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (804, 24, NULL, NULL, NULL, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (805, 24, 6, NULL, NULL, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (806, 25, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (807, 25, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (808, 25, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (809, 25, NULL, NULL, NULL, 4, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (810, 25, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (811, 25, 5, NULL, NULL, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (812, 25, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (813, 25, 1, NULL, NULL, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (814, 25, 1, NULL, NULL, 9, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (815, 25, 1, NULL, NULL, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (816, 25, 1, NULL, NULL, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (817, 25, 1, NULL, NULL, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (818, 25, 2, NULL, NULL, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (819, 25, 2, NULL, NULL, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (820, 25, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (821, 25, NULL, NULL, NULL, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (822, 25, 4, NULL, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (823, 25, NULL, NULL, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (824, 25, NULL, NULL, NULL, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (825, 25, 5, NULL, NULL, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (826, 25, 10, NULL, NULL, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (827, 25, 10, NULL, NULL, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (828, 25, 10, NULL, NULL, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (829, 25, 5, NULL, NULL, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (830, 25, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (831, 25, 3, NULL, NULL, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (832, 25, NULL, NULL, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (833, 25, 5, NULL, NULL, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (834, 25, 5, NULL, NULL, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (835, 25, 5, NULL, NULL, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (836, 25, 5, NULL, NULL, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (837, 25, 5, NULL, NULL, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (838, 25, 4, NULL, NULL, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (839, 25, 0, NULL, NULL, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (840, 25, 5, NULL, NULL, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (841, 26, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (842, 26, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (843, 26, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (844, 26, NULL, NULL, NULL, 4, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (845, 26, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (846, 26, 5, 5, 5, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (847, 26, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (848, 26, 1, 1, 1, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (849, 26, 1, 1, 1, 9, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (850, 26, 1, 1, 1, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (851, 26, 1, 1, 1, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (852, 26, 1, 1, 1, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (853, 26, 2, 2, 1, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (854, 26, 2, 2, 2, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (855, 26, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (856, 26, NULL, 3, 2, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (857, 26, NULL, NULL, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (858, 26, 5, NULL, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (859, 26, 2, NULL, NULL, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (860, 26, 2, 5, 5, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (861, 26, 2, 5, 10, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (862, 26, 2, 5, 10, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (863, 26, 2, 5, 10, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (864, 26, 2, NULL, 5, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (865, 26, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (866, 26, 3, 3, 3, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (867, 26, 2, 5, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (868, 26, 2, 5, 5, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (869, 26, 2, 5, 5, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (870, 26, 2, 5, 5, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (871, 26, 2, 5, 5, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (872, 26, 2, 5, 5, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (873, 26, 2, 4, 4, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (874, 26, 0, 0, NULL, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (875, 26, 2, 5, 10, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (876, 27, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (877, 27, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (878, 27, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (879, 27, NULL, NULL, NULL, 4, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (880, 27, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (881, 27, 5, 5, 5, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (882, 27, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (883, 27, 1, 1, 1, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (884, 27, 1, 1, 1, 9, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (885, 27, 1, 1, 1, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (886, 27, 1, 1, 1, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (887, 27, 1, 1, 1, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (888, 27, 2, 2, 2, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (889, 27, 2, 2, 2, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (890, 27, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (891, 27, 3, 3, 3, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (892, 27, NULL, NULL, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (893, 27, NULL, NULL, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (894, 27, NULL, NULL, NULL, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (895, 27, 5, 5, 5, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (896, 27, 10, 5, 10, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (897, 27, 10, 5, 10, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (898, 27, 10, 5, 10, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (899, 27, 4, 5, 5, 24, 0)
GO
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (900, 27, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (901, 27, 3, NULL, 3, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (902, 27, 5, 5, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (903, 27, 5, 5, 5, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (904, 27, 5, 5, 5, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (905, 27, 2, 5, 5, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (906, 27, 5, 5, 5, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (907, 27, 5, 5, 5, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (908, 27, 2, 4, 4, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (909, 27, NULL, 0, 0, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (910, 27, NULL, 10, 10, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (911, 28, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (912, 28, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (913, 28, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (914, 28, NULL, NULL, NULL, 4, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (915, 28, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (916, 28, 5, 5, 5, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (917, 28, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (918, 28, 1, 1, 1, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (919, 28, 1, 1, 1, 9, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (920, 28, 1, 1, 1, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (921, 28, 1, 1, 1, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (922, 28, 1, 1, 1, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (923, 28, 2, 2, 2, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (924, 28, 2, 2, 2, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (925, 28, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (926, 28, 3, NULL, NULL, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (927, 28, NULL, 4, 4, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (928, 28, NULL, NULL, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (929, 28, NULL, NULL, NULL, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (930, 28, 5, 5, 5, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (931, 28, 5, 10, 10, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (932, 28, 5, 10, 10, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (933, 28, 5, 10, 10, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (934, 28, 5, 5, 5, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (935, 28, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (936, 28, 3, NULL, 3, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (937, 28, NULL, 5, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (938, 28, 5, 4, 5, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (939, 28, 5, 4, 5, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (940, 28, 5, 5, 5, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (941, 28, 5, 5, 5, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (942, 28, 5, 5, 5, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (943, 28, 4, 4, 4, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (944, 28, 0, NULL, NULL, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (945, 28, 5, 10, 10, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (946, 29, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (947, 29, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (948, 29, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (949, 29, NULL, NULL, NULL, 4, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (950, 29, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (951, 29, 5, 5, NULL, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (952, 29, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (953, 29, 1, 1, NULL, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (954, 29, 1, 1, NULL, 9, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (955, 29, 1, 1, NULL, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (956, 29, 1, 1, NULL, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (957, 29, 1, 1, NULL, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (958, 29, 2, 2, NULL, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (959, 29, 2, 2, NULL, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (960, 29, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (961, 29, 3, 3, NULL, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (962, 29, NULL, NULL, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (963, 29, NULL, NULL, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (964, 29, NULL, NULL, NULL, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (965, 29, 2, 2, NULL, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (966, 29, 2, 2, NULL, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (967, 29, 2, 2, NULL, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (968, 29, 2, 2, NULL, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (969, 29, 2, 2, NULL, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (970, 29, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (971, 29, 2, 2, NULL, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (972, 29, NULL, NULL, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (973, 29, 2, 2, NULL, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (974, 29, 2, 2, NULL, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (975, 29, 2, 2, NULL, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (976, 29, 2, 2, NULL, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (977, 29, 2, 2, NULL, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (978, 29, 2, 2, NULL, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (979, 29, 0, 0, NULL, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (980, 29, 2, 2, NULL, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (981, 30, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (982, 30, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (983, 30, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (984, 30, NULL, NULL, NULL, 4, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (985, 30, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (986, 30, 5, NULL, NULL, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (987, 30, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (988, 30, 1, NULL, NULL, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (989, 30, 1, NULL, NULL, 9, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (990, 30, 1, NULL, NULL, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (991, 30, 1, NULL, NULL, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (992, 30, 1, NULL, NULL, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (993, 30, 2, NULL, NULL, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (994, 30, 2, NULL, NULL, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (995, 30, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (996, 30, 3, NULL, NULL, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (997, 30, NULL, NULL, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (998, 30, NULL, NULL, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (999, 30, NULL, NULL, NULL, 19, 0)
GO
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1000, 30, 5, NULL, NULL, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1001, 30, 5, NULL, NULL, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1002, 30, 5, NULL, NULL, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1003, 30, 5, NULL, NULL, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1004, 30, 5, NULL, NULL, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1005, 30, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1006, 30, 3, NULL, NULL, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1007, 30, NULL, NULL, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1008, 30, 5, NULL, NULL, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1009, 30, 5, NULL, NULL, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1010, 30, 5, NULL, NULL, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1011, 30, 5, NULL, NULL, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1012, 30, 5, NULL, NULL, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1013, 30, 4, NULL, NULL, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1014, 30, 0, NULL, NULL, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1015, 30, 5, NULL, NULL, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1016, 31, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1017, 31, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1018, 31, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1019, 31, NULL, NULL, NULL, 4, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1020, 31, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1021, 31, 5, 5, 5, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1022, 31, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1023, 31, 1, 1, 1, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1024, 31, 1, 1, 1, 9, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1025, 31, 1, 1, 1, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1026, 31, 1, 1, 1, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1027, 31, 1, 1, 1, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1028, 31, 2, 2, 2, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1029, 31, 2, 2, 2, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1030, 31, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1031, 31, 3, 3, 3, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1032, 31, NULL, NULL, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1033, 31, NULL, NULL, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1034, 31, NULL, NULL, NULL, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1035, 31, 4, 5, 5, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1036, 31, 4, 5, 5, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1037, 31, 4, 5, 5, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1038, 31, 4, 5, 5, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1039, 31, NULL, 5, 5, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1040, 31, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1041, 31, NULL, NULL, 3, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1042, 31, 5, 5, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1043, 31, 5, 5, 4, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1044, 31, 5, 5, 5, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1045, 31, 5, 5, 5, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1046, 31, 5, 5, 5, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1047, 31, 5, 5, 5, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1048, 31, 4, 4, 4, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1049, 31, NULL, 0, 0, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1050, 31, 10, 5, 5, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1051, 32, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1052, 32, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1053, 32, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1054, 32, NULL, NULL, NULL, 4, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1055, 32, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1056, 32, 5, 5, 5, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1057, 32, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1058, 32, 1, 1, 1, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1059, 32, 1, 1, 1, 9, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1060, 32, 1, 1, 1, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1061, 32, 1, 1, 1, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1062, 32, 1, 1, 1, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1063, 32, 2, 2, 2, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1064, 32, 2, 2, 2, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1065, 32, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1066, 32, 2, 3, 3, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1067, 32, NULL, NULL, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1068, 32, NULL, NULL, 0, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1069, 32, NULL, NULL, 0, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1070, 32, 5, 5, 5, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1071, 32, 10, 5, 5, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1072, 32, 10, 5, 5, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1073, 32, 10, 5, 5, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1074, 32, 5, 5, 5, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1075, 32, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1076, 32, 3, 3, 3, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1077, 32, NULL, NULL, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1078, 32, 5, 5, 5, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1079, 32, 5, 5, 5, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1080, 32, 5, 5, 5, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1081, 32, 5, 5, 5, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1082, 32, 5, 5, 5, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1083, 32, 4, 4, 4, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1084, 32, NULL, 0, 0, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1085, 32, 10, 10, 10, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1086, 33, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1087, 33, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1088, 33, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1089, 33, NULL, NULL, NULL, 4, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1090, 33, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1091, 33, 5, NULL, NULL, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1092, 33, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1093, 33, 1, NULL, NULL, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1094, 33, 1, NULL, NULL, 9, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1095, 33, 1, NULL, NULL, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1096, 33, 1, NULL, NULL, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1097, 33, 1, NULL, NULL, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1098, 33, 2, NULL, NULL, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1099, 33, 2, NULL, NULL, 14, 0)
GO
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1100, 33, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1101, 33, NULL, NULL, NULL, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1102, 33, NULL, NULL, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1103, 33, 5, NULL, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1104, 33, NULL, NULL, NULL, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1105, 33, 5, NULL, NULL, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1106, 33, 10, NULL, NULL, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1107, 33, 10, NULL, NULL, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1108, 33, 10, NULL, NULL, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1109, 33, 5, NULL, NULL, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1110, 33, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1111, 33, 3, NULL, NULL, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1112, 33, NULL, NULL, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1113, 33, 5, NULL, NULL, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1114, 33, 5, NULL, NULL, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1115, 33, 5, NULL, NULL, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1116, 33, 5, NULL, NULL, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1117, 33, 5, NULL, NULL, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1118, 33, 4, NULL, NULL, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1119, 33, NULL, NULL, NULL, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1120, 33, NULL, NULL, NULL, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1121, 34, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1122, 34, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1123, 34, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1124, 34, NULL, NULL, NULL, 4, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1125, 34, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1126, 34, 5, NULL, NULL, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1127, 34, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1128, 34, 1, NULL, NULL, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1129, 34, 1, NULL, NULL, 9, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1130, 34, 1, NULL, NULL, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1131, 34, 1, NULL, NULL, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1132, 34, 1, NULL, NULL, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1133, 34, 2, NULL, NULL, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1134, 34, 2, NULL, NULL, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1135, 34, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1136, 34, 3, NULL, NULL, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1137, 34, 4, NULL, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1138, 34, 5, NULL, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1139, 34, 5, NULL, NULL, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1140, 34, 5, NULL, NULL, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1141, 34, 5, NULL, NULL, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1142, 34, 5, NULL, NULL, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1143, 34, 5, NULL, NULL, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1144, 34, 5, NULL, NULL, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1145, 34, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1146, 34, 3, NULL, NULL, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1147, 34, 5, NULL, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1148, 34, 5, NULL, NULL, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1149, 34, 5, NULL, NULL, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1150, 34, 5, NULL, NULL, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1151, 34, 5, NULL, NULL, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1152, 34, 5, NULL, NULL, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1153, 34, 4, NULL, NULL, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1154, 34, 0, NULL, NULL, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1155, 34, 5, NULL, NULL, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1156, 35, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1157, 35, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1158, 35, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1159, 35, NULL, NULL, NULL, 4, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1160, 35, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1161, 35, NULL, NULL, NULL, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1162, 35, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1163, 35, NULL, NULL, NULL, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1164, 35, NULL, NULL, NULL, 9, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1165, 35, NULL, NULL, NULL, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1166, 35, NULL, NULL, NULL, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1167, 35, NULL, NULL, NULL, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1168, 35, NULL, NULL, NULL, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1169, 35, NULL, NULL, NULL, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1170, 35, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1171, 35, NULL, NULL, NULL, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1172, 35, NULL, NULL, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1173, 35, NULL, NULL, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1174, 35, NULL, NULL, NULL, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1175, 35, NULL, NULL, NULL, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1176, 35, NULL, NULL, NULL, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1177, 35, NULL, NULL, NULL, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1178, 35, NULL, NULL, NULL, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1179, 35, NULL, NULL, NULL, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1180, 35, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1181, 35, NULL, NULL, NULL, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1182, 35, NULL, NULL, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1183, 35, NULL, NULL, NULL, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1184, 35, NULL, NULL, NULL, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1185, 35, NULL, NULL, NULL, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1186, 35, NULL, NULL, NULL, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1187, 35, NULL, NULL, NULL, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1188, 35, NULL, NULL, NULL, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1189, 35, NULL, NULL, NULL, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1190, 35, NULL, NULL, NULL, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1191, 36, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1192, 36, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1193, 36, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1194, 36, NULL, NULL, NULL, 4, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1195, 36, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1196, 36, 5, NULL, NULL, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1197, 36, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1198, 36, 1, NULL, NULL, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1199, 36, 1, NULL, NULL, 9, 0)
GO
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1200, 36, 1, NULL, NULL, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1201, 36, 1, NULL, NULL, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1202, 36, 1, NULL, NULL, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1203, 36, 2, NULL, NULL, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1204, 36, 2, NULL, NULL, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1205, 36, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1206, 36, 3, NULL, NULL, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1207, 36, 4, NULL, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1208, 36, 5, NULL, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1209, 36, 5, NULL, NULL, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1210, 36, 5, NULL, NULL, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1211, 36, 5, NULL, NULL, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1212, 36, 5, NULL, NULL, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1213, 36, 5, NULL, NULL, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1214, 36, 5, NULL, NULL, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1215, 36, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1216, 36, 3, NULL, NULL, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1217, 36, 5, NULL, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1218, 36, 5, NULL, NULL, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1219, 36, 5, NULL, NULL, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1220, 36, 5, NULL, NULL, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1221, 36, 5, NULL, NULL, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1222, 36, 5, NULL, NULL, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1223, 36, 4, NULL, NULL, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1224, 36, 0, NULL, NULL, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1225, 36, 5, NULL, NULL, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1226, 37, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1227, 37, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1228, 37, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1229, 37, NULL, NULL, NULL, 4, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1230, 37, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1231, 37, NULL, NULL, NULL, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1232, 37, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1233, 37, NULL, NULL, NULL, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1234, 37, NULL, NULL, NULL, 9, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1235, 37, NULL, NULL, NULL, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1236, 37, NULL, NULL, NULL, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1237, 37, NULL, NULL, NULL, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1238, 37, NULL, NULL, NULL, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1239, 37, NULL, NULL, NULL, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1240, 37, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1241, 37, NULL, NULL, NULL, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1242, 37, NULL, NULL, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1243, 37, NULL, NULL, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1244, 37, NULL, NULL, NULL, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1245, 37, NULL, NULL, NULL, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1246, 37, NULL, NULL, NULL, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1247, 37, NULL, NULL, NULL, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1248, 37, NULL, NULL, NULL, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1249, 37, NULL, NULL, NULL, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1250, 37, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1251, 37, NULL, NULL, NULL, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1252, 37, NULL, NULL, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1253, 37, NULL, NULL, NULL, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1254, 37, NULL, NULL, NULL, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1255, 37, NULL, NULL, NULL, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1256, 37, NULL, NULL, NULL, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1257, 37, NULL, NULL, NULL, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1258, 37, NULL, NULL, NULL, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1259, 37, NULL, NULL, NULL, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1260, 37, NULL, NULL, NULL, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1261, 38, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1262, 38, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1263, 38, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1264, 38, NULL, NULL, NULL, 4, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1265, 38, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1266, 38, 5, 5, NULL, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1267, 38, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1268, 38, 1, 1, NULL, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1269, 38, 1, 1, NULL, 9, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1270, 38, 1, 1, NULL, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1271, 38, 1, 1, NULL, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1272, 38, 1, 1, NULL, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1273, 38, 2, 2, NULL, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1274, 38, 2, 2, NULL, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1275, 38, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1276, 38, NULL, NULL, NULL, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1277, 38, 4, 4, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1278, 38, NULL, NULL, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1279, 38, NULL, NULL, NULL, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1280, 38, 5, 5, NULL, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1281, 38, 5, 10, NULL, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1282, 38, 10, 10, NULL, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1283, 38, 10, 10, NULL, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1284, 38, 5, 5, NULL, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1285, 38, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1286, 38, NULL, 3, NULL, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1287, 38, 5, NULL, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1288, 38, 5, 5, NULL, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1289, 38, 5, 5, NULL, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1290, 38, 5, 5, NULL, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1291, 38, 5, 5, NULL, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1292, 38, 5, 5, NULL, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1293, 38, 4, 4, NULL, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1294, 38, NULL, NULL, NULL, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1295, 38, 10, 10, NULL, 35, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1296, 39, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1297, 39, NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1298, 39, NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1299, 39, NULL, NULL, NULL, 4, 0)
GO
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1300, 39, NULL, NULL, NULL, 5, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1301, 39, 5, 5, NULL, 6, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1302, 39, NULL, NULL, NULL, 7, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1303, 39, 1, 1, NULL, 8, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1304, 39, 1, 1, NULL, 9, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1305, 39, 1, 1, NULL, 10, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1306, 39, 1, 1, NULL, 11, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1307, 39, 1, 1, NULL, 12, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1308, 39, 2, 2, NULL, 13, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1309, 39, NULL, 2, NULL, 14, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1310, 39, NULL, NULL, NULL, 15, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1311, 39, 3, 3, NULL, 16, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1312, 39, NULL, 0, NULL, 17, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1313, 39, NULL, 0, NULL, 18, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1314, 39, NULL, NULL, NULL, 19, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1315, 39, 5, 5, NULL, 20, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1316, 39, 10, 10, NULL, 21, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1317, 39, 10, 10, NULL, 22, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1318, 39, 10, 10, NULL, 23, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1319, 39, 5, 5, NULL, 24, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1320, 39, NULL, NULL, NULL, 25, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1321, 39, 3, 3, NULL, 26, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1322, 39, NULL, NULL, NULL, 27, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1323, 39, 5, 5, NULL, 28, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1324, 39, 5, 5, NULL, 29, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1325, 39, 5, 5, NULL, 30, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1326, 39, 5, 5, NULL, 31, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1327, 39, 5, 5, NULL, 32, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1328, 39, 4, 4, NULL, 33, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1329, 39, 5, 0, NULL, 34, 0)
INSERT [dbo].[Diem] ([DiemID], [PhieuID], [DiemSV], [DiemCBL], [DiemCBK], [TieuChiID], [isDelete]) VALUES (1330, 39, 5, 10, NULL, 35, 0)
SET IDENTITY_INSERT [dbo].[Diem] OFF
GO
SET IDENTITY_INSERT [dbo].[Khoa] ON 

INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [isDelete]) VALUES (1, N'Sư phạm Toán - Tin', 0)
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [isDelete]) VALUES (2, N'Sư phạm Ngữ văn', 0)
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [isDelete]) VALUES (3, N'Giáo dục Thể chất', 0)
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [isDelete]) VALUES (4, N'Ngoại Ngữ', 0)
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [isDelete]) VALUES (5, N'Sự phạm Nghệ thuật', 0)
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [isDelete]) VALUES (6, N'Giáo dục', NULL)
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [isDelete]) VALUES (7, N'test', 1)
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [isDelete]) VALUES (8, NULL, 1)
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa], [isDelete]) VALUES (9, N'test1', 1)
SET IDENTITY_INSERT [dbo].[Khoa] OFF
GO
SET IDENTITY_INSERT [dbo].[KyDangKy] ON 

INSERT [dbo].[KyDangKy] ([KyDKID], [HocKyXet], [NgayBD], [NgayKT], [NamXet], [TieuDeDK], [NoiDungDK], [IsDelete], [TrangThai]) VALUES (26, N'I', CAST(N'2022-04-02' AS Date), CAST(N'2022-05-31' AS Date), N'2021 - 2022', N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2021 - 2022', N'<h4 id="TieuDeDK">PHIẾU Đ&Aacute;NH GI&Aacute; KẾT QUẢ R&Egrave;N LUYỆN HỌC KỲ&nbsp;<span id="hk">I</span>&nbsp;NĂM HỌC&nbsp;<span id="nam">2021 - 2022</span></h4>', 0, 2)
INSERT [dbo].[KyDangKy] ([KyDKID], [HocKyXet], [NgayBD], [NgayKT], [NamXet], [TieuDeDK], [NoiDungDK], [IsDelete], [TrangThai]) VALUES (28, N'I', CAST(N'2022-04-05' AS Date), CAST(N'2022-04-29' AS Date), N'2021 - 2022', N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2021 - 2022', N'<p>55555</p>', 0, 1)
INSERT [dbo].[KyDangKy] ([KyDKID], [HocKyXet], [NgayBD], [NgayKT], [NamXet], [TieuDeDK], [NoiDungDK], [IsDelete], [TrangThai]) VALUES (29, N'II', CAST(N'2022-04-05' AS Date), CAST(N'2022-05-07' AS Date), N'2021 - 2022', N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ II NĂM HỌC 2021 - 2022', N'<p>6666</p>', 1, 2)
INSERT [dbo].[KyDangKy] ([KyDKID], [HocKyXet], [NgayBD], [NgayKT], [NamXet], [TieuDeDK], [NoiDungDK], [IsDelete], [TrangThai]) VALUES (30, N'I', CAST(N'2022-04-05' AS Date), CAST(N'2022-04-22' AS Date), N'2022 - 2023', N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2022 - 2023', N'<p>6666</p>', 0, 2)
INSERT [dbo].[KyDangKy] ([KyDKID], [HocKyXet], [NgayBD], [NgayKT], [NamXet], [TieuDeDK], [NoiDungDK], [IsDelete], [TrangThai]) VALUES (31, N'I', CAST(N'2022-04-06' AS Date), CAST(N'2022-04-30' AS Date), N'2020 - 2021', N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2020 - 2021', N'<p>Nội dung x&eacute;t r&egrave;n luyện</p>', 0, 1)
SET IDENTITY_INSERT [dbo].[KyDangKy] OFF
GO
SET IDENTITY_INSERT [dbo].[Lop] ON 

INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (1, N'CNTT18', 1, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (2, N'CNTT19', 1, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (3, N'CNTT20', 1, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (4, N'CNTT21', 1, 1)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (5, N'CNTT22', 1, 1)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (6, N'SPTA18', 4, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (7, N'SPTA19', 4, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (8, N'SPTA20', 4, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (9, N'SPTA21', 4, 1)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (10, N'SPTA22', 4, 1)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (11, N'NNTQ18', 4, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (12, N'NNTQ19', 4, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (13, N'NNTQ20', 4, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (14, N'NNTQ21', 4, 1)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (15, N'NNTQ22', 4, 1)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (16, N'SPNV18', 2, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (17, N'SPNV19', 2, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (18, N'SPNV20', 2, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (19, N'SPNV21', 2, 1)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (20, N'SPNV22', 2, 1)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (21, N'GDMN18', 6, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (22, N'GDMN19', 6, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (23, N'GDMN20', 6, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (24, N'SPTIN18', 1, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (25, N'SPTIN19', 1, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (26, N'SPTIN20', 1, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (27, N'GDTH18', 6, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (28, N'GDTH19', 6, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (29, N'GDTH20', 6, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (30, N'GDTC18', 3, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (31, N'GDTC19', 3, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (32, N'GDTC20', 3, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (33, N'SPAN18', 5, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (34, N'SPAN19', 5, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (35, N'SPAN20', 5, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa], [isDelete]) VALUES (36, N'test1', 1, 1)
SET IDENTITY_INSERT [dbo].[Lop] OFF
GO
SET IDENTITY_INSERT [dbo].[LopKyDangKy] ON 

INSERT [dbo].[LopKyDangKy] ([ID], [MaLop], [KyDKID], [MaKhoa], [IsDelete]) VALUES (27, 1, 26, 1, NULL)
INSERT [dbo].[LopKyDangKy] ([ID], [MaLop], [KyDKID], [MaKhoa], [IsDelete]) VALUES (28, 2, 26, 1, NULL)
INSERT [dbo].[LopKyDangKy] ([ID], [MaLop], [KyDKID], [MaKhoa], [IsDelete]) VALUES (29, 3, 26, 1, NULL)
INSERT [dbo].[LopKyDangKy] ([ID], [MaLop], [KyDKID], [MaKhoa], [IsDelete]) VALUES (30, 24, 26, 1, NULL)
INSERT [dbo].[LopKyDangKy] ([ID], [MaLop], [KyDKID], [MaKhoa], [IsDelete]) VALUES (31, 25, 26, 1, NULL)
INSERT [dbo].[LopKyDangKy] ([ID], [MaLop], [KyDKID], [MaKhoa], [IsDelete]) VALUES (32, 26, 26, 1, NULL)
INSERT [dbo].[LopKyDangKy] ([ID], [MaLop], [KyDKID], [MaKhoa], [IsDelete]) VALUES (36, 6, 28, 4, NULL)
INSERT [dbo].[LopKyDangKy] ([ID], [MaLop], [KyDKID], [MaKhoa], [IsDelete]) VALUES (37, 7, 28, 4, NULL)
INSERT [dbo].[LopKyDangKy] ([ID], [MaLop], [KyDKID], [MaKhoa], [IsDelete]) VALUES (38, 2, 29, 1, 1)
INSERT [dbo].[LopKyDangKy] ([ID], [MaLop], [KyDKID], [MaKhoa], [IsDelete]) VALUES (39, 3, 29, 1, 1)
INSERT [dbo].[LopKyDangKy] ([ID], [MaLop], [KyDKID], [MaKhoa], [IsDelete]) VALUES (40, 1, 30, 1, NULL)
INSERT [dbo].[LopKyDangKy] ([ID], [MaLop], [KyDKID], [MaKhoa], [IsDelete]) VALUES (41, 2, 30, 1, NULL)
INSERT [dbo].[LopKyDangKy] ([ID], [MaLop], [KyDKID], [MaKhoa], [IsDelete]) VALUES (42, 3, 30, 1, NULL)
INSERT [dbo].[LopKyDangKy] ([ID], [MaLop], [KyDKID], [MaKhoa], [IsDelete]) VALUES (43, 16, 31, 2, NULL)
INSERT [dbo].[LopKyDangKy] ([ID], [MaLop], [KyDKID], [MaKhoa], [IsDelete]) VALUES (44, 17, 31, 2, NULL)
INSERT [dbo].[LopKyDangKy] ([ID], [MaLop], [KyDKID], [MaKhoa], [IsDelete]) VALUES (45, 18, 31, 2, NULL)
SET IDENTITY_INSERT [dbo].[LopKyDangKy] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([MenuID], [TenMenu], [ParentID], [OrderKey], [isDelete], [Path]) VALUES (1, N'Thông tin', NULL, 0, 0, NULL)
INSERT [dbo].[Menu] ([MenuID], [TenMenu], [ParentID], [OrderKey], [isDelete], [Path]) VALUES (2, N'Quản lý lớp', NULL, 1, 0, NULL)
INSERT [dbo].[Menu] ([MenuID], [TenMenu], [ParentID], [OrderKey], [isDelete], [Path]) VALUES (3, N'Quản lý đánh giá', NULL, 2, 0, NULL)
INSERT [dbo].[Menu] ([MenuID], [TenMenu], [ParentID], [OrderKey], [isDelete], [Path]) VALUES (4, N'Quản lý phiếu điểm', NULL, 3, 0, NULL)
INSERT [dbo].[Menu] ([MenuID], [TenMenu], [ParentID], [OrderKey], [isDelete], [Path]) VALUES (5, N'Xét điểm rèn luyện', 0, 5, 0, NULL)
INSERT [dbo].[Menu] ([MenuID], [TenMenu], [ParentID], [OrderKey], [isDelete], [Path]) VALUES (6, N'Thống kê', 0, 6, 0, NULL)
INSERT [dbo].[Menu] ([MenuID], [TenMenu], [ParentID], [OrderKey], [isDelete], [Path]) VALUES (7, N'Quản trị hệ thống', NULL, 7, 0, NULL)
INSERT [dbo].[Menu] ([MenuID], [TenMenu], [ParentID], [OrderKey], [isDelete], [Path]) VALUES (8, N'Sinh viên', 2, 0, 0, NULL)
INSERT [dbo].[Menu] ([MenuID], [TenMenu], [ParentID], [OrderKey], [isDelete], [Path]) VALUES (9, N'Lớp', 7, 0, 0, N'/Lop')
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[PhieuDanhGia] ON 

INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (13, NULL, NULL, NULL, NULL, NULL, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2021 - 2022', 1, NULL, NULL, NULL)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (14, NULL, NULL, NULL, NULL, NULL, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2021 - 2022', 1, NULL, NULL, NULL)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (15, 1, 24, NULL, CAST(N'2022-04-02' AS Date), 26, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2021 - 2022', 0, NULL, 93, 99)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (16, 4, NULL, NULL, NULL, 26, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2021 - 2022', 0, NULL, NULL, NULL)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (17, 18, NULL, NULL, NULL, 26, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2021 - 2022', 0, NULL, NULL, NULL)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (18, 21, NULL, NULL, NULL, 26, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2021 - 2022', 0, NULL, NULL, NULL)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (19, 19, 1, 3, CAST(N'2022-04-02' AS Date), 26, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2021 - 2022', 0, 97, 97, 96)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (20, 24, NULL, NULL, CAST(N'2022-04-04' AS Date), 26, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2021 - 2022', 0, NULL, 98, NULL)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (21, 5, 5, 5, CAST(N'2022-04-04' AS Date), 26, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2021 - 2022', 0, 99, 94, 100)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (22, 40, 37, 3, CAST(N'2022-04-05' AS Date), 29, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ II NĂM HỌC 2021 - 2022', 0, 98, 96, 76)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (23, 37, 37, NULL, CAST(N'2022-04-05' AS Date), 29, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ II NĂM HỌC 2021 - 2022', 0, NULL, 80, 86)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (24, 29, NULL, NULL, CAST(N'2022-04-05' AS Date), 30, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ II NĂM HỌC 2021 - 2022', 0, NULL, 97, NULL)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (25, 33, NULL, NULL, CAST(N'2022-04-05' AS Date), 30, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2022 - 2023', 0, NULL, 95, NULL)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (26, 40, 37, 3, CAST(N'2022-04-05' AS Date), 30, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2022 - 2023', 0, 97, 50, 79)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (27, 34, 37, 3, CAST(N'2022-04-05' AS Date), 30, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2022 - 2023', 0, 99, 88, 86)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (28, 38, 37, 3, CAST(N'2022-04-05' AS Date), 30, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2022 - 2023', 0, 100, 79, 100)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (29, 39, 37, NULL, CAST(N'2022-04-05' AS Date), 30, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2022 - 2023', 0, NULL, 43, 43)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (30, 30, NULL, NULL, CAST(N'2022-04-05' AS Date), 30, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2022 - 2023', 0, NULL, 79, NULL)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (31, 35, 37, 3, CAST(N'2022-04-05' AS Date), 30, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2022 - 2023', 0, 78, 77, 81)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (32, 37, 37, 3, CAST(N'2022-04-05' AS Date), 30, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2022 - 2023', 0, 84, 98, 84)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (33, 4, NULL, NULL, CAST(N'2022-04-05' AS Date), 30, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2022 - 2023', 0, NULL, 91, NULL)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (34, 16, NULL, NULL, CAST(N'2022-04-05' AS Date), 30, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2022 - 2023', 0, NULL, 98, NULL)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (35, 27, NULL, NULL, NULL, 30, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2022 - 2023', 0, NULL, NULL, NULL)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (36, 42, NULL, NULL, CAST(N'2022-04-05' AS Date), 30, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2022 - 2023', 0, NULL, 98, NULL)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (37, 1, NULL, NULL, NULL, 30, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2022 - 2023', 0, NULL, NULL, NULL)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (38, 150, 151, NULL, CAST(N'2022-04-06' AS Date), 31, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2020 - 2021', 0, NULL, 97, 100)
INSERT [dbo].[PhieuDanhGia] ([PhieuID], [SinhVienID], [CanBoLopID], [CanBoID], [NgayDanhGia], [KyDKID], [TenPhieu], [isDelete], [DiemTong], [DiemTongSV], [DiemTongCBL]) VALUES (39, 151, 151, NULL, CAST(N'2022-04-06' AS Date), 31, N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2020 - 2021', 0, NULL, 97, 99)
SET IDENTITY_INSERT [dbo].[PhieuDanhGia] OFF
GO
SET IDENTITY_INSERT [dbo].[Quyen] ON 

INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa], [isDelete]) VALUES (1, N'Sinh viên', N'Chưc năng cơ bản ', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa], [isDelete]) VALUES (2, N'Cán bộ lớp', N'Chức năng duyệt điểm rèn luyện', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [MoTa], [isDelete]) VALUES (3, N'Cán bộ khoa', N'Chức năng adminmmm', NULL)
SET IDENTITY_INSERT [dbo].[Quyen] OFF
GO
SET IDENTITY_INSERT [dbo].[QuyenMenu] ON 

INSERT [dbo].[QuyenMenu] ([QuyenMenuID], [MaQuyen], [MenuID], [isDelete]) VALUES (1, 1, 1, 0)
INSERT [dbo].[QuyenMenu] ([QuyenMenuID], [MaQuyen], [MenuID], [isDelete]) VALUES (2, 1, 7, 0)
INSERT [dbo].[QuyenMenu] ([QuyenMenuID], [MaQuyen], [MenuID], [isDelete]) VALUES (3, 2, 1, 0)
INSERT [dbo].[QuyenMenu] ([QuyenMenuID], [MaQuyen], [MenuID], [isDelete]) VALUES (4, 2, 7, 0)
INSERT [dbo].[QuyenMenu] ([QuyenMenuID], [MaQuyen], [MenuID], [isDelete]) VALUES (5, 2, 5, 0)
INSERT [dbo].[QuyenMenu] ([QuyenMenuID], [MaQuyen], [MenuID], [isDelete]) VALUES (6, 3, 1, 0)
INSERT [dbo].[QuyenMenu] ([QuyenMenuID], [MaQuyen], [MenuID], [isDelete]) VALUES (7, 3, 2, 0)
INSERT [dbo].[QuyenMenu] ([QuyenMenuID], [MaQuyen], [MenuID], [isDelete]) VALUES (8, 3, 3, 0)
INSERT [dbo].[QuyenMenu] ([QuyenMenuID], [MaQuyen], [MenuID], [isDelete]) VALUES (9, 3, 4, 0)
INSERT [dbo].[QuyenMenu] ([QuyenMenuID], [MaQuyen], [MenuID], [isDelete]) VALUES (10, 3, 5, 0)
INSERT [dbo].[QuyenMenu] ([QuyenMenuID], [MaQuyen], [MenuID], [isDelete]) VALUES (11, 3, 6, 0)
SET IDENTITY_INSERT [dbo].[QuyenMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (1, N'cbkttt', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-16' AS Date), N'Cán Bộ Khoa', N'0866744002', N'dangngocbin2000@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/bin.jpg', N'0018413035', 5, NULL, 1, CAST(N'2000-02-29' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (3, N'phugvTT', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-16' AS Date), N'Trần Quốc Phú', N'02858425834', N'dangngocbin2000@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/7eaeb56f99ef75b12cfe.jpg', N'0018254165', 5, NULL, 1, CAST(N'1999-02-09' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (4, N'nqnghia', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-16' AS Date), N'Nguyễn Quốc Nghĩa', N'0987654321', N'nghiadeptraikuto@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018410654', 3, 1, 1, CAST(N'1999-02-09' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (5, N'admin', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-21' AS Date), N'Nguyễn Bá Nhật', N'0866744002', N'dangngocbin2000@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018410654', 1, 1, 1, CAST(N'1999-02-09' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (6, N'huynh-0018410764', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Nguyễn Thị Cẩm Huỳnh', N'0865465465', N'huynh0018410764@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018410764', 1, 24, 1, CAST(N'1999-02-09' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (7, N'hanhstin18', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Bùi Trần Hồng Hạnh', N'0862601166', N'hanh0018410764@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018411034', 1, 24, 1, CAST(N'1999-12-09' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (8, N'mystin18', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Thái Quốc Thế Mỹ', N'0865489111', N'my18@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018410804', 1, 24, 1, CAST(N'1999-12-09' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (9, N'trangstin18', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Nguyễn Thị Thu Trang', N'0861651321', N'trang18@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018410204', 1, 24, 1, CAST(N'1999-12-09' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (10, N'dienstin18', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Nguyễn Lê Hoài Diễn', N'0865421976', N'dien18@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018410881', 1, 24, 1, CAST(N'1999-12-12' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (11, N'truongstin18', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Đặng Hoàng Lam Trường', N'0841321656', N'truong18@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0184100654', 1, 24, 1, CAST(N'2000-03-04' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (12, N'binhstin18', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Phạm Công Bình', N'0651984944', N'binh18@gmai.dthu.com', N'Tiền Giang', N'/Assets/images/users/no_image.png', N'0018410962', 1, 24, 1, CAST(N'2000-09-09' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (13, N'tanstin18', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Nguyễn Hoàng Tân', N'0616546545', N'tan18@gmail.dthu.com', N'Tiền Giang', N'/Assets/images/users/no_image.png', N'0018410995', 4, 24, 1, CAST(N'2000-03-12' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (14, N'khangstin18', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Nguyễn Thanh Khang', N'0865134665', N'khang18@gmail.dthu.com', N'Tiền Giang', N'/Assets/images/users/no_image.png', N'0018411016', 3, 24, 1, CAST(N'2000-08-08' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (15, N'dientin18', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Nguyễn Lê Hoài Diễn', N'0865421976', N'dien18@gmail.dthu.com', N'Tiền Giang', N'/Assets/images/users/no_image.png', N'0018410881', 1, 1, 1, CAST(N'1999-12-12' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (16, N'lamCBtin18', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Lê Phát Lảm', N'0354654846', N'lam18@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018411024', 3, 1, 1, CAST(N'2000-08-23' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (17, N'0018410679', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'NGUYỄN THANH TOÀN', N'0265465499', N'bduy18@gmail.dthu.com', N'Tiền Giang', N'/Assets/images/users/no_image.png', N'0018410679', 1, 1, 1, CAST(N'2000-07-08' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (18, N'0018413041', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'LÊ DUY KHANG', N'0598461333', N'nhu@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018413041', 1, 1, 1, CAST(N'2000-01-07' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (19, N'0018413046', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'NGUYỄN THỊ HỒNG NGỌC', N'0198465466', N'hngoc@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018413046', 1, 1, 1, CAST(N'2000-12-24' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (20, N'0018413058', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'VÕ THỊ BÍCH TRĂM', N'0654684899', N'tduy@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018413058', 1, 1, 1, CAST(N'2000-01-02' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (21, N'0018413059', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'LÊ CHÍ TRỌNG', N'0269876300', N'bphuc@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018413059', 1, 1, 1, CAST(N'2000-02-08' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (22, N'0018413060', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'NGUYỄN LÊ HOÀNG TRUNG', N'0654813266', N'toan@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018413060', 1, 1, 1, CAST(N'2000-12-24' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (23, N'0018410634', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'PHẠM NGUYỄN THANH DUY', N'0843216161', N'man@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0184130560', 1, 1, 1, CAST(N'2000-11-12' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (24, N'0018410645', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'MAI CHÍ LINH', N'0804165466', N'khoa@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018410634', 1, 1, 1, CAST(N'2000-08-12' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (25, N'0018410665', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'VÕ VĂN QUÍ', N'0841320333', N'tinh@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0194016546', 1, 1, 1, CAST(N'2001-02-01' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (26, N'0018413035', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'ĐẶNG NGỌC BIN', N'0841321666', N'tien@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018413035', 1, 1, 1, CAST(N'2001-12-12' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (27, N'0018413042', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'NGUYỄN AN KHANG', N'0841513000', N'hai@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018413042', 1, 1, 1, CAST(N'2001-12-11' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (28, N'0018413050', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'HỒ NGỌC VINH QUANG', N'0842002132', N'toan@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018413050', 1, 1, 1, CAST(N'2001-04-12' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (29, N'0018410633', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'LÊ HOÀNG BẢO DUY', N'0132016546', N'men@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018410633', 1, 1, 1, CAST(N'2001-12-12' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (30, N'0018410644', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'LÊ PHÁT LẢM', N'0665465433', N'an@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018410644', 1, 1, 1, CAST(N'2001-09-09' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (31, N'0018410666', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'NGUYỄN THỊ QUỲNH QUYÊN', N'0946513210', N'nguyen@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018410666', 4, 1, 1, CAST(N'2001-01-03' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (32, N'0018410673', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'DƯƠNG NGUYỄN CẨM THU', N'0921650311', N'nghia@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018410673', 1, 1, 1, CAST(N'2001-02-02' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (33, N'0018410651', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'NGUYỄN VIỆT MỸ', N'0651354866', N'nhan@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018410651', 1, 1, 1, CAST(N'2001-03-03' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (34, N'0018410653', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'ĐOÀN VĨNH NGHI', N'0984650233', N'tien@gmai.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018410653', 1, 1, 1, CAST(N'2002-01-01' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (35, N'0018410659', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'NGUYỄN VIỆT NHẬT', N'0976541351', N'gam@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018410659', 1, 1, 1, CAST(N'2002-02-02' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (36, N'0018410672', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'NGUYỄN UY THÔNG', N'0165496546', N'minh@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018410672', 1, 1, 1, CAST(N'2002-03-03' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (37, N'0018410647', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'ĐINH THỊ BÉ LOAN', N'0984316456', N'dung@gmail.dthu.com', N'Tiền Giang', N'/Assets/images/users/no_image.png', N'0018410647', 1, 1, 1, CAST(N'2002-04-04' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (38, N'0018410655', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'NGUYỄN ÁNH NGỌC', N'0165132316', N'thanh@gmail.dthu.com', N'Tiền Giang', N'/Assets/images/users/no_image.png', N'0018410655', 1, 1, 1, CAST(N'2002-05-04' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (39, N'0018410654', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'NGUYỄN QUỐC NGHĨA', N'0687430254', N'kha@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018410654', 1, 1, 1, CAST(N'2002-03-12' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (40, N'0018410656', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'NGUYỄN THÁI NGỌC', N'0832503516', N'hung@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018410656', 1, 1, 1, CAST(N'2002-01-01' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (41, N'0018410662', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'NGUYỄN BÁ PHÚC', N'0465324165', N'tuan@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018410662', 1, 1, 1, CAST(N'2002-12-12' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (42, N'0018413053', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'TRẦN HUỲNH NGUYÊN THÀNH', N'0165413216', N'thai@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018413053', 1, 1, 1, CAST(N'2002-12-11' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (43, N'0018410639', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'LÊ HỒ HOÀNG HUY', N'0165465643', N'bin@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018410639', 1, 1, 1, CAST(N'2002-11-11' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (44, N'0018410674', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'PHẠM VÕ THUẬT', N'0168432133', N'lam@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018410674', 1, 1, 1, CAST(N'2000-12-12' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (45, N'0018410669', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'NGUYỄN HÒA THÀNH', N'0653416866', N'hoai@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018410669', 1, 1, 1, CAST(N'2000-01-03' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (46, N'0018410661', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'TRẦN THÁI NHU', N'0615314633', N'tri@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018410661', 1, 1, 1, CAST(N'2000-12-12' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (47, N'0018410650', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'NGUYỄN MINH MẪN', N'0645343334', N'hoanganh@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018410650', 1, 1, 1, CAST(N'2000-12-08' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (48, N'0018410657', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'LÊ THÀNH NHÂN', N'0198302133', N'hai@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018410657', 1, 1, 1, CAST(N'2000-05-12' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (49, N'0018410670', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'NGUYỄN HOÀNG THÀNH', N'0854321317', N'duy@gmail.com', N'Hãi Dương', N'/Assets/images/users/no_image.png', N'0018410670', 1, 1, 1, CAST(N'2000-01-05' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (50, N'0018410642', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'NGUYỄN DUY KHOA', N'0366354164', N'hien@gmail.dthu.com', N'Long An', N'/Assets/images/users/no_image.png', N'0018410642', 1, 1, 1, CAST(N'2000-12-29' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (51, N'0018413051', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'DƯƠNG TẤN THÀNH', N'0641746687', N'man@gmail.dthu.com', N'Long An', N'/Assets/images/users/no_image.png', N'0018413051', 1, 1, 1, CAST(N'2000-12-23' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (52, N'0018410629', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'NGUYỄN HOÀNG BỬU', N'0168534316', N'canh@gmail.dthu.com', N'Tiền Giang', N'/Assets/images/users/no_image.png', N'0018410629', 1, 1, 1, CAST(N'2000-09-09' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (53, N'0018410683', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'NGUYỄN THỊ THIỆN VY', N'0365345333', N'tien@gmail.com', N'Hậu Giang', N'/Assets/images/users/no_image.png', N'0018410683', 1, 1, 1, CAST(N'2000-01-24' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (54, N'0018413040', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'HUỲNH MINH HÙNG', N'0143501333', N'dat@gmail.dthu.com', N'Tiền Giang', N'/Assets/images/users/no_image.png', N'0018413040', 1, 1, 1, CAST(N'2001-12-24' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (55, N'0019413000', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Trần Tiến Dũng', N'0861754302', N'dung@gmai.dthu.com', N'Long An', N'/Assets/images/users/no_image.png', N'0019413000', 1, 2, 1, CAST(N'2001-12-25' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (56, N'0019413001', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Nguyễn Bảo Duy', N'0683531636', N'duy@gmail.dthu.com', N'Long An ', N'/Assets/images/users/no_image.png', N'0019413001', 1, 2, 1, CAST(N'2001-11-12' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (57, N'0019413002', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Trương Minh Sa', N'0145346535', N'minh@gmail.dthu.com', N'Long An', N'/Assets/images/users/no_image.png', N'0019413002', 1, 2, 1, CAST(N'2001-10-10' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (58, N'0019413003', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Dương Tuấn Cảnh', N'0178412655', N'canh@gmail.dthu.com', N'Long An ', N'/Assets/images/users/no_image.png', N'0019413003', 1, 2, 1, CAST(N'2001-03-12' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (59, N'0019413004', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Nguyễn Hoài Lam', N'0489651331', N'lam@gmail.com', N'Hậu Giang', N'/Assets/images/users/no_image.png', N'0019413004', 1, 2, 1, CAST(N'2000-12-12' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (60, N'0019413005', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Cao Thái Văn Tuấn', N'0174653216', N'tuan@gmail.dthu.com', N'Hậu Giang', N'/Assets/images/users/no_image.png', N'0019413005', 4, 2, 1, CAST(N'2000-12-24' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (61, N'0019413006', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Nguyễn Thị Lại Phượng', N'0498675496', N'phuong@gmail.dthu.com', N'Tiền Giang', N'/Assets/images/users/no_image.png', N'0019413006', 3, 2, 1, CAST(N'2000-01-23' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (62, N'0019413007', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Nguyễn Văn Tuấn', N'0189654163', N'tuan@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019413007', 1, 2, 1, CAST(N'2000-12-23' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (63, N'0019413008', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Nguyễn Tấn Nguyễn', N'0798654663', N'nguyen@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019413008', 1, 2, 1, CAST(N'2000-11-11' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (64, N'0019413009', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Nguyễn Quốc Nghĩa', N'0565435466', N'nghia@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019413009', 1, 2, 1, CAST(N'2001-01-02' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (65, N'0019413010', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Đặng Ngọc Bin', N'0465465133', N'bin@dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019413010', 1, 2, 1, CAST(N'2001-04-02' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (66, N'0019413011', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Dương Thị Thanh Hà', N'0795165316', N'ha@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019413011', 1, 2, 1, CAST(N'2001-03-01' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (67, N'0019413012', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Nguyễn Thị Ánh Tuyến', N'0798464644', N'tuyen@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019413012', 1, 2, 1, CAST(N'2001-12-24' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (68, N'0019413013', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Trần Văn Minh', N'0786418416', N'minh@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019413013', 1, 2, 1, CAST(N'2001-12-29' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (69, N'0019413014', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Nguyễn Minh Duy', N'0984121323', N'duy@gmail.dthu.com', N'Tiền Giang', N'/Assets/images/users/no_image.png', N'0019413014', 1, 2, 1, CAST(N'2001-10-12' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (70, N'0019413015', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Nguyễn Quốc Nghĩa', N'0794654656', N'nghia@gmai.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019413015', 1, 2, 1, CAST(N'2002-12-12' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (71, N'0019413016', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Trần Hà Duy Phúc', N'0165401363', N'phuc@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019413016', 1, 2, 1, CAST(N'2002-03-23' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (72, N'0019413017', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Dương Thế Phạm Tài ', N'0175613266', N'tai@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019413017', 5, 2, 1, CAST(N'2002-12-30' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (73, N'0019413018', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Dương Thị Cẩm Thu', N'0098674122', N'thu@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019413018', 1, 2, 1, CAST(N'2002-12-30' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (74, N'0019413019', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Trần Ngọc Trâm', N'0746531653', N'tram@gmail.com', N'Tiền Giang', N'/Assets/images/users/no_image.png', N'0019413019', 1, 2, 1, CAST(N'2000-12-12' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (75, N'0019413020', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Trần Thị Thu Hà ', N'0651251365', N'ha@gmail.com', N'An Giang', N'/Assets/images/users/no_image.png', N'0019413020', 1, 2, 1, CAST(N'2000-04-04' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (76, N'0019413021', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Nguyễn Thị Đinh Loan', N'0174320153', N'loan@gmail.dthu.com', N'An Giang', N'/Assets/images/users/no_image.png', N'0019413021', 1, 2, 1, CAST(N'2000-05-05' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (77, N'0019413022', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Cao Thái Tuấn ', N'0746532416', N'tuan@gmail.com', N'Tiền Giang', N'/Assets/images/users/no_image.png', N'0019413022', 1, 2, 1, CAST(N'2000-01-20' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (78, N'0019413023', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Nguyễn Ánh Ngọc', N'0765321532', N'angoc@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019413023', 1, 2, 1, CAST(N'2000-01-01' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (79, N'0019413024', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Nguyễn Văn Duy', N'0941321333', N'duy@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019413024', 1, 2, 1, CAST(N'2000-03-04' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (80, N'0019413025', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Trần Thái Nhu', N'0946531531', N'nhu@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019413025', 1, 2, 1, CAST(N'2001-04-02' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (81, N'0019413026', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Cao Thiên Phước', N'0965132161', N'phuoc@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019413026', 1, 2, 1, CAST(N'2001-01-23' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (82, N'0019413027', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Cao Minh Tú', N'0591821233', N'tu@gmail.dthu.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019413027', 1, 2, 1, CAST(N'2001-02-03' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (83, N'0019413028', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Nguyễn Trần Anh Thành', N'0867643466', N'thanh@gmail.com', N'Thái Bình', N'/Assets/images/users/no_image.png', N'0019413028', 1, 2, 1, CAST(N'2001-06-13' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (84, N'0019413029', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Ngô Thanh Toàn', N'0765426532', N'toan@gmail.com', N'Hà Tĩnh', N'/Assets/images/users/no_image.png', N'0019413029', 1, 2, 1, CAST(N'2001-04-05' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (85, N'0019413030', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Nguyễn Quốc Nghĩa', N'0896512653', N'nghia@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019413030', 1, 2, 1, CAST(N'2002-09-09' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (86, N'0019413031', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Đặng Ngọc Bin', N'0986512031', N'bin@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019413031', 1, 2, 1, CAST(N'2002-06-06' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (87, N'0019413032', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Nguyễn Phạm Thanh Duy', N'0896521656', N'duy@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019413032', 1, 2, 1, CAST(N'2002-05-09' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (88, N'0019413033', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-03-31' AS Date), N'Nguyễn Thị Hồng Ngọc', N'0984516511', N'hngoc@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019413033', 1, 2, 1, CAST(N'2002-05-12' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (98, N'0019413034', N'�
�9I�Y��V�W��>', 1, CAST(N'2022-04-01' AS Date), N'Nguyễn Duy Khoa', N'0337359920', N'duykhoadthu@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019413034', 1, 2, 1, CAST(N'2000-12-28' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (99, N'0019413035', N'�
�9I�Y��V�W��>', 1, CAST(N'2022-04-01' AS Date), N'Nguyễn Duy Khoa', N'0337359920', N'duykhoadthu@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019413035', 1, 2, 1, CAST(N'2000-12-28' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (100, N'0020412300', N'�
�9I�Y��V�W��>', 1, CAST(N'2022-04-01' AS Date), N'Nguyễn Quốc Nghĩa', N'0866744002', N'quocnghia2@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412300', 5, 3, 1, CAST(N'2000-12-31' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (101, N'0020412301', N'�
�9I�Y��V�W��>', 1, CAST(N'2022-04-01' AS Date), N'Nguyễn Quốc Nghĩa', N'0866744002', N'quocnghia2@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412301', 1, 3, 1, CAST(N'2000-12-31' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (102, N'0020412302', N'�
�9I�Y��V�W��>', 1, CAST(N'2022-04-01' AS Date), N'Nguyễn Quốc Nghĩa', N'0866744002', N'quocnghia2@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412302', 1, 3, 1, CAST(N'1999-02-09' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (103, N'0020412303', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Trần Quốc Minh', N'09647387463', N'minh@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412303', 5, 3, 1, CAST(N'1994-06-09' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (104, N'0020412304', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Admin', N'02098798799', N'quocnghia@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412304', 5, 3, 1, CAST(N'1999-02-09' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (105, N'0020412305', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Xuân Phúc', N'032165465', N'phuc291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412305', 1, 3, 1, CAST(N'2000-02-02' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (106, N'0020412306', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Bá Bé', N'032498465', N'bab123@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412306', 1, 3, 1, CAST(N'2000-05-05' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (107, N'0020412307', N'�
�9I�Y��V�W��>', 1, CAST(N'2022-04-05' AS Date), N'Mai Nguyễn Thanh Ngân
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412307', 2, 3, 1, CAST(N'2000-12-15' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (108, N'0020412308', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'NGUYỄN THANH TOÀN', N'0866744002', N'nbin1@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412308', 2, 3, 1, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (109, N'0020412309', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Trung Nguyên
', N'0866744002', N'nbin1@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412309', 1, 3, 1, CAST(N'2000-02-22' AS Date))
GO
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (110, N'0020412310', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Hoàng Huy
', N'0866744002', N'nbin1@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412310', 1, 3, 1, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (111, N'0020412311', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Đặng Huy Toàn', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412311', 1, 3, 1, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (112, N'0020412312', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Hoàng Thảo
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412312', 1, 3, 1, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (113, N'0020412313', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Hiệp Hòa
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412313', 1, 3, 1, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (114, N'0020412314', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Minh Đăng
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412314', 1, 3, 1, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (115, N'0020412315', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Phạm Tấn Minh
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412315', 1, 3, 1, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (116, N'0020412316', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Lê Thị Huyền Trang
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412316', 1, 3, 1, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (117, N'0020412317', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Võ Minh Khôi
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412317', 1, 3, 1, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (118, N'0020412318', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Huỳnh Minh Đức
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412318', 1, 3, 1, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (119, N'0020412319', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Lê Minh Nhật
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412319', 1, 3, 1, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (120, N'0020412320', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Lê Nguyễn Quốc Nhật
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412320', 1, 3, 1, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (121, N'0020412321', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Hồ Dương Anh Kiệt
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412321', 1, 3, 1, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (122, N'0020412322', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Lê Ngọc Bích
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412322', 1, 3, 1, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (123, N'0020412323', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Trần Anh Khoa
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412323', 1, 3, 1, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (124, N'0020412324', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Lê Hữu Nhật Tiến
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412324', 1, 3, 1, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (125, N'0020412325', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Phan Đặng Quang Linh
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412325', 1, 3, 1, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (126, N'0020412326', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Huỳnh Ngọc Thảo
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412326', 1, 3, 1, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (127, N'0020412327', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Hữu Tâm
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412327', 1, 3, 1, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (128, N'0020412328', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Hồ Đắc Phúc Thiên
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412328', 1, 3, 1, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (129, N'0020412329', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Nhựt Trường', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412329', 4, 3, 1, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (130, N'0020412330', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Khánh', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020412330', 3, 3, 1, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (131, N'0018488001', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Phạm Hồng Thái
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018488001', 1, 16, 2, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (132, N'0018488002', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Thành Phát
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018488002', 1, 16, 2, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (133, N'0018488003', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Đào Duy Quang
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018488003', 1, 16, 2, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (134, N'0018488004', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Phạm Minh Kha
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018488004', 1, 16, 2, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (135, N'0018488005', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Đặng Rồng Vàng
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018488005', 1, 16, 2, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (136, N'0018488006', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Nhựt Nam
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018488006', 1, 16, 2, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (137, N'0018488007', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Lê Trần Phúc Hiển', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018488007', 3, 16, 2, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (138, N'0019499001', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Quốc Huy
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019499001', 1, 17, 2, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (139, N'0019499002', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Minh Quang
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019499002', 1, 17, 2, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (140, N'0019499003', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Lê Mỹ Duyên
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019499003', 1, 17, 2, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (141, N'0019499004', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Lê Hữu Nhật Tiến
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019499004', 1, 17, 2, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (142, N'0019499005', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Lê Ngọc Bích
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019499005', 1, 17, 2, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (143, N'0019499006', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Hồ Dương Anh Kiệt
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019499006', 1, 17, 2, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (144, N'0019499007', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Hữu Tâm', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019499007', 3, 17, 2, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (145, N'0020820001', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Phạm Tấn Minh
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020820001', 1, 18, 2, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (146, N'0020820002', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Huỳnh Minh Đức
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020820002', 1, 18, 2, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (147, N'0020820003', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Phạm Hồng Thái
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020820003', 1, 18, 2, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (148, N'0020820004', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Đặng Huy Toàn
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020820004', 1, 18, 2, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (149, N'0020820005', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Hoàng Thảo
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020820005', 1, 18, 2, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (150, N'0020820006', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Võ Minh Khôi
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020820006', 1, 18, 2, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (151, N'0020820007', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Lê Minh Nhật', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020820007', 3, 18, 2, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (152, N'0018484001', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Hồ Dương Anh Kiệt
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/n/Assets/images/users/no_image.pngo_image.png', N'0018484001', 1, 30, 3, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (153, N'0018484002', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Trần Anh Khoa
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018484002', 1, 30, 3, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (154, N'0018484003', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Phan Đặng Quang Linh
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018484003', 1, 30, 3, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (155, N'0018484004', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Huỳnh Ngọc Thảo
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018484004', 1, 30, 3, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (156, N'0018484005', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Hồ Đắc Phúc Thiên
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018484005', 1, 30, 3, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (157, N'0018484006', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Lê Mỹ Duyên
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018484006', 1, 30, 3, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (158, N'0018484007', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Minh Quang', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0018484007', 3, 30, 3, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (159, N'0019484001', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Quốc Huy
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019484001', 1, 31, 3, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (160, N'0019484002', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Đặng Rồng Vàng
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019484002', 1, 31, 3, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (161, N'0019484003', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Thành Phát
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019484003', 1, 31, 3, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (162, N'0019484004', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Khánh
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019484004', 1, 31, 3, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (163, N'0019484005', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Hồ Đắc Phúc Thiên', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019484005', 3, 31, 3, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (164, N'0019484006', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Nhựt Nam
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019484006', 1, 31, 3, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (165, N'0019484007', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Võ Minh Khôi
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0019484007', 1, 31, 3, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (166, N'0020123001', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Minh Đăng
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020123001', 1, 32, 3, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (167, N'0020123002', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Minh Đăng
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020123002', 1, 32, 3, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (168, N'0020123003', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Phạm Tấn Minh
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020123003', 1, 32, 3, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (169, N'0020123004', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Lê Hữu Nhật Tiến
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020123004', 1, 32, 3, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (170, N'0020123005', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Hữu Tâm
', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020123005', 1, 32, 3, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (171, N'0020123006', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Nguyễn Khánh', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020123006', 4, 32, 3, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (172, N'0020123007', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-05' AS Date), N'Phạm Hồng Thái', N'0866744002', N'quocnghia291999@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020123007', 3, 32, 3, CAST(N'2000-02-22' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (173, N'hoanggd', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-06' AS Date), N'Nguyễn Quốc Hoàng', N'01541245121', N'hoang19@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'0020123007', 5, NULL, 6, CAST(N'1990-07-19' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (174, N'nghiagvnn', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-06' AS Date), N'Nguyễn Quốc Hoàng', N'01541245121', N'hoang19@gmail.com', N'Đồng Tháp', N'/Assets/images/users/no_image.png', N'2222222222', 5, NULL, 2, CAST(N'1990-07-19' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (175, N'vuspnt', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-06' AS Date), N'Nguyễn Hoàng Vũ', N'0866123123', N'vu31@gmail.com', N'Tiền Giang', N'/Assets/images/users/no_image.png', N'0235652362', 5, NULL, 5, CAST(N'1989-10-31' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (176, N'tiennn', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-06' AS Date), N'Trần Quốc Tiến', N'0866123122', N'tien64@gmail.com', N'Tiền Giang', N'/Assets/images/users/no_image.png', N'0012458421', 5, NULL, 4, CAST(N'2022-04-06' AS Date))
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [TenTaiKhoan], [MatKhau], [isDelete], [NgayTao], [HoTen], [SoDienThoai], [Email], [DiaChi], [HinhAnh], [MaTaiKhoan], [ChucVuID], [MaLop], [MaKhoa], [NgaySinh]) VALUES (177, N'binh12', N'�
�9I�Y��V�W��>', 0, CAST(N'2022-04-06' AS Date), N'Nguyễn Thanh Bình', N'0866123222', N'binh12@gmail.c', N'Tiền Giang', N'/Assets/images/users/no_image.png', N'0011565565', 5, NULL, 3, CAST(N'1988-08-06' AS Date))
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoanQuyen] ON 

INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (1, 1, 3, NULL)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (2, 1, 2, 1)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (8, 3, 3, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (9, 4, 1, 1)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (10, 4, 1, 1)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (11, 4, 2, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (12, 4, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (13, 7, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (14, 7, 2, 1)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (15, 3, 2, 1)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (16, 3, 1, 1)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (17, 5, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (18, 6, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (19, 9, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (20, 8, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (21, 11, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (22, 10, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (23, 12, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (24, 13, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (25, 14, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (26, 15, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (27, 16, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (28, 17, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (29, 19, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (30, 18, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (31, 16, 2, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (32, 20, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (33, 21, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (34, 22, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (35, 23, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (36, 24, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (37, 103, 3, 1)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (38, 100, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (39, 43, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (40, 42, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (41, 41, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (42, 40, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (43, 39, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (44, 38, 2, 1)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (45, 37, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (46, 37, 2, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (47, 36, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (48, 36, 2, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (49, 35, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (50, 35, 2, 1)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (51, 34, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (52, 38, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (53, 33, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (54, 32, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (55, 31, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (56, 30, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (57, 29, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (58, 31, 2, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (59, 28, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (60, 27, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (61, 26, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (62, 25, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (63, 30, 2, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (64, 14, 2, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (65, 13, 2, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (66, 104, 3, 1)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (67, 105, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (68, 108, 3, 1)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (69, 108, 2, 1)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (70, 108, 1, 1)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (71, 108, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (72, 108, 2, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (73, 88, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (74, 87, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (75, 86, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (76, 84, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (77, 85, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (78, 82, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (79, 83, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (80, 81, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (81, 80, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (82, 79, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (83, 78, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (84, 77, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (85, 76, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (86, 75, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (87, 74, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (88, 73, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (89, 72, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (90, 71, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (91, 70, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (92, 69, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (93, 68, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (94, 44, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (95, 67, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (96, 66, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (97, 65, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (98, 64, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (99, 63, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (100, 62, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (101, 61, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (102, 45, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (103, 60, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (104, 59, 1, 0)
GO
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (105, 58, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (106, 57, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (107, 46, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (108, 56, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (109, 55, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (110, 54, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (111, 53, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (112, 52, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (113, 51, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (114, 50, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (115, 49, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (116, 48, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (117, 47, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (118, 173, 3, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (119, 175, 3, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (120, 130, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (121, 129, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (122, 130, 2, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (123, 128, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (124, 127, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (125, 126, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (126, 125, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (127, 124, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (128, 123, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (129, 122, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (130, 120, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (131, 119, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (132, 118, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (133, 121, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (134, 117, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (135, 176, 3, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (136, 177, 3, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (137, 172, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (138, 171, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (139, 170, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (140, 169, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (141, 168, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (142, 167, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (143, 166, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (144, 165, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (145, 164, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (146, 163, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (147, 162, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (148, 161, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (149, 152, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (150, 153, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (151, 154, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (152, 155, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (153, 156, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (154, 157, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (155, 158, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (156, 159, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (157, 160, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (158, 172, 2, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (159, 171, 2, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (160, 163, 2, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (161, 158, 2, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (162, 116, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (163, 115, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (164, 114, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (165, 106, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (166, 113, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (167, 112, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (168, 111, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (169, 110, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (170, 109, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (171, 129, 2, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (172, 174, 3, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (173, 104, 2, 1)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (174, 104, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (175, 103, 2, 1)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (176, 103, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (177, 61, 2, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (178, 60, 2, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (179, 151, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (180, 150, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (181, 149, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (182, 148, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (183, 147, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (184, 146, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (185, 145, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (186, 143, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (187, 144, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (188, 142, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (189, 141, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (190, 133, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (191, 134, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (192, 135, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (193, 136, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (194, 137, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (195, 138, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (196, 139, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (197, 140, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (198, 131, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (199, 132, 1, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (200, 151, 2, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (201, 144, 2, 0)
INSERT [dbo].[TaiKhoanQuyen] ([ID], [TaiKhoanID], [MaQuyen], [isDelete]) VALUES (202, 137, 2, 0)
SET IDENTITY_INSERT [dbo].[TaiKhoanQuyen] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoanThongBao] ON 

INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (70, 1, 9, NULL, 4)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (71, 4, 9, NULL, 2)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (72, 5, 9, NULL, 5)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (73, 15, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (74, 16, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (75, 17, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (76, 18, 9, NULL, 2)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (77, 19, 9, NULL, 5)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (78, 20, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (79, 21, 9, NULL, 2)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (80, 22, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (81, 23, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (82, 24, 9, NULL, 3)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (83, 98, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (84, 99, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (85, 100, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (86, 101, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (87, 102, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (88, 25, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (89, 26, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (90, 27, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (91, 28, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (92, 29, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (93, 30, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (94, 31, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (95, 32, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (96, 33, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (97, 34, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (98, 35, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (99, 36, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (100, 37, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (101, 38, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (102, 39, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (103, 40, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (104, 41, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (105, 42, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (106, 43, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (107, 6, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (108, 7, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (109, 8, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (110, 9, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (111, 10, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (112, 11, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (113, 12, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (114, 13, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (115, 14, 9, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (144, 44, 11, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (145, 45, 11, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (146, 46, 11, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (147, 47, 11, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (148, 48, 11, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (149, 49, 11, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (150, 50, 11, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (151, 51, 11, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (152, 52, 11, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (153, 53, 11, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (154, 54, 11, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (155, 55, 11, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (156, 56, 11, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (157, 57, 11, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (158, 58, 11, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (159, 25, 12, 1, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (160, 26, 12, 1, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (161, 27, 12, 1, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (162, 28, 12, 1, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (163, 29, 12, 1, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (164, 30, 12, 1, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (165, 31, 12, 1, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (166, 32, 12, 1, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (167, 33, 12, 1, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (168, 34, 12, 1, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (169, 35, 12, 1, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (170, 36, 12, 1, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (171, 37, 12, 1, 4)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (172, 38, 12, 1, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (173, 39, 12, 1, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (174, 40, 12, 1, 5)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (175, 41, 12, 1, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (176, 42, 12, 1, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (177, 43, 12, 1, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (178, 1, 13, NULL, 2)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (179, 4, 13, NULL, 3)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (180, 5, 13, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (181, 15, 13, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (182, 16, 13, NULL, 3)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (183, 17, 13, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (184, 18, 13, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (185, 19, 13, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (186, 20, 13, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (187, 21, 13, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (188, 22, 13, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (189, 23, 13, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (190, 24, 13, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (191, 98, 13, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (192, 99, 13, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (193, 100, 13, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (194, 101, 13, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (195, 102, 13, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (196, 25, 13, NULL, 1)
GO
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (197, 26, 13, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (198, 27, 13, NULL, 2)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (199, 28, 13, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (200, 29, 13, NULL, 3)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (201, 30, 13, NULL, 3)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (202, 31, 13, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (203, 32, 13, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (204, 33, 13, NULL, 3)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (205, 34, 13, NULL, 5)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (206, 35, 13, NULL, 5)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (207, 36, 13, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (208, 37, 13, NULL, 5)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (209, 38, 13, NULL, 5)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (210, 39, 13, NULL, 4)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (211, 40, 13, NULL, 5)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (212, 41, 13, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (213, 42, 13, NULL, 3)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (214, 43, 13, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (215, 131, 14, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (216, 132, 14, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (217, 133, 14, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (218, 134, 14, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (219, 135, 14, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (220, 136, 14, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (221, 137, 14, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (222, 138, 14, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (223, 139, 14, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (224, 140, 14, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (225, 141, 14, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (226, 142, 14, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (227, 143, 14, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (228, 144, 14, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (229, 145, 14, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (230, 146, 14, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (231, 147, 14, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (232, 148, 14, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (233, 149, 14, NULL, 1)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (234, 150, 14, NULL, 4)
INSERT [dbo].[TaiKhoanThongBao] ([ID], [TaiKhoanID], [ThongBaoID], [IsDelete], [TrangThai]) VALUES (235, 151, 14, NULL, 4)
SET IDENTITY_INSERT [dbo].[TaiKhoanThongBao] OFF
GO
SET IDENTITY_INSERT [dbo].[ThongBao] ON 

INSERT [dbo].[ThongBao] ([ThongBaoID], [NgayThongBao], [NoiDungTB], [TieuDe], [KyDKID], [IsDelete]) VALUES (9, CAST(N'2022-04-02' AS Date), N'<h4 id="TieuDeDK">PHIẾU Đ&Aacute;NH GI&Aacute; KẾT QUẢ R&Egrave;N LUYỆN HỌC KỲ&nbsp;<span id="hk">I</span>&nbsp;NĂM HỌC&nbsp;<span id="nam">2021 - 2022</span></h4>', N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2021 - 2022', 26, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoID], [NgayThongBao], [NoiDungTB], [TieuDe], [KyDKID], [IsDelete]) VALUES (11, CAST(N'2022-04-05' AS Date), N'<p>55555</p>', N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2021 - 2022', 28, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoID], [NgayThongBao], [NoiDungTB], [TieuDe], [KyDKID], [IsDelete]) VALUES (12, CAST(N'2022-04-05' AS Date), N'<p>6666</p>', N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ II NĂM HỌC 2021 - 2022', 29, 1)
INSERT [dbo].[ThongBao] ([ThongBaoID], [NgayThongBao], [NoiDungTB], [TieuDe], [KyDKID], [IsDelete]) VALUES (13, CAST(N'2022-04-05' AS Date), N'<p>6666</p>', N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2022 - 2023', 30, NULL)
INSERT [dbo].[ThongBao] ([ThongBaoID], [NgayThongBao], [NoiDungTB], [TieuDe], [KyDKID], [IsDelete]) VALUES (14, CAST(N'2022-04-06' AS Date), N'<p>Nội dung x&eacute;t r&egrave;n luyện</p>', N'PHIẾU ĐÁNH GIÁ KẾT QUẢ RÈN LUYỆN HỌC KỲ I NĂM HỌC 2020 - 2021', 31, NULL)
SET IDENTITY_INSERT [dbo].[ThongBao] OFF
GO
SET IDENTITY_INSERT [dbo].[TieuChi] ON 

INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (1, N'I. Đánh giá ý thức tham gia học tập ( Điểm tối đa 20 điểm)', 0, NULL, 1, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (2, N'II. Đánh giá về ý thức chấp hành nội quy, quy chế, quy định trong Nhà trường (Điểm tối đa 25 điểm)', 0, NULL, 16, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (3, N'III. Đánh giá về ý thức và kết quả tham gia các hoạt động chính trị, xã hội, văn hoá, văn nghệ, thể thao, phòng chống tội phạm và các tệ nạn xã hội. (Điểm tối đa 20 điểm)', 0, NULL, 20, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (4, N'IV. Đánh giá về ý thức công dân trong quan hệ cộng đồng (Điểm tối đa 25 điểm)', 0, NULL, 26, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (5, N'V. Đánh giá về ý thức và kết quả khi tham gia công tác cán bộ lớp, các đoàn thể, tổ chức trong trường hoặc người học đạt được thành tích đặc biệt trong học tập, rèn luyện. (Điểm tối đa 10 điểm)', 0, NULL, 32, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (6, N'1. Đi học đúng giờ, chuẩn bị bài đầy đủ, tích cực phát biểu trong giờ học (đi học muộn, nghỉ học không có lý do, bỏ giờ trừ 1 điểm/1 lần)', 1, 5, 2, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (7, N'2. Ý thực, thái độ tham gia', 1, NULL, 3, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (8, N'- Các hoạt động học thuật', 7, 1, 4, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (9, N'- Hoạt động ngoại khóa', 7, 1, 5, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (10, N'- Rèn luyện kỹ năng mềm', 7, 1, 6, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (11, N'- Hoạt động nghiêm cứu khoa học', 7, 1, 7, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (12, N'- Các cuộc thi do Nhà trường, Đoàn Thanh niên, Hội Sinh viên phát động', 7, 1, 8, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (13, N'3. Tinh thần vượt khó, phấn đấu vương lên trong học tập', 1, 2, 9, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (14, N'4. Tích cực đánh giá hoạt động giảng dạy của giảng viên, khóa đào tạo', 1, 2, 10, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (15, N'5. Kết quả học tập', 1, NULL, 11, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (16, N'- Điểm TBCHT: 2,00 đến 2,49', 15, 3, 12, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (17, N'- Điểm TBCHT: 2,50 đến 3,19', 15, 4, 13, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (18, N'- Điểm TBCHT: 3,20 đến 3,59', 15, 5, 14, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (19, N'- Điểm TBCHT: 3,60 đến 4,00', 15, 6, 15, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (20, N'1. Thực hiện tốt nội quy lớp học, quy định của Nhà trường.', 2, 5, 17, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (21, N'2. Thực hiện tốt Quy chế học sinh, sinh viên; Quy định của Nhà trường đối với sinh viên ngoại trú.', 2, 10, 18, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (22, N'3. Tham gia đầy đủ bảo hiểm y tế, bảo hiểm tai nạn. (05 điểm/1 loại hình bảo hiểm)', 2, 10, 19, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (23, N'1. Tham gia đầy đủ và có ý thức các hoạt động tập trung do Nhà trường, Khoa tổ chức (Trừ 05 điểm/1 lần vắng mặt)', 3, 10, 21, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (24, N'2. Có ý thức và tích cực tham gia tuyên truyền công tác phòng chống tệ nạn xã hội tình nguyện, từ thiện, công tác xã hội.', 3, 5, 22, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (25, N'3. Kết quả phân loại đoàn viên:', 3, NULL, 23, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (26, N'- Khá', 25, 3, 24, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (27, N'- Xuất sắc', 25, 5, 25, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (28, N'1. Chấp hành tốt và tích cực tham gia tuyên truyền các chủ trương của Đảng, chính sách và pháp luật của nhà nước trong cộng đồng.', 4, 5, 27, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (29, N'2. Tham gia đầy đủ các buổi học tập, tìm hiểu pháp luật do Nhà trường tổ chức', 4, 5, 28, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (30, N'3. Tích cực tham gia các hoạt động xã hội do Nhà trường hoặc địa phương nơi cư trú tổ chức', 4, 5, 29, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (31, N'4. Có mối quan hệ tốt trong tập thể, không gây mất đoàn kết, bản thân có tác dụng tích cực đối với tập thể', 4, 5, 30, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (32, N'5. Thực hiện tốt tinh thần tương thân, tương ái trong cuộc sống.', 4, 5, 31, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (33, N'1. Không là cán bộ lớp, cán bộ Đoàn, Hội nhưng thực hiện tốt nhiệm vụ được giao', 5, 4, 33, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (34, N'2. Là cán bộ lớp, cán bộ Đoàn, Hội nhưng không thực hiện tốt nhiệm vụ được giao, không gương mẫu trước tập thể', 5, 0, 34, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (35, N'3. Nếu là cán bộ lớp, cán bộ Đoàn, Hội thì căn cứ vào kết quả thi đua của tập thể lớp quy định như sau:', NULL, 10, 35, 0)
INSERT [dbo].[TieuChi] ([TieuChiID], [TenTieuChi], [ParentID], [DiemTieuChi], [OrderKey], [isDelete]) VALUES (36, N'11111', NULL, 15, 36, 1)
SET IDENTITY_INSERT [dbo].[TieuChi] OFF
GO
ALTER TABLE [dbo].[Diem]  WITH CHECK ADD  CONSTRAINT [FK_Diem_PhieuDanhGia] FOREIGN KEY([PhieuID])
REFERENCES [dbo].[PhieuDanhGia] ([PhieuID])
GO
ALTER TABLE [dbo].[Diem] CHECK CONSTRAINT [FK_Diem_PhieuDanhGia]
GO
ALTER TABLE [dbo].[Diem]  WITH CHECK ADD  CONSTRAINT [FK_Diem_TieuChi] FOREIGN KEY([TieuChiID])
REFERENCES [dbo].[TieuChi] ([TieuChiID])
GO
ALTER TABLE [dbo].[Diem] CHECK CONSTRAINT [FK_Diem_TieuChi]
GO
ALTER TABLE [dbo].[Lop]  WITH CHECK ADD  CONSTRAINT [FK_Lop_Khoa] FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
ALTER TABLE [dbo].[Lop] CHECK CONSTRAINT [FK_Lop_Khoa]
GO
ALTER TABLE [dbo].[LopKyDangKy]  WITH CHECK ADD  CONSTRAINT [FK_LopKyDangKy_KyDangKy] FOREIGN KEY([KyDKID])
REFERENCES [dbo].[KyDangKy] ([KyDKID])
GO
ALTER TABLE [dbo].[LopKyDangKy] CHECK CONSTRAINT [FK_LopKyDangKy_KyDangKy]
GO
ALTER TABLE [dbo].[LopKyDangKy]  WITH CHECK ADD  CONSTRAINT [FK_LopKyDangKy_Lop] FOREIGN KEY([MaLop])
REFERENCES [dbo].[Lop] ([MaLop])
GO
ALTER TABLE [dbo].[LopKyDangKy] CHECK CONSTRAINT [FK_LopKyDangKy_Lop]
GO
ALTER TABLE [dbo].[PhieuDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_PhieuDanhGia_KyDangKy] FOREIGN KEY([KyDKID])
REFERENCES [dbo].[KyDangKy] ([KyDKID])
GO
ALTER TABLE [dbo].[PhieuDanhGia] CHECK CONSTRAINT [FK_PhieuDanhGia_KyDangKy]
GO
ALTER TABLE [dbo].[PhieuDanhGia]  WITH CHECK ADD  CONSTRAINT [FK_PhieuDanhGia_TaiKhoan] FOREIGN KEY([SinhVienID])
REFERENCES [dbo].[TaiKhoan] ([TaiKhoanID])
GO
ALTER TABLE [dbo].[PhieuDanhGia] CHECK CONSTRAINT [FK_PhieuDanhGia_TaiKhoan]
GO
ALTER TABLE [dbo].[QuyenMenu]  WITH CHECK ADD  CONSTRAINT [FK_QuyenMenu_Menu] FOREIGN KEY([MenuID])
REFERENCES [dbo].[Menu] ([MenuID])
GO
ALTER TABLE [dbo].[QuyenMenu] CHECK CONSTRAINT [FK_QuyenMenu_Menu]
GO
ALTER TABLE [dbo].[QuyenMenu]  WITH CHECK ADD  CONSTRAINT [FK_QuyenMenu_Quyen] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[Quyen] ([MaQuyen])
GO
ALTER TABLE [dbo].[QuyenMenu] CHECK CONSTRAINT [FK_QuyenMenu_Quyen]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_ChucVu] FOREIGN KEY([ChucVuID])
REFERENCES [dbo].[ChucVu] ([ChucVuID])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_ChucVu]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_Khoa] FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_Khoa]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_Lop] FOREIGN KEY([MaLop])
REFERENCES [dbo].[Lop] ([MaLop])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_Lop]
GO
ALTER TABLE [dbo].[TaiKhoanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoanQuyen_Quyen] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[Quyen] ([MaQuyen])
GO
ALTER TABLE [dbo].[TaiKhoanQuyen] CHECK CONSTRAINT [FK_TaiKhoanQuyen_Quyen]
GO
ALTER TABLE [dbo].[TaiKhoanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoanQuyen_TaiKhoan] FOREIGN KEY([TaiKhoanID])
REFERENCES [dbo].[TaiKhoan] ([TaiKhoanID])
GO
ALTER TABLE [dbo].[TaiKhoanQuyen] CHECK CONSTRAINT [FK_TaiKhoanQuyen_TaiKhoan]
GO
ALTER TABLE [dbo].[TaiKhoanThongBao]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoanThongBao_TaiKhoan] FOREIGN KEY([TaiKhoanID])
REFERENCES [dbo].[TaiKhoan] ([TaiKhoanID])
GO
ALTER TABLE [dbo].[TaiKhoanThongBao] CHECK CONSTRAINT [FK_TaiKhoanThongBao_TaiKhoan]
GO
ALTER TABLE [dbo].[TaiKhoanThongBao]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoanThongBao_ThongBao] FOREIGN KEY([ThongBaoID])
REFERENCES [dbo].[ThongBao] ([ThongBaoID])
GO
ALTER TABLE [dbo].[TaiKhoanThongBao] CHECK CONSTRAINT [FK_TaiKhoanThongBao_ThongBao]
GO
ALTER TABLE [dbo].[ThongBao]  WITH CHECK ADD  CONSTRAINT [FK_ThongBao_HocKy] FOREIGN KEY([KyDKID])
REFERENCES [dbo].[KyDangKy] ([KyDKID])
GO
ALTER TABLE [dbo].[ThongBao] CHECK CONSTRAINT [FK_ThongBao_HocKy]
GO

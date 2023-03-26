using QuanlyDiemrenluyen.Models;
using QuanlyDiemrenluyen.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.Interfaces
{
    public interface ILopKyDangKyService
    {
        List<LopKyDangKy> Get();
        LopKyDangKy GetById(int id);
        void Create(KyDangKyVM model,int KyDKID);
        void Delete(int id);

    }
}
using QuanlyDiemrenluyen.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.Interfaces
{
    public interface IChucVuService
    {
        List<ChucVu> Get();
        ChucVu GetById(int id);
        void Create(ChucVu model);
        void Update(ChucVu model);
        void Delete(ChucVu model);
    }
}
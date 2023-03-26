using QuanlyDiemrenluyen.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.Interfaces
{
    public interface IQuyenService
    {
        List<Quyen> Get();
        Quyen GetById(int id);
        void Create(Quyen model);
        void Update(Quyen model);
        void Delete(Quyen model);
    }
}
using QuanlyDiemrenluyen.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.Interfaces
{
    public interface IQuyenMenuService
    {
        List<QuyenMenu> Get();
        QuyenMenu GetById(int id);
        void Create(QuyenMenu model);
        void Update(QuyenMenu model);
        void Delete(QuyenMenu model);
    }
}
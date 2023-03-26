using QuanlyDiemrenluyen.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.Interfaces
{
    public interface IKhoaService
    {
        List<Khoa> Get();
        Khoa GetById(int id);
        void Create(Khoa model);
        void Update(Khoa model);
        void Delete(Khoa model);
    }
}
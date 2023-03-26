using QuanlyDiemrenluyen.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanlyDiemrenluyen.Interfaces
{
    public interface ITieuChiService
    {
        List<TieuChi> Get();
        //List<TieuChi> GetChild(int id);
        TieuChi GetById(int id);
        void Create(TieuChi model);
        void Update(TieuChi model);
        void Delete(TieuChi model);
    }
}
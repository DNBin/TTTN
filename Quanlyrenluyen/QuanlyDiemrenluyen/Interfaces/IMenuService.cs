using QuanlyDiemrenluyen.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanlyDiemrenluyen.Interfaces
{
    public interface IMenuService
    {
        List<Menu> Get();
        Menu GetById(int id);
        void Create(Menu model);
        void Update(Menu model);
        void Delete(Menu model);
    }
}

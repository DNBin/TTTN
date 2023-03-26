using System.Web;
using System.Web.Mvc;

namespace QuanlyDiemrenluyen
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}

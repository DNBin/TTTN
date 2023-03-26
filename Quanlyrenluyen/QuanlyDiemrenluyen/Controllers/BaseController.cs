using QuanlyDiemrenluyen.Data;
using QuanlyDiemrenluyen.Helpers;
using QuanlyDiemrenluyen.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace QuanlyDiemrenluyen.Controllers
{
    public class BaseController : Controller
    {
        //private DataContext _context;
        //public BaseController(DataContext context)
        //{
        //    _context = context;
        //}
        // GET: Base
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var session= (User)Session[Constants.USER_SESSION];
            if (session == null)
            {
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { controller = "DangNhap", action = "Index" }));
            }
            base.OnActionExecuting(filterContext);
        }
    }
}
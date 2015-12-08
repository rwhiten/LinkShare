using LinkShare.BLL;
using System.Web.Mvc;

namespace LinkShare.UI.Areas.Security.Controllers
{
    public class BaseSecurityController : Controller
    {
        protected SecurityBLogic _securityBLogic;

        public BaseSecurityController()
        {
            _securityBLogic = new SecurityBLogic();
        }
    }
}
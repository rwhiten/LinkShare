using LinkShare.BLL;
using System.Web.Mvc;

namespace LinkShare.UI.Areas.Admin.Controllers
{
    public class BaseAdminController : Controller
    {
        protected AdminBLogic _adminBLogic;

        public BaseAdminController()
        {
            _adminBLogic = new AdminBLogic();
        }
    }
}
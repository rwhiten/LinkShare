using LinkShare.BLL;
using System.Web.Mvc;

namespace LinkShare.UI.Areas.Common.Controllers
{
    public class BaseCommonController : Controller
    {
        protected CommonBLogic _commonBLogic;

        public BaseCommonController()
        {
            _commonBLogic = new CommonBLogic();
        }
    }
}
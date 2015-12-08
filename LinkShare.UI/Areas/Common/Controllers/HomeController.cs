using System.Web.Mvc;

namespace LinkShare.UI.Areas.Common.Controllers
{
    [AllowAnonymous]
    public class HomeController : BaseCommonController
    {
        // GET: Common/Home
        public ActionResult Index()
        {
            return View();
        }
    }
}
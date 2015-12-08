using LinkShare.BLL;
using System.Web.Mvc;

namespace LinkShare.UI.Areas.User.Controllers
{
    public class BaseUserController : Controller
    {
        protected UserBLogic _userBLogic;

        public BaseUserController()
        {
            _userBLogic = new UserBLogic();
        }
    }
}
using LinkShare.BOL;
using System;
using System.Web.Mvc;
using System.Web.Security;

namespace LinkShare.UI.Areas.Security.Controllers
{
    [AllowAnonymous]
    public class LoginController : BaseSecurityController
    {
        // GET: Security/Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult SignIn(AppUser user)
        {
            try
            {
                if (Membership.ValidateUser(user.AppUserEmail, user.Password))
                {
                    FormsAuthentication.SetAuthCookie(user.AppUserEmail, false);
                    return RedirectToAction("Index", "Home", new { area = "Common" });
                }
                else
                {
                    TempData["Msg"] = "Login Failed";
                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                TempData["Msg"] = "Login Failed" + ex.Message;
                return RedirectToAction("Index");
            }
        }

        public ActionResult SignOut()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home", new { area = "Common" });
        }
    }
}
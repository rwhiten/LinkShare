using LinkShare.BOL;
using System;
using System.Linq;
using System.Web.Mvc;

namespace LinkShare.UI.Areas.User.Controllers
{
    [Authorize(Roles = "A,U")]
    public class URLController : BaseUserController
    {
        public ActionResult Index()
        {
            ViewBag.CategoryId = new SelectList(_userBLogic.Category.GetALL().ToList(), "CategoryId", "CategoryName");
            ViewBag.AppUserId = new SelectList(_userBLogic.User.GetALL().ToList(), "AppUserId", "AppUserEmail");
            return View();
        }

        [HttpPost]
        public ActionResult Create(Url myUrl)
        {
            try
            {
                myUrl.IsApproved = "P";
                myUrl.AppUserId = _userBLogic.User.GetALL().Where(x => x.AppUserEmail == User.Identity.Name).FirstOrDefault().AppUserId;
                if (ModelState.IsValid)
                {
                    _userBLogic.Url.Insert(myUrl);
                    TempData["Msg"] = "Created Successfully";
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.CategoryId = new SelectList(_userBLogic.Category.GetALL().ToList(), "CategoryId", "CategoryName");
                    ViewBag.AppUserId = new SelectList(_userBLogic.User.GetALL().ToList(), "AppUserId", "AppUserEmail");
                    return View("Index");
                }
            }
            catch (Exception ex)
            {
                TempData["Msg"] = "Create Failed : " + ex.Message;
                return RedirectToAction("Index");
            }
        }
    }
}
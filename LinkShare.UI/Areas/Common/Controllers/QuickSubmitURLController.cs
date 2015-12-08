using LinkShare.BOL;
using System;
using System.Linq;
using System.Web.Mvc;

namespace LinkShare.UI.Areas.Common.Controllers
{
    [AllowAnonymous]
    public class QuickSubmitURLController : BaseCommonController
    {
        // GET: Common/QuickSubmitURL
        public ActionResult Index()
        {
            ViewBag.CategoryId = new SelectList(_commonBLogic.Category.GetALL().ToList(), "CategoryId", "CategoryName");
            return View();
        }

        [HttpPost]
        public ActionResult Create(QuickSubmitURLModel model)
        {
            try
            {
                ModelState.Remove("MyUser.Password");
                ModelState.Remove("MyUser.ConfirmPassword");
                ModelState.Remove("MyUrl.UrlDesc");

                if (ModelState.IsValid)
                {
                    _commonBLogic.InsertQuickURL(model);
                    TempData["Msg"] = "Created Successfully";
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.CategoryId = new SelectList(_commonBLogic.Category.GetALL().ToList(), "CategoryId", "CategoryName");
                    return View("Index");
                }
            }
            catch (Exception ex)
            {
                TempData["Msg"] = "Create Failed: " + ex.Message;
                return RedirectToAction("Index");
            }
        }
    }
}
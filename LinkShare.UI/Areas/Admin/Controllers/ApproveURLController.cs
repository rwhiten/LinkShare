using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace LinkShare.UI.Areas.Admin.Controllers
{
    [Authorize(Roles = "A")]
    public class ApproveURLController : BaseAdminController
    {
        public ActionResult Index(string status)
        {
            ViewBag.Status = (status == null ? "P" : status);
            if (status == null)
            {
                var urls = _adminBLogic.Url.GetALL().Where(x => x.IsApproved == "P").ToList();
                return View(urls);
            }
            else
            {
                var urls = _adminBLogic.Url.GetALL().Where(x => x.IsApproved == status).ToList();
                return View(urls);
            }
        }

        public ActionResult Approve(int id)
        {
            try
            {
                var myUrl = _adminBLogic.Url.GetByID(id);
                myUrl.IsApproved = "A";
                _adminBLogic.Url.Update(myUrl);
                TempData["Msg"] = "Approved Successfully";
                return RedirectToAction("Index");
            }
            catch (Exception e1)
            {
                TempData["Msg"] = "Approval Failed : " + e1.Message;
                return RedirectToAction("Index");
            }
        }

        public ActionResult Reject(int id)
        {
            try
            {
                var myUrl = _adminBLogic.Url.GetByID(id);
                myUrl.IsApproved = "R";
                _adminBLogic.Url.Update(myUrl);
                TempData["Msg"] = "Rejected Successfully";
                return RedirectToAction("Index");
            }
            catch (Exception e1)
            {
                TempData["Msg"] = "Rejection Failed : " + e1.Message;
                return RedirectToAction("Index");
            }
        }

        [HttpPost]
        public ActionResult ApproveOrRejectALL(List<int> ids, String status, string currentStatus)
        {
            try
            {
                _adminBLogic.ApproveOrReject(ids, status);
                TempData["Msg"] = "Operation Successfully";
                var urls = _adminBLogic.Url.GetALL().Where(x => x.IsApproved == currentStatus).ToList();
                return PartialView("pv_ApproveURL", urls);
            }
            catch (Exception e1)
            {
                TempData["Msg"] = "Operation Failed" + e1.Message;
                var urls = _adminBLogic.Url.GetALL().Where(x => x.IsApproved == currentStatus).ToList();
                return PartialView("pv_ApproveURL", urls);
            }
        }
    }
}
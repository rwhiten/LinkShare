using System;
using System.Linq;
using System.Web.Mvc;

namespace LinkShare.UI.Areas.Admin.Controllers
{
    [Authorize(Roles = "A")]
    public class ListUserController : BaseAdminController
    {
        public ActionResult Index(string sortOrder, string sortBy, string page)
        {
            ViewBag.SortOrder = sortOrder;
            ViewBag.SortBy = sortBy;
            var users = _adminBLogic.User.GetALL();

            switch (sortBy)
            {
                case "UserEmail":
                    switch (sortOrder)
                    {
                        case "Asc":
                            users = users.OrderBy(x => x.AppUserEmail).ToList();
                            break;

                        case "Desc":
                            users = users.OrderByDescending(x => x.AppUserEmail).ToList();
                            break;

                        default:
                            break;
                    }
                    break;

                case "Role":
                    switch (sortOrder)
                    {
                        case "Asc":
                            users = users.OrderBy(x => x.Role).ToList();
                            break;

                        case "Desc":
                            users = users.OrderByDescending(x => x.Role).ToList();
                            break;

                        default:
                            break;
                    }
                    break;

                default:
                    users = users.OrderBy(x => x.AppUserEmail).ToList();
                    break;
            }

            ViewBag.TotalPages = Math.Ceiling(_adminBLogic.User.GetALL().Count() / 10.0);
            int pageselected = int.Parse(page == null ? "1" : page);
            ViewBag.Page = pageselected;
            users = users.Skip((pageselected - 1) * 10).Take(10).ToList();

            return View(users);
        }
    }
}
using System;
using System.Linq;
using System.Web.Mvc;

namespace LinkShare.UI.Areas.Admin.Controllers
{
    [Authorize(Roles = "A")]
    public class ListCategoryController : BaseAdminController
    {
        public ActionResult Index(string sortOrder, string sortBy, string page)
        {
            ViewBag.SortOrder = sortOrder;
            ViewBag.SortBy = sortBy;
            var categories = _adminBLogic.Category.GetALL();

            switch (sortBy)
            {
                case "CategoryName":
                    switch (sortOrder)
                    {
                        case "Asc":
                            categories = categories.OrderBy(x => x.CategoryName).ToList();
                            break;

                        case "Desc":
                            categories = categories.OrderByDescending(x => x.CategoryName).ToList();
                            break;

                        default:
                            break;
                    }
                    break;

                case "CategoryDesc":
                    switch (sortOrder)
                    {
                        case "Asc":
                            categories = categories.OrderBy(x => x.CategoryDesc).ToList();
                            break;

                        case "Desc":
                            categories = categories.OrderByDescending(x => x.CategoryDesc).ToList();
                            break;

                        default:
                            break;
                    }
                    break;

                default:
                    categories = categories.OrderBy(x => x.CategoryName).ToList();
                    break;
            }

            ViewBag.TotalPages = Math.Ceiling(_adminBLogic.Category.GetALL().Count() / 10.0);
            int pageselected = int.Parse(page == null ? "1" : page);
            ViewBag.Page = pageselected;
            categories = categories.Skip((pageselected - 1) * 10).Take(10);

            return View(categories);
        }

        public ActionResult Delete(int id)
        {
            try
            {
                _adminBLogic.Category.Delete(id);
                TempData["Msg"] = "Deleted Successfully";
                return RedirectToAction("Index");
            }
            catch (Exception e1)
            {
                TempData["Msg"] = "Delete Failed : " + e1.Message;
                return RedirectToAction("Index");
            }
        }
    }
}
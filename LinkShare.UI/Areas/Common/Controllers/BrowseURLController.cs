using Microsoft.Reporting.WebForms;
using System;
using System.Linq;
using System.Web.Mvc;

namespace LinkShare.UI.Areas.Common.Controllers
{
    [AllowAnonymous]
    public class BrowseURLController : BaseCommonController
    {
        public ActionResult Index(string sortOrder, string sortBy, string page)
        {
            ViewBag.SortOrder = sortOrder;
            ViewBag.SortBy = sortBy;
            var urls = _commonBLogic.Url.GetALL().Where(x => x.IsApproved == "A");

            switch (sortBy)
            {
                case "Title":
                    switch (sortOrder)
                    {
                        case "Asc":
                            urls = urls.OrderBy(x => x.UrlTitle).ToList();
                            break;

                        case "Desc":
                            urls = urls.OrderByDescending(x => x.UrlTitle).ToList();
                            break;

                        default:
                            break;
                    }
                    break;

                case "Category":
                    switch (sortOrder)
                    {
                        case "Asc":
                            urls = urls.OrderBy(x => x.Category.CategoryName).ToList();
                            break;

                        case "Desc":
                            urls = urls.OrderByDescending(x => x.Category.CategoryName).ToList();
                            break;

                        default:
                            break;
                    }
                    break;

                case "Url":
                    switch (sortOrder)
                    {
                        case "Asc":
                            urls = urls.OrderBy(x => x.UrlLink).ToList();
                            break;

                        case "Desc":
                            urls = urls.OrderByDescending(x => x.UrlLink).ToList();
                            break;

                        default:
                            break;
                    }
                    break;

                case "Description":
                    switch (sortOrder)
                    {
                        case "Asc":
                            urls = urls.OrderBy(x => x.UrlDesc).ToList();
                            break;

                        case "Desc":
                            urls = urls.OrderByDescending(x => x.UrlDesc).ToList();
                            break;

                        default:
                            break;
                    }
                    break;

                default:
                    urls = urls.OrderBy(x => x.UrlTitle).ToList();
                    break;
            }

            ViewBag.TotalPages = Math.Ceiling(_commonBLogic.Url.GetALL().Where(x => x.IsApproved == "A").Count() / 10.0);
            int pageselected = int.Parse(page == null ? "1" : page);
            ViewBag.Page = pageselected;
            urls = urls.Skip((pageselected - 1) * 10).Take(10);

            return View(urls);
        }

        public FileResult ExportTo(string reportType)
        {
            var localReport = new LocalReport();
            localReport.ReportPath = Server.MapPath("~/Reports/UrlReport.rdlc");

            var reportDataSource = new ReportDataSource();
            reportDataSource.Name = "UrlDataSet";
            reportDataSource.Value = _commonBLogic.Url.GetALL().Where(x => x.IsApproved == "A").ToList();

            localReport.DataSources.Add(reportDataSource);

            string mimeType;
            string encoding;
            string fileNameExtension = (reportType == "Excel") ? "xlsx" : (reportType == "Word" ? "doc" : "pdf");
            Warning[] warnings;
            string[] streams;
            byte[] renderedBytes;

            renderedBytes = localReport.Render(reportType, "", out mimeType, out encoding,
                                                out fileNameExtension, out streams, out warnings);
            Response.AddHeader("content-disposition", "attachment; filename=Urls." + fileNameExtension);

            return File(renderedBytes, fileNameExtension);
        }
    }
}
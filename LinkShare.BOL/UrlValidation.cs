using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace LinkShare.BOL
{
    public class UniqueUrlAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            LinkShareDbEntities db = new LinkShareDbEntities();
            string urlValue = value.ToString();
            int count = db.Urls.Where(x => x.UrlLink == urlValue).ToList().Count;
            if (count != 0)
            {
                return new ValidationResult("Url Already Exist");
            }

            return ValidationResult.Success;
        }
    }

    public class UrlValidation
    {
        [Required]
        [Display(Name="Title")]
        public string UrlTitle { get; set; }

        [Required]
        [Url]
        [UniqueUrl]
        [Display(Name="Url")]
        public string UrlLink { get; set; }

        [Required]
        [Display(Name="Description")]
        public string UrlDesc { get; set; }
    }

    [MetadataType(typeof(UrlValidation))]
    public partial class Url
    {
        // Empty
    }
}
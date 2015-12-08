using System.ComponentModel.DataAnnotations;

namespace LinkShare.BOL
{
    public class CategoryValidation
    {
        [Required]
        [Display(Name="Category")]
        public string CategoryName { get; set; }

        [Required]
        [Display(Name="Description")]
        public string CategoryDesc { get; set; }
    }

    [MetadataType(typeof(CategoryValidation))]
    public partial class Category
    {
        // Emtpy
    }
}
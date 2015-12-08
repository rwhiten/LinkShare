using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace LinkShare.BOL
{
    public class UniqueEmailAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            LinkShareDbEntities db = new LinkShareDbEntities();
            string userEmailValue = value.ToString();
            int count = db.AppUsers.Where(x => x.AppUserEmail == userEmailValue).ToList().Count;
            if (count != 0)
            {
                return new ValidationResult("User Already Exist With This Email ID");
            }

            return ValidationResult.Success;
        }
    }

    public class UserValidation
    {
        [Required]
        [EmailAddress]
        [UniqueEmail]
        [Display(Name="Email")]
        public string AppUserEmail { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required]
        [Compare("Password")]
        [Display(Name="Confirm Password")]
        public string ConfirmPassword { get; set; }
    }

    [MetadataType(typeof(UserValidation))]
    public partial class AppUser
    {
        public string ConfirmPassword { get; set; }
    }
}
using LinkShare.BOL;
using System;
using System.Transactions;

namespace LinkShare.BLL
{
    public class CommonBLogic : BaseBLogic
    {
        public void InsertQuickURL(QuickSubmitURLModel model)
        {
            using (var trans = new TransactionScope())
            {
                try
                {
                    var user = model.MyUser;
                    user.Password = user.ConfirmPassword = "12345";
                    user.Role = "U";
                    User.Insert(user);

                    var url = model.MyUrl;
                    url.AppUserId = user.AppUserId;
                    url.UrlDesc = url.UrlTitle;
                    url.IsApproved = "P";
                    Url.Insert(url);

                    trans.Complete();
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
            }
        }
    }
}
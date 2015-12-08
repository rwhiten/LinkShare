using System;
using System.Collections.Generic;
using System.Transactions;

namespace LinkShare.BLL
{
    public class AdminBLogic : BaseBLogic
    {
        public void ApproveOrReject(List<int> ids, string status)
        {
            using (TransactionScope Trans = new TransactionScope())
            {
                try
                {
                    foreach (var item in ids)
                    {
                        var myUrl = Url.GetByID(item);
                        myUrl.IsApproved = status;
                        Url.Update(myUrl);
                    }

                    Trans.Complete();
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
            }
        }
    }
}
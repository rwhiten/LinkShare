using LinkShare.BOL;
using LinkShare.DAL;
using System.Collections.Generic;

namespace LinkShare.BLL
{
    public class AppUserBLogic
    {
        private UserDb _userDb;

        public AppUserBLogic()
        {
            _userDb = new UserDb();
        }

        public IEnumerable<AppUser> GetALL()
        {
            return _userDb.GetALL();
        }

        public AppUser GetByID(int Id)
        {
            return _userDb.GetByID(Id);
        }

        public void Insert(AppUser user)
        {
            _userDb.Insert(user);
        }

        public void Delete(int Id)
        {
            _userDb.Delete(Id);
        }

        public void Update(AppUser user)
        {
            _userDb.Update(user);
        }
    }
}
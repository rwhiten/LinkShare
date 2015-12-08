using LinkShare.BOL;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace LinkShare.DAL
{
    public class UserDb
    {
        private LinkShareDbEntities _db;

        public UserDb()
        {
            _db = new LinkShareDbEntities();
        }

        public IEnumerable<AppUser> GetALL()
        {
            return _db.AppUsers.ToList();
        }

        public AppUser GetByID(int Id)
        {
            return _db.AppUsers.Find(Id);
        }

        public void Insert(AppUser user)
        {
            _db.AppUsers.Add(user);
            Save();
        }

        public void Delete(int Id)
        {
            AppUser user = _db.AppUsers.Find(Id);
            _db.AppUsers.Remove(user);
            Save();
        }

        public void Update(AppUser user)
        {
            _db.Entry(user).State = EntityState.Modified;
        }

        public void Save()
        {
            _db.SaveChanges();
        }
    }
}
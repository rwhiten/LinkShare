using LinkShare.BOL;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace LinkShare.DAL
{
    public class UrlDb
    {
        private LinkShareDbEntities _db;

        public UrlDb()
        {
            _db = new LinkShareDbEntities();
        }

        public IEnumerable<Url> GetAll()
        {
            return _db.Urls.ToList();
        }

        public Url GetByID(int id)
        {
            return _db.Urls.Find(id);
        }

        public void Insert(Url url)
        {
            _db.Urls.Add(url);
            Save();
        }

        public void Delete(int id)
        {
            Url url = _db.Urls.Find(id);
            _db.Urls.Remove(url);
            Save();
        }

        public void Update(Url url)
        {
            _db.Entry(url).State = EntityState.Modified;
            _db.Configuration.ValidateOnSaveEnabled = false;
            Save();
            _db.Configuration.ValidateOnSaveEnabled = true;
        }

        private void Save()
        {
            _db.SaveChanges();
        }
    }
}
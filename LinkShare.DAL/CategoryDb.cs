using LinkShare.BOL;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace LinkShare.DAL
{
    public class CategoryDb
    {
        private LinkShareDbEntities _db;

        public CategoryDb()
        {
            _db = new LinkShareDbEntities();
        }

        public IEnumerable<Category> GetALL()
        {
            return _db.Categories.ToList();
        }

        public Category GetByID(int Id)
        {
            return _db.Categories.Find(Id);
        }

        public void Insert(Category category)
        {
            _db.Categories.Add(category);
            Save();
        }

        public void Delete(int Id)
        {
            Category category = _db.Categories.Find(Id);
            _db.Categories.Remove(category);
            Save();
        }

        public void Update(Category category)
        {
            _db.Entry(category).State = EntityState.Modified;
        }

        public void Save()
        {
            _db.SaveChanges();
        }
    }
}
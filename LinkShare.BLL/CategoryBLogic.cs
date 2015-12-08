using LinkShare.BOL;
using LinkShare.DAL;
using System.Collections.Generic;

namespace LinkShare.BLL
{
    public class CategoryBLogic
    {
        private CategoryDb _categoryDb;

        public CategoryBLogic()
        {
            _categoryDb = new CategoryDb();
        }

        public IEnumerable<Category> GetALL()
        {
            return _categoryDb.GetALL();
        }

        public Category GetByID(int Id)
        {
            return _categoryDb.GetByID(Id);
        }

        public void Insert(Category category)
        {
            _categoryDb.Insert(category);
        }

        public void Delete(int Id)
        {
            _categoryDb.Delete(Id);
        }

        public void Update(Category category)
        {
            _categoryDb.Update(category);
        }
    }
}
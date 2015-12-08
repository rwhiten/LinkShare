using LinkShare.BOL;
using LinkShare.DAL;
using System.Collections.Generic;

namespace LinkShare.BLL
{
    public class UrlBLogic
    {
        private UrlDb _urlDb;

        public UrlBLogic()
        {
            _urlDb = new UrlDb();
        }

        public IEnumerable<Url> GetALL()
        {
            return _urlDb.GetAll();
        }

        public Url GetByID(int id)
        {
            return _urlDb.GetByID(id);
        }

        public void Insert(Url url)
        {
            _urlDb.Insert(url);
        }

        public void Delete(int id)
        {
            _urlDb.Delete(id);
        }

        public void Update(Url url)
        {
            _urlDb.Update(url);
        }
    }
}
namespace LinkShare.BLL
{
    public abstract class BaseBLogic
    {
        public CategoryBLogic Category { get; set; }
        public UrlBLogic Url { get; set; }
        public AppUserBLogic User { get; set; }

        public BaseBLogic()
        {
            Category = new CategoryBLogic();
            Url = new UrlBLogic();
            User = new AppUserBLogic();
        }
    }
}
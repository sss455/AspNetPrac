namespace SelfAspNetIdentity.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UrlToUsers : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "Url", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.AspNetUsers", "Url");
        }
    }
}

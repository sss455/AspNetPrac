namespace SelfAspNetApi.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class SelfAsp : DbContext
    {
        public SelfAsp()
            : base("name=SelfAspEntities")
        {
        }

        public virtual DbSet<Book> Book { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Book>()
                .Property(e => e.isbn)
                .IsFixedLength()
                .IsUnicode(false);
        }
    }
}

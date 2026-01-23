namespace SelfAspNet.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.ComponentModel;

    [Table("Book")]
    public partial class Book
    {
        [Key]
        [DisplayName("ISBNコード")]
        [StringLength(17)]
        [Required(ErrorMessage = "{0}は必須です。")]
        [RegularExpression("[0-9]{3}-[0-9]{1}-[0-9]{3,5}-[0-9]{3,5}-[0-9X]{1}", ErrorMessage = "{0}は正しい形式で入力してください。")]
        public string isbn { get; set; }

        [DisplayName("書名")]
        [Required(ErrorMessage = "{0}は必須です。")]
        [StringLength(100, ErrorMessage = "{0}は{1}文字以内で入力してください。")]
        public string title { get; set; }

        [DisplayName("価格")]
        [Range(0, 10000, ErrorMessage = "{0}は{1}～{2}の間で指定してください。")]
        public int price { get; set; }

        [DisplayName("出版社")]
        [Required]
        [StringLength(30)]
        public string publish { get; set; }

        [DisplayName("発売日")]
        [Column(TypeName = "date")]
        public DateTime published { get; set; }

        [DisplayName("CD-ROM")]
        public bool cdrom { get; set; }
    }
}

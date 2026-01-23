$(function () {
    $('#btnSearch').click(function () {
        $.getJSON('api/books/' + $('#txtIsbn').val(),
          function (data) {
              var html = '<li>ISBNコード：' + data.isbn + '</li>';
              html += '<li>書名：' + data.title + '</li>';
              html += '<li>価格：' + data.price + '円</li>';
              html += '<li>出版社：' + data.publish + '</li>';
              html += '<li>刊行日：' + data.published + '</li>';
              html += '<li>CD-ROM：' + data.cdrom + '</li>';
              $('#result').html(html);
          }
        );
    });
});
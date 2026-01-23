$(function () {
	$('#btnSearch').click(function () {
		$.getJSON(`api/books/${$('#txtIsbn').val()}`,
			function (data) {
				let html = `<li>ISBNコード：${data.isbn}</li>
					<li>書名：${data.title}</li>
					<li>価格：${data.price}</li>
					<li>出版社：${data.publish}</li>
					<li>刊行日：${data.published}</li>
					<li>CD-ROM：${data.cdrom}</li>`;
				$('#result').html(html);
			}
		);
	});
});
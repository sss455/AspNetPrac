$(function () {
    // 検索ボタンクリック
    $('#btnSearch').click(function () {
        // $.getJSONメソッドでURL「api/books/<ISBNコード>」のWeb APIにアクセス
        $.getJSON(`/api/books/${$('#txtIsbn').val()}`,
            // コールバック関数（WebAPIへのアクセスが成功したタイミングで呼び出される関数のこと
            function (data) {
                // 引数dataにはWebAPIからのレスポンスが自動的にセットされる
                // ※この場合、JSONデータがJavaScriptのオブジェクトとして解析されたものがセットされる
                //   このため、「data.isbn」「data.title」のようにJSONデータにアクセスできる
                let html = `
                    <li>ISBNコード：${data.isbn}<li>
                    <li>書名：${data.title}</li>
                    <li>価格：${data.price}</li>
                    <li>出版社：${data.publish}</li>
                    <li>刊行日：${data.published}</li>
                    <li>CD-ROM：${data.cdrom}</li>`;

                // できあがったHTML文字列をhtmlメソッドでhtmlメソッドでページに反映
                $('#result').html(html);
            }
        );
    });
});
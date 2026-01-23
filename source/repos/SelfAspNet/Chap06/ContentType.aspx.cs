using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap06
{
    public partial class ContentType : System.Web.UI.Page
    {
        // リクエストURLは「～ContentType.aspx?id=12」のように指定する。
        protected void Page_Load(object sender, EventArgs e)
        {
            // SELECT命令を実行
            // sds「 SelectCommand="SELECT type, data FROM Photo WHERE (id = @id) 」
            var reader = (IDataReader) sds.Select(
                                            // ここでは拡張パラメータは必要ないため、空（ダミー）を渡す
                                            DataSourceSelectArguments.Empty );

            if (reader.Read())
            {
                // 取得したPhoto.type列の値を、レスポンスヘッダ―のコンテンツタイプに設定
                Response.ContentType = reader["type"].ToString();
                // BinaryWriteメソッドで、Photo.data列のバイトデータを（デコード処理など一切行わずに）そのままの状態でクライアントに送信
                Response.BinaryWrite( (byte[]) reader["data"] );
            }
            else
            {
                // HTTPステータス404を返す（Not Found）を返す
                Response.StatusCode = 404;
                Response.Write("ページが見つかりませんでした。");
            }

            // 出力を終了
            Response.End();
        }
    }
}
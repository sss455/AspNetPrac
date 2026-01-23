using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap03
{
    public partial class FileUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // アップロードボタンクリックイベント
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            // HasFileプロパティで、FileUploadコントロールにファイルが指定されたかどうかを判定（ture/false）
            if (upload.HasFile)
            {
                // PostedFileプロパティで、FileUploadコントロールによってアップロードされたファイルの情報をHttpPostedFileオブジェクトとして取得
                //var postfile = upload.PostedFile;
                HttpPostedFile postfile = upload.PostedFile;

                //------------------------------------------------------------------------------------------------------------------------------------
                //【参考】
                // HttpPostedFileクラスはアップローdファイルの情報にアクセスする手段、またファイル自体を操作するための機能を提供します。
                // ■HttpPostedFileクラスで利用可能な主なメンバー
                //　int fileSize    = postfile.ContentLength; // アップロードファイルのサイズ（バイト単位）
                //　string type     = postfile.ContentType;   // アップロードファイルのコンテンツタイプ
                //　string fileName = postfile.FileName;      // クライアント上での絶対パス （例）「D:\myData\uploaded.gif」
                //　Stream stream   = postfile.InputStream;   // アップロードファイルをStreamオブジェクトとして取得
                //------------------------------------------------------------------------------------------------------------------------------------

                // [アップロード先の物理パス(サーバ上)の取得手順]
                //  (1) Path.GetFileNameメソッドは指定されたパスからファイル名だけを取り出す。
                //  (2) HttpPostedFile.FileNameプロパティは、アップロードファイルのクライアント上での絶対パスを「D:\myData\uploaded.gif」のような形式で取得するので、
                //      Path.GetFileNameメソッドで「uploaded.gif」の部分だけを取り出す。
                //  (4) Server.MapPathメソッドは指定されたパスを物理パスに変換。
                //       例）「~/App_Data/doc/uploaded.gif」→「C:\Data\SelfAspNet\App_Data\doc\uploaded.gif」
                string uppath = Server.MapPath(
                        $"~/App_Data/doc/{ Path.GetFileName(postfile.FileName) }"   // ← (3)「~/App_Data/doc/uploaded.gif」のようなパスが生成。
                    );
                
                // SaveAsメソッドでアップロードファイルを保存
                postfile.SaveAs( uppath );
                
                lblResult.Text = $"{postfile.FileName}をアップロードしました。";
            }
        }
    }
}
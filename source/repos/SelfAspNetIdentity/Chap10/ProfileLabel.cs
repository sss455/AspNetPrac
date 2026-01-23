using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using SelfAspNetIdentity.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNetIdentity.Chap10
{
    [Designer(typeof(System.Web.UI.Design.ControlDesigner))]            // [属性]デザインビューで利用するデザインクラスの型
    [DefaultProperty("ProfileName")]                                    // [属性]デフォルトのプロパティ名
    [ToolboxData("<{0}:ProfileLabel runat=server></{0}:ProfileLabel>")] // [属性]デザインビューにドラッグ＆ドロップされたときにデフォルトで生成されるタグ（{0}は、名前空間に埋め込まれるプレースホルダー）
    public class ProfileLabel : Label
    {
        // ProfileLabelコントロール固有のProfileNameプロパティを定義
        [Bindable(true)]                // [属性]データバインド可能であるか
        [Category("Behavior")]          // [属性]プロパティウィンドウ情での分類（Action｜Appearance｜Behavior｜Data｜Default｜Design｜Format｜Layoutなど）
        [DefaultValue("")]              // [属性]デフォルト値
        [Localizable(true)]             // [属性]ローカライズが可能であるか
        [Description("プロファイル名")] // [属性]プロパティうウィンドウ株に表示されるプロパティの概要
        public string ProfileName
        {
            get
            {
                String s = (String) ViewState["ProfileName"];
                return ((s == null) ? String.Empty : s);
            }

            set
            {
                ViewState["ProfileName"] = value;
            }
        }

        // もともとあるTextプロパティを無効化
        [Browsable(false)]  // [属性]プロパティウィンドウに表示するか
        public override String Text
        {
            get
            {
                return "";
            }

            set
            {
                throw new NotSupportedException();
            }
        }

        // 実コンテンツを出力（ProfileNameプロパティで指定されたプロファイルを取得）
        protected override void RenderContents(HtmlTextWriter output)
        {
            // サーバーコントロールが動作しているHTTPコンテキスト（HttpContextオブジェクト）を取得
            HttpContext cx = this.Context;

            // HTTPコンテキストが空でない（ページが実行状態）
            if (cx != null)
            {
                ApplicationUserManager manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                ApplicationUser user = manager.FindByName(Context.User.Identity.Name);

                // コンテンツの出力
                output.Write( typeof(ApplicationUser).GetProperty(ProfileName).GetValue(user) );
            }
            // HTTPコンテキストが空であるということは、ページが実行状態でない（デザインビューでの表示である）ことを表す
            else
            {
                // デザインビューでの表示の場合、ProfileLabelコントロールのID値を表示
                output.Write( String.Format("[{0}]", this.ID) );
            }
        }
    }
}

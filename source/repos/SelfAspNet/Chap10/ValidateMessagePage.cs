using iText.IO.Font.Cmap;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap10
{
    public class ValidateMessagePage : Page
    {
        // 検証の種類に応じて、エラーメッセージを定義
        protected const String REQUIRED_MSG = "{0}は必ず入力してください２。";
        protected const String RANGE_MSG    = "{0}は{1}～{2}の範囲で入力してください２。";
        protected const String REGEX_MSG    = "{0}は正しい形式で入力してください２。";
        protected const String COMPARE_MSG  = "{0}と{1}は正しい大小関係で入力してください２。";
        protected const String TYPE_MSG     = "{0}は正しいデータ型で入力してください２。";

        // ページの内容が準備でき、レンダリング内容を確定した段階で実行
        protected override void OnPreRenderComplete(EventArgs e)
        {
            // 基底クラスのOnPreRenderCompleteメソッドを実行
            base.OnPreRenderComplete(e);

            // ページに含まれるすべての検証コントロールを順に処理
            foreach (BaseValidator vControl in Page.Validators)
            {
                // SetFocusOnErrorプロパティがfalseである場合にのみ処理を実行
                if (!vControl.SetFocusOnError)
                {
                    // 検証コントロールの種類（型）に応じてエラーメッセージを設定
                    switch (vControl)
                    {
                        // 必須検証
                        case RequiredFieldValidator required:
                            required.ErrorMessage = String.Format(REQUIRED_MSG, required.ErrorMessage);
                            break;

                        // 範囲検証
                        case RangeValidator rng:
                            rng.ErrorMessage = String.Format(RANGE_MSG, rng.ErrorMessage, rng.MinimumValue, rng.MaximumValue);
                            break;

                        // 正規表現検証
                        case RegularExpressionValidator regex:
                            regex.ErrorMessage = String.Format(REGEX_MSG, regex.ErrorMessage);
                            break;

                        // 項目名が「名前1、名前2」のようなカンマ区切りで指定されているはずなので、これを分割してエラーメッセージに設定
                        case CompareValidator comp:
                            string[] msgs = comp.ErrorMessage.Split(',');

                            // データ型検証の場合
                            if(comp.Operator == ValidationCompareOperator.DataTypeCheck)
                            {
                                comp.ErrorMessage = String.Format(TYPE_MSG, msgs[0]);
                            }
                            else
                            {
                                comp.ErrorMessage = String.Format(COMPARE_MSG, msgs[0], msgs[1]);
                            }
                            break;
                    }

                    // その他の共通プロパティを設定
                    vControl.Display = ValidatorDisplay.Dynamic;
                    vControl.SetFocusOnError = true;
                    vControl.Text = "*";
                }
            }
        }
    }
}
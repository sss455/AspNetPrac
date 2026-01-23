using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfAspNet.Chap10
{
    public class ValidateMessagePage : Page
    {
        protected const String REQUIRED_MSG = "{0}は必ず入力してください。";
        protected const String RANGE_MSG = "{0}は{1}～{2}の範囲で入力してください。";
        protected const String REGEX_MSG = "{0}は正しい形式で入力してください。";
        protected const String COMPARE_MSG = "{0}と{1}は正しい大小関係で入力してください。";
        protected const String TYPE_MSG = "{0}は正しいデータ型で入力してください。";
        
        protected override void OnPreRenderComplete(EventArgs e)
        {
            base.OnPreRenderComplete(e);
            foreach (BaseValidator vControl in Page.Validators)
            {
                if (!vControl.SetFocusOnError)
                {
                    switch (vControl.GetType().Name)
                    {
                        case "RequiredFieldValidator":
                            vControl.ErrorMessage =
                                String.Format(REQUIRED_MSG, vControl.ErrorMessage);
                            break;
                        case "RangeValidator":
                            var rng = (RangeValidator)vControl;
                            vControl.ErrorMessage = String.Format(
                                RANGE_MSG, rng.ErrorMessage, rng.MinimumValue,
                                rng.MaximumValue);
                            break;
                        case "RegularExpressionValidator":
                            vControl.ErrorMessage = String.Format(
                                REGEX_MSG, vControl.ErrorMessage);
                            break;
                        case "CompareValidator":
                            var cmp = (CompareValidator)vControl;
                            var msgs = vControl.ErrorMessage.Split(',');
                            if (cmp.Operator == ValidationCompareOperator.DataTypeCheck)
                            {
                                cmp.ErrorMessage = String.Format(TYPE_MSG, msgs[0]);
                            }
                            else
                            {
                                cmp.ErrorMessage = String.Format(
                                COMPARE_MSG, msgs[0], msgs[1]);
                            }
                            break;
                    }

                    vControl.Display = ValidatorDisplay.Dynamic;
                    vControl.SetFocusOnError = true;
                    vControl.Text = "*";
                }
            }
        }
    }
}
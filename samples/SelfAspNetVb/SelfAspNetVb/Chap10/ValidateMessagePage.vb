Public Class ValidateMessagePage : Inherits Page
    Protected Const REQUIRED_MSG As String = "{0}は必ず入力してください。"
    Protected Const RANGE_MSG As String = "{0}は{1}～{2}の範囲で入力してください。"
    Protected Const REGEX_MSG As String = "{0}は正しい形式で入力してください。"
    Protected Const COMPARE_MSG As String = "{0}と{1}は正しい大小関係で入力してください。"
    Protected Const TYPE_MSG As String = "{0}は正しいデータ型で入力してください。"

    Protected Overrides Sub OnPreRenderComplete(e As EventArgs)
        MyBase.OnPreRenderComplete(e)
        For Each vControl As BaseValidator In Page.Validators
            If Not vControl.SetFocusOnError Then
                Select Case vControl.GetType().Name
                    Case "RequiredFieldValidator"
                        vControl.ErrorMessage = String.Format(REQUIRED_MSG,
                            vControl.ErrorMessage)
                    Case "RangeValidator"
                        Dim rng As RangeValidator = DirectCast(vControl,
                            RangeValidator)
                        vControl.ErrorMessage = String.Format(RANGE_MSG,
                            rng.ErrorMessage, rng.MinimumValue, rng.MaximumValue)
                    Case "RegularExpressionValidator"
                        vControl.ErrorMessage = String.Format(REGEX_MSG,
                            vControl.ErrorMessage)
                    Case "CompareValidator"
                        Dim cmp = DirectCast(vControl, CompareValidator)
                        Dim msgs = vControl.ErrorMessage.Split(",")
                        If cmp.Operator = ValidationCompareOperator.DataTypeCheck Then
                            cmp.ErrorMessage = String.Format(TYPE_MSG, msgs(0))
                        Else
                            cmp.ErrorMessage = String.Format(
                              COMPARE_MSG, msgs(0), msgs(1))
                        End If
                End Select
                vControl.Display = ValidatorDisplay.Dynamic
                vControl.SetFocusOnError = True
                vControl.Text = "*"
            End If
        Next
    End Sub

End Class

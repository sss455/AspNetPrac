Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.ComponentModel.DataAnnotations
Imports System.ComponentModel.DataAnnotations.Schema
Imports System.Data.Entity.Spatial

<Table("Book")>
Partial Public Class Book
    <Key>
    <DisplayName("ISBNコード")>
    <StringLength(17)>
    <Required(ErrorMessage:="{0}は必須です。")>
    <RegularExpression("[0-9]{3}-[0-9]{1}-[0-9]{3,5}-[0-9]{3,5}-[0-9X]{1}", ErrorMessage:="{0}は正しい形式で入力してください。")>
    Public Property isbn As String

    <DisplayName("書名")>
    <Required(ErrorMessage:="{0}は必須です。")>
    <StringLength(100, ErrorMessage:="{0}は{1}文字以内で入力してください。")>
    Public Property title As String

    <DisplayName("価格")>
    <Range(0, 10000, ErrorMessage:="{0}は{1}～{2}の間で指定してください。")>
    Public Property price As Integer

    <DisplayName("出版社")>
    <Required>
    <StringLength(30)>
    Public Property publish As String

    <DisplayName("発売日")>
    <Column(TypeName:="date")>
    Public Property published As Date

    <DisplayName("CD-ROM")>
    Public Property cdrom As Boolean
End Class

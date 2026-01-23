Imports System
Imports System.Collections.Generic
Imports System.ComponentModel.DataAnnotations
Imports System.ComponentModel.DataAnnotations.Schema
Imports System.Data.Entity.Spatial

<Table("Book")>
Partial Public Class Book
    <Key>
    <StringLength(17)>
    Public Property isbn As String

    <Required>
    <StringLength(100)>
    Public Property title As String

    Public Property price As Integer

    <Required>
    <StringLength(30)>
    Public Property publish As String

    <Column(TypeName:="date")>
    Public Property published As Date

    Public Property cdrom As Boolean
End Class

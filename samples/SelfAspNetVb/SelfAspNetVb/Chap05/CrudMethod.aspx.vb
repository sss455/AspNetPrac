Imports System.Data.Entity
Imports System.Web.ModelBinding
Imports Microsoft.AspNet.FriendlyUrls.ModelBinding

Public Class CrudMethod
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Response.Write(DateTime.Now.ToString())
    End Sub

    Public Function GetBooks() As IQueryable(Of Book)
        Dim db = New SelfAsp()
        Return From b In db.Book
               Order By b.isbn
               Select b
    End Function

    'Public Function GetBooksByPrice(<QueryString> price As Integer?) As IQueryable(Of Book)
    'Public Function GetBooksByPrice(<QueryString("p")> price As Integer?) As IQueryable(Of Book)
    'Public Function GetBooksByPrice(<Control("txtPrice")> price As Integer?) As IQueryable(Of Book)
    Public Function GetBooksByPrice(<FriendlyUrlSegments(0)> price As Integer?) As IQueryable(Of Book)
        Dim db = New SelfAsp()
        If price.HasValue Then
            Return From b In db.Book
                   Order By b.isbn
                   Where b.price >= price
                   Select b
        End If
        Return From b In db.Book
               Order By b.isbn
               Select b
    End Function

    Public Sub UpdateBook(b As Book)
        Dim db = New SelfAsp()
        If ModelState.IsValid Then
            db.Entry(b).State = EntityState.Modified
            db.SaveChanges()
        End If
    End Sub
End Class
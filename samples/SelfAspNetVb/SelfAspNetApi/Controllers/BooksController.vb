Imports System.Net
Imports System.Web.Http

Namespace Controllers
    Public Class BooksController
        Inherits ApiController
        Function GetBook(ByVal id As String) As Book
            '<HttpGet>
            'Function RetrieveBook(ByVal id As String) As Book
            Dim db = New SelfAsp()
            Dim book As Book = db.Book.Find(id)
            If IsNothing(book) Then
                Throw New HttpResponseException(HttpStatusCode.NotFound)
            End If
            Return book
        End Function

    End Class
End Namespace
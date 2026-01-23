Imports System
Imports System.Data.Entity
Imports System.ComponentModel.DataAnnotations.Schema
Imports System.Linq

Partial Public Class SelfAsp
    Inherits DbContext

    Public Sub New()
        MyBase.New("name=SelfAspEntities")
    End Sub

    Public Overridable Property Book As DbSet(Of Book)

    Protected Overrides Sub OnModelCreating(ByVal modelBuilder As DbModelBuilder)
        modelBuilder.Entity(Of Book)() _
            .Property(Function(e) e.isbn) _
            .IsFixedLength() _
            .IsUnicode(False)
    End Sub
End Class

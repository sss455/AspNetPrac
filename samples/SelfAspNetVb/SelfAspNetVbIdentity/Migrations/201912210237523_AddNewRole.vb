Imports System
Imports System.Data.Entity.Migrations
Imports Microsoft.VisualBasic

Namespace Migrations
    Public Partial Class AddNewRole
        Inherits DbMigration
    
        Public Overrides Sub Up()
            AddColumn("dbo.AspNetRoles", "Discriminator", Function(c) c.String(nullable := False, maxLength := 128))
        End Sub
        
        Public Overrides Sub Down()
            DropColumn("dbo.AspNetRoles", "Discriminator")
        End Sub
    End Class
End Namespace

Imports System.Data.SqlClient

Public Class SqlSiteMapProvider : Inherits StaticSiteMapProvider
    Private connectName As String = Nothing
    Private root As SiteMapNode = Nothing

    Public Overrides Sub Initialize(name As String, attributes As NameValueCollection)
        If connectName Is Nothing Then
            MyBase.Initialize(name, attributes)
            connectName = attributes("connectName")
        End If
    End Sub

    Public Overrides Function BuildSiteMap() As System.Web.SiteMapNode
        If root Is Nothing Then
            SyncLock Me
                Me.CreateNode(root)
            End SyncLock
        End If
        Return root
    End Function

    Protected Overrides Function GetRootNodeCore() As System.Web.SiteMapNode
        Return Me.BuildSiteMap()
    End Function

    Private Sub CreateNode(pnode As SiteMapNode)
        Dim setting As ConnectionStringSettings =
          ConfigurationManager.ConnectionStrings(Me.connectName)
        Using db As New SqlConnection(setting.ConnectionString)
            Dim comm As New SqlCommand("SELECT mid, url, title, description FROM Sitemap WHERE parent = @parent", db)
            comm.Parameters.AddWithValue("@parent", If(pnode Is Nothing, 0, pnode.Key))
            db.Open()
            Dim reader As SqlDataReader = comm.ExecuteReader()
            Do While reader.Read()
                If pnode Is Nothing Then
                    root = New SiteMapNode(Me, reader("mid"), reader("url"), reader("title"), reader("description"))
                    Me.AddNode(root)
                    Me.CreateNode(root)
                Else
                    Dim node As New SiteMapNode(Me, reader("mid"), reader("url"), reader("title"), reader("description"))
                    Me.AddNode(node, pnode)
                    Me.CreateNode(node)
                End If
            Loop
        End Using
    End Sub
End Class



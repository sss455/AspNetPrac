Public Class DataCache2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim ds As New DataSet()
        If IsDBNull(Cache.Get("Books")) Or IsNothing(Cache.Get("Books")) Then
            ds.ReadXml(Server.MapPath("~/App_Data/Books.xml"))
            Dim cd As New CacheDependency(Server.MapPath("~/App_Data/Books.xml"))
            Cache.Insert("Books", ds, cd)
        Else
            ds = Cache.Get("Books")
        End If
        grid.DataSource = ds
        Page.DataBind()
    End Sub

End Class
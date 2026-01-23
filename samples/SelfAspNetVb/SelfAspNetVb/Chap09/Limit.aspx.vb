Public Class Limit
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim nodCur As SiteMapNode = SiteMap.CurrentNode
        If nodCur IsNot Nothing Then
            Dim nodPrev As SiteMapNode = nodCur.PreviousSibling
            Dim nodParent As SiteMapNode = nodCur.ParentNode
            Dim nodNext As SiteMapNode = nodCur.NextSibling
            Me.SetHyperLink(lnkPrev, nodPrev)
            Me.SetHyperLink(lnkParent, nodParent)
            Me.SetHyperLink(lnkNext, nodNext)
        End If
    End Sub

    Private Sub SetHyperLink(link As WebControls.HyperLink, node As SiteMapNode)
        If node IsNot Nothing Then
            link.NavigateUrl = node.Url
            link.Visible = True
        End If
    End Sub
End Class
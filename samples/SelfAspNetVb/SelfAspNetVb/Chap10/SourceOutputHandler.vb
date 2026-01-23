Imports System.Web
Imports System.IO

Public Class SourceOutputHandler
    Implements IHttpHandler

#Region "IHttpHandler Members"

    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return True
        End Get
    End Property

    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        Dim orgPath As String = context.Request.PhysicalPath
        Dim file As String = Path.GetFileNameWithoutExtension(orgPath)
        Dim srcPath As String = Path.Combine(Path.GetDirectoryName(orgPath), file)
        Using reader As New StreamReader(srcPath, Encoding.UTF8)
            Dim Response As HttpResponse = context.Response
            Response.Write("<html>")
            Response.Write("<head><title>" & file & "</title></head>")
            Response.Write("<body>")
            Response.Write("<h1>" & file & "</h1>")
            Response.Write("<table border='0'>")
            Dim cnt = 1
            Do While reader.Peek > -1
                Response.Write("<tr>")
                Response.Write("<th align='right'>" & cnt & "</th>")
                Dim line As String = context.Server.HtmlEncode(reader.ReadLine())
                Response.Write("<td>" & line.Replace(" ", "&nbsp;") & "</td></tr>")
                cnt = cnt + 1
            Loop
            Response.Write("</body>")
            Response.Write("</html>")
        End Using

    End Sub

#End Region

End Class

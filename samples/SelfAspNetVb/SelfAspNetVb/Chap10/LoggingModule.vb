Imports System.Web
Imports System.Data.Common
Imports System.Data.SqlClient

Public Class LoggingModule
    Implements IHttpModule

    Private WithEvents _context As HttpApplication

    ''' <summary>
    '''  モジュールを使用するには、Web の Web.config ファイルでこの
    '''  モジュールを設定し、IIS に登録する必要があります。詳細については、
    '''  次のリンクを参照してください: http://go.microsoft.com/?linkid=8101007
    ''' </summary>
#Region "IHttpModule Members"

    Public Sub Dispose() Implements IHttpModule.Dispose

        ' 後処理用コードはここに追加します

    End Sub

    Public Sub Init(ByVal context As HttpApplication) Implements IHttpModule.Init
        AddHandler context.EndRequest, AddressOf Me.Application_EndRequest
    End Sub

#End Region

    Public Sub OnLogRequest(ByVal source As Object, ByVal e As EventArgs) Handles _context.LogRequest

        ' LogRequest イベントを処理して、イベントに対する 
        ' カスタム ログを実装します

    End Sub

    Public Sub Application_EndRequest(ByVal sender As Object, ByVal e As EventArgs)
        Dim req As HttpRequest = DirectCast(sender, HttpApplication).Request
        Dim setting As ConnectionStringSettings =
          ConfigurationManager.ConnectionStrings("SelfAsp")
        Using db As New SqlConnection(setting.ConnectionString)
            Dim comm As New SqlCommand("INSERT INTO AccessLog(url, userAgent, referrer, accessTime) VALUES(@url, @userAgent, @referrer, @accessTime)", db)
            comm.Parameters.AddWithValue("@url", req.Url.ToString())
            comm.Parameters.AddWithValue("@userAgent", req.UserAgent)
            comm.Parameters.AddWithValue("@referrer", If(req.UrlReferrer IsNot Nothing, req.UrlReferrer.ToString(), ""))
            comm.Parameters.AddWithValue("@accessTime", DateTime.Now.ToString())
            db.Open()
            comm.ExecuteNonQuery()
        End Using
    End Sub
End Class

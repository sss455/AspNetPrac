
Imports System.Data.SqlClient
Imports System.IO
Imports System.Web.Routing
Imports Microsoft.AspNet.FriendlyUrls

Public Class Global_asax
    Inherits HttpApplication

    Sub Application_Start(sender As Object, e As EventArgs)
        ScriptManager.ScriptResourceMapping.AddDefinition("jquery", Nothing,
            New ScriptResourceDefinition() With {
                .Path = "~/Scripts/jquery-3.4.1.min.js",
                .DebugPath = "~/Scripts/jquery-3.4.1.js",
                .CdnPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-3.4.1.min.js",
                .CdnDebugPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-3.4.1.js"
        })

        'RouteTable.Routes.MapPageRoute("blog",
        '    "blog/{day}/{month}/{year}", "~/Chap10/Blog.aspx")

        'RouteTable.Routes.MapPageRoute("blog",
        '  "blog/{day}/{month}/{year}", "~/Chap10/Blog.aspx",
        '  False,
        '  New RouteValueDictionary(New With {
        '    .year = DateTime.Now.Year,
        '    .month = DateTime.Now.Month,
        '    .day = DateTime.Now.Day
        '  }))

        RouteTable.Routes.MapPageRoute("blog",
            "blog/{day}/{month}/{year}", "~/Chap10/Blog.aspx",
            False,
            New RouteValueDictionary(New With {
                .year = DateTime.Now.Year,
                .month = DateTime.Now.Month,
                .day = DateTime.Now.Day
                }),
            New RouteValueDictionary(New With {
                .year = "\d{4}",
                .month = "\d{1,2}",
                .day = "\d{1,2}"
            }))

        RouteTable.Routes.EnableFriendlyUrls()
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        Using writer As New StreamWriter(Server.MapPath("~/App_Data/error.log"), True, Encoding.GetEncoding("Shift_JIS"))
            Dim err As Exception = Server.GetLastError().InnerException
            If err IsNot Nothing Then
                Dim builder As New StringBuilder()
                builder.Append(err.Source)
                builder.Append(vbTab)
                builder.Append(err.Message)
                builder.Append(vbTab)
                builder.Append(DateTime.Now.ToString())
                writer.WriteLine(builder.ToString())
            End If
        End Using
    End Sub


    'Private Sub OnEndRequest(sender As Object, e As EventArgs) Handles Me.EndRequest
    '    Dim req As HttpRequest = Context.Request
    '    Dim setting As ConnectionStringSettings =
    '      ConfigurationManager.ConnectionStrings("SelfAsp")
    '    Using db As New SqlConnection(setting.ConnectionString)
    '        Dim comm As New SqlCommand("INSERT INTO AccessLog(url, userAgent, referrer, accessTime) VALUES(@url, @userAgent, @referrer, @accessTime)", db)
    '        comm.Parameters.AddWithValue("@url", req.Url.ToString())
    '        comm.Parameters.AddWithValue("@userAgent", req.UserAgent)
    '        comm.Parameters.AddWithValue("@referrer", If(Request.UrlReferrer IsNot Nothing, Request.UrlReferrer.ToString(), ""))
    '        comm.Parameters.AddWithValue("@accessTime", DateTime.Now.ToString())
    '        db.Open()
    '        comm.ExecuteNonQuery()
    '    End Using
    'End Sub

End Class
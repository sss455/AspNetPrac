Imports System.Web.Http
Imports System.Web.Optimization

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

        GlobalConfiguration.Configure(AddressOf WebApiConfig.Register)
        BundleTable.Bundles.Add(New ScriptBundle("~/bundles/my").
            Include("~/Scripts/BookSearch.js"))
        BundleTable.EnableOptimizations = True

    End Sub
End Class
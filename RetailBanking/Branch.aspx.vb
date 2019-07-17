Imports System.Data.SqlClient
Public Class Branch
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        FillMenu()
    End Sub
    Private Function FillMenu()
        MenuNav.InnerHtml = Session.Item("Menu")
    End Function
End Class
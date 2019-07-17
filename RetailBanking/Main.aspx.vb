Imports System.Data.SqlClient

Public Class Main
    Inherits System.Web.UI.Page
   
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        
        FillMenu()
        'FillGrid("شعبه")

    End Sub
    Private Function FillMenu()
        MenuNav.InnerHtml = Session.Item("Menu")
    End Function
   
    Function FillGrid(Tilte As String)
        Dim strHTML As String = "<table id='restbl' class = 'table table-hover text-center'><caption>" + Tilte + "</caption>"
        strHTML += " <thead  class = 'table table-hover text-right'><tr><th>شناسه</th><th>نام</th></tr></thead>"
        Dim queryString As String = "SELECT top 50  Name, Family FROM Sanabad"
        Using connection As New SqlConnection(Session.Item("connectionString").ToString)
            Dim command As New SqlCommand(queryString, connection)
            Dim RowColor As String = "'success'"
            connection.Open()
            Dim reader As SqlDataReader = command.ExecuteReader()
            Try

                strHTML += " <tbody>"
                While reader.Read()
                    Select Case RowColor
                        Case "'success'"
                            RowColor = "'danger'"
                        Case Else
                            RowColor = "'success'"
                    End Select
                    strHTML += "<tr class =" + RowColor + " >"
                    ' strHTML += "<td><input type='checkbox' value=''></td>"
                    For i As Integer = 0 To reader.FieldCount - 1
                        strHTML += "<td>" + reader(i).ToString + "</td>"
                    Next
                    strHTML += " </tr>"
                End While
                strHTML += " </tbody></table>"
            Finally
                reader.Close()
            End Try
        End Using
        tblResult1.InnerHtml = strHTML
        Return False
    End Function
   
End Class
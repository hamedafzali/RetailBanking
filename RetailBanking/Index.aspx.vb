Imports System.Data
Imports System.Data.SqlClient
Imports System.Text
Imports System.Security.Cryptography

Public Class cMd5Hash

    Public Function Md5FromString(ByVal Source As String) As String
        Dim Bytes() As Byte
        Dim sb As New StringBuilder()

        'Check for empty string.
        If String.IsNullOrEmpty(Source) Then
            Throw New ArgumentNullException
        End If

        'Get bytes from string.
        Bytes = Encoding.Default.GetBytes(Source)

        'Get md5 hash
        Bytes = MD5.Create().ComputeHash(Bytes)

        'Loop though the byte array and convert each byte to hex.
        For x As Integer = 0 To Bytes.Length - 1
            sb.Append(Bytes(x).ToString("x2"))
        Next

        'Return md5 hash.
        Return sb.ToString()

    End Function

End Class
Public Class Index
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Server=10.80.80.194;Database=Sanjab;User Id=sa;Password=postbank123?" '"workstation id=PBI;packet size=4096;user id=sa;data source=.;persist security info=True;initial catalog=s;password=12;POOLING=FALSE;Enlist = false;Connect Timeout=500"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Readnews()

    End Sub
    Function Readnews()
        Using sqlCon = New SqlConnection(connectionString)
            sqlCon.Open()
            Dim str As String = "<ul class='demo1' style='direction: rtl'>"
            Dim cmd As New SqlCommand()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "[GetNews]"
            With cmd
                .Connection = sqlCon
            End With
            Dim res As SqlClient.SqlDataReader = cmd.ExecuteReader
            'While res.Read
            '    str += "<li class='news-item col-12'><table cellpadding='4'><tr><td>"
            '    str += "<h6 class='alert alert-danger'><a Id='NewsTitle" + res(0).ToString + "' href='javascript:popupshow(" + res(0).ToString + ");'>" + res(1).ToString + vbCrLf + "<a></h6>"
            '    str += "<p  id='News" + res(0).ToString + "'>" + res(2).ToString + "<p><br/><p  class='alert alert-success'>تاریخ خبر:" + res(3).ToString + "</p></td></tr></table></li>"
            'End While
            Dim colorcode As Integer = 0
            Dim colors() As String
            ReDim colors(2)
            colors(0) = "warning"
            colors(1) = "success"
            colors(2) = "danger"
            While res.Read
                str += "<li class='news-item col-12'>"
                'str += "<p class='alert alert-" + colors(colorcode) + "'><a Id='NewsTitle" + res(0).ToString + "' href='javascript:popupshow(" + res(0).ToString + ");'>" + res(1).ToString + "<a></p>"
                str += "<p ><img src='img/arrow-left.png' width='10px' height='10px'/><a Id='NewsTitle" + res(0).ToString + "' href='javascript:popupshow(" + res(0).ToString + ");'>" + res(1).ToString + "<a></p>"
                str += "<p hidden id='News" + res(0).ToString + "'>" + res(2).ToString + "</p><p hidden id='NewsDate" + res(0).ToString + "' class='alert alert-success'>تاریخ خبر:" + res(3).ToString + "</p></li>"
                If colorcode < 2 Then colorcode += 1 Else colorcode = 0
            End While
            str += "</ul>"
            sqlCon.Close()
            newsdiv.InnerHtml = str
        End Using
    End Function
    Private Function FillMenu()
        Dim ds As New DataSet()
        Dim cn As New SqlConnection(Session.Item("connectionString"))
        Dim cmd As New SqlCommand("SELECT * FROM Menu inner join AccessControl on Menu.Id = AccessControl.MenuId  where Menu.Status = 1 and AccessControl.groupId=" & Session.Item("GroupId") + " order by [Order]", cn)
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(ds)
        Dim table As DataTable = ds.Tables(0)
        Dim parentMenus As DataRow() = table.[Select]("ParentId = 0")

        Dim sb = New StringBuilder()
        sb.AppendLine("<ul class='nav navbar-nav'>")
        Dim unorderedList As String = GenerateUL(parentMenus, table, sb)
        unorderedList += "</ul>"
        Session.Add("Menu", unorderedList)
    End Function
    Private Function GenerateUL(ByVal menu As DataRow(), ByVal table As DataTable, ByVal sb As StringBuilder) As String


        If menu.Length > 0 Then
            For Each dr As DataRow In menu
                'Dim handler As String = dr("Handler").ToString()
                Dim menuText As String = dr("Name").ToString()
                Dim pid As String = dr("Id").ToString()

                Dim subMenu As DataRow() = table.[Select]([String].Format("ParentId = {0}", pid))
                If subMenu.Length > 0 Then
                    Dim line As String = "<li  class='dropdown'><a class='dropdown-toggle' data-toggle='dropdown' href='" + dr("Link").ToString() + "'>" + menuText + "<span class='caret'></span></a></span><ul class='dropdown-menu'>"
                    sb.Append(line)
                    Dim subMenuBuilder = New StringBuilder()
                    sb.Append(GenerateUL(subMenu, table, subMenuBuilder) + "</ul>")

                Else
                    Dim line As String = [String].Format("<li class='nav-item'><a href='" + dr("Link").ToString() + "'>{0}</a>", menuText)
                    sb.Append(line)

                End If
                sb.Append("</li>")
            Next
        End If


        Return sb.ToString()
    End Function
    'Protected Sub UserLogin_Authenticate(sender As Object, e As AuthenticateEventArgs) Handles UserLogin.Authenticate
    '    Using sqlCon = New SqlConnection(connectionString)
    '        sqlCon.Open()


    '        Dim cmd As New SqlCommand()

    '        cmd.CommandType = CommandType.StoredProcedure
    '        cmd.CommandText = "[CheckUser]"
    '        cmd.Parameters.Add("@Username", SqlDbType.NVarChar, 50)
    '        cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 50)
    '        cmd.Parameters.Add("@@Count", SqlDbType.Int, 4)
    '        cmd.Parameters("@@Count").Direction = ParameterDirection.Output

    '        With cmd
    '            .Connection = sqlCon
    '            .Parameters("@Username").Value = UserLogin.UserName
    '            .Parameters("@Password").Value = (New cMd5Hash).Md5FromString(UserLogin.Password)
    '        End With

    '        cmd.ExecuteNonQuery()
    '        If cmd.Parameters("@@Count").Value = 0 Then
    '            UserLogin.PasswordRequiredErrorMessage = "خطا در نام کاربری با کلمه عبور"
    '        Else
    '            Session.Add("connectionString", connectionString)
    '            Session.Add("GroupId", "1")
    '            FillMenu()
    '            Response.Redirect("Main.aspx")
    '        End If
    '        sqlCon.Close()
    '    End Using


    'End Sub
End Class
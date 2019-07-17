Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel
Imports System.Data.SqlClient
' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
' <System.Web.Script.Services.ScriptService()> _
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<ToolboxItem(False)> _
Public Class Getdata
    Inherits System.Web.Services.WebService
    Dim connectionString As String = "Server=10.80.80.194;Database=Sanjab;User Id=sa;Password=postbank123?" '"workstation id=PBI;packet size=4096;user id=sa;data source=.;persist security info=True;initial catalog=s;password=12;POOLING=FALSE;Enlist = false;Connect Timeout=500"
    <WebMethod()> _
    Public Function GetCostcenter(Keyword As String) As String
        Dim str As String = "<div class='row'><div class='col-lg-2'>سرپرستی</div><div class='col-lg-2'>شعبه</div><div class='col-lg-2'>کد شعبه</div><div class='col-lg-2'>باجه</div><div class='col-lg-2'>کد باجه</div><div class='col-lg-4'>شماره تلفن</div></div>"
        Using sqlCon = New SqlConnection(connectionString)
            sqlCon.Open()

            Dim cmd As New SqlCommand()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "[SearchCostcenter]"
            cmd.Parameters.Add("@Keyword", System.Data.SqlDbType.NVarChar, 50)
            cmd.Parameters("@Keyword").Value = Keyword
            With cmd
                .Connection = sqlCon
            End With
            Dim res As SqlClient.SqlDataReader = cmd.ExecuteReader
            While res.Read
                Str += "<div class='row'><div class='col-lg-2'>" + res(0).ToString + "</div><div class='col-lg-2'>" + res(1).ToString + "</div><div class='col-lg-2'>" + res(2).ToString + "</div><div class='col-lg-2'>" + res(3).ToString + "</div><div class='col-lg-2'>" + res(4).ToString + "</div><div class='col-lg-4'>" + res(5).ToString + "</div></div>"
            End While
            sqlCon.Close()

        End Using

        Return str
    End Function
   
End Class
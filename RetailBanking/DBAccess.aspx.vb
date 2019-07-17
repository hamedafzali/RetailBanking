Imports System.Data.SqlClient
Public Class DBAccess
    Inherits System.Web.UI.Page
    Dim Res As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Using connection As New SqlConnection("workstation id=PBI;packet size=4096;user id=sa;data source=192.168.5.31;persist security info=True;initial catalog=RetailBankingDB;password=12;POOLING=FALSE;Enlist = false;Connect Timeout=500")

            Dim command As New SqlCommand("[db_owner].[AmountSupervisorReport]", connection)
            connection.Open()
            Try
                command.CommandType = CommandType.StoredProcedure
                command.Parameters.Add("@Date", SqlDbType.NVarChar)
                command.Parameters.Add("@LocationType", SqlDbType.NVarChar)
                command.Parameters("@Date").Value = Request.QueryString("Date")
                command.Parameters("@LocationType").Value = Request.QueryString("LocationType")
                Dim reader As SqlDataReader = command.ExecuteReader()
                Res = "["
                While reader.Read()
                    Res += "{" + """تاریخ"":""" + reader.Item(0).ToString + """," + """نام سرپرستی"":""" + reader.Item(1).ToString + """," + """نوع"":""" + reader.Item(2).ToString + """," + """قرض الحسنه جاری"":""" + reader.Item(3).ToString + """," + """قرض الحسنه پس انداز"":""" + reader.Item(4).ToString + """," + """کوتاه مدت"":""" + reader.Item(5).ToString + """," + """بلند مدت"":""" + reader.Item(6).ToString + """," + """جمع کل"":""" + reader.Item(7).ToString + """," + """میزان رشد"":""" + reader.Item(8).ToString + """," + """درصد رشد"":""" + reader.Item(9).ToString + """},"
                End While
                Res = Res.Substring(0, Res.Length - 1) + "]"
            Finally
                If command IsNot Nothing Then command.Dispose()
                If connection IsNot Nothing AndAlso connection.State <> ConnectionState.Closed Then connection.Close()
            End Try
            Response.Write(Res)


        End Using
    End Sub

End Class
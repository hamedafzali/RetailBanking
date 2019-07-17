<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="News.aspx.vb" Inherits="RetailBanking.News" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head" runat="server">

    <title>سامانه اطلاعات دفاتر پست بانک ایران</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.js"></script>
    <script src="js/MD5.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/resume.min.css" rel="stylesheet">
</head>
<body>

    <form id="form1" runat="server">
        <div>

            <div class="table-responsive">
                <table class="table text-right">
                    <thead>
                        <tr>

                            <th>وضعیت</th>
                            <th>تاریخ</th>
                            <th>شرح</th>
                            <th>عنوان</th>
                            <th>#</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>

                            <td>
                                <asp:DropDownList ID="drpStatus" runat="server" Font-Names="Tahoma" Width="150px">
                                    <asp:ListItem Value="1">فعال</asp:ListItem>
                                    <asp:ListItem Value="0">آرشیو</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDate" runat="server" TextMode="Date" Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtNews" runat="server" TextMode="MultiLine" Width="500px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTitle" runat="server" Width="400px"></asp:TextBox>
                            </td>
                            <td>1</td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>
    </form>
    <p>
        <input id="Button1" type="button" value="button" onclick="javascript: alert(CryptoJS.MD5(password));" /></p>
</body>
</html>

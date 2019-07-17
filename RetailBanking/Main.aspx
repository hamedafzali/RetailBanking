<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Main.aspx.vb" Inherits="RetailBanking.Main" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head" runat="server">
   
    <title>سامانه اطلاعات دفاتر پست بانک ایران</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/resume.min.css" rel="stylesheet">
</head>
<form id="form2" runat="server">
    <body id="page-top  ">
        <nav class="navbar  bg-success">
            <div class="container-fluid">
                <div class="navbar-header">
                    <img src="img/logo.jpg" class="img-circle" alt="Cinque Terre" width="50" height="50">
                </div>
                <div runat="server" id="MenuNav">

                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Page 1-1</a></li>
                                <li><a href="#">Page 1-2</a></li>
                                <li><a href="#">Page 1-3</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Page 2</a></li>
                    </ul>
                </div>
                <form class="navbar-form navbar-left" action="/action_page.php">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search" name="search">
                        <div class="input-group-btn">
                            <button class="btn btn-success" type="submit">جستجو</button>
                        </div>
                    </div>
                </form>
            </div>
        </nav>
        <div runat="server" id="tblResult1" class="center-block" style="width: 80%"></div>
        
    </body>
</form>
</html>

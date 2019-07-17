<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AmountSupervisorReport.aspx.vb" Inherits="RetailBanking.AmountSupervisorReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head" runat="server">

    <title>سامانه اطلاعات دفاتر پست بانک ایران</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/resume.min.css" rel="stylesheet"/>
    <script src="js/jquery.columns-1.0.min.js"></script> 
    <link type="text/css" rel="stylesheet" href="css/kamadatepicker.css" />
    <script src="js/kamadatepicker.js"></script>
    <link id="style" href="css/classic.css" rel="stylesheet" media="screen"/>
    <script>
        $(document).ready(function () {
            $("#btnPrint").click(function () {
                //$("#ResultGrid").val().
            });
            $("#btnShow").click(function () {
                
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "DBAccess.aspx?Date="+$("#date1").val()+"&LocationType="+$("select#drpLocationType").val(),
                    data: "{}",
                    dataType: "json",
                    success: function (data) {
                        $('#ResultGrid').columns({
                            data: data
                        }),
                        $("#lblDate").text("گزارش منابع دفاتر منتهی به"+$("#date1").val())
                    },
                    error: function (result) {
                        alert("error");
                        
                    }
                });
            });
        });

</script>
</head>
<body id="page-top">
    <form id="form1" runat="server" class="text-right">
        
             <div class="col-sm-4">
                <input type="button" value="نمایش" id="btnShow" /></div>
            
            <div class="col-sm-4">
                <input type="text" id="date1"/></div>
           <div class="col-sm-4"><span>:تاریخ را انتخاب کنید</span></div>
            

        
        <div class="row">
            <input type="button" value="چاپ" id="btnPrint" />
            <div class="col-sm-4"><select id="drpLocationType" name="D1">
            <option>شهری</option>
            <option>روستایی</option>
            </select></div></div>
        <div><h3><label id="lblDate" ></label> </h3></div>
        <div id="ResultGrid" class="glyphicon-text-color"></div>
    </form>
    <script>
        kamaDatepicker('date1', { buttonsColor: "red" });

        var customOptions = {
            placeholder: "روز / ماه / سال"
			, twodigit: false
			, closeAfterSelect: false
			, nextButtonIcon: "fa fa-arrow-circle-right"
			, previousButtonIcon: "fa fa-arrow-circle-left"
			, buttonsColor: "blue"
			, forceFarsiDigits: true
			, markToday: true
			, markHolidays: true
			, highlightSelectedDay: true
			, sync: true
			, gotoToday: true
        }


        // for testing sync functionallity
        $("#date2").val("1311/10/01");
    </script>
</body>
</html>

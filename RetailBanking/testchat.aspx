﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="testchat.aspx.vb" Inherits="RetailBanking.testchat" %>
<!DOCTYPE html>
<html lang="en" ng-app="app">
<head>
  <meta charset="UTF-8">
  <title>
    AngularJS+Bootstrap Simple Chat Directive Sample
  </title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <link
    rel="stylesheet"
    href="../bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link
    rel="stylesheet"
    href="../src/css/style.css">

    <link
    rel="stylesheet"
    href="../src/css/themes.css">

  <link
    rel="stylesheet"
    href="style.css">
</head>
<body ng-controller="Shell as vm">

    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
      Launch Bootstrap modal
    </button>
    <button type="button" onclick="openInExternalWindow()" class="btn btn-primary btn-lg">
      Launch External window
    </button>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Modal title</h4>
          </div>
          <div class="modal-body">
            <irontec-simple-chat
                messages="vm.messages"
                username="vm.username"
                input-placeholder-text="You can write here"
                submit-button-text="Send your message"
                title="Super Awesome Chat"
                theme="material"
                submit-function="vm.sendMessage"
                visible="true">
              </irontec-simple-chat>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Save changes</button>
          </div>
        </div>
      </div>
    </div>


    <script src="../bower_components/lodash/dist/lodash.js"></script>
    <script src="../bower_components/jquery/dist/jquery.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="../bower_components/angular/angular.js"></script>

    <script>
        function openInExternalWindow() {
            window.open("index.html", "", "width=400, height=600");
        }
    </script>

    <script src="../src/scripts/index.js"></script>

    <script src="app.js"></script>

</body>
</html>
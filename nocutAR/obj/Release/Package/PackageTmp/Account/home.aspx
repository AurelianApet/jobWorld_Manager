<%@ Page Language="C#"  MasterPageFile="~/Account/UserPage.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="jobworld.Account.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    var step_value = 0;

    function InitContent()
    {
        if(step_value == 0)
        {
            $.ajax({
                url:'InitContent.aspx?step=0',
                type:"post",
                async:false,
                success:function(data)
                {
                    document.getElementById("step0").innerHTML = data;
                    document.getElementById("step0").style.display = "";
                    document.getElementById("step1").style.display = "none";
                    document.getElementById("step2").style.display = "none";
                    document.getElementById("step3").style.display = "none";
                    document.getElementById("gotoprevstep").style.display = "none";
                },
                error:function(data){
                }
            });
        }
        else if(step_value == 1)
        {
            $.ajax({
                url:'InitContent.aspx?step=1',
                type:"post",
                async:false,
                success:function(data)
                {
                    document.getElementById("step1").innerHTML = data;
                    document.getElementById("step1").style.display = "";
                    document.getElementById("step0").style.display = "none";
                    document.getElementById("step2").style.display = "none";
                    document.getElementById("step3").style.display = "none";
                    document.getElementById("gotoprevstep").style.display = "";
                },
                error:function(data){
                }
            });
        }
        if(step_value == 2)
        {
            $.ajax({
                url:'InitContent.aspx?step=2',
                type:"post",
                async:false,
                success:function(data)
                {
                    document.getElementById("step2").innerHTML = data;
                    document.getElementById("step2").style.display = "";
                    document.getElementById("step0").style.display = "none";
                    document.getElementById("step1").style.display = "none";
                    document.getElementById("step3").style.display = "none";
                    document.getElementById("gotoprevstep").style.display = "";
                },
                error:function(data){
                }
            });
        }
        if(step_value == 3)
        {
            $.ajax({
                url:'InitContent.aspx?step=3',
                type:"post",
                async:false,
                success:function(data)
                {
                    document.getElementById("step3").innerHTML = data;
                    document.getElementById("step3").style.display = "";
                    document.getElementById("step0").style.display = "none";
                    document.getElementById("step2").style.display = "none";
                    document.getElementById("step1").style.display = "none";
                    document.getElementById("gotoprevstep").style.display = "";
                },
                error:function(data){
                }
            });
        }
    }

    $(document).ready(function () {
        document.getElementById("menu1").style.background = "#2d96c1";
        document.getElementById("menu2").style.background = "";
        document.getElementById("menu3").style.background = "";
        $.ajax({
            url: 'getInitStatue.aspx',
            type: "post",
            async: false,
            success: function (data) {
                if (data != "")
                {
                    step_value = data;
                }
            },
            error: function (data) {
            }
        });

        if (step_value == 0)
        {
            document.getElementById("gotoprevstep").style.display = "none";
            document.getElementById("gotonextstep").style.display = "";
            document.getElementById("gotonextstepvalue").innerText = "잠금해제";
            document.getElementById("top_content").innerHTML = "STEP0:체험 전 대기";
        }
        else if (step_value == 1)
        {
            document.getElementById("gotoprevstep").style.display = "";
            document.getElementById("gotonextstepvalue").innerText = "체험시작";
            document.getElementById("gotonextstep").style.display = "none";
            document.getElementById("top_content").innerHTML = "STEP1:로그인/신문사명 세팅";
        }
        else if (step_value == 2) {
            document.getElementById("gotoprevstep").style.display = "";
            document.getElementById("gotonextstepvalue").innerText = "체험종료";
            document.getElementById("gotonextstep").style.display = "none";
            document.getElementById("top_content").innerHTML = "STEP2: 체험 진행 현황";
        }
        else if (step_value == 3) {
            document.getElementById("gotonextstepvalue").innerText = "저장 및 종료";
            document.getElementById("gotoprevstep").style.display = "";
            document.getElementById("gotonextstep").style.display = "";
            document.getElementById("top_content").innerHTML = "STEP3:편집회의";
        }
        InitContent();
    });

    function processStep1Type1(num, x)
    {
        try {
            var id = x[i].getElementsByTagName("id")[num].childNodes[0].nodeValue;
        }
        catch (e) {

        }
        try {
            var content = x[i].getElementsByTagName("content")[num].childNodes[0].nodeValue;
            content = content.substr(0, 6);
        }
        catch (e) {

        }
        try {
            var coltxt = "collector" + (id - 1);
        }
        catch (e) {

        }
        if (content != null)
            document.getElementById(coltxt).value = content;
        try {
            var email = x[i].getElementsByTagName("email")[num].childNodes[0].nodeValue;
            email = email.substr(0,27);
            var c_email = "c_email" + (id - 1);
            document.getElementById(c_email).value = email;
        }
        catch (e) {

        }
        try {
            var btnCol = "btnCol" + (id - 1);
            document.getElementById(btnCol).innerText = "준비";
            var dvCol = "dvCol" + (id - 1);
            document.getElementById(dvCol).setAttribute("class", "btn_rgt btn_ablu");
        }
        catch (e) {

        }
    }

    function processStep1Type2(num, x)
    {
        try {
            var id = x[i].getElementsByTagName("id")[num].childNodes[0].nodeValue;
        }
        catch (e) {

        }
        try {
            var content = x[i].getElementsByTagName("content")[num].childNodes[0].nodeValue;
            content = content.substr(0, 6);
        }
        catch (e) {

        }
        try {
            var editxt = "editor" + (id - 1);
            document.getElementById(editxt).value = content;
        }
        catch (e) {

        }

        try {
            var email = x[i].getElementsByTagName("email")[num].childNodes[0].nodeValue;
            email = email.substr(0,27);
            var e_email = "e_email" + (id - 1);
            document.getElementById(e_email).value = email;
        }
        catch (e) {

        }

        try {
            var btnEdi = "btnEdi" + (id - 1);
            document.getElementById(btnEdi).innerText = "준비";
            var dvEdi = "dvEdi" + (id - 1);
            document.getElementById(dvEdi).setAttribute("class", "btn_rgt btn_ablu");
        }
        catch (e) {

        }
    }

    function processStep1Type3(num, x)
    {
        try {
            var id = x[i].getElementsByTagName("id")[num].childNodes[0].nodeValue;
        }
        catch (e) {

        }
        try {
            var content = x[i].getElementsByTagName("content")[num].childNodes[0].nodeValue;
            content = content.substr(0, 6);
        }
        catch (e) {

        }
        try {
            var newsType = x[i].getElementsByTagName("newsType")[num].childNodes[0].nodeValue;
        }
        catch (e) {

        }
        try {
            var place = x[i].getElementsByTagName("place")[num].childNodes[0].nodeValue;
            place = place.substr(0, 6);
        }
        catch (e) {

        }
        var comimg = "comimg" + id;
        if (newsType == "0") {
            var imagesrc = "../images/ad_ic_i.png";
        }
        else if (newsType == "1") {
            var imagesrc = "../images/ad_ic_p.png";
        }
        try {
            var com = "company" + (id - 1);
            if (place == null)
                place = "";
            document.getElementById(com).innerHTML = "<span class='num'>" + id + "</span>" + content + "<span>" + place + "</span>" + "<img id='comimg" + (id - 1) + "' src = '" + imagesrc + "' />";

            var dvCom = "li" + (id - 1);
            document.getElementById(dvCom).setAttribute("class", "on");
        }
        catch (e) {

        }
    }

    function processStep2Type1(num, x) {
        try {
            var id = x[i].getElementsByTagName("id")[num].childNodes[0].nodeValue;
        }
        catch (e) {

        }
        try {
            var content = x[i].getElementsByTagName("content")[num].childNodes[0].nodeValue;
        }
        catch (e) {

        }
        try {
            var coltxt = "collector1" + (id - 1);
        }
        catch (e) {

        }
        if (content != null) {
            try {
                document.getElementById(coltxt).value = content.substr(0, 6);
            }
            catch (e) {

            }
        }
        try {
            var btnCol = "btnCol1" + (id - 1);
            document.getElementById(btnCol).style.display = "";
        }
        catch (e) {

        }
        try {
            var id1 = x[i].getElementsByTagName("id1")[num].childNodes[0].nodeValue;
            var btnCol1 = "btnCol1" + (id1 - 1);
            document.getElementById(btnCol1).innerText = "완료";
        }
        catch (e) {

        }

        try {
            var email = x[i].getElementsByTagName("email")[num].childNodes[0].nodeValue;
            var c_email = "c_email1" + (id - 1);
            document.getElementById(c_email).value = email.substr(0,27);
        }
        catch (e) {

        }
        try {
            var dvCol1 = "dvCol1" + (id - 1);
            document.getElementById(dvCol1).setAttribute("class", "btn_rgt btn_ablu");
        }
        catch (e) {

        }
    }

    function processStep2Type2(num, x) {
        try {
            var id = x[i].getElementsByTagName("id")[num].childNodes[0].nodeValue;
        }
        catch (e) {

        }
        try {
            var content = x[i].getElementsByTagName("content")[num].childNodes[0].nodeValue;
        }
        catch (e) {

        }
        try {
            var editxt = "editor1" + (id - 1);
        }
        catch (e) {

        }
        if (content != null) {
            try {
                document.getElementById(editxt).value = content.substr(0, 6);
            }
            catch (e) {

            }
        }

        try {
            var btnEdi = "btnEdi1" + (id - 1);
            document.getElementById(btnEdi).style.display = "";
        }
        catch (e) {

        }

        var comimg = "comimg1" + i;
        //                        document.getElementById(comimg).src = "../images/ad_ic_i.png";

        try {
            var id1 = x[i].getElementsByTagName("id1")[num].childNodes[0].nodeValue;
            var btnEdi1 = "btnEdi1" + (id1 - 1);
            document.getElementById(btnEdi1).innerText = "완료";
        }
        catch (e) {

        }

        try {
            var email = x[i].getElementsByTagName("email")[num].childNodes[0].nodeValue;
            var e_email = "e_email1" + (id - 1);
            document.getElementById(e_email).value = email.substr(0,27);
        }
        catch (e) {

        }
        try {
            var dvEdi1 = "dvEdi1" + (id - 1);
            document.getElementById(dvEdi1).setAttribute("class", "btn_rgt btn_ablu");
        }
        catch (e) {

        }
    }

    function processStep2Type3(num, x) {
        try {
            var id = x[i].getElementsByTagName("id")[num].childNodes[0].nodeValue;
        }
        catch (e) {

        }
        try {
            var content = x[i].getElementsByTagName("content")[num].childNodes[0].nodeValue;
            content1 = content;
        }
        catch (e) {

        }
        try {
            var place = x[i].getElementsByTagName("place")[num].childNodes[0].nodeValue;
        }
        catch (e) {

        }
        try {
            var newsType = x[i].getElementsByTagName("newsType")[num].childNodes[0].nodeValue;
        }
        catch (e) {

        }
        var comimg = "comimg1" + id;
        if (newsType == "0") {
            var imagesrc = "../images/ad_ic_i.png";
        }
        else if (newsType == "1") {
            var imagesrc = "../images/ad_ic_p.png";
        }
        var com = "company1" + (id - 1);
        if (place == null)
            place = "";
        try {
            content = content.substr(0, 6);
        }
        catch (e) {
        }
        content += "<span>" + place.substr(0, 6) + "</span>" + "<img id='comimg1"
            + (id - 1)
            + "' src = '" + imagesrc + "' />"
            + "<em class='btn_pos btn_agry2' style='display:none;' id = 'btnCom1"
            + (id - 1)
            + "'><a id='DsetCom"
            + (id - 1)
            + "' style='cursor:pointer' onclick = 'DsetCom("
            + (id - 1)
            + ")'>확인</a></em>";
        if (content != null)
            document.getElementById(com).innerHTML = content;
        try {
            var btnCom = "btnCom1" + (id - 1);
            //                            document.getElementById(btnCom).style.display = "";
            var dvCom = "li1" + (id - 1);
            document.getElementById(dvCom).setAttribute("class", "on");
        }
        catch (e) {

        }
    }

    function loadlink() {
/*
        if (step_value == 1)
        {
            $.ajax({
                url: 'getExperience.aspx?step=1&type=1',
                type: "post",
                async: false,
                success: function (data) {
                    var xmlDoc = new DOMParser().parseFromString(data, 'text/xml');
                    var x = xmlDoc.getElementsByTagName("collector");
                    for (var i = 0; i < x.length; i++) {
                        processStep1Type1(i, x);
                    }
                },
                error: function (data) {
                }
            });

            $.ajax({
                url: 'getExperience.aspx?step=1&type=2',
                type: "post",
                async: false,
                success: function (data) {
                    var xmlDoc = new DOMParser().parseFromString(data, 'text/xml');
                    var x = xmlDoc.getElementsByTagName("editor");
                    for (var i = 0; i < x.length; i++) {
                        processStep1Type2(i, x);
                    }
                },
                error: function (data) {
                }
            });

            $.ajax({
                url: 'getExperience.aspx?step=1&type=3',
                type: "post",
                async: false,
                success: function (data) {
                    try{
                        var xmlDoc = new DOMParser().parseFromString(data, 'text/xml');
                    }
                    catch (e) {

                    }
                    try{
                        var x = xmlDoc.getElementsByTagName("company");
                    }
                    catch (e) {

                    }
                    for (var i = 0; i < x.length; i++) {
                        processStep1Type3(i, x);
                    }
                },
                error: function (data) {
                }
            });

            var ready = true;
            var ct = 0;
            for (var i = 0; i < 6; i++) {
                var btnCol = "btnCol" + i;
                var btnEdi = "btnEdi" + i;
                if (document.getElementById(btnCol).innerText == '준비') {
                    ct++;
                    if (document.getElementById(btnEdi).innerText != '준비') {
                        return false;
                    }
                }
                if (document.getElementById(btnEdi).innerText == '준비') {
                    ct++;
                    if (document.getElementById(btnCol).innerText != '준비') {
                        return false;
                    }
                }
            }
            if (ready == true && ct != 0) {
                document.getElementById("gotonextstep").style.display = "";
            }
        }
        else if (step_value == 2) {
            $.ajax({
                url: 'getExperience.aspx?step=2&type=1',
                type: "post",
                async: false,
                success: function (data) {
                    try {
                        var xmlDoc = new DOMParser().parseFromString(data, 'text/xml');
                    }
                    catch (e) {

                    }
                    try {
                        var x = xmlDoc.getElementsByTagName("collector");
                    }
                    catch (e) {

                    }
                    for (var i = 0; i < x.length; i++) {
                        processStep2Type1(i, x);
                    }
                },
                error: function (data) {
                }
            });

            $.ajax({
                url: 'getExperience.aspx?step=2&type=2',
                type: "post",
                async: false,
                success: function (data) {
                    var xmlDoc = new DOMParser().parseFromString(data, 'text/xml');
                    var x = xmlDoc.getElementsByTagName("editor");
                    for (var i = 0; i < x.length; i++) {
                        processStep2Type2(i, x);
                    }
                },
                error: function (data) {
                }
            });

            $.ajax({
                url: 'getExperience.aspx?step=2&type=3',
                type: "post",
                async: false,
                success: function (data) {
                    try{
                        var xmlDoc = new DOMParser().parseFromString(data, 'text/xml');
                    }
                    catch (e) {

                    }
                    try{
                        var x = xmlDoc.getElementsByTagName("company");
                    }
                    catch(e)
                    {

                    }
                    for (var i = 0; i < x.length; i++) {
                        processStep2Type3(i, x);
                    }
                },
                error: function (data) {
                }
            });

            var ready = true;
            var ct = 0;
            for (var i = 0; i < 6; i++) {
                var btnCol1 = "btnCol1" + i;
                var btnEdi1 = "btnEdi1" + i;
                var li1 = "li1" + i;
                if (document.getElementById(btnCol1).innerText != '완료' || document.getElementById(btnEdi1).innerText != '완료') {
                    try {
                        document.getElementById("btnCom1" + i).style.display = "none";
                    }
                    catch (e) {

                    }
                }
                if (document.getElementById(btnCol1).innerText == '완료') {
                    ct++;
                    if (document.getElementById(btnEdi1).innerText != '완료') {
                        return false;
                    }
                }
                if (document.getElementById(btnEdi1).innerText == '완료') {
                    ct++;
                    if (document.getElementById(btnCol1).innerText != '완료') {
                        return false;
                    }
                }
            }
            if (ready == true && ct != 0) {
                document.getElementById("gotonextstep").style.display = "";
            }
        }
*/

        if (step_value == 1) {
            $.ajax({
                url: 'getExperience.aspx?step=1&type=1',
                type: "post",
                async: false,
                success: function (data) {
                    var xmlDoc = new DOMParser().parseFromString(data, 'text/xml');
                    var x = xmlDoc.getElementsByTagName("collector");
                    for (i = 0; i < x.length; i++) {
                        try {
                            var id = x[i].getElementsByTagName("id")[0].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[0].childNodes[0].nodeValue;
                            content = content.substr(0, 6);
                        }
                        catch (e) {

                        }
                        try {
                            var coltxt = "collector" + (id - 1);
                        }
                        catch (e) {

                        }
                        if (content != null)
                            document.getElementById(coltxt).value = content;
                        try {
                            var email = x[i].getElementsByTagName("email")[0].childNodes[0].nodeValue;
                            email = email.substr(0,27);
                            var c_email = "c_email" + (id - 1);
                            document.getElementById(c_email).value = email;
                        }
                        catch (e) {

                        }
                        try {
                            var btnCol = "btnCol" + (id - 1);
                            document.getElementById(btnCol).innerText = "준비";
                            var dvCol = "dvCol" + (id - 1);
                            document.getElementById(dvCol).setAttribute("class", "btn_rgt btn_ablu");
                        }
                        catch (e) {

                        }

                        try {
                            var id = x[i].getElementsByTagName("id")[1].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[1].childNodes[0].nodeValue;
                            content = content.substr(0, 6);
                        }
                        catch (e) {

                        }
                        try {
                            var coltxt = "collector" + (id - 1);
                        }
                        catch (e) {

                        }
                        if (content != null)
                            document.getElementById(coltxt).value = content;
                        try {
                            var email = x[i].getElementsByTagName("email")[1].childNodes[0].nodeValue;
                            email = email.substr(0,27);
                            var c_email = "c_email" + (id - 1);
                            document.getElementById(c_email).value = email;
                        }
                        catch (e) {

                        }
                        try {
                            var btnCol = "btnCol" + (id - 1);
                            document.getElementById(btnCol).innerText = "준비";
                            var dvCol = "dvCol" + (id - 1);
                            document.getElementById(dvCol).setAttribute("class", "btn_rgt btn_ablu");
                        }
                        catch (e) {

                        }
                        try {
                            var id = x[i].getElementsByTagName("id")[2].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[2].childNodes[0].nodeValue;
                            content = content.substr(0, 6);
                        }
                        catch (e) {

                        }
                        try {
                            var coltxt = "collector" + (id - 1);
                        }
                        catch (e) {

                        }
                        if (content != null)
                            document.getElementById(coltxt).value = content;
                        try {
                            var email = x[i].getElementsByTagName("email")[2].childNodes[0].nodeValue;
                            email = email.substr(0,27);
                            var c_email = "c_email" + (id - 1);
                            document.getElementById(c_email).value = email;
                        }
                        catch (e) {

                        }
                        try {
                            var btnCol = "btnCol" + (id - 1);
                            document.getElementById(btnCol).innerText = "준비";
                            var dvCol = "dvCol" + (id - 1);
                            document.getElementById(dvCol).setAttribute("class", "btn_rgt btn_ablu");
                        }
                        catch (e) {

                        }

                        try {
                            var id = x[i].getElementsByTagName("id")[3].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[3].childNodes[0].nodeValue;
                            content = content.substr(0, 6);
                        }
                        catch (e) {

                        }
                        try {
                            var coltxt = "collector" + (id - 1);
                        }
                        catch (e) {

                        }
                        if (content != null)
                            document.getElementById(coltxt).value = content;
                        try {
                            var email = x[i].getElementsByTagName("email")[3].childNodes[0].nodeValue;
                            email = email.substr(0,27);
                            var c_email = "c_email" + (id - 1);
                            document.getElementById(c_email).value = email;
                        }
                        catch (e) {

                        }
                        try {
                            var btnCol = "btnCol" + (id - 1);
                            document.getElementById(btnCol).innerText = "준비";
                            var dvCol = "dvCol" + (id - 1);
                            document.getElementById(dvCol).setAttribute("class", "btn_rgt btn_ablu");
                        }
                        catch (e) {

                        }

                        try {
                            var id = x[i].getElementsByTagName("id")[4].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[4].childNodes[0].nodeValue;
                            content = content.substr(0, 6);
                        }
                        catch (e) {

                        }
                        try {
                            var coltxt = "collector" + (id - 1);
                        }
                        catch (e) {

                        }
                        if (content != null)
                            document.getElementById(coltxt).value = content;
                        try {
                            var email = x[i].getElementsByTagName("email")[4].childNodes[0].nodeValue;
                            email = email.substr(0,27);
                            var c_email = "c_email" + (id - 1);
                            document.getElementById(c_email).value = email;
                        }
                        catch (e) {

                        }
                        try {
                            var btnCol = "btnCol" + (id - 1);
                            document.getElementById(btnCol).innerText = "준비";
                            var dvCol = "dvCol" + (id - 1);
                            document.getElementById(dvCol).setAttribute("class", "btn_rgt btn_ablu");
                        }
                        catch (e) {

                        }

                        try {
                            var id = x[i].getElementsByTagName("id")[5].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[5].childNodes[0].nodeValue;
                            content = content.substr(0, 6);
                        }
                        catch (e) {

                        }
                        try {
                            var coltxt = "collector" + (id - 1);
                        }
                        catch (e) {

                        }
                        if (content != null)
                            document.getElementById(coltxt).value = content;
                        try {
                            var email = x[i].getElementsByTagName("email")[5].childNodes[0].nodeValue;
                            email = email.substr(0,27);
                            var c_email = "c_email" + (id - 1);
                            document.getElementById(c_email).value = email;
                        }
                        catch (e) {

                        }
                        try {
                            var btnCol = "btnCol" + (id - 1);
                            document.getElementById(btnCol).innerText = "준비";
                            var dvCol = "dvCol" + (id - 1);
                            document.getElementById(dvCol).setAttribute("class", "btn_rgt btn_ablu");
                        }
                        catch (e) {

                        }
                    }
                },
                error: function (data) {
                }
            });

            $.ajax({
                url: 'getExperience.aspx?step=1&type=2',
                type: "post",
                async: false,
                success: function (data) {
                    var xmlDoc = new DOMParser().parseFromString(data, 'text/xml');
                    var x = xmlDoc.getElementsByTagName("editor");
                    for (i = 0; i < x.length; i++) {
                        try {
                            var id = x[i].getElementsByTagName("id")[0].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[0].childNodes[0].nodeValue;
                            content = content.substr(0, 6);
                        }
                        catch (e) {

                        }
                        try {
                            var editxt = "editor" + (id - 1);
                            document.getElementById(editxt).value = content;
                        }
                        catch (e) {

                        }

                        try {
                            var email = x[i].getElementsByTagName("email")[0].childNodes[0].nodeValue;
                            email = email.substr(0,27);
                            var e_email = "e_email" + (id - 1);
                            document.getElementById(e_email).value = email;
                        }
                        catch (e) {

                        }

                        try {
                            var btnEdi = "btnEdi" + (id - 1);
                            document.getElementById(btnEdi).innerText = "준비";
                            var dvEdi = "dvEdi" + (id - 1);
                            document.getElementById(dvEdi).setAttribute("class", "btn_rgt btn_ablu");
                        }
                        catch (e) {

                        }

                        try {
                            var id = x[i].getElementsByTagName("id")[1].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[1].childNodes[0].nodeValue;
                            content = content.substr(0, 6);
                        }
                        catch (e) {

                        }
                        try {
                            var editxt = "editor" + (id - 1);
                            document.getElementById(editxt).value = content;
                        }
                        catch (e) {

                        }

                        try {
                            var email = x[i].getElementsByTagName("email")[1].childNodes[0].nodeValue;
                            email = email.substr(0,27);
                            var e_email = "e_email" + (id - 1);
                            document.getElementById(e_email).value = email;
                        }
                        catch (e) {

                        }
                        try {
                            var btnEdi = "btnEdi" + (id - 1);
                            document.getElementById(btnEdi).innerText = "준비";
                            var dvEdi = "dvEdi" + (id - 1);
                            document.getElementById(dvEdi).setAttribute("class", "btn_rgt btn_ablu");
                        }
                        catch (e) {

                        }

                        try {
                            var id = x[i].getElementsByTagName("id")[2].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[2].childNodes[0].nodeValue;
                            content = content.substr(0, 6);
                        }
                        catch (e) {

                        }
                        try {
                            var editxt = "editor" + (id - 1);
                            document.getElementById(editxt).value = content;
                        }
                        catch (e) {

                        }

                        try {
                            var email = x[i].getElementsByTagName("email")[2].childNodes[0].nodeValue;
                            email = email.substr(0,27);
                            var e_email = "e_email" + (id - 1);
                            document.getElementById(e_email).value = email;
                        }
                        catch (e) {

                        }
                        try {
                            var btnEdi = "btnEdi" + (id - 1);
                            document.getElementById(btnEdi).innerText = "준비";
                            var dvEdi = "dvEdi" + (id - 1);
                            document.getElementById(dvEdi).setAttribute("class", "btn_rgt btn_ablu");
                        }
                        catch (e) {

                        }

                        try {
                            var id = x[i].getElementsByTagName("id")[3].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[3].childNodes[0].nodeValue;
                            content = content.substr(0, 6);
                        }
                        catch (e) {

                        }
                        try {
                            var editxt = "editor" + (id - 1);
                            document.getElementById(editxt).value = content;
                        }
                        catch (e) {

                        }

                        try {
                            var email = x[i].getElementsByTagName("email")[3].childNodes[0].nodeValue;
                            email = email.substr(0,27);
                            var e_email = "e_email" + (id - 1);
                            document.getElementById(e_email).value = email;
                        }
                        catch (e) {

                        }
                        try {
                            var btnEdi = "btnEdi" + (id - 1);
                            document.getElementById(btnEdi).innerText = "준비";
                            var dvEdi = "dvEdi" + (id - 1);
                            document.getElementById(dvEdi).setAttribute("class", "btn_rgt btn_ablu");
                        }
                        catch (e) {

                        }

                        try {
                            var id = x[i].getElementsByTagName("id")[4].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[4].childNodes[0].nodeValue;
                            content = content.substr(0, 6);
                        }
                        catch (e) {

                        }
                        try {
                            var editxt = "editor" + (id - 1);
                            document.getElementById(editxt).value = content;
                        }
                        catch (e) {

                        }

                        try {
                            var email = x[i].getElementsByTagName("email")[4].childNodes[0].nodeValue;
                            email = email.substr(0,27);
                            var e_email = "e_email" + (id - 1);
                            document.getElementById(e_email).value = email;
                        }
                        catch (e) {

                        }
                        try {
                            var btnEdi = "btnEdi" + (id - 1);
                            document.getElementById(btnEdi).innerText = "준비";
                            var dvEdi = "dvEdi" + (id - 1);
                            document.getElementById(dvEdi).setAttribute("class", "btn_rgt btn_ablu");
                        }
                        catch (e) {

                        }

                        try {
                            var id = x[i].getElementsByTagName("id")[5].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[5].childNodes[0].nodeValue;
                            content = content.substr(0, 6);
                        }
                        catch (e) {

                        }
                        try {
                            var editxt = "editor" + (id - 1);
                            document.getElementById(editxt).value = content;
                        }
                        catch (e) {

                        }

                        try {
                            var email = x[i].getElementsByTagName("email")[5].childNodes[0].nodeValue;
                            email = email.substr(0,27);
                            var e_email = "e_email" + (id - 1);
                            document.getElementById(e_email).value = email;
                        }
                        catch (e) {

                        }
                        try {
                            var btnEdi = "btnEdi" + (id - 1);
                            document.getElementById(btnEdi).innerText = "준비";
                            var dvEdi = "dvEdi" + (id - 1);
                            document.getElementById(dvEdi).setAttribute("class", "btn_rgt btn_ablu");
                        }
                        catch (e) {

                        }
                    }
                },
                error: function (data) {
                }
            });

            $.ajax({
                url: 'getExperience.aspx?step=1&type=3',
                type: "post",
                async: false,
                success: function (data) {
                    try {
                        var xmlDoc = new DOMParser().parseFromString(data, 'text/xml');
                    }
                    catch (e) {

                    }
                    try {
                        var x = xmlDoc.getElementsByTagName("company");
                    }
                    catch (e) {

                    }
                    for (i = 0; i < x.length; i++) {
                        try {
                            var id = x[i].getElementsByTagName("id")[0].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[0].childNodes[0].nodeValue;
                            content = content.substr(0, 6);
                        }
                        catch (e) {

                        }
                        try {
                            var newsType = x[i].getElementsByTagName("newsType")[0].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var place = x[i].getElementsByTagName("place")[0].childNodes[0].nodeValue;
                            place = place.substr(0, 6);
                        }
                        catch (e) {

                        }
                        var comimg = "comimg" + id;
                        if (newsType == "0") {
                            var imagesrc = "../images/ad_ic_i.png";
                        }
                        else if (newsType == "1") {
                            var imagesrc = "../images/ad_ic_p.png";
                        }
                        try {
                            var com = "company" + (id - 1);
                            if (place == null)
                                place = "";
                            document.getElementById(com).innerHTML = "<span class='num'>" + id + "</span>" + content + "<span>" + place + "</span>" + "<img id='comimg" + (id - 1) + "' src = '" + imagesrc + "' />";

                            var dvCom = "li" + (id - 1);
                            document.getElementById(dvCom).setAttribute("class", "on");
                        }
                        catch (e) {

                        }

                        try {
                            var id = x[i].getElementsByTagName("id")[1].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[1].childNodes[0].nodeValue;
                            content = content.substr(0, 6);
                        }
                        catch (e) {

                        }
                        try {
                            var newsType = x[i].getElementsByTagName("newsType")[1].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var place = x[i].getElementsByTagName("place")[1].childNodes[0].nodeValue;
                            place = place.substr(0, 6);
                        }
                        catch (e) {

                        }
                        var comimg = "comimg" + id;
                        if (newsType == "0") {
                            var imagesrc = "../images/ad_ic_i.png";
                        }
                        else if (newsType == "1") {
                            var imagesrc = "../images/ad_ic_p.png";
                        }
                        try {
                            var com = "company" + (id - 1);
                            if (place == null)
                                place = "";
                            document.getElementById(com).innerHTML = "<span class='num'>" + id + "</span>" + content + "<span>" + place + "</span>" + "<img id='comimg" + (id - 1) + "' src = '" + imagesrc + "' />";

                            var dvCom = "li" + (id - 1);
                            document.getElementById(dvCom).setAttribute("class", "on");
                        }
                        catch (e) {

                        }
                        try {
                            var id = x[i].getElementsByTagName("id")[2].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[2].childNodes[0].nodeValue;
                            content = content.substr(0, 6);
                        }
                        catch (e) {

                        }
                        try {
                            var newsType = x[i].getElementsByTagName("newsType")[2].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var place = x[i].getElementsByTagName("place")[2].childNodes[0].nodeValue;
                            place = place.substr(0, 6);
                        }
                        catch (e) {

                        }
                        var comimg = "comimg" + id;
                        if (newsType == "0") {
                            var imagesrc = "../images/ad_ic_i.png";
                        }
                        else if (newsType == "1") {
                            var imagesrc = "../images/ad_ic_p.png";
                        }
                        try {
                            var com = "company" + (id - 1);
                            if (place == null)
                                place = "";
                            document.getElementById(com).innerHTML = "<span class='num'>" + id + "</span>" + content + "<span>" + place + "</span>" + "<img id='comimg" + (id - 1) + "' src = '" + imagesrc + "' />";

                            var dvCom = "li" + (id - 1);
                            document.getElementById(dvCom).setAttribute("class", "on");
                        }
                        catch (e) {

                        }

                        try {
                            var id = x[i].getElementsByTagName("id")[3].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[3].childNodes[0].nodeValue;
                            content = content.substr(0, 6);
                        }
                        catch (e) {

                        }
                        try {
                            var newsType = x[i].getElementsByTagName("newsType")[3].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var place = x[i].getElementsByTagName("place")[3].childNodes[0].nodeValue;
                            place = place.substr(0, 6);
                        }
                        catch (e) {

                        }
                        var comimg = "comimg" + id;
                        if (newsType == "0") {
                            var imagesrc = "../images/ad_ic_i.png";
                        }
                        else if (newsType == "1") {
                            var imagesrc = "../images/ad_ic_p.png";
                        }
                        try {
                            var com = "company" + (id - 1);
                            if (place == null)
                                place = "";
                            document.getElementById(com).innerHTML = "<span class='num'>" + id + "</span>" + content + "<span>" + place + "</span>" + "<img id='comimg" + (id - 1) + "' src = '" + imagesrc + "' />";

                            var dvCom = "li" + (id - 1);
                            document.getElementById(dvCom).setAttribute("class", "on");
                        }
                        catch (e) {

                        }

                        try {
                            var id = x[i].getElementsByTagName("id")[4].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[4].childNodes[0].nodeValue;
                            content = content.substr(0, 6);
                        }
                        catch (e) {

                        }
                        try {
                            var newsType = x[i].getElementsByTagName("newsType")[4].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var place = x[i].getElementsByTagName("place")[4].childNodes[0].nodeValue;
                            place = place.substr(0, 6);
                        }
                        catch (e) {

                        }
                        var comimg = "comimg" + id;
                        if (newsType == "0") {
                            var imagesrc = "../images/ad_ic_i.png";
                        }
                        else if (newsType == "1") {
                            var imagesrc = "../images/ad_ic_p.png";
                        }
                        try {
                            var com = "company" + (id - 1);
                            if (place == null)
                                place = "";
                            document.getElementById(com).innerHTML = "<span class='num'>" + id + "</span>" + content + "<span>" + place + "</span>" + "<img id='comimg" + (id - 1) + "' src = '" + imagesrc + "' />";

                            var dvCom = "li" + (id - 1);
                            document.getElementById(dvCom).setAttribute("class", "on");
                        }
                        catch (e) {

                        }

                        try {
                            var id = x[i].getElementsByTagName("id")[5].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[5].childNodes[0].nodeValue;
                            content = content.substr(0, 6);
                        }
                        catch (e) {

                        }
                        try {
                            var newsType = x[i].getElementsByTagName("newsType")[5].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var place = x[i].getElementsByTagName("place")[5].childNodes[0].nodeValue;
                            place = place.substr(0, 6);
                        }
                        catch (e) {

                        }
                        var comimg = "comimg" + id;
                        if (newsType == "0") {
                            var imagesrc = "../images/ad_ic_i.png";
                        }
                        else if (newsType == "1") {
                            var imagesrc = "../images/ad_ic_p.png";
                        }
                        try {
                            var com = "company" + (id - 1);
                            if (place == null)
                                place = "";
                            document.getElementById(com).innerHTML = "<span class='num'>" + id + "</span>" + content + "<span>" + place + "</span>" + "<img id='comimg" + (id - 1) + "' src = '" + imagesrc + "' />";

                            var dvCom = "li" + (id - 1);
                            document.getElementById(dvCom).setAttribute("class", "on");
                        }
                        catch (e) {

                        }
                    }
                },
                error: function (data) {
                }
            });

            var ready = true;
            var ct = 0;
            for (i = 0; i < 6; i++) {
                var btnCol = "btnCol" + i;
                var btnEdi = "btnEdi" + i;
                if (document.getElementById(btnCol).innerText == '준비') {
                    ct++;
                    if (document.getElementById(btnEdi).innerText != '준비') {
                        return false;
                    }
                }
                if (document.getElementById(btnEdi).innerText == '준비') {
                    ct++;
                    if (document.getElementById(btnCol).innerText != '준비') {
                        return false;
                    }
                }
            }
            if (ready == true && ct != 0) {
                document.getElementById("gotonextstep").style.display = "";
            }
        }
        else if (step_value == 2) {
            $.ajax({
                url: 'getExperience.aspx?step=2&type=1',
                type: "post",
                async: false,
                success: function (data) {
                    try {
                        var xmlDoc = new DOMParser().parseFromString(data, 'text/xml');
                    }
                    catch (e) {

                    }
                    try {
                        var x = xmlDoc.getElementsByTagName("collector");
                    }
                    catch (e) {

                    }
                    for (i = 0; i < x.length; i++) {
                        try {
                            var id = x[i].getElementsByTagName("id")[0].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[0].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var coltxt = "collector1" + (id - 1);
                        }
                        catch (e) {

                        }
                        if (content != null) {
                            try {
                                document.getElementById(coltxt).value = content.substr(0, 6);
                            }
                            catch (e) {

                            }
                        }
                        try {
                            var btnCol = "btnCol1" + (id - 1);
                            document.getElementById(btnCol).style.display = "";
                        }
                        catch (e) {

                        }
                        try {
                            var id1 = x[i].getElementsByTagName("id1")[0].childNodes[0].nodeValue;
                            var btnCol1 = "btnCol1" + (id1 - 1);
                            document.getElementById(btnCol1).innerText = "완료";
                        }
                        catch (e) {

                        }

                        try {
                            var email = x[i].getElementsByTagName("email")[0].childNodes[0].nodeValue;
                            var c_email = "c_email1" + (id - 1);
                            document.getElementById(c_email).value = email.substr(0,27);
                        }
                        catch (e) {

                        }
                        try {
                            var dvCol1 = "dvCol1" + (id - 1);
                            document.getElementById(dvCol1).setAttribute("class", "btn_rgt btn_ablu");
                        }
                        catch (e) {

                        }
                        try {
                            var id = x[i].getElementsByTagName("id")[1].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[1].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var coltxt = "collector1" + (id - 1);
                        }
                        catch (e) {

                        }
                        if (content != null) {
                            try {
                                document.getElementById(coltxt).value = content.substr(0, 6);
                            }
                            catch (e) {

                            }
                        }
                        try {
                            var btnCol = "btnCol1" + (id - 1);
                            document.getElementById(btnCol).style.display = "";
                        }
                        catch (e) {

                        }
                        try {
                            var id1 = x[i].getElementsByTagName("id1")[1].childNodes[0].nodeValue;
                            var btnCol1 = "btnCol1" + (id1 - 1);
                            document.getElementById(btnCol1).innerText = "완료";
                        }
                        catch (e) {

                        }

                        try {
                            var email = x[i].getElementsByTagName("email")[1].childNodes[0].nodeValue;
                            var c_email = "c_email1" + (id - 1);
                            document.getElementById(c_email).value = email.substr(0,27);
                        }
                        catch (e) {

                        }
                        try {
                            var dvCol1 = "dvCol1" + (id - 1);
                            document.getElementById(dvCol1).setAttribute("class", "btn_rgt btn_ablu");
                        }
                        catch (e) {

                        }
                        try {
                            var id = x[i].getElementsByTagName("id")[2].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[2].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var coltxt = "collector1" + (id - 1);
                        }
                        catch (e) {

                        }
                        if (content != null) {
                            try {
                                document.getElementById(coltxt).value = content.substr(0, 6);
                            }
                            catch (e) {

                            }
                        }
                        try {
                            var btnCol = "btnCol1" + (id - 1);
                            document.getElementById(btnCol).style.display = "";
                        }
                        catch (e) {

                        }
                        try {
                            var id1 = x[i].getElementsByTagName("id1")[2].childNodes[0].nodeValue;
                            var btnCol1 = "btnCol1" + (id1 - 1);
                            document.getElementById(btnCol1).innerText = "완료";
                        }
                        catch (e) {

                        }

                        try {
                            var email = x[i].getElementsByTagName("email")[2].childNodes[0].nodeValue;
                            var c_email = "c_email1" + (id - 1);
                            document.getElementById(c_email).value = email.substr(0,27);
                        }
                        catch (e) {

                        }
                        try {
                            var dvCol1 = "dvCol1" + (id - 1);
                            document.getElementById(dvCol1).setAttribute("class", "btn_rgt btn_ablu");
                        }
                        catch (e) {

                        }
                        try {
                            var id = x[i].getElementsByTagName("id")[3].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[3].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var coltxt = "collector1" + (id - 1);
                        }
                        catch (e) {

                        }
                        if (content != null) {
                            try {
                                document.getElementById(coltxt).value = content.substr(0, 6);
                            }
                            catch (e) {

                            }
                        }
                        try {
                            var btnCol = "btnCol1" + (id - 1);
                            document.getElementById(btnCol).style.display = "";
                        }
                        catch (e) {

                        }
                        try {
                            var id1 = x[i].getElementsByTagName("id1")[3].childNodes[0].nodeValue;
                            var btnCol1 = "btnCol1" + (id1 - 1);
                            document.getElementById(btnCol1).innerText = "완료";
                        }
                        catch (e) {

                        }

                        try {
                            var email = x[i].getElementsByTagName("email")[3].childNodes[0].nodeValue;
                            var c_email = "c_email1" + (id - 1);
                            document.getElementById(c_email).value = email.substr(0,27);
                        }
                        catch (e) {

                        }
                        try {
                            var dvCol1 = "dvCol1" + (id - 1);
                            document.getElementById(dvCol1).setAttribute("class", "btn_rgt btn_ablu");
                        }
                        catch (e) {

                        }

                        try {
                            var id = x[i].getElementsByTagName("id")[4].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[4].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var coltxt = "collector1" + (id - 1);
                        }
                        catch (e) {

                        }
                        if (content != null) {
                            try {
                                document.getElementById(coltxt).value = content.substr(0, 6);
                            }
                            catch (e) {

                            }
                        }
                        try {
                            var btnCol = "btnCol1" + (id - 1);
                            document.getElementById(btnCol).style.display = "";
                        }
                        catch (e) {

                        }
                        try {
                            var id1 = x[i].getElementsByTagName("id1")[4].childNodes[0].nodeValue;
                            var btnCol1 = "btnCol1" + (id1 - 1);
                            document.getElementById(btnCol1).innerText = "완료";
                        }
                        catch (e) {

                        }

                        try {
                            var email = x[i].getElementsByTagName("email")[4].childNodes[0].nodeValue;
                            var c_email = "c_email1" + (id - 1);
                            document.getElementById(c_email).value = email.substr(0,27);
                        }
                        catch (e) {

                        }
                        try {
                            var dvCol1 = "dvCol1" + (id - 1);
                            document.getElementById(dvCol1).setAttribute("class", "btn_rgt btn_ablu");
                        }
                        catch (e) {

                        }

                        try {
                            var id = x[i].getElementsByTagName("id")[5].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[5].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var coltxt = "collector1" + (id - 1);
                        }
                        catch (e) {

                        }
                        if (content != null) {
                            try {
                                document.getElementById(coltxt).value = content.substr(0, 6);
                            }
                            catch (e) {

                            }
                        }
                        try {
                            var btnCol = "btnCol1" + (id - 1);
                            document.getElementById(btnCol).style.display = "";
                        }
                        catch (e) {

                        }
                        try {
                            var id1 = x[i].getElementsByTagName("id1")[5].childNodes[0].nodeValue;
                            var btnCol1 = "btnCol1" + (id1 - 1);
                            document.getElementById(btnCol1).innerText = "완료";
                        }
                        catch (e) {

                        }

                        try {
                            var email = x[i].getElementsByTagName("email")[5].childNodes[0].nodeValue;
                            var c_email = "c_email1" + (id - 1);
                            document.getElementById(c_email).value = email.substr(0,27);
                        }
                        catch (e) {

                        }
                        try {
                            var dvCol1 = "dvCol1" + (id - 1);
                            document.getElementById(dvCol1).setAttribute("class", "btn_rgt btn_ablu");
                        }
                        catch (e) {

                        }

                    }
                },
                error: function (data) {
                }
            });

            $.ajax({
                url: 'getExperience.aspx?step=2&type=2',
                type: "post",
                async: false,
                success: function (data) {
                    var xmlDoc = new DOMParser().parseFromString(data, 'text/xml');
                    var x = xmlDoc.getElementsByTagName("editor");
                    for (i = 0; i < x.length; i++) {
                        try {
                            var id = x[i].getElementsByTagName("id")[0].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[0].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var editxt = "editor1" + (id - 1);
                        }
                        catch (e) {

                        }
                        if (content != null) {
                            try {
                                document.getElementById(editxt).value = content.substr(0, 6);
                            }
                            catch (e) {

                            }
                        }

                        try {
                            var btnEdi = "btnEdi1" + (id - 1);
                            document.getElementById(btnEdi).style.display = "";
                        }
                        catch (e) {

                        }

                        var comimg = "comimg1" + i;
                        //                        document.getElementById(comimg).src = "../images/ad_ic_i.png";

                        try {
                            var id1 = x[i].getElementsByTagName("id1")[0].childNodes[0].nodeValue;
                            var btnEdi1 = "btnEdi1" + (id1 - 1);
                            document.getElementById(btnEdi1).innerText = "완료";
                        }
                        catch (e) {

                        }

                        try {
                            var email = x[i].getElementsByTagName("email")[0].childNodes[0].nodeValue;
                            var e_email = "e_email1" + (id - 1);
                            document.getElementById(e_email).value = email.substr(0,27);
                        }
                        catch (e) {

                        }
                        try {
                            var dvEdi1 = "dvEdi1" + (id - 1);
                            document.getElementById(dvEdi1).setAttribute("class", "btn_rgt btn_ablu");
                        }
                        catch (e) {

                        }

                        try {
                            var id = x[i].getElementsByTagName("id")[1].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[1].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var editxt = "editor1" + (id - 1);
                        }
                        catch (e) {

                        }
                        if (content != null) {
                            try {
                                document.getElementById(editxt).value = content.substr(0, 6);
                            }
                            catch (e) {

                            }
                        }

                        try {
                            var btnEdi = "btnEdi1" + (id - 1);
                            document.getElementById(btnEdi).style.display = "";
                        }
                        catch (e) {

                        }

                        var comimg = "comimg1" + i;
                        //                document.getElementById(comimg).src = "../images/ad_ic_i.png";

                        try {
                            var id1 = x[i].getElementsByTagName("id1")[1].childNodes[0].nodeValue;
                            var btnEdi1 = "btnEdi1" + (id1 - 1);
                            document.getElementById(btnEdi1).innerText = "완료";
                        }
                        catch (e) {

                        }

                        try {
                            var email = x[i].getElementsByTagName("email")[1].childNodes[0].nodeValue;
                            var e_email = "e_email1" + (id - 1);
                            document.getElementById(e_email).value = email.substr(0,27);
                        }
                        catch (e) {

                        }
                        try {
                            var dvEdi1 = "dvEdi1" + (id - 1);
                            document.getElementById(dvEdi1).setAttribute("class", "btn_rgt btn_ablu");
                        }
                        catch (e) {

                        }

                        try {
                            var id = x[i].getElementsByTagName("id")[2].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[2].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var editxt = "editor1" + (id - 1);
                        }
                        catch (e) {

                        }
                        if (content != null) {
                            try {
                                document.getElementById(editxt).value = content.substr(0, 6);
                            }
                            catch (e) {

                            }
                        }

                        try {
                            var btnEdi = "btnEdi1" + (id - 1);
                            document.getElementById(btnEdi).style.display = "";
                        }
                        catch (e) {

                        }

                        var comimg = "comimg1" + i;
                        //        document.getElementById(comimg).src = "../images/ad_ic_i.png";

                        try {
                            var id1 = x[i].getElementsByTagName("id1")[2].childNodes[0].nodeValue;
                            var btnEdi1 = "btnEdi1" + (id1 - 1);
                            document.getElementById(btnEdi1).innerText = "완료";
                        }
                        catch (e) {

                        }

                        try {
                            var email = x[i].getElementsByTagName("email")[2].childNodes[0].nodeValue;
                            var e_email = "e_email1" + (id - 1);
                            document.getElementById(e_email).value = email.substr(0,27);
                        }
                        catch (e) {

                        }
                        try {
                            var dvEdi1 = "dvEdi1" + (id - 1);
                            document.getElementById(dvEdi1).setAttribute("class", "btn_rgt btn_ablu");
                        }
                        catch (e) {

                        }

                        try {
                            var id = x[i].getElementsByTagName("id")[3].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[3].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var editxt = "editor1" + (id - 1);
                        }
                        catch (e) {

                        }
                        if (content != null) {
                            try {
                                document.getElementById(editxt).value = content.substr(0, 6);
                            }
                            catch (e) {

                            }
                        }

                        try {
                            var btnEdi = "btnEdi1" + (id - 1);
                            document.getElementById(btnEdi).style.display = "";
                        }
                        catch (e) {

                        }

                        var comimg = "comimg1" + i;
                        //document.getElementById(comimg).src = "../images/ad_ic_i.png";

                        try {
                            var id1 = x[i].getElementsByTagName("id1")[3].childNodes[0].nodeValue;
                            var btnEdi1 = "btnEdi1" + (id1 - 1);
                            document.getElementById(btnEdi1).innerText = "완료";
                        }
                        catch (e) {

                        }

                        try {
                            var email = x[i].getElementsByTagName("email")[3].childNodes[0].nodeValue;
                            var e_email = "e_email1" + (id - 1);
                            document.getElementById(e_email).value = email.substr(0,27);
                        }
                        catch (e) {

                        }
                        try {
                            var dvEdi1 = "dvEdi1" + (id - 1);
                            document.getElementById(dvEdi1).setAttribute("class", "btn_rgt btn_ablu");
                        }
                        catch (e) {

                        }

                        try {
                            var id = x[i].getElementsByTagName("id")[4].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[4].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var editxt = "editor1" + (id - 1);
                        }
                        catch (e) {

                        }
                        if (content != null) {
                            try {
                                document.getElementById(editxt).value = content.substr(0, 6);
                            }
                            catch (e) {

                            }
                        }

                        try {
                            var btnEdi = "btnEdi1" + (id - 1);
                            document.getElementById(btnEdi).style.display = "";
                        }
                        catch (e) {

                        }

                        var comimg = "comimg1" + i;
                        //document.getElementById(comimg).src = "../images/ad_ic_i.png";

                        try {
                            var id1 = x[i].getElementsByTagName("id1")[4].childNodes[0].nodeValue;
                            var btnEdi1 = "btnEdi1" + (id1 - 1);
                            document.getElementById(btnEdi1).innerText = "완료";
                        }
                        catch (e) {

                        }

                        try {
                            var email = x[i].getElementsByTagName("email")[4].childNodes[0].nodeValue;
                            var e_email = "e_email1" + (id - 1);
                            document.getElementById(e_email).value = email.substr(0,27);
                        }
                        catch (e) {

                        }
                        try {
                            var dvEdi1 = "dvEdi1" + (id - 1);
                            document.getElementById(dvEdi1).setAttribute("class", "btn_rgt btn_ablu");
                        }
                        catch (e) {

                        }

                        try {
                            var id = x[i].getElementsByTagName("id")[5].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[5].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var editxt = "editor1" + (id - 1);
                        }
                        catch (e) {

                        }
                        if (content != null) {
                            try {
                                document.getElementById(editxt).value = content.substr(0, 6);
                            }
                            catch (e) {

                            }
                        }

                        try {
                            var btnEdi = "btnEdi1" + (id - 1);
                            document.getElementById(btnEdi).style.display = "";
                        }
                        catch (e) {

                        }

                        var comimg = "comimg1" + i;
                        //document.getElementById(comimg).src = "../images/ad_ic_i.png";

                        try {
                            var id1 = x[i].getElementsByTagName("id1")[5].childNodes[0].nodeValue;
                            var btnEdi1 = "btnEdi1" + (id1 - 1);
                            document.getElementById(btnEdi1).innerText = "완료";
                        }
                        catch (e) {

                        }

                        try {
                            var email = x[i].getElementsByTagName("email")[5].childNodes[0].nodeValue;
                            var e_email = "e_email1" + (id - 1);
                            document.getElementById(e_email).value = email.substr(0,27);
                        }
                        catch (e) {

                        }
                        try {
                            var dvEdi1 = "dvEdi1" + (id - 1);
                            document.getElementById(dvEdi1).setAttribute("class", "btn_rgt btn_ablu");
                        }
                        catch (e) {

                        }

                    }
                },
                error: function (data) {
                }
            });

            $.ajax({
                url: 'getExperience.aspx?step=2&type=3',
                type: "post",
                async: false,
                success: function (data) {
                    var content1 = "";

                    try {
                        var xmlDoc = new DOMParser().parseFromString(data, 'text/xml');
                    }
                    catch (e) {

                    }
                    try {
                        var x = xmlDoc.getElementsByTagName("company");
                    }
                    catch (e) {

                    }
                    for (i = 0; i < x.length; i++) {
                        if (x[i].getElementsByTagName("id").length <= 0)
                        {
                            break;
                        }
                        try {
                            var id = x[i].getElementsByTagName("id")[0].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[0].childNodes[0].nodeValue;
                            content1 = content;
                        }
                        catch (e) {

                        }
                        try {
                            var place = x[i].getElementsByTagName("place")[0].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var newsType = x[i].getElementsByTagName("newsType")[0].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        var comimg = "comimg1" + id;
                        if (newsType == "0") {
                            var imagesrc = "../images/ad_ic_i.png";
                        }
                        else if (newsType == "1") {
                            var imagesrc = "../images/ad_ic_p.png";
                        }
                        var com = "company1" + (id - 1);
                        if (place == null)
                            place = "";
                        try {
                            content = content.substr(0, 6);
                        }
                        catch (e) {
                        }
                        content += "<span>" + place.substr(0, 6) + "</span>" + "<img id='comimg1"
                            + (id - 1)
                            + "' src = '" + imagesrc + "' />"
                            + "<em class='btn_pos btn_agry2' style='display:none;' id = 'btnCom1"
                            + (id - 1)
                            + "'><a id='DsetCom"
                            + (id - 1)
                            + "' style='cursor:pointer' onclick = 'DsetCom("
                            + (id - 1)
                            + ")'>확인</a></em>";
                        if (content != null)
                            document.getElementById(com).innerHTML = "<span class='num'>" + id + "</span>" + content;
                        try {
                            var btnCom = "btnCom1" + (id - 1);
                            //                            document.getElementById(btnCom).style.display = "";
                            var dvCom = "li1" + (id - 1);
                            document.getElementById(dvCom).setAttribute("class", "on");
                        }
                        catch (e) {

                        }

                        if (x[i].getElementsByTagName("id").length <= 1) {
                            break;
                        }
                        content = content1;
                        try {
                            var id = x[i].getElementsByTagName("id")[1].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[1].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var place = x[i].getElementsByTagName("place")[1].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var newsType = x[i].getElementsByTagName("newsType")[1].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        var comimg = "comimg1" + id;
                        if (newsType == "0") {
                            var imagesrc = "../images/ad_ic_i.png";
                        }
                        else if (newsType == "1") {
                            var imagesrc = "../images/ad_ic_p.png";
                        }
                        var com = "company1" + (id - 1);
                        if (place == null)
                            place = "";
                        try {
                            content = content.substr(0, 6);
                        }
                        catch (e) {
                        }
                        content += "<span>" + place.substr(0, 6) + "</span>" + "<img id='comimg1"
                            + (id - 1)
                            + "' src = '" + imagesrc + "' />"
                            + "<em class='btn_pos btn_agry2' style='display:none;' id = 'btnCom1"
                            + (id - 1)
                            + "'><a id='DsetCom"
                            + (id - 1)
                            + "' style='cursor:pointer' onclick = 'DsetCom("
                            + (id - 1)
                            + ")'>확인</a></em>";
                        if (content != null)
                            document.getElementById(com).innerHTML = "<span class='num'>" + id + "</span>" + content;
                        try {
                            var btnCom = "btnCom1" + (id - 1);
                            //                                document.getElementById(btnCom).style.display = "";
                            var dvCom = "li1" + (id - 1);
                            document.getElementById(dvCom).setAttribute("class", "on");
                        }
                        catch (e) {

                        }

                        if (x[i].getElementsByTagName("id").length <= 2) {
                            break;
                        }
                        content = content1;
                        try {
                            var id = x[i].getElementsByTagName("id")[2].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[2].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var place = x[i].getElementsByTagName("place")[2].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var newsType = x[i].getElementsByTagName("newsType")[2].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        var comimg = "comimg1" + id;
                        if (newsType == "0") {
                            var imagesrc = "../images/ad_ic_i.png";
                        }
                        else if (newsType == "1") {
                            var imagesrc = "../images/ad_ic_p.png";
                        }
                        var com = "company1" + (id - 1);
                        if (place == null)
                            place = "";
                        try {
                            content = content.substr(0, 6);
                        }
                        catch (e) {
                        }
                        content += "<span>" + place.substr(0, 6) + "</span>" + "<img id='comimg1"
                            + (id - 1)
                            + "' src = '" + imagesrc + "' />"
                            + "<em class='btn_pos btn_agry2' style='display:none;' id = 'btnCom1"
                            + (id - 1)
                            + "'><a id='DsetCom"
                            + (id - 1)
                            + "' style='cursor:pointer' onclick = 'DsetCom("
                            + (id - 1)
                            + ")'>확인</a></em>";
                        if (content != null)
                            document.getElementById(com).innerHTML = "<span class='num'>" + id + "</span>" + content;
                        try {
                            var btnCom = "btnCom1" + (id - 1);
                            //                                    document.getElementById(btnCom).style.display = "";
                            var dvCom = "li1" + (id - 1);
                            document.getElementById(dvCom).setAttribute("class", "on");
                        }
                        catch (e) {

                        }

                        if (x[i].getElementsByTagName("id").length <= 3) {
                            break;
                        }
                        content = content1;
                        try {
                            var id = x[i].getElementsByTagName("id")[3].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[3].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var place = x[i].getElementsByTagName("place")[3].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var newsType = x[i].getElementsByTagName("newsType")[3].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        var comimg = "comimg1" + id;
                        if (newsType == "0") {
                            var imagesrc = "../images/ad_ic_i.png";
                        }
                        else if (newsType == "1") {
                            var imagesrc = "../images/ad_ic_p.png";
                        }
                        var com = "company1" + (id - 1);
                        if (place == null)
                            place = "";
                        try {
                            content = content.substr(0, 6);
                        }
                        catch (e) {
                        }
                        content += "<span>" + place.substr(0, 6) + "</span>" + "<img id='comimg1"
                            + (id - 1)
                            + "' src = '" + imagesrc + "' />"
                            + "<em class='btn_pos btn_agry2' style='display:none;' id = 'btnCom1"
                            + (id - 1)
                            + "'><a id='DsetCom"
                            + (id - 1)
                            + "' style='cursor:pointer' onclick = 'DsetCom("
                            + (id - 1)
                            + ")'>확인</a></em>";
                        if (content != null)
                            document.getElementById(com).innerHTML = "<span class='num'>" + id + "</span>" + content;
                        try {
                            var btnCom = "btnCom1" + (id - 1);
                            //                                        document.getElementById(btnCom).style.display = "";
                            var dvCom = "li1" + (id - 1);
                            document.getElementById(dvCom).setAttribute("class", "on");
                        }
                        catch (e) {

                        }

                        if (x[i].getElementsByTagName("id").length <= 4) {
                            break;
                        }
                        content = content1;
                        try {
                            var id = x[i].getElementsByTagName("id")[4].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[4].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var place = x[i].getElementsByTagName("place")[4].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var newsType = x[i].getElementsByTagName("newsType")[4].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        var comimg = "comimg1" + id;
                        if (newsType == "0") {
                            var imagesrc = "../images/ad_ic_i.png";
                        }
                        else if (newsType == "1") {
                            var imagesrc = "../images/ad_ic_p.png";
                        }
                        var com = "company1" + (id - 1);
                        if (place == null)
                            place = "";
                        try {
                            content = content.substr(0, 6);
                        }
                        catch (e) {
                        }
                        content += "<span>" + place.substr(0, 6) + "</span>" + "<img id='comimg1"
                            + (id - 1)
                            + "' src = '" + imagesrc + "' />"
                            + "<em class='btn_pos btn_agry2' style='display:none;' id = 'btnCom1"
                            + (id - 1)
                            + "'><a id='DsetCom"
                            + (id - 1)
                            + "' style='cursor:pointer' onclick = 'DsetCom("
                            + (id - 1)
                            + ")'>확인</a></em>";
                        if (content != null)
                            document.getElementById(com).innerHTML = "<span class='num'>" + id + "</span>" + content;
                        try {
                            var btnCom = "btnCom1" + (id - 1);
                            //                                            document.getElementById(btnCom).style.display = "";
                            var dvCom = "li1" + (id - 1);
                            document.getElementById(dvCom).setAttribute("class", "on");
                        }
                        catch (e) {

                        }

                        if (x[i].getElementsByTagName("id").length <= 5) {
                            break;
                        }
                        content = content1;
                        try {
                            var id = x[i].getElementsByTagName("id")[5].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var content = x[i].getElementsByTagName("content")[5].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var place = x[i].getElementsByTagName("place")[5].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        try {
                            var newsType = x[i].getElementsByTagName("newsType")[5].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }
                        var comimg = "comimg1" + id;
                        if (newsType == "0") {
                            var imagesrc = "../images/ad_ic_i.png";
                        }
                        else if (newsType == "1") {
                            var imagesrc = "../images/ad_ic_p.png";
                        }
                        var com = "company1" + (id - 1);
                        if (place == null)
                            place = "";
                        try {
                            content = content.substr(0, 6);
                        }
                        catch (e) {
                        }
                        content += "<span>" + place.substr(0, 6) + "</span>" + "<img id='comimg1"
                            + (id - 1)
                            + "' src = '" + imagesrc + "' />"
                            + "<em class='btn_pos btn_agry2' style='display:none;' id = 'btnCom1"
                            + (id - 1)
                            + "'><a id='DsetCom"
                            + (id - 1)
                            + "' style='cursor:pointer' onclick = 'DsetCom("
                            + (id - 1)
                            + ")'>확인</a></em>";
                        if (content != null)
                            document.getElementById(com).innerHTML = "<span class='num'>" + id + "</span>" + content;
                        try {
                            var btnCom = "btnCom1" + (id - 1);
                            //                                                document.getElementById(btnCom).style.display = "";
                            var dvCom = "li1" + (id - 1);
                            document.getElementById(dvCom).setAttribute("class", "on");
                        }
                        catch (e) {

                        }

                    }
                },
                error: function (data) {
                }
            });

            var ready = true;
            var ct = 0;
            for (i = 0; i < 6; i++) {
                var btnCol1 = "btnCol1" + i;
                var btnEdi1 = "btnEdi1" + i;
                var li1 = "li1" + i;
                if (document.getElementById(btnCol1).innerText != '완료' || document.getElementById(btnEdi1).innerText != '완료') {
                    try {
                        document.getElementById("btnCom1" + i).style.display = "none";
                    }
                    catch (e) {

                    }
                }
                if (document.getElementById(btnCol1).innerText == '완료') {
                    ct++;
                    if (document.getElementById(btnEdi1).innerText != '완료') {
                        return false;
                    }
                }
                if (document.getElementById(btnEdi1).innerText == '완료') {
                    ct++;
                    if (document.getElementById(btnCol1).innerText != '완료') {
                        return false;
                    }
                }
            }
            if (ready == true && ct != 0) {
                document.getElementById("gotonextstep").style.display = "";
            }
        }

    }

    loadlink();
    setInterval(function () {
        loadlink()
    }, 5000);

    function GotoNextStep()
    {
        if(step_value == 0)
        {
            $.ajax({
                url: 'setStatue.aspx?step=0',
                type: "post",
                async: false,
                success: function (data) {
                    if(data == 'success')
                    {
                        location.reload();
                    }
                },
                error: function () {
                }
            });
        }
        else if(step_value == 1)
        {
            $.ajax({
                url: 'setStatue.aspx?step=1',
                type: "post",
                async: false,
                success: function (data) {
                    if (data == 'success') {
                        location.reload();
                    }
                },
                error: function () {
                }
            });
        }
        else if(step_value == 2)
        {
            $.ajax({
                url: 'setStatue.aspx?step=2',
                type: "post",
                async: false,
                success: function (data) {
                    if (data == 'success') {
                        location.reload();
                    }
                },
                error: function () {
                }
            });
        }
        else if(step_value == 3)
        {
            $.ajax({
                url: 'setStatue.aspx?step=3',
                type: "post",
                async: false,
                success: function (data) {
                    if (data == 'success') {
                        location.reload();
                    }
                },
                error: function () {
                }
            });
        }
    }

    function sendEmail(id)
    {
        $.ajax({
            url: "mailsender.aspx?id=" + id,
            type: "post",
            async: false,
            success: function (data) {
                if(data != "")
                {
                    alert(data);
                }
            },
            error: function () {
                onClosePopup();
                document.getElementById("popupForm").style.display = "";
                document.getElementById("outlookFormpopup").style.display = "";
            }
        });
/*
        document.getElementById("popupForm").style.display = "";
        document.getElementById("sendEmail_popup").style.display = "";
        $.ajax({
            url: 'getEmail.aspx?id=' + id,
            type: "post",
            async: false,
            success: function (data) {
                var emails = data;
                try
                {
                    document.getElementById("sender").value = "sender email";
                    document.getElementById("email_title").value = "[잡월드] eNEWS 체험 결과물을 보내 드립니다.";
                    document.getElementById("email_content").innerHTML = "안녕하세요, 한국잡월드에 방문해 주셔서 감사합니다.\n\n한국잡월드의 eNEWS 체험결과물을 첨부파일로 보내 드립니다.\n\n\n내 컴퓨터에 설치해서 사용하시면 됩니다.\n\n\n\n감사합니다.";
                    var email = emails.split(',');
                    document.getElementById("receiver").value = email[0] + ";" + email[1];
                }
                catch(e)
                {

                }
            },
            error: function () {
            }
        });
*/
    }

    function onSendEmail()
    {
        var title = document.getElementById("email_title").value;
        var content = document.getElementById("email_content").innerHTML;
        var sender = document.getElementById("sender").value;
        var receivers = document.getElementById("receiver").value;
        var file = document.getElementById("email_file");

        var data = new FormData();
        data.append("title", title);
        data.append("content", content);
        data.append("receivers", receivers);
        data.append("sender", sender);

        if (file.files[0] != null)
            data.append("upfile", file.files[0]);

        $.ajax({
            url: 'sendEmail.aspx',
            type: "post",
            data:  data,
            async: false,
            processData: false,
            contentType: false,
            success: function (data, textStatus, jqXHR) {
                alert(data);
            },
            error: function (jqXHR, textStatus, errorThrown) {
            }
        });
    }

    function ImagetoPrint(source) {
        return "<html><head><script>function step1(){\n" +
                "setTimeout('step2()', 10);}\n" +
                "function step2(){window.print();window.close()}\n" +
                "</scri" + "pt></head><body onload='step1()'>\n" +
                "<img src='" + source + "' /></body></html>";
    }

    function PrintImage(source) {
        Pagelink = "about:blank";
        var pwa = window.open(Pagelink, "_new");
        pwa.document.open();
        pwa.document.write(ImagetoPrint(source));
        pwa.document.close();
    }

    function openPrintWindow(url, name, specs) {
        var printWindow = window.open(url, name, specs);

        var printAndClose = function () {
            if (printWindow.document.readyState == 'complete') {
                clearInterval(sched);
                printWindow.print();
                printWindow.close();
            }
        }
        var sched = setInterval(printAndClose, 200);
    };

    function printPage(id) {
        $.ajax({
            url: 'getPrintContent.aspx?id=' + id,
            type: "post",
            async: false,
            processData: false,
            contentType: false,
            success: function (data, textStatus, jqXHR) {
                //PrintImage(data);
                var printwindow = window.open(data);
//                openPrintWindow(data, "print", "width=1920,height=1080,_blank");
            },
            error: function (jqXHR, textStatus, errorThrown) {
            }
        });
    }

    function GotoPrevStep()
    {
        if (step_value == 1) {
            $.ajax({
                url: 'setPrevStatue.aspx?step=1',
                type: "post",
                async: false,
                success: function (data) {
                    if (data == 'success') {
                        location.reload();
                    }
                },
                error: function () {
                }
            });
        }
        else if (step_value == 2) {
            $.ajax({
                url: 'setPrevStatue.aspx?step=2',
                type: "post",
                async: false,
                success: function (data) {
                    if (data == 'success') {
                        location.reload();
                    }
                },
                error: function () {
                }
            });
        }
        else if (step_value == 3) {
            $.ajax({
                url: 'setPrevStatue.aspx?step=3',
                type: "post",
                async: false,
                success: function (data) {
                    location.reload();
                },
                error: function () {
                }
            });
        }
    }

    function setCollector(no)
    {
        var name = "collector" + no;
        var btnCol = "btnCol" + no;
        var collect = document.getElementById(name).value;
        $.ajax({
            url: 'setExperience.aspx?type=0&no=' + no + '&data=' + collect,
            type: "post",
            async: false,
            success: function (data) {
                if (data == 'success') {
                    document.getElementById(btnCol).innerText = '준비';
                    document.getElementById(name).setAttribute('readonly', 'readonly');
                }
                else {
                    onClosePopup();
                    document.getElementById("popupForm").style.display = "";
                    document.getElementById("change1Formpopup").style.display = "";
                }
            },
            error: function (data) {
                onClosePopup();
                document.getElementById("popupForm").style.display = "";
                document.getElementById("change1Formpopup").style.display = "";
            }
        });
    }

    function setEditor(no)
    {
        var name = "editor" + no;
        var btnEdi = "btnEdi" + no;
        var collect = document.getElementById(name).value;
        $.ajax({
            url: 'setExperience.aspx?type=1&no=' + no + '&data=' + collect,
            type: "post",
            async: false,
            success: function (data) {
                if(data == 'success')
                {
                    document.getElementById(btnEdi).value = '준비';
                    document.getElementById(name).setAttribute('readonly', 'readonly');
                }
                else {
                    onClosePopup();
                    document.getElementById("popupForm").style.display = "";
                    document.getElementById("change1Formpopup").style.display = "";
                }
            },
            error: function (data) {
                onClosePopup();
                document.getElementById("popupForm").style.display = "";
                document.getElementById("change1Formpopup").style.display = "";
            }
        });
    }

    function setCom(no)
    {
        var name = "com" + no;
        var btnEdi = "btnCom" + no;
        var collect = document.getElementById(name).value;
        $.ajax({
            url: 'setExperience.aspx?type=2&no=' + no + '&data=' + collect,
            type: "post",
            async: false,
            success: function (data) {
                if (data == 'success') {
                    document.getElementById(name).setAttribute('readonly', 'readonly');
                }
                else {
                    onClosePopup();
                    document.getElementById("popupForm").style.display = "";
                    document.getElementById("change1Formpopup").style.display = "";
                }
            },
            error: function (data) {
                onClosePopup();
                document.getElementById("popupForm").style.display = "";
                document.getElementById("change1Formpopup").style.display = "";
            }
        });
    }

    function printArticle(id)
    {
        $.ajax({
            url: 'printArticle.aspx?id=' + id,
            type: "post",
            async: false,
            success: function (data) {
                if(data != "")
                {
                    alert("인쇄창을 열수 없습니다.");
                }
            },
            error: function (data) {
                alert("인쇄과정에 알지 못할 오류가 발생하였습니다.");
            }
        });
    }

    function viewArticleContent(id)
    {
/*
        document.getElementById("popupForm").style.display = "";
        document.getElementById("article_content_popup").style.display = "";
        $.ajax({
            url: 'getImagePath.aspx?id=' + id,
            type: "post",
            async: false,
            success: function (data) {
                document.getElementById("popup_result").src = data;
            },
            error: function (data) {
            }
        });
*/
        $.ajax({
            url: 'getContentPath.aspx?id=' + id,
            type: "post",
            async: false,
            success: function (data) {                
                window.open(data, "_blank", "toolbar=yes,scrollbars=yes,resizable=yes");
            },
            error: function (data) {
            }
        });
    }

    function showpreview(url)
    {
        document.getElementById("popupForm").style.display = "";
        document.getElementById("show_preview_popup").style.display = "";
        document.getElementById("preview_popup_result").src = url;
    }

    function DsetEditor(id)
    {
        if (document.getElementById("btnEdi1" + id).innerText == "완료") {
            $.ajax({
                url: 'resetTostep2.aspx?type=1&id=' + (id + 1),
                type: "post",
                async: false,
                success: function (data) {
                    if (data == "success") {
                        document.getElementById("btnEdi1" + id).innerText = "체험중";
                        document.getElementById("gotonextstep").style.display = "none";
                    }
                },
                error: function (data) {
                }
            });
        }
    }

    function DsetCollector(id)
    {
        if (document.getElementById("btnCol1" + id).innerText == "완료")
        {
            $.ajax({
                url: 'resetTostep2.aspx?type=0&id=' + (id + 1),
                type: "post",
                async: false,
                success: function (data) {
                    if (data == "success") {
                        document.getElementById("btnCol1" + id).innerText = "체험중";
                        document.getElementById("gotonextstep").style.display = "none";
                    }
                },
                error: function (data) {
                }
            });
        }
    }

    function DsetCom(id)
    {
        viewArticleContent(id + 1);
    }

    function showChangepopupC(id)
    {
        onClosePopup();
        if (document.getElementById("li1" + id).getAttribute("class") == "on")
        {
            document.getElementById("popupForm").style.display = "";
            document.getElementById("dvChangeExperience").style.display = "";
            $.ajax({
                url: 'getInformation.aspx?type=0&id=' + (id + 1),
                type: "post",
                async: false,
                success: function (data) {
                    var data = data;
                    var list = data.split(',');
                    document.getElementById("change_editor").value = list[0];
                    document.getElementById("change_email").value = list[1];
                    document.getElementById("changeEditor").innerHTML = "<a style='cursor:pointer' onclick='onChangeCollector(" + id + ")'>확인</a>";
                },
                error: function (data) {
                }
            });
        }
    }

    function showChangepopupE(id) {
        onClosePopup();
        if (document.getElementById("li1" + id).getAttribute("class") == "on") {
            document.getElementById("popupForm").style.display = "";
            document.getElementById("dvChangeExperience").style.display = "";
            $.ajax({
                url: 'getInformation.aspx?type=1&id=' + (id + 1),
                type: "post",
                async: false,
                success: function (data) {
                    var data = data;
                    var list = data.split(',');
                    document.getElementById("change_editor").value = list[0];
                    document.getElementById("change_email").value = list[1];
                    document.getElementById("changeEditor").innerHTML = "<a style='cursor:pointer' onclick='onChangeEditor(" + id + ")'>확인</a>";
                },
                error: function (data) {
                }
            });
        }
    }

    function onCancel_changeEditor()
    {
        onClosePopup();
    }

    function onChangeCollector(id) {
        var editor = document.getElementById("change_editor").value;
        var email = document.getElementById("change_email").value;
        var data = new FormData();
        data.append("editor", editor);
        data.append("email", email);
        $.ajax({
            url: 'saveInformation.aspx?type=0&id=' + (id + 1),
            type: "post",
            data: data,
            processData: false,
            contentType: false,
            async: false,
            success: function (data) {
                if (data = 'success') {
                    onClosePopup();
                    document.getElementById("popupForm").style.display = "";
                    document.getElementById("changeFormpopup").style.display = "";
                    onCancel_changeEditor();
                }
                else {
                    onClosePopup();
                    document.getElementById("popupForm").style.display = "";
                    document.getElementById("change1Formpopup").style.display = "";
                    onCancel_changeEditor();
                }
            },
            error: function (data) {
                onClosePopup();
                document.getElementById("popupForm").style.display = "";
                document.getElementById("change1Formpopup").style.display = "";
            }
        });
    }

    function onChangeEditor(id)
    {
        var editor = document.getElementById("change_editor").value;
        var email = document.getElementById("change_email").value;
        var data = new FormData();
        data.append("editor", editor);
        data.append("email", email);
        $.ajax({
            url: 'saveInformation.aspx?type=1&id=' + (id + 1),
            type: "post",
            data: data,
            processData: false,
            contentType: false,
            async: false,
            success: function (data) {
                if(data = 'success')
                {
                    onClosePopup();
                    document.getElementById("popupForm").style.display = "";
                    document.getElementById("changeFormpopup").style.display = "";
                    onCancel_changeEditor();
                }
                else {
                    onClosePopup();
                    document.getElementById("popupForm").style.display = "";
                    document.getElementById("change1Formpopup").style.display = "";
                    onCancel_changeEditor();
                }
            },
            error: function (data) {
                onClosePopup();
                document.getElementById("popupForm").style.display = "";
                document.getElementById("change1Formpopup").style.display = "";
            }
        });
    }

    function onClosePopup() {
        document.getElementById("popupForm").style.display = "none";
        document.getElementById("outlookFormpopup").style.display = "none";
        document.getElementById("changeFormpopup").style.display = "none";
        document.getElementById("change1Formpopup").style.display = "none";
        document.getElementById("dvChangeExperience").style.display = "none";
        document.getElementById("show_preview_popup").style.display = "none";
        document.getElementById("sendEmail_popup").style.display = "none";
        document.getElementById("article_content_popup").style.display = "none";
    }

</script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box_tit">
        <div>
			<h2>체험관리</h2><span>체험 프로그램을 시작하고, 종료합니다. 체험자들의 상태를 확인할 수 있으며, 결과물을 이메일 발송합니다.</span>
		</div>
    </div>
    <div id="content">
		<h3 id="top_content" class="step1">STEP1: 로그인 / 신문사명 세팅</h3>
		<section class="sec_list">
    		<ul class="clfix" id="step0" style="display:none;">
                <asp:Literal ID="experienceapp0" runat="server"></asp:Literal>
            </ul>

    		<ul class="clfix" id="step1" style="display:none;">
                <asp:Literal ID="experienceapp1" runat="server"></asp:Literal>
            </ul>

            <ul class="clfix" id="step2" style="display:none;">
                <asp:Literal ID="experienceapp2" runat="server"></asp:Literal>
            </ul>

            <ul class="clfix" id="step3" style="display:none;">
                <asp:Literal ID="experienceapp3" runat="server"></asp:Literal>
            </ul>

            <ul class="clfix" id="step4" style="display:none;">
                <asp:Literal ID="experienceapp4" runat="server"></asp:Literal>
            </ul>
		</section>
		<div class="box_btnbm">
			<div class="btn_lft btn_prev" id="gotoprevstep" style="display:none"><a onclick="GotoPrevStep()" style="cursor:pointer">이전</a></div>
			<div class="btn_rgt btn_nor" id="gotonextstep" style="display:none"><a onclick="GotoNextStep()" id="gotonextstepvalue" style="cursor:pointer">체험 시작</a></div>
		</div>
	</div>

    <div class="wrap_layerpop" id="popupForm" style="display:none;position: absolute;height: 100%;width: 1920px;">
        <div class="layerpop pop1" id="outlookFormpopup" style="display:none">
		    <div class="box_titpop">
			    <h2>아웃룩실행 확인</h2>
			    <div class="btn_close"><button type="button">닫기</button></div>
		    </div>
		    <div class="box_contpop">
			    <div class="box_in">
				    <p class="tx_t1">아웃룩 실행과정에 오류가 발생하였습니다.</p>
				    <div class="btn_polst">
					    <span class="btn_askk"><a onclick="onClosePopup()" style="cursor:pointer">확인</a></span>
				    </div>
			    </div>
		    </div>
	    </div>

        <div class="layerpop pop1" id="changeFormpopup" style="display:none">
		    <div class="box_titpop">
			    <h2>변경 확인</h2>
			    <div class="btn_close"><button type="button">닫기</button></div>
		    </div>
		    <div class="box_contpop">
			    <div class="box_in">
				    <p class="tx_t1">성공적으로 변경되었습니다.</p>
				    <div class="btn_polst">
					    <span class="btn_askk"><a onclick="onClosePopup()" style="cursor:pointer">확인</a></span>
				    </div>
			    </div>
		    </div>
	    </div>

        <div class="layerpop pop4" id="show_preview_popup" style="left: 30%;">
		    <div class="box_titpop">
                <h2>결과물 확인</h2>
			    <div class="btn_close"><button type="button">닫기</button></div>
		    </div>
		    <div class="clfix" style="height:931px;">
                <iframe id="preview_popup_result" style="width:785px;height:981px;background-color:#fff;"></iframe>
		    </div>
	    </div>

        <div class="layerpop pop1" id="change1Formpopup" style="display:none">
		    <div class="box_titpop">
			    <h2>변경 확인</h2>
			    <div class="btn_close"><button type="button">닫기</button></div>
		    </div>
		    <div class="box_contpop">
			    <div class="box_in">
				    <p class="tx_t1">변경에 실패했습니다.</p>
				    <div class="btn_polst">
					    <span class="btn_askk"><a onclick="onClosePopup()" style="cursor:pointer">확인</a></span>
				    </div>
			    </div>
		    </div>
	    </div>

   	    <div class="layerpop pop1" id="dvChangeExperience" style="display:none">
		    <div class="box_titpop">
			    <h2>체험자 정보변경</h2>
			    <div class="btn_close"><button type="button">닫기</button></div>
		    </div>
		    <div class="box_contpop">
			    <div class="box_in">
				    <ul class="loginfo">
					    <li>
						    <span>성 명</span>
						    <div class="inp"><input type="text" id="change_editor"></div>
					    </li>
					    <li>
						    <span>E-mail</span>
						    <div class="inp"><input type="text" id="change_email" style="width: 222px;"></div>
					    </li>
				    </ul>
				    <div class="btn_polst">
					    <span class="btn_askk mr5" id="changeEditor"><a style="cursor:pointer">확인</a></span>
					    <span class="btn_askk"><a style="cursor:pointer" onclick="onCancel_changeEditor()">취소</a></span>
				    </div>
			    </div>
		    </div>
	    </div>

        <div class="layerpop pop2" id="sendEmail_popup" style="display:none">
		    <div class="box_titpop">
			    <div class="btn_close"><button type="button">닫기</button></div>
		    </div>
		    <div class="box_contpop">
			    <div class="board_write">
				    <table>
					    <colgroup>
						    <col style="width: 15%;" />
						    <col style="width: 85%;" />
					    </colgroup>
					    <tbody>
						    <tr>
							    <th scope="row">받는 사람</th>
							    <td><input id="receiver" type="text" /></td>
						    </tr>
						    <tr>
							    <th scope="row">참조</th>
							    <td><input type="text" id="sender" /></td>
						    </tr>
						    <tr>
							    <th scope="row">제목</th>
							    <td><input type="text" id="email_title" /></td>
						    </tr>
						    <tr>
							    <th scope="row">첨부파일</th>
							    <td>
								    <div class="area_fileup">
									    <input type="file" id="email_file" name="" class="inp_file" />
								    </div>
							    </td>
						    </tr>
					    </tbody>
				    </table>
				    <div class="textar">
					    <textarea name="" cols="1" rows="1" id="email_content"></textarea>
				    </div>
				    <div class="box_btnbm">
					    <div class="btn_rgt btn_nor mr10"><a onclick="onSendEmail()" style="cursor:pointer">보내기</a></div>
				    </div>
			    </div>
		    </div>
	    </div>

        <div class="layerpop pop3" id="article_content_popup" style="display:none;width:766px;">
            <div class="box_titpop">
			    <div class="btn_close"><button type="button">닫기</button></div>
		    </div>

            <div class="box_contpop">
			    <div class="pop_result"><img id="popup_result" style="width:725px;height:1302px;" src="../images/img_popend.jpg" alt=""></div>
		    </div>
        </div>
    </div>
</asp:Content>
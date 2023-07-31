<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Page Title="" Language="C#" MasterPageFile="~/Account/UserPage.Master" AutoEventWireup="true" CodeBehind="content.aspx.cs" Inherits="jobworld.Account.content" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        var currentId = -1;
        var currentAdv = 0;
        var adv_type = 0;
        var sel_content_type = 0;

        $(document).ready(function () {
            document.getElementById("menu2").style.background = "#2d96c1";
            document.getElementById("menu1").style.background = "";
            document.getElementById("menu3").style.background = "";

            $('#adv_file').bind('change', function () {
                $('#adv_file_text').val(this.value.replace('C:\\fakepath\\', ''));

                var files = document.getElementById('adv_file').files;

                var file, img;
                if ((file = this.files[0])) {
                    img = new Image();
                    img.src = URL.createObjectURL(file);

                    img.onload = function () {
                        marker_width = this.width;
                        marker_height = this.height;
                    };
                }

                if (FileReader && files && files.length) {
                    var fr = new FileReader();
                    fr.onload = function () {
                        $('#previewAdv').attr("src", fr.result);
                    }
                    fr.readAsDataURL(files[0]);
                }
            });

            if (sel_content_type == 0) {
                onContentList();
            }
            else if (sel_content_type == 1) {
                onAdvertisement();
            }

            $.ajax({
                url: 'getNewsname.aspx?type=0',
                type: "post",
                async: false,
                success: function (data) {
                    try {
                        var xmlDoc = new DOMParser().parseFromString(data, 'text/xml');
                    }
                    catch (e) {

                    }
                    try {
                        var x = xmlDoc.getElementsByTagName("content");
                    }
                    catch (e) {

                    }
                    for (i = 0; i < x.length; i++) {
                        for(var j = 0; j < 8; j ++)
                        {
                            try {
                                var name = x[i].getElementsByTagName("name")[j].childNodes[0].nodeValue;
                                document.getElementById("news" + (j + 1)).value = name;
                            }
                            catch (e) {

                            }
                            try {
                                var link = x[i].getElementsByTagName("link")[j].childNodes[0].nodeValue;
                                document.getElementById("link" + (j + 1)).value = link;
                            }
                            catch (e) {

                            }
                        }
                    }
                },
                error: function (data) {
                }
            });

            $('#title_letters').text('0');
            $('#content_letters').text('0');
            $('#summary_letters').text('0');
            $("#<%=title.ClientID %>").bind('keyup paste drop', function (e) {
                $('#title_letters').text($("#<%=title.ClientID %>").val().length);
            });

            $("#<%=econtent.ClientID %>").bind('keyup paste drop', function (e) {
                $('#content_letters').text($("#<%=econtent.ClientID %>").val().length);
            });

            $("#<%=summary.ClientID %>").bind('keyup paste drop', function (e) {
                $('#summary_letters').text($("#<%=summary.ClientID %>").val().length);
            });
        });

        function onContentList()
        {
            document.getElementById("showArticleContent").style.display = "";
            document.getElementById("showArticleSearch").style.display = "none";
            document.getElementById("showAdvertisementContent").style.display = "none";
            document.getElementById("newsContent").style.display = "";
            document.getElementById("AdvContent").style.display = "none";
            sel_content_type = 0;
        }

        function onAdvertisement()
        {
            document.getElementById("showArticleContent").style.display = "none";
            document.getElementById("showArticleSearch").style.display = "none";
            document.getElementById("showAdvertisementContent").style.display = "";
            document.getElementById("newsContent").style.display = "none";
            document.getElementById("AdvContent").style.display = "";
            sel_content_type = 1;
            onShowAdv1Content();
        }

        function clearContent()
        {
            $.ajax({
                url: 'getlist.aspx',
                type: "post",
                async: false,
                success:function (data)
                {
                    var list = data.split(',');
                    for(var i = 0; i < list.length - 1; i ++)
                    {
                        try{
                            var licontent = "liContent" + list[i];
                            document.getElementById(licontent).setAttribute("class", "");
                        }
                        catch(e)
                        {

                        }
                    }
                },
                error: function (data) {
                }
            });
        }

        function showContent(id) {
            $.ajax({
                url: 'getContent.aspx?id=' + id,
                type: "post",
                async: false,
                success: function (data) {
                    clearContent();
                    var licontent = "liContent" + id;
                    document.getElementById(licontent).setAttribute("class", "on");

                    currentId = id;
                    document.getElementById("<%=currentID.ClientID %>").value = currentId;
                    var xmlDoc = new DOMParser().parseFromString(data, 'text/xml');
                    var x = xmlDoc.getElementsByTagName("content");
                    for (var i = 0; i < x.length; i++) {
                        try{
                            var title = x[i].getElementsByTagName("title")[0].childNodes[0].nodeValue;
                        }
                        catch(e)
                        {

                        }
                        try{
                            var content = x[i].getElementsByTagName("econtent")[0].childNodes[0].nodeValue;
                        }
                        catch(e)
                        {

                        }
                        try
                        {
                            var summary = x[i].getElementsByTagName("summary")[0].childNodes[0].nodeValue;
                        }
                        catch(e)
                        {

                        }
                        try
                        {
                            var imagepath = x[i].getElementsByTagName("imagepath")[0].childNodes[0].nodeValue;
                            imagepath = conDomain + imagepath;
                        }
                        catch (e)
                        {

                        }
                        try{
                            var type = x[i].getElementsByTagName("type")[0].childNodes[0].nodeValue;
                        }
                        catch(e)
                        {

                        }

                        if (type == "0")
                        {
                            $("#<%=sel_type.ClientID %>").val("정치/사회");
                        }
                        else if (type == "1")
                        {
                            $("#<%=sel_type.ClientID %>").val("경제/국제");
                        }
                        else if (type == "2")
                        {
                            $("#<%=sel_type.ClientID %>").val("문화/예술");
                        }
                        else if (type == "3")
                        {
                            $("#<%=sel_type.ClientID %>").val("과학/기술");
                        }
                        else if (type == "4")
                        {
                            $("#<%=sel_type.ClientID %>").val("취재기사");
                        }

                        try {
                            var author = x[i].getElementsByTagName("author")[0].childNodes[0].nodeValue;
                        }
                        catch (e) {

                        }

                        content = content.split('\\r\\n\\r\\n').join('\r\n');
                        summary = summary.split('\\r\\n\\r\\n').join('\r\n');

                        content = content.split('\\r\\n').join('\r\n');
                        summary = summary.split('\\r\\n').join('\r\n');

                        $("#<%=title.ClientID %>").val(title);
                        $("#<%=econtent.ClientID %>").val(content);
                        $("#<%=summary.ClientID %>").val(summary);
                        $("#<%=author.ClientID %>").val(author);
                        if(imagepath && imagepath != "")
                            $("#<%=showPhoto.ClientID %>").attr('src', imagepath);
                        else
                            $("#<%=showPhoto.ClientID %>").attr('src', "");
                    }
                },
                error: function (data) {
                }
            });
            $('#title_letters').text($("#<%=title.ClientID %>").val().length);
            $('#content_letters').text($("#<%=econtent.ClientID %>").val().length);
            $('#summary_letters').text($("#<%=summary.ClientID %>").val().length);
        }

        function onModifyContent()
        {
//            document.getElementById("<%=title.ClientID %>").disabled = false;
//            document.getElementById("<%=sel_type.ClientID %>").disabled = false;
//            document.getElementById("<%=econtent.ClientID %>").disabled = false;
//            document.getElementById("<%=summary.ClientID %>").disabled = false;
//            document.getElementById("<%=showPhoto.ClientID %>").disabled = false;
            modify_condition = 1;
/*
            if (!checkImgExtention("content_file", "img")) {
                alert("파일형식이 올바르지 않습니다.");
                return false;
            }
*/
            if (currentId == -1)
            {
                document.getElementById("popupForm").style.display = "";
                document.getElementById("modifyFormpopup").style.display = "";
                return;
            }
            var file = document.getElementById("content_file");
            if (file.files[0] != null) {
                var data = new FormData();
                data.append("upfile", file.files[0]);
                $.ajax({
                    url: 'PostUpload.aspx?type=3&id=' + currentId,
                    type: "post",
                    data: data,
                    processData: false,
                    contentType: false,
                    async: false,
                    success: function (data, textStatus, jqXHR) {
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                    }
                });
            }

            var title = document.getElementById("<%=title.ClientID %>").value;
            var sel_type = document.getElementById("<%=sel_type.ClientID %>").value;
            var content = document.getElementById("<%=econtent.ClientID %>").value;
            var summary = document.getElementById("<%=summary.ClientID %>").value;
            var author = document.getElementById("<%=author.ClientID %>").value;
            var contentdata = new FormData();
            contentdata.append("title", title);
            contentdata.append("sel_type", sel_type);
            contentdata.append("content", content);
            contentdata.append("summary", summary);
            contentdata.append("author", author);

            $.ajax({
                url: 'modifyContent.aspx?id=' + currentId,
                type: "post",
                data: contentdata,
                processData: false,
                contentType: false,
                async: false,
                success: function (data, textStatus, jqXHR) {
                    alert(data);
                    location.reload();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                }
            });
        }

        function onDeleteContent()
        {
            if (currentId == -1)
            {
                document.getElementById("popupForm").style.display = "";
                document.getElementById("deleteFormpopup").style.display = "";
                return;
            }

            $.ajax({
                url: 'deleteContent.aspx?id=' + currentId,
                type: "post",
                processData: false,
                contentType: false,
                async: false,
                success: function (data, textStatus, jqXHR) {
                    alert(data);
                    location.reload();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    onClosePopup();
                    document.getElementById("popupForm").style.display = "";
                    document.getElementById("deleteFormpopup2").style.display = "";
                }
            });
        }

        function onRegisterContent()
        {
/*
            if (!checkImgExtention("content_file", "img")) {
                alert("파일형식이 올바르지 않습니다.");
                return false;
            }
*/
            var file = document.getElementById("content_file");
            var reg_type = 0;
            if (file.files[0] != null) {
                var data = new FormData();
                data.append("upfile", file.files[0]);
                $.ajax({
                    url: 'PostUpload.aspx?type=4&id=' + currentId,
                    type: "post",
                    data: data,
                    processData: false,
                    contentType: false,
                    async: false,
                    success: function (data, textStatus, jqXHR) {
                        reg_type = 1;
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                    }
                });
            }

            register_condition = 1;

            var title = document.getElementById("<%=title.ClientID %>").value;
            var sel_type = document.getElementById("<%=sel_type.ClientID %>").value;
            var content = document.getElementById("<%=econtent.ClientID %>").value;
            var summary = document.getElementById("<%=summary.ClientID %>").value;
            var author = document.getElementById("<%=author.ClientID %>").value;
            var contentdata = new FormData();
            contentdata.append("title", title);
            contentdata.append("sel_type", sel_type);
            contentdata.append("content", content);
            contentdata.append("summary", summary);
            contentdata.append("author", author);
            $.ajax({
                url: 'registerContent.aspx?id=' + reg_type,
                type: "post",
                data: contentdata,
                processData: false,
                contentType: false,
                async: false,
                success: function (data, textStatus, jqXHR) {
                    alert(data);
                    location.reload();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                }
            });
        }

        function onCancel()
        {
            currentId = -1;
            document.getElementById("title").value = "";
            document.getElementById("econtent").value = "";
            document.getElementById("summary").value = "";
            document.getElementById("<%=showPhoto.ClientID %>").src = "";
            document.getElementById("sel_type").value = "정치";
        }

        function onShowAdv1()
        {
            onShowAdv1Content();
            document.getElementById("adv1").style.display = '';
            document.getElementById("adv2").style.display = 'none';
            document.getElementById("adv3").style.display = 'none';
        }

        function onShowAdv2()
        {
            onShowAdv2Content();
            document.getElementById("adv1").style.display = 'none';
            document.getElementById("adv2").style.display = '';
            document.getElementById("adv3").style.display = 'none';
        }

        function onShowAdv3()
        {
            onShowAdv3Content();
            document.getElementById("adv1").style.display = 'none';
            document.getElementById("adv2").style.display = 'none';
            document.getElementById("adv3").style.display = '';
        }

        function onShowAdv4() {
            onShowAdv4Content();
        }

        function showAdvContent(id)
        {
            $.ajax({
                url: 'getAdvContent.aspx?id=' + id,
                type: "post",
                async: false,
                success: function (data) {
                    currentAdv = id;
                    var cons = data.split(',');
                    var type = cons[1];
                    if (type == "0")
                    {
                        onShowAdv1Content();
                    }
                    else if (type == "1")
                    {
                        onShowAdv2Content();
                    }
                    else if (type == "2")
                    {
                        onShowAdv3Content();
                    }
                    document.getElementById("previewAdv").src = advDomain + cons[0];
                },
                error: function (data) {

                }
            });
        }

        function onShowAdv1Content()
        {
            document.getElementById("adv_li1").setAttribute("class", "on");
            document.getElementById("adv_li2").setAttribute("class", "");
            document.getElementById("adv_li3").setAttribute("class", "");
            document.getElementById("adv_li4").setAttribute("class", "");
            document.getElementById("noticeAdv").innerText = "정사각형의 광고 이미지파일만을 등록할 수 있습니다.";
            document.getElementById("previewAdv").style = "width:303px;height:303px;";
            adv_type = 0;
            document.getElementById("news").style.display = "none";
            document.getElementById("showAdv").style.display = "";
            document.getElementById("noticeImage").innerHTML = "<span>500*500크기의 사진만 등록해 주세요<br />jpg, jpeg,png파일만 가능합니다.<br />최대 사진 용량은 5MB입니다.</span>";
        }

        function onShowAdv2Content() {
            document.getElementById("adv_li2").setAttribute("class", "on");
            document.getElementById("adv_li1").setAttribute("class", "");
            document.getElementById("adv_li3").setAttribute("class", "");
            document.getElementById("adv_li4").setAttribute("class", "");
            document.getElementById("noticeAdv").innerText = "7:3비율의 광고 이미지파일만 등록할 수 있습니다.";
            document.getElementById("previewAdv").style = "width:303px;height:130px;";
            adv_type = 1;
            document.getElementById("news").style.display = "none";
            document.getElementById("showAdv").style.display = "";
            document.getElementById("noticeImage").innerHTML = "<span>700*300크기의 사진만 등록해 주세요<br />jpg, jpeg,png파일만 가능합니다.<br />최대 사진 용량은 5MB입니다.</span>";
        }

        function onShowAdv3Content() {
            document.getElementById("adv_li3").setAttribute("class", "on");
            document.getElementById("adv_li2").setAttribute("class", "");
            document.getElementById("adv_li1").setAttribute("class", "");
            document.getElementById("adv_li4").setAttribute("class", "");
            document.getElementById("noticeAdv").innerText = "5:3비율의 광고 이미지파일만 등록할 수 있습니다.";
            document.getElementById("previewAdv").style = "width:303px;height:182px;";
            adv_type = 2;
            document.getElementById("news").style.display = "none";
            document.getElementById("showAdv").style.display = "";
            document.getElementById("noticeImage").innerHTML = "<span>1,500*900크기의 사진만 등록해 주세요<br />jpg, jpeg,png파일만 가능합니다.<br />최대 사진 용량은 5MB입니다.</span>";
        }

        function onShowAdv4Content() {
            document.getElementById("adv_li4").setAttribute("class", "on");
            document.getElementById("adv_li3").setAttribute("class", "");
            document.getElementById("adv_li2").setAttribute("class", "");
            document.getElementById("adv_li1").setAttribute("class", "");
            document.getElementById("showAdv").style.display = "none";
            document.getElementById("news").style.display = "";
        }

        function onCancelAdv()
        {
            document.getElementById("previewAdv").src = "";
            document.getElementById("adv_file_text").value = "";
        }

        function onModifyAdvContent()
        {
            if ($("#adv_file_text").val() == "") {
                onClosePopup();
                document.getElementById("popupForm").style.display = "";
                document.getElementById("modifyAdvFormpopup").style.display = "";
                return false;
            }

            if (!checkImgExtention("adv_file", "img")) {
                onClosePopup();
                document.getElementById("popupForm").style.display = "";
                document.getElementById("fileFormpopup").style.display = "";
                return false;
            }
            var file = document.getElementById("adv_file");
            if (file.files[0] != null) {
                var data = new FormData();
                data.append("upfile", file.files[0]);
                $.ajax({
                    url: 'PostUpload.aspx?type=1&id=' + currentAdv + "&adv_type=" + adv_type,
                    type: "post",
                    data: data,
                    processData: false,
                    contentType: false,
                    async: false,
                    success: function (data, textStatus, jqXHR) {
                        alert(data);
                        location.reload();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        onClosePopup();
                        document.getElementById("popupForm").style.display = "";
                        document.getElementById("modifyAdvFormpopup2").style.display = "";
                    }
                });
            }
        }

        function onRegisterAdvContent()
        {
            if ($("#adv_file_text").val() == "") {
                onClosePopup();
                document.getElementById("popupForm").style.display = "";
                document.getElementById("registerAdvFormpopup2").style.display = "";
                return false;
            }

            if (!checkImgExtention("adv_file", "img")) {
                onClosePopup();
                document.getElementById("popupForm").style.display = "";
                document.getElementById("fileFormpopup").style.display = "";
                return false;
            }
            var file = document.getElementById("adv_file");
            if (file.files[0] != null) {
                var data = new FormData();
                data.append("upfile", file.files[0]);
                $.ajax({
                    url: 'PostUpload.aspx?type=2&id=' + currentAdv + "&adv_type=" + adv_type,
                    type: "post",
                    data: data,
                    processData: false,
                    contentType: false,
                    async: false,
                    success: function (data, textStatus, jqXHR) {
                        alert(data);
                        location.reload();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        onClosePopup();
                        document.getElementById("popupForm").style.display = "";
                        document.getElementById("registerAdvFormpopup1").style.display = "";
                    }
                });
            }
        }

        function onDeleteAdvContent() {
            if (currentAdv == 0)
            {
                onClosePopup();
                document.getElementById("popupForm").style.display = "";
                document.getElementById("deleteAdvFormpopup").style.display = "";
                return;
            }
            $.ajax({
                url: 'deleteAdvContent.aspx?id=' + currentAdv,
                type: "post",
                processData: false,
                contentType: false,
                async: false,
                success: function (data, textStatus, jqXHR) {
                    alert(data);
                    location.reload();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    onClosePopup();
                    document.getElementById("popupForm").style.display = "";
                    document.getElementById("deleteAdvFormpopup2").style.display = "";
                }
            });
        }

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#previewAdv').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        function readURL1(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=showPhoto.ClientID %>').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        function onApplyNews()
        {
            var data = new FormData();
            for (var i = 0; i < 8; i++)
            {
                var name = document.getElementById("news" + (i + 1)).value;
                var link = document.getElementById("link" + (i + 1)).value;
                data.append("name" + i, name);
                data.append("link" + i, link);
            }
            $.ajax({
                url: 'getNewsname.aspx?type=1',
                type: "post",
                data: data,
                processData: false,
                contentType: false,
                async: false,
                success: function (data, textStatus, jqXHR) {
                    alert('성공적으로 적용되었습니다.');
                    location.reload();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                }
            });
        }

        function onClosePopup()
        {
            document.getElementById("popupForm").style.display = "none";
            document.getElementById("modifyFormpopup").style.display = "none";
            document.getElementById("modifyAdvFormpopup").style.display = "none";
            document.getElementById("modifyFormpopup1").style.display = "none";
            document.getElementById("modifyAdvFormpopup1").style.display = "none";
            document.getElementById("modifyFormpopup2").style.display = "none";
            document.getElementById("modifyAdvFormpopup2").style.display = "none";
            document.getElementById("registerFormpopup").style.display = "none";
            document.getElementById("registerAdvFormpopup").style.display = "none";
            document.getElementById("registerFormpopup1").style.display = "none";
            document.getElementById("registerAdvFormpopup1").style.display = "none";
            document.getElementById("deleteFormpopup1").style.display = "none";
            document.getElementById("deleteAdvFormpopup1").style.display = "none";
            document.getElementById("deleteFormpopup").style.display = "none";
            document.getElementById("deleteAdvFormpopup").style.display = "none";
            document.getElementById("deleteFormpopup2").style.display = "none";
            document.getElementById("deleteAdvFormpopup2").style.display = "none";
            document.getElementById("fileFormpopup").style.display = "none";
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrap_2col clfix">
		<div class="lnb fl">
			<div class="tablist">
				<ul>
					<li class="on"><a onclick="onContentList()" style="cursor:pointer"><strong>기사</strong>(사진)</a></li>
					<li><a onclick="onAdvertisement()" style="cursor:pointer">광고</a></li>
				</ul>
			</div>

            <div id="showArticleSearch" style="display:none">
                <table>
                    <tr>
                        <td>
                            <asp:DropDownList ID="articleSearch" runat="server">
                                <asp:ListItem>기사제목보기</asp:ListItem>
                                <asp:ListItem>기사요약보기</asp:ListItem>
                                <asp:ListItem>기사원고보기</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button Text="Search" ID="showArticelSearchButton" OnClick="onShowArticleSearch" runat="server" />
                        </td>
                    </tr>
                </table>
            </div>

            <div id="showArticleContent" style="height:100%;overflow-y:auto" class="dt_list">
				<ul>
                    <asp:Literal ID="showContent" runat="server" ></asp:Literal>
				</ul>
            </div>

            <div id="showAdvertisementContent" class="dt_list2" style="display:none">
				<div>
                    <div class="l_tit"><strong style="cursor:pointer">사각광고</strong>
                        <a><img src="../images/ico_adup.png" alt="" /></a>
                    </div>
                    <div id="adv1">
					    <ul>
                            <asp:Literal ID="AdvertisementList1" runat="server" ></asp:Literal>
					    </ul>
                    </div>
				</div>
				<div>
                    <div class="l_tit"><strong style="cursor:pointer">배너광고</strong>
                        <a><img src="../images/ico_adup.png" alt="" /></a>
                    </div>
                    <div id="adv2">
					    <ul>
                            <asp:Literal ID="AdvertisementList2" runat="server" ></asp:Literal>
					    </ul>
                    </div>
				</div>
				<div>
                    <div class="l_tit"><strong style="cursor:pointer">삼단광고</strong>
                        <a><img src="../images/ico_adup.png" alt="" /></a>
                    </div>
                    <div id="adv3">
					    <ul>
                            <asp:Literal ID="AdvertisementList3" runat="server" ></asp:Literal>
					    </ul>
                    </div>
				</div>
            </div>
		</div>

		<div id="content" class="fl" style="position:relative;overflow-y:auto;">
			<div class="board_write" id="newsContent">
				<table>
					<colgroup>
						<col style="width: 15%;">
						<col style="width: 35%;">
						<col style="width: 15%;">
						<col style="width: 35%;">
					</colgroup>
					<tbody>
						<tr>
							<th>분류</th>
							<td>
                                <select id="sel_type" runat="server">
                                    <option>정치/사회</option>
                                    <option>경제/국제</option>
                                    <option>문화/예술</option>
                                    <option>과학/기술</option>
                                    <option>취재기사</option>
                                </select>
                                <input type="hidden" id="currentID" value="-1" runat="server" />
                                <input type="hidden" id="modify_condition" value="0" runat="server" />
                                <input type="hidden" id="register_condition" value="0" runat="server" />
							</td>
                            <th>기자</th>
							<td>
                                <input type="text" id="author" maxlength="6" runat="server" style="width: 260px" />
							</td>
                        </tr>
						<tr>
							<th scope="row">제목<br />
                                <span id="title_letters"></span>
                                <span> / 30</span>
							</th>
							<td colspan="4"><input type="text"  runat="server" id="title" /></td>
						</tr>
						<tr>
							<th scope="row">내용<br />
                                <span id="content_letters"></span>
                                <span> / 450</span>
							</th>
							<td colspan="4">
								<textarea id="econtent" runat="server" class="dat1"></textarea>
							</td>
						</tr>
						<tr>
							<th scope="row">요약<br />
                                <span id="summary_letters"></span>
                                <span> / 250</span>
							</th>
							<td colspan="4">
								<textarea id="summary" runat="server" class="dat2"></textarea>
							</td>
						</tr>
						<tr>
							<th scope="row">사진</th>
							<td colspan="4">
								<div class="file_inp">
									<input type="text" class="uploadfile" value="" disabled="disabled" />
									<label for="filesearch" class="btn_filesearch"><span onclick = "javascript:OnBrowse('content_file')" style="cursor: pointer;">
                                        <img src="../images/ico_file.png" alt="" /></span></label>
       									<input type="file" id="content_file" name="content_image_path" accept="image/png, image/jpeg" class="hidden" onchange="readURL1(this);" />
                                        <table><tbody><tr><td>
                                            <img id="showPhoto" runat="server" style="width:300px;padding-top: 10px;" />
                                        </td><td><center>
                                          <span>1,024X768 크기의 사진만 등록해 주세요.<br />jpg, jpeg, png 파일만 가능합니다.<br />
                                                최대 사진 용량은 5MB입니다.
                                          </span></center></td></tr>
                                        </tbody></table>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
                <div class="box_btnbm align-c margnon">
			        <div class="btn_nor disib" style="cursor:pointer">
                        <a onclick="onModifyContent()" style="cursor:pointer;" id="modifyContent">수정</a>
			        </div>
			        <div class="btn_nor disib" style="cursor:pointer">
                        <a onclick="onRegisterContent()" style="cursor:pointer;" id="registerContent">등록</a>
			        </div>
			        <div class="btn_nor disib" style="cursor:pointer">
                        <a onclick="onDeleteContent()" style="cursor:pointer;" id="DeleteContent">삭제</a>
			        </div>
			        <div class="btn_nor disib"><a onclick="onCancel()" style="cursor:pointer;" id="cancel">취소</a></div>
			    </div>
			</div>

            <div id="AdvContent" class="fl">
			    <div class="tabtp">
				    <ul class="clfix">
					    <li id="adv_li1" class="on"><a onclick="onShowAdv1Content()" style="cursor:pointer">사각광고</a></li>
					    <li id="adv_li2"><a onclick="onShowAdv2Content()" style="cursor:pointer">배너광고</a></li>
					    <li id="adv_li3"><a onclick="onShowAdv3Content()" style="cursor:pointer">3단광고</a></li>
					    <li id="adv_li4"><a onclick="onShowAdv4Content()" style="cursor:pointer">많이 본 기사</a></li>
				    </ul>
			    </div>

                <div id="showAdv">
			        <p id="noticeAdv" class="txwpp">정사각형의 광고 이미지파일을 등록할 수 있습니다.</p>
			        <div class="board_write" style="height: 581px;">
				        <table>
					        <colgroup>
						        <col style="width: 15%;">
						        <col style="width: 85%;">
					        </colgroup>
					        <tbody>
						        <tr>
							        <th scope="row">업로드</th>
							        <td>
								        <div class="file_inp file2">
									        <input type="text" id="adv_file_text" placeholder="jpg,jpeg,png 파일" class="uploadfile" value="" disabled="disabled" />
									        <label for="adv_file_text" onclick = "javascript:OnBrowse('adv_file')" style="cursor: pointer;" class="btn_filesearch">
                                                <span><img src="../images/ico_file.png" alt=""></span></label>
									        <input type="file" id="adv_file" name="adv_image_path" accept="image/png, image/jpeg" class="hidden" onchange="document.getElementById('adv_file_text').value=this.value; readURL(this);" />
								        </div>
							        </td>
						        </tr>
						        <tr>
							        <th scope="row">미리보기</th>
							        <td>
                                        <table>
                                            <tr>
                                                <td style="width:50%">
            								        <img id="previewAdv" src="" alt="" class="imgview">
                                                </td>
                                                <td id="noticeImage">
                                                    <span>[500*500크기의 사진만 등록해 주세요<br />jpg, jpeg,png파일만 가능합니다.<br />최대 사진 용량은 5MB입니다.</span>
                                                </td>
                                            </tr>
                                        </table>
							        </td>
						        </tr>
					        </tbody>
				        </table>
			        </div>
			        <div class="box_btnbm align-c margnon">
				        <div class="btn_nor disib"><a onclick="onModifyAdvContent()" style="cursor:pointer" id="modifyAdv">수정</a></div>
				        <div class="btn_nor disib"><a onclick="onRegisterAdvContent()" style="cursor:pointer" id="registerAdv">등록</a></div>
				        <div class="btn_nor disib"><a onclick="onDeleteAdvContent()" style="cursor:pointer" id="deleteAdv">삭제</a></div>
				        <div class="btn_nor disib"><a onclick="onCancelAdv()" style="cursor:pointer">취소</a></div>
			        </div>
                </div>

                <div id="news">
                    <div id="newsField">
                        <p class="txwpp">많이 본 기사 모듈의 기사를 관리합니다.</p>
                        <div class="board_write">
                            <table>
                                <colgroup>
						            <col style="width: 8%;"><col style="width: 42%;"><col style="width: 50%;">
					            </colgroup>
                                <thead>
						            <tr>
							            <th></th>
							            <th>제목 (영문 25글자, 한글 12글자 이내)</th>
							            <th>링크</th>
						            </tr>
            					</thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            1
                                        </td>
                                        <td>
                                            <input type="text" id="news1" />                                      
                                        </td>
                                        <td>
                                            <input type="text" id="link1" />                                        
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            2
                                        </td>
                                        <td>
                                            <input type="text" id="news2" />                                      
                                        </td>
                                        <td>
                                            <input type="text" id="link2" />                                        
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            3
                                        </td>
                                        <td>
                                            <input type="text" id="news3" />                                      
                                        </td>
                                        <td>
                                            <input type="text" id="link3" />                                        
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            4
                                        </td>
                                        <td>
                                            <input type="text" id="news4" />                                      
                                        </td>
                                        <td>
                                            <input type="text" id="link4" />                                        
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            5
                                        </td>
                                        <td>
                                            <input type="text" id="news5" />                                      
                                        </td>
                                        <td>
                                            <input type="text" id="link5" />                                        
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            6
                                        </td>
                                        <td>
                                            <input type="text" id="news6" />                                      
                                        </td>
                                        <td>
                                            <input type="text" id="link6" />                                        
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            7
                                        </td>
                                        <td>
                                            <input type="text" id="news7" />                                      
                                        </td>
                                        <td>
                                            <input type="text" id="link7" />                                        
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            8
                                        </td>
                                        <td>
                                            <input type="text" id="news8" />                                      
                                        </td>
                                        <td>
                                            <input type="text" id="link8" />                                        
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
			        <div class="box_btnbm align-c margnon">
				        <div class="btn_nor disib"><a onclick="onApplyNews()" style="cursor:pointer" id="apply">적용</a></div>
			        </div>
                </div>
            </div>
		</div>

        <div class="wrap_layerpop" id="popupForm" style="display:none;position: absolute;height: 100%;width: 1920px;">
            <div class="layerpop pop1" id="modifyFormpopup" style="display:none">
		        <div class="box_titpop">
			        <h2>기사 확인</h2>
			        <div class="btn_close"><button type="button">닫기</button></div>
		        </div>
		        <div class="box_contpop">
			        <div class="box_in">
				        <p class="tx_t1">수정할 기사를 선택하세요.</p>
				        <div class="btn_polst">
					        <span class="btn_askk"><a onclick="onClosePopup()" style="cursor:pointer">확인</a></span>
				        </div>
			        </div>
		        </div>
	        </div>

            <div class="layerpop pop1" id="registerFormpopup2" style="display:none">
		        <div class="box_titpop">
			        <h2>등록기사 확인</h2>
			        <div class="btn_close"><button type="button">닫기</button></div>
		        </div>
		        <div class="box_contpop">
			        <div class="box_in">
				        <p class="tx_t1">등록할 기사를 선택하세요.</p>
				        <div class="btn_polst">
					        <span class="btn_askk"><a onclick="onClosePopup()" style="cursor:pointer">확인</a></span>
				        </div>
			        </div>
		        </div>
	        </div>

            <div class="layerpop pop1" id="modifyAdvFormpopup" style="display:none">
		        <div class="box_titpop">
			        <h2>광고이미지 확인</h2>
			        <div class="btn_close"><button type="button">닫기</button></div>
		        </div>
		        <div class="box_contpop">
			        <div class="box_in">
				        <p class="tx_t1">수정할 광고이미지를 선택하세요.</p>
				        <div class="btn_polst">
					        <span class="btn_askk"><a onclick="onClosePopup()" style="cursor:pointer">확인</a></span>
				        </div>
			        </div>
		        </div>
	        </div>

            <div class="layerpop pop1" id="registerAdvFormpopup2" style="display:none">
		        <div class="box_titpop">
			        <h2>광고이미지 등록확인</h2>
			        <div class="btn_close"><button type="button">닫기</button></div>
		        </div>
		        <div class="box_contpop">
			        <div class="box_in">
				        <p class="tx_t1">등록할 광고이미지를 선택하세요.</p>
				        <div class="btn_polst">
					        <span class="btn_askk"><a onclick="onClosePopup()" style="cursor:pointer">확인</a></span>
				        </div>
			        </div>
		        </div>
	        </div>

            <div class="layerpop pop1" id="modifyFormpopup1" style="display:none">
		        <div class="box_titpop">
			        <h2>기사수정 확인</h2>
			        <div class="btn_close"><button type="button">닫기</button></div>
		        </div>
		        <div class="box_contpop">
			        <div class="box_in">
				        <p class="tx_t1">성공적으로 수정되었습니다.</p>
				        <div class="btn_polst">
					        <span class="btn_askk"><a onclick="onClosePopup()" style="cursor:pointer">확인</a></span>
				        </div>
			        </div>
		        </div>
	        </div>

            <div class="layerpop pop1" id="modifyAdvFormpopup1" style="display:none">
		        <div class="box_titpop">
			        <h2>광고이미지수정 확인</h2>
			        <div class="btn_close"><button type="button">닫기</button></div>
		        </div>
		        <div class="box_contpop">
			        <div class="box_in">
				        <p class="tx_t1">성공적으로 수정되었습니다.</p>
				        <div class="btn_polst">
					        <span class="btn_askk"><a onclick="onClosePopup()" style="cursor:pointer">확인</a></span>
				        </div>
			        </div>
		        </div>
	        </div>

            <div class="layerpop pop1" id="modifyFormpopup2" style="display:none">
		        <div class="box_titpop">
			        <h2>기사수정 확인</h2>
			        <div class="btn_close"><button type="button">닫기</button></div>
		        </div>
		        <div class="box_contpop">
			        <div class="box_in">
				        <p class="tx_t1">수정에 실패했습니다.</p>
				        <div class="btn_polst">
					        <span class="btn_askk"><a onclick="onClosePopup()" style="cursor:pointer">확인</a></span>
				        </div>
			        </div>
		        </div>
	        </div>

            <div class="layerpop pop1" id="modifyAdvFormpopup2" style="display:none">
		        <div class="box_titpop">
			        <h2>광고이미지수정 확인</h2>
			        <div class="btn_close"><button type="button">닫기</button></div>
		        </div>
		        <div class="box_contpop">
			        <div class="box_in">
				        <p class="tx_t1">수정에 실패했습니다.</p>
				        <div class="btn_polst">
					        <span class="btn_askk"><a onclick="onClosePopup()" style="cursor:pointer">확인</a></span>
				        </div>
			        </div>
		        </div>
	        </div>

            <div class="layerpop pop1" id="registerFormpopup" style="display:none">
		        <div class="box_titpop">
			        <h2>기사등록 확인</h2>
			        <div class="btn_close"><button type="button">닫기</button></div>
		        </div>
		        <div class="box_contpop">
			        <div class="box_in">
				        <p class="tx_t1">성공적으로 등록되었습니다.</p>
				        <div class="btn_polst">
					        <span class="btn_askk"><a onclick="onClosePopup()" style="cursor:pointer">확인</a></span>
				        </div>
			        </div>
		        </div>
	        </div>

            <div class="layerpop pop1" id="registerAdvFormpopup" style="display:none">
		        <div class="box_titpop">
			        <h2>광고이미지등록 확인</h2>
			        <div class="btn_close"><button type="button">닫기</button></div>
		        </div>
		        <div class="box_contpop">
			        <div class="box_in">
				        <p class="tx_t1">성공적으로 등록되었습니다.</p>
				        <div class="btn_polst">
					        <span class="btn_askk"><a onclick="onClosePopup()" style="cursor:pointer">확인</a></span>
				        </div>
			        </div>
		        </div>
	        </div>

            <div class="layerpop pop1" id="registerFormpopup1" style="display:none">
		        <div class="box_titpop">
			        <h2>기사등록 확인</h2>
			        <div class="btn_close"><button type="button">닫기</button></div>
		        </div>
		        <div class="box_contpop">
			        <div class="box_in">
				        <p class="tx_t1">등록에 실패하였습니다.</p>
				        <div class="btn_polst">
					        <span class="btn_askk"><a onclick="onClosePopup()" style="cursor:pointer">확인</a></span>
				        </div>
			        </div>
		        </div>
	        </div>

            <div class="layerpop pop1" id="registerAdvFormpopup1" style="display:none">
		        <div class="box_titpop">
			        <h2>광고이미지등록 확인</h2>
			        <div class="btn_close"><button type="button">닫기</button></div>
		        </div>
		        <div class="box_contpop">
			        <div class="box_in">
				        <p class="tx_t1">등록에 실패하였습니다.</p>
				        <div class="btn_polst">
					        <span class="btn_askk"><a onclick="onClosePopup()" style="cursor:pointer">확인</a></span>
				        </div>
			        </div>
		        </div>
	        </div>

            <div class="layerpop pop1" id="deleteFormpopup1" style="display:none">
		        <div class="box_titpop">
			        <h2>기사삭제 확인</h2>
			        <div class="btn_close"><button type="button">닫기</button></div>
		        </div>
		        <div class="box_contpop">
			        <div class="box_in">
				        <p class="tx_t1">성공적으로 삭제되었습니다.</p>
				        <div class="btn_polst">
					        <span class="btn_askk"><a onclick="onClosePopup()" style="cursor:pointer">확인</a></span>
				        </div>
			        </div>
		        </div>
	        </div>

            <div class="layerpop pop1" id="deleteAdvFormpopup1" style="display:none">
		        <div class="box_titpop">
			        <h2>광고이미지삭제 확인</h2>
			        <div class="btn_close"><button type="button">닫기</button></div>
		        </div>
		        <div class="box_contpop">
			        <div class="box_in">
				        <p class="tx_t1">성공적으로 삭제되었습니다.</p>
				        <div class="btn_polst">
					        <span class="btn_askk"><a onclick="onClosePopup()" style="cursor:pointer">확인</a></span>
				        </div>
			        </div>
		        </div>
	        </div>

            <div class="layerpop pop1" id="deleteFormpopup" style="display:none">
		        <div class="box_titpop">
			        <h2>기사 확인</h2>
			        <div class="btn_close"><button type="button">닫기</button></div>
		        </div>
		        <div class="box_contpop">
			        <div class="box_in">
				        <p class="tx_t1">삭제할 기사를 선택하세요.</p>
				        <div class="btn_polst">
					        <span class="btn_askk"><a onclick="onClosePopup()" style="cursor:pointer">확인</a></span>
				        </div>
			        </div>
		        </div>
	        </div>

            <div class="layerpop pop1" id="deleteAdvFormpopup" style="display:none">
		        <div class="box_titpop">
			        <h2>광고이미지 확인</h2>
			        <div class="btn_close"><button type="button">닫기</button></div>
		        </div>
		        <div class="box_contpop">
			        <div class="box_in">
				        <p class="tx_t1">삭제할 광고이미지를 선택하세요.</p>
				        <div class="btn_polst">
					        <span class="btn_askk"><a onclick="onClosePopup()" style="cursor:pointer">확인</a></span>
				        </div>
			        </div>
		        </div>
	        </div>

            <div class="layerpop pop1" id="deleteFormpopup2" style="display:none">
		        <div class="box_titpop">
			        <h2>기사 확인</h2>
			        <div class="btn_close"><button type="button">닫기</button></div>
		        </div>
		        <div class="box_contpop">
			        <div class="box_in">
				        <p class="tx_t1">삭제하는 동안 오류가 발생했습니다.</p>
				        <div class="btn_polst">
					        <span class="btn_askk"><a onclick="onClosePopup()" style="cursor:pointer">확인</a></span>
				        </div>
			        </div>
		        </div>
	        </div>

            <div class="layerpop pop1" id="deleteAdvFormpopup2" style="display:none">
		        <div class="box_titpop">
			        <h2>광고이미지 확인</h2>
			        <div class="btn_close"><button type="button">닫기</button></div>
		        </div>
		        <div class="box_contpop">
			        <div class="box_in">
				        <p class="tx_t1">삭제하는 동안 오류가 발생했습니다.</p>
				        <div class="btn_polst">
					        <span class="btn_askk"><a onclick="onClosePopup()" style="cursor:pointer">확인</a></span>
				        </div>
			        </div>
		        </div>
	        </div>

            <div class="layerpop pop1" id="fileFormpopup" style="display:none">
		        <div class="box_titpop">
			        <h2>파일형식 확인</h2>
			        <div class="btn_close"><button type="button">닫기</button></div>
		        </div>
		        <div class="box_contpop">
			        <div class="box_in">
				        <p class="tx_t1">파일형식이 옳바르지 않습니다.</p>
				        <div class="btn_polst">
					        <span class="btn_askk"><a onclick="onClosePopup()" style="cursor:pointer">확인</a></span>
				        </div>
			        </div>
		        </div>
	        </div>
        </div>
	</div>
</asp:Content>

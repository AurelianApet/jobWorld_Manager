<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Page Title="" Language="C#" MasterPageFile="~/Account/UserPage.Master" AutoEventWireup="true" CodeBehind="kiosk.aspx.cs" Inherits="jobworld.Account.kiosk" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        var kiosk_list = "";
        var all_list = "";
        $(document).ready(function () {
            document.getElementById("menu3").style.background = "#2d96c1";
            document.getElementById("menu1").style.background = "";
            document.getElementById("menu2").style.background = "";
        });

        function KgotoFirstPage()
        {
            document.location = "kiosk.aspx?kpageno=1";
        }

        function KgotoLastPage(pageno) {
            document.location = "kiosk.aspx?kpageno=" + pageno;
        }

        function AgotoFirstPage()
        {
            document.location = "kiosk.aspx?allpageno=1";
        }

        function AgotoLastPage(pageno) {
            document.location = "kiosk.aspx?allpageno=" + pageno;
        }

        function onLeftBar()
        {
            var url = 'setKiosk.aspx?type=1&ids=' + all_list;
            $.ajax({
                url: url,
                type: "post",
                processData: false,
                contentType: false,
                async: false,
                success: function (data, textStatus, jqXHR) {
                    if (data == "success") {
                        location.reload();
                    }
                    else {
                        onClosePopup();
                        document.getElementById("popupForm").style.display = "";
                        document.getElementById("kiosk1Formpopup").style.display = "";
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    onClosePopup();
                    document.getElementById("popupForm").style.display = "";
                    document.getElementById("kiosk1Formpopup").style.display = "";
                }
            });

        }

        function onRightBar()
        {
            var url = 'setKiosk.aspx?type=0&ids=' + kiosk_list;
            $.ajax({
                url: url,
                type: "post",
                processData: false,
                contentType: false,
                async: false,
                success: function (data, textStatus, jqXHR) {
                    if (data == "success") {
                        location.reload();
                    }
                    else {
                        onClosePopup();
                        document.getElementById("popupForm").style.display = "";
                        document.getElementById("kiosk1Formpopup").style.display = "";
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    onClosePopup();
                    document.getElementById("popupForm").style.display = "";
                    document.getElementById("kiosk1Formpopup").style.display = "";
                }
            });
        }

        function setKiosk(id)
        {
            if (document.getElementById("kiosk_option" + id).checked == true)
                kiosk_list += id + ",";
            else
                kiosk_list = kiosk_list.replace(id + ",", "");
        }

        function setAll(id)
        {
            if (document.getElementById("all_option" + id).checked == true)
                all_list += id + ",";
            else
                all_list = all_list.replace(id + ",", "");
        }

        function kGoPrevPage(pageno)
        {
            pageno --;
            document.location = "kiosk.aspx?kpageno=" + pageno;
        }

        function kGoNextPage(pageno)
        {
            pageno++;
            document.location = "kiosk.aspx?kpageno=" + pageno;
        }

        function kGotoPage(pageno)
        {
            document.location = "kiosk.aspx?kpageno=" + pageno;
        }

        function AGoPrevPage(pageno) {
            pageno--;
            document.location = "kiosk.aspx?allpageno=" + pageno;
        }

        function AGoNextPage(pageno) {
            pageno++;
            document.location = "kiosk.aspx?allpageno=" + pageno;
        }

        function AGotoPage(pageno) {
            document.location = "kiosk.aspx?allpageno=" + pageno;
        }

        function showPreview(id) {
            var url = 'openKioskResult.aspx?id=' + id;
            $.ajax({
                url: url,
                type: "post",
                processData: false,
                contentType: false,
                async: false,
                success: function (data, textStatus, jqXHR) {
                    if(data != "")
                    {
                        alert(data);
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                }
            });
        }

        function checkCalendar(type) {
            if (type == 0) {
                $("#<%=kstartDate.ClientID %>").attr("readonly", true);
                showCal('<%=kstartDate.ClientID %>');
            }
            else if (type == 1) {
                $("#<%=kendDate.ClientID %>").attr("readonly", true);
                showCal('<%=kendDate.ClientID %>');
            }
            else if (type == 2) {
                $("#<%=astartDate.ClientID %>").attr("readonly", true);
                showCal('<%=astartDate.ClientID %>'); 
            }
            else if (type == 3) {
                $("#<%=aendDate.ClientID %>").attr("readonly", true);
                showCal('<%=aendDate.ClientID %>'); 
            }
        }

        function onKsearch()
        {

        }

        function Allaset()
        {
            if (document.getElementById("asetID").checked == true)
            {
                var ids = document.getElementById("<%=allaids.ClientID%>").value;
                var id = ids.split(',');
                for(var i = 1; i < id.length; i ++)
                {
                    document.getElementById("all_option" + id[i - 1]).checked = true;
                    setAll(id[i - 1]);
                }
            }
            else
            {
                var ids = document.getElementById("<%=allaids.ClientID%>").value;
                var id = ids.split(',');
                for(var i = 1; i < id.length; i ++)
                {
                    document.getElementById("all_option" + id[i - 1]).checked = false;
                    setAll(id[i - 1]);
                }
            }
        }

        function Allkset()
        {
            if (document.getElementById("ksetID").checked == true)
            {
                var ids = document.getElementById("<%=allkids.ClientID%>").value;
                var id = ids.split(',');
                for(var i = 1; i < id.length; i ++)
                {
                    document.getElementById("kiosk_option" + id[i - 1]).checked = true;
                    setKiosk(id[i - 1]);
                }
            }
            else
            {
                var ids = document.getElementById("<%=allkids.ClientID%>").value;
                var id = ids.split(',');
                for(var i = 1; i < id.length; i ++)
                {
                    document.getElementById("kiosk_option" + id[i - 1]).checked = false;
                    setKiosk(id[i - 1]);
                }
            }
        }

        function onClosePopup() {
            document.getElementById("popupForm").style.display = "none";
            document.getElementById("kioskFormpopup").style.display = "none";
            document.getElementById("kiosk1Formpopup").style.display = "none";
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
		<div class="wrap_2col clfix mt20" style="height: 100%;">
			<section class="sec_tbllist fl">
				<h2 class="dth2" style="color:black">키오스 노출 결과물 목록</h2>
				<div class="box_inpsech">
					<div class="lnp">
                        <asp:TextBox ID="kstartDate" runat="server" Text="" onclick="checkCalendar('0')" style="font-size:10pt; color:#42485a; width:100px;">
                        </asp:TextBox>
                        <span>~</span>
                        <asp:TextBox ID="kendDate" runat="server" Text="" onclick="checkCalendar('1')" style="font-size:10pt; color:#42485a; width:100px;">
                        </asp:TextBox>
					</div>
					<div class="rnp">
                        <asp:DropDownList ID="ktype" runat="server">
                            <asp:ListItem>신문명</asp:ListItem>
                            <asp:ListItem>취재기자</asp:ListItem>
                            <asp:ListItem>편집기자</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="kfield" runat="server"></asp:TextBox>
                        <asp:ImageButton ImageUrl="../images/ico_ser.png" Width="37px" Height="35" ID="Ksearch" Text="Search" runat="server" OnClick="onKsearch" />
					</div>
				</div>
				<div class="box_tbllist">
					<table>
                        <colgroup>
							<col style="width: 4%;">
							<col style="width: 9%;">
							<col style="width: 19%;">
							<col style="width: 19%;">
							<col style="width: 14%;">
							<col style="width: 14%;">
							<col style="width: 18%;">
						</colgroup>
						<caption>공지사항</caption>
						<thead>
							<tr>
								<th scope="col"><input onclick="Allkset()" id="ksetID" type="checkbox"></th>
								<th scope="col">번호</th>
								<th scope="col">신문명</th>
								<th scope="col">체험일시</th>
								<th scope="col">취재기사</th>
								<th scope="col">편집기자</th>
								<th scope="col">미리보기</th>
							</tr>
						</thead>
						<tbody>
                            <asp:Literal ID="showKioskList" runat="server"></asp:Literal>
						</tbody>
					</table>
                    <input type="hidden" id="allkids" runat="server" />
				</div>
				<div class="paging">
                    <asp:Literal ID="showKioskListPage" runat="server"></asp:Literal>
				</div>
			</section>
			<div class="vw_ic">
				<div class="btn_r"><a style="cursor:pointer" onclick="onRightBar()"><img src="../images/ad_icrr.png" alt="" /></a></div>
				<div class="btn_l"><a style="cursor:pointer" onclick="onLeftBar()"><img src="../images/ad_icll.png" alt="" /></a></div>
			</div>

			<section class="sec_tbllist fr">
				<h2 class="dth2"  style="color:black">전체 결과물 목록</h2>
				<div class="box_inpsech">
					<div class="lnp">
                        <asp:TextBox ID="astartDate" runat="server" Text="" onclick="checkCalendar('2')" style="font-size:10pt; color:#42485a; width:100px;">
                        </asp:TextBox>
                        <span>~</span>
                        <asp:TextBox ID="aendDate" runat="server" Text="" onclick="checkCalendar('3')" style="font-size:10pt; color:#42485a; width:100px;">
                        </asp:TextBox>
					</div>

					<div class="rnp">
                        <asp:DropDownList ID="atype" runat="server">
                            <asp:ListItem>신문명</asp:ListItem>
                            <asp:ListItem>취재기자</asp:ListItem>
                            <asp:ListItem>편집기자</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="afield" runat="server"></asp:TextBox>
                        <asp:ImageButton ImageUrl="../images/ico_ser.png" Width="37px" Height="35" ID="Asearch" Text="Search" runat="server" OnClick="onAsearch" />
					</div>
				</div>
				<div class="box_tbllist">                    
					<table>
                        <colgroup>
							<col style="width: 4%;">
							<col style="width: 9%;">
							<col style="width: 19%;">
							<col style="width: 19%;">
							<col style="width: 14%;">
							<col style="width: 14%;">
							<col style="width: 18%;">
						</colgroup>
						<caption>공지사항</caption>
						<thead>
							<tr>
								<th scope="col"><input onclick="Allaset()" id="asetID" type="checkbox"></th>
								<th scope="col">번호</th>
								<th scope="col">신문명</th>
								<th scope="col">체험일시</th>
								<th scope="col">취재기사</th>
								<th scope="col">편집기자</th>
								<th scope="col">미리보기</th>
							</tr>
						</thead>
						<tbody>
                            <asp:Literal ID="showAllList" runat="server"></asp:Literal>
						</tbody>
					</table>
                    <input type="hidden" id="allaids" runat="server" />
				</div>
				<div class="paging">
                    <asp:Literal ID="showAllListPage" runat="server"></asp:Literal>
				</div>
			</section>
		</div>

        <div class="wrap_layerpop" id="popupForm" style="display:none;position: absolute;height: 100%;width: 1920px;">
            <div class="layerpop pop1" id="kioskFormpopup" style="display:none">
		        <div class="box_titpop">
			        <h2>키오스크보관 확인</h2>
			        <div class="btn_close"><button type="button">닫기</button></div>
		        </div>
		        <div class="box_contpop">
			        <div class="box_in">
				        <p class="tx_t1">키오스크보관에 성공하였습니다.</p>
				        <div class="btn_polst">
					        <span class="btn_askk"><a onclick="onClosePopup()" style="cursor:pointer">확인</a></span>
				        </div>
			        </div>
		        </div>
	        </div>

            <div class="layerpop pop1" id="kiosk1Formpopup" style="display:none">
		        <div class="box_titpop">
			        <h2>키오스크보관 확인</h2>
			        <div class="btn_close"><button type="button">닫기</button></div>
		        </div>
		        <div class="box_contpop">
			        <div class="box_in">
				        <p class="tx_t1">키오스크보관에 실패하였습니다.</p>
				        <div class="btn_polst">
					        <span class="btn_askk"><a onclick="onClosePopup()" style="cursor:pointer">확인</a></span>
				        </div>
			        </div>
		        </div>
	        </div>
        </div>
	</div>
</asp:Content>
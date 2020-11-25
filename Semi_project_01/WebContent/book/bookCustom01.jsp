<!-- Le styles -->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/jquery.miniColors.css" />
<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/reset.css" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap"
	rel="stylesheet">

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 이게 body 안으로 들어가면 색상 입히는거 안먹힘 -->
<%@ include file="../main/header.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>북커버커스텀</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<mea name="description" content="">
<meta name="author" content="">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/fabric.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.miniColors.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/tshirtEditor.js"></script>
<script src="<%=request.getContextPath() %>/book/html2canvas.js"></script>

<style type="text/css">
* {
	margin: 0;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0 auto;
	width: 100%;
	position: relative;
}

.footer {
	padding: 70px 0;
	margin-top: 70px;
	border-top: 1px solid #E5E5E5;
	background-color: whiteSmoke;
}

.color-preview {
	border: 1px solid #CCC;
	margin-left: 3px;
	margin-bottom : 4px;
	zoom: 1;
	vertical-align: top;
	display: inline-block;
	cursor: pointer;
	overflow: hidden;
	width: 20px;
	height: 20px;
}

.rotate {
	-webkit-transform: rotate(90deg);
	-moz-transform: rotate(90deg);
	-o-transform: rotate(90deg);
	-ms-transform: rotate(90deg);
}

.Arial {
	font-family: "Arial";
}

.Helvetica {
	font-family: "Helvetica";
}

.MyriadPro {
	font-family: "Myriad Pro";
}

.Delicious {
	font-family: "Delicious";
}

.Verdana {
	font-family: "Verdana";
}

.Georgia {
	font-family: "Georgia";
}

.Courier {
	font-family: "Courier";
}

.ComicSansMS {
	font-family: "Comic Sans MS";
}

.Impact {
	font-family: "Impact";
}

.Monaco {
	font-family: "Monaco";
}

.Optima {
	font-family: "Optima";
}

.HoeflerText {
	font-family: "Hoefler Text";
}

.Plaster {
	font-family: "Plaster";
}

.Engagement {
	font-family: "Engagement";
}

#drawingArea:hover {
	border: 2px solid black;
}

.container {
	padding-top: 60px;
}

#thumbnail {
	width: 128px;
	height: 150px;
	border: solid 1px;
	margin: 0 auto;
	
	margin-bottom: 32px;
}
#myImg{
	width : 128px;
	height : 150px;
}

.bookcustom {
	width: 570px;
	heigh : 678px;
}

.well .cstinfo {
	outline: none;
	border: none;
	box-shadow: none;
}

.cstoption {
	margin-bottom: 10px;
}

.csttitle {
	padding-bottom: 50px;
	color : #425c5a;
	font-size : 16px;
	font-weight : bold;
}

#tshirtFacing {
	width: 570px;
}
#text-string{
	height : 25px;
}
input.cstinfo{
	padding-left : 0;
}
.table td {
	padding-left : 0;
}
</style>
</head>

<body class="preview" data-spy="scroll" data-target=".subnav"
	data-offset="80">
	<!-- Navbar
    ================================================== -->
	<div class="container">
		<section id="typography">
			<%
				String bookamount = request.getParameter("bookamount");
			String bisbn = request.getParameter("bisbn");
			%>
			<!-- Headings & Paragraph Copy -->
			<div class="row">
				<div class="span3">

					<div class="tabbable">
						<!-- Only required for left/right tabs -->
						<ul class="nav nav-tabs">
							<li class="active"><a href="#tab1" data-toggle="tab">북커버디자인</a></li>
							<li><a href="#tab2" data-toggle="tab">제작옵션</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tab1">
								<div class="well">
									<div class="input-append">
										<input class="span2" id="text-string" type="text"
											placeholder="텍스트를 입력하세요">
										<button id="add-text" class="btn" title="Add text">
											<i class="icon-share-alt"></i>
										</button>
										<hr>
									</div>
									<div id="avatarlist">
										<!-- img size : 96px // 이미지 추가하는 곳. -->
										<table>
											<tr>
												<td><img style="cursor: pointer;" class="img-polaroid"
													src="./imgs/m1.png"></td>
												<td><img style="cursor: pointer;" class="img-polaroid"
													src="./imgs/m2.png"></td>
											</tr>
											<tr>
												<td><img style="cursor: pointer;" class="img-polaroid"
													src="./imgs/s1.png"></td>
												<td><img style="cursor: pointer;" class="img-polaroid"
													src="./imgs/s2.png"></td>
											</tr>
											<tr>
												<td><img style="cursor: pointer;" class="img-polaroid"
													src="./imgs/h1.png"></td>
												<td><img style="cursor: pointer;" class="img-polaroid"
													src="./imgs/h2.png"></td>
											</tr>
											<tr>
												<td><img style="cursor: pointer;" class="img-polaroid"
													src="./imgs/a1.png"></td>
												<td><img style="cursor: pointer;" class="img-polaroid"
													src="./imgs/a2.png"></td>
											</tr>
										</table>
									</div>
								</div>
								<div class="well">
									<ul class="nav">
										<li class="color-preview" title="White"
											style="background-color: #ffffff;"></li>
										<li class="color-preview" title="Dark Heather"
											style="background-color: #616161;"></li>
										<li class="color-preview" title="Gray"
											style="background-color: #f0f0f0;"></li>
										<li class="color-preview" title="Charcoal"
											style="background-color: #5b5b5b;"></li>
										<li class="color-preview" title="Black"
											style="background-color: #222222;"></li>
										<li class="color-preview" title="Heather Orange"
											style="background-color: #fc8d74;"></li>
										<li class="color-preview" title="Heather Dark Chocolate"
											style="background-color: #432d26;"></li>
										<li class="color-preview" title="Salmon"
											style="background-color: #eead91;"></li>
										<li class="color-preview" title="Chesnut"
											style="background-color: #806355;"></li>
										<li class="color-preview" title="Dark Chocolate"
											style="background-color: #382d21;"></li>
										<li class="color-preview" title="Citrus Yellow"
											style="background-color: #faef93;"></li>
										<li class="color-preview" title="Avocado"
											style="background-color: #aeba5e;"></li>
										<li class="color-preview" title="Kiwi"
											style="background-color: #8aa140;"></li>
										<li class="color-preview" title="Irish Green"
											style="background-color: #1f6522;"></li>
										<li class="color-preview" title="Scrub Green"
											style="background-color: #13afa2;"></li>
										<li class="color-preview" title="Teal Ice"
											style="background-color: #b8d5d7;"></li>
										<li class="color-preview" title="Heather Sapphire"
											style="background-color: #15aeda;"></li>
										<li class="color-preview" title="Sky"
											style="background-color: #a5def8;"></li>
										<li class="color-preview" title="Antique Sapphire"
											style="background-color: #0f77c0;"></li>
										<li class="color-preview" title="Heather Navy"
											style="background-color: #3469b7;"></li>
										<li class="color-preview" title="Cherry Red"
											style="background-color: #c50404;"></li>
										
									</ul>
								</div>
							</div>
							<div class="tab-pane" id="tab2">
								<div class="well">
									<div class="cstoption">제본</div>
									<div class="input-append">
										<select id="">
											<option value="1" selected="selected">무선</option>
											<option value="2">중철</option>
											<option value="3">하드커버</option>
										</select>
									</div>
									<hr>
									<div class="cstoption">표지인쇄</div>
									<div class="input-append">
										<select id="">
											<option value="1" selected="selected">단면인쇄</option>
											<option value="2">양면인쇄</option>
										</select>
									</div>
									<hr>
									<div class="cstoption">컬러</div>
									<div class="input-append">
										<select id="">
											<option value="1" selected="selected">흑백인쇄</option>
											<option value="2">컬러인쇄(4도)</option>
										</select>
									</div>
									<hr>
									<div class="cstoption">재질</div>
									<div class="input-append">
										<select id="">
											<option value="3">일반지/아트지</option>
											<option value="3">일반지/하드커버</option>
											<option value="4">고급지/랑데뷰 - 네츄럴</option>
											<option value="4">고급지/랑데뷰 - 울트랄화이트</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="span6">
					<div align="center" style="min-height: 32px;">
						<div class="clearfix">
							<div class="btn-group inline pull-left" id="texteditor"
								style="display: none">
								<button id="font-family" class="btn dropdown-toggle"
									data-toggle="dropdown" title="Font Style">
									<i class="icon-font" style="width: 19px; height: 19px;"></i>
								</button>
								<ul class="dropdown-menu" role="menu"
									aria-labelledby="font-family-X">
									<li><a tabindex="-1" href="#" onclick="setFont('Arial');"
										class="Arial">Arial</a></li>
									<li><a tabindex="-1" href="#"
										onclick="setFont('Helvetica');" class="Helvetica">Helvetica</a></li>
									<li><a tabindex="-1" href="#"
										onclick="setFont('Myriad Pro');" class="MyriadPro">Myriad
											Pro</a></li>
									<li><a tabindex="-1" href="#"
										onclick="setFont('Delicious');" class="Delicious">Delicious</a></li>
									<li><a tabindex="-1" href="#"
										onclick="setFont('Verdana');" class="Verdana">Verdana</a></li>
									<li><a tabindex="-1" href="#"
										onclick="setFont('Georgia');" class="Georgia">Georgia</a></li>
									<li><a tabindex="-1" href="#"
										onclick="setFont('Courier');" class="Courier">Courier</a></li>
									<li><a tabindex="-1" href="#"
										onclick="setFont('Comic Sans MS');" class="ComicSansMS">Comic
											Sans MS</a></li>
									<li><a tabindex="-1" href="#" onclick="setFont('Impact');"
										class="Impact">Impact</a></li>
									<li><a tabindex="-1" href="#" onclick="setFont('Monaco');"
										class="Monaco">Monaco</a></li>
									<li><a tabindex="-1" href="#" onclick="setFont('Optima');"
										class="Optima">Optima</a></li>
									<li><a tabindex="-1" href="#"
										onclick="setFont('Hoefler Text');" class="Hoefler Text">Hoefler
											Text</a></li>
									<li><a tabindex="-1" href="#"
										onclick="setFont('Plaster');" class="Plaster">Plaster</a></li>
									<li><a tabindex="-1" href="#"
										onclick="setFont('Engagement');" class="Engagement">Engagement</a></li>
								</ul>
								<button id="text-bold" class="btn" data-original-title="Bold">
									<img src="img/font_bold.png" height="" width="">
								</button>
								<button id="text-italic" class="btn"
									data-original-title="Italic">
									<img src="img/font_italic.png" height="" width="">
								</button>
								<button id="text-strike" class="btn" title="Strike" style="">
									<img src="img/font_strikethrough.png" height="" width="">
								</button>
								<button id="text-underline" class="btn" title="Underline"
									style="">
									<img src="img/font_underline.png">
								</button>
								<a class="btn" href="#" rel="tooltip" data-placement="top"
									data-original-title="Font Color"><input type="hidden"
									id="text-fontcolor" class="color-picker" size="7"
									value="#000000"></a> <a class="btn" href="#" rel="tooltip"
									data-placement="top" data-original-title="Font Border Color"><input
									type="hidden" id="text-strokecolor" class="color-picker"
									size="7" value="#000000"></a>
								<!--- Background <input type="hidden" id="text-bgcolor" class="color-picker" size="7" value="#ffffff"> --->
							</div>
							<div class="pull-right" align="" id="imageeditor"
								style="display: none">
								<div class="btn-group">
									<!-- 캔버스 안 수정 버튼. show back view 없애야함. -->
									<button class="btn" id="bring-to-front" title="Bring to Front">
										<i class="icon-fast-backward rotate" style="height: 19px;"></i>
									</button>
									<button class="btn" id="send-to-back" title="Send to Back">
										<i class="icon-fast-forward rotate" style="height: 19px;"></i>
									</button>

									<button id="remove-selected" class="btn"
										title="Delete selected item">
										<i class="icon-trash" style="height: 19px;"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<!--	EDITOR      -->
					<div class="bookcustom" id='bookcustom'>
						<div id="shirtDiv" class="page"
							style="width: 530px; height: 630px; position: relative; background-color: rgb(255, 255, 255);">
							<img id="tshirtFacing" src="img/ssak_bookcover-mockup.png"></img>
							<div id="drawingArea"
								style="position: absolute; top: 188px; left: 70px; z-index: 10; width: 438; height: 308;">
								<canvas id="tcanvas" width="445" height="313" class="hover"
									style="-webkit-user-select: none;"></canvas>
							</div>
						</div>
					</div>
					<!--	/EDITOR		-->
				</div>
				<script>
				</script>

				<div class="span3">
					<div id="thumbnail">
						<img id="myImg"> <input type="hidden" id="saveImg" value="0" />
					</div>
					<div class="well" id="well3">
						<h3>
							<input type="text" name="ddesc" value="북커버입니다" class="cstinfo"
								readonly>
						</h3>
						<p>
						<table class="table">
							<!-- <tr>
								<td class="customInfo"><input type="text"
								name="dno" value="1003" readonly></td>
								<td align="right"><input type="text"
								name="ddesc" value="북커버입니다" readonly></td>
							</tr> -->
							<tr>
								<!-- name 넣어야함-->
								<td align="right" class="csttitle">책이름</td>
							</tr>
							<tr>
								<!-- name 넣어야함-->
								<td align="right"><input type="text" name="" value="책 이름"
									class="cstinfo" readonly></td>
							</tr>
							<tr>
								<td align="right" class="csttitle">책표준가</td>
							</tr>
							<tr>
								<td align="right"><input type="text" name="bpriceStandard"
									value="책표준가" class="cstinfo" readonly></td>
							</tr>
							<tr>
								<td align="right" class="csttitle">책세일가</td>
							</tr>
							<tr>
								<!-- name 넣어야함-->
								<td align="right"><input type="text" name="bpriceSales"
									value="책세일가" class="cstinfo" readonly></td>
							</tr>
							<tr>
								<td align="right" class="csttitle">북커버가격</td>
							</tr>
							<tr>
								<!-- name 넣어야함-->
								<td align="right"><input type="text" name="dprice"
									value="북커버가격" class="cstinfo" readonly></td>
							</tr>
						</table>
						</p>
						<button type="button" class="btn btn-large btn-block btn-success"
							name="addToTheBag" id="saveImg" onclick=partShot()>
							저장하기 <i class="icon-briefcase icon-white"></i>
						</button>
						<button type="button" class="btn btn-large btn-block btn-success"
							name="addToTheBag" id="addToTheBag" onclick=goCart()>
							장바구니 <i class="icon-briefcase icon-white"></i>
						</button>
						<button type="button" class="btn btn-large btn-block btn-success"
							name="gototheorder" id="gototheorder" onclick=goOrder()>
							결제하기 <i class="icon-briefcase icon-white"></i>
						</button>
					</div>
				</div>

			</div>

		</section>
	</div>
	<!-- /container -->
	<!-- Footer ================================================== -->
	<footer class="footer"> > </footer>
	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
<<<<<<< HEAD
	<script src="./js/bootstrap.min.js"></script>
=======
			<%String member = String.valueOf(session.getAttribute("member"));%>
	<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
>>>>>>> 1c0b0dd50d4fbc42f1f8bdd230d6b103a1a87e7d
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-35639689-1' ]);
		_gaq.push([ '_trackPageview' ]);

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>
	<script>
	
function partShot() {
	//특정부분 스크린샷
	html2canvas(document.getElementById("bookcustom"))
	//id container 부분만 스크린샷
	.then(function (canvas) {
	//jpg 결과값
		drawImg1(canvas.toDataURL('image/jpeg'));
		//이미지 저장
		var myImg = document.getElementById("myImg");
		myImg.src = canvas.toDataURL();
	})
	.catch(function (err) {
		console.log(err);
	});
}
function drawImg1(imgData) {
	console.log(imgData);
	save();
};
function save(){
	document.getElementById("saveImg").value = '1'
}

function goCart(){
	if(document.getElementById("saveImg").value == 0)
		alert("저장하기를 눌러주세요")
	else if(document.getElementById("saveImg").value == 1) {
		 html2canvas(document.getElementById("thumbnail"))
		//id container 부분만 스크린샷
		.then(function (canvas) {
		//jpg 결과값ㅣdlrp 
		drawImg2(canvas.toDataURL('image/jpeg'));
		})
		.catch(function (err) {
		console.log(err);
		}); 
	}
 };
 function drawImg2(imgData) {
	console.log(imgData);
	var bbb = imgData;	
	goC(bbb);	
};
 function goC(bbb){
		$.ajax({
			url : "cstUploadtoCart",
			type : "post",
			data :{customURL : bbb},
		success : function(res){
				confirm(res);
				/* location.href="장바구니 페이지"; */
		}
		})
	}; 
function goOrder(){
	if(document.getElementById("saveImg").value == 0)
		alert("저장하기를 눌러주세요")
	else if(document.getElementById("saveImg").value == 1) {
	 html2canvas(document.getElementById("thumbnail"))
	//id container 부분만 스크린샷
	.then(function (canvas) {
	//jpg 결과값
	drawImg3(canvas.toDataURL('image/jpeg'));
	})
	.catch(function (err) {
	console.log(err);
	}); 
	}
 };
 function drawImg3(imgData) {
	console.log(imgData);
	var bbb = imgData;
	goO(bbb);
};
function goO(bbb){
	var bookamount= $("#cutsom_bookamount").val();
	var bisbn = $("#cutsom_bisbn").val();
		$.ajax({
			url : "cstUploadtoOrder",
			type : "post",
			data : {customURL : bbb},
		success : function(res){
			if(res>0)
				location.href="<%=request.getContextPath() %>/BookCoverOrderList?bisbn="+bisbn+"&bookamount="+bookamount+"&dno="+res;
			
		}
		})
<<<<<<< HEAD
	};
=======
	}; 

>>>>>>> 1c0b0dd50d4fbc42f1f8bdd230d6b103a1a87e7d
	
function saveAs(uri, filename) {
	var link = document.createElement('a');
	if (typeof link.download === 'string') {
		link.href = uri;
		link.download = filename;
		document.body.appendChild(link);
		link.click();
		document.body.removeChild(link);
	} else {
		window.open(uri);
	}
}
</script>
</body>
</html>
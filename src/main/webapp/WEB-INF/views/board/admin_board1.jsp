<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/> 

<title>게시판</title>

<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">


<style>
.btn-write {
	color: #fff !Important;
	background-color: #008080 !Important;
	border-color: #008080 !Important;
	position: fixed;
	top: 26%;
	right: 12%;
 	float: right;
}

#top {
	background-color: #F9D142;
 	position: absolute;
    width: 80%;
    height: 190px;
    z-index: -1;
}

#board_title {
	margin: auto;
	width: 450px;
	background-color: #292826;
	border-radius: 50px;
}
#board_title a {
	color: white;
	font-size: 50px;
	font-weight: 900;
}
#board_title a:hover {
	color: #F9D142;
}
</style>

</head>
<body>


<div id="top"></div>
<div style="height: 60px;"></div>
<div id="board_title" class="text-center mb-3">
	<a id="osm">OSM ESCAPE</a>
</div>

<div class="container pt-1">
	<a id="btn1" href="admin_noticeBoard" class="btn tab tabOn"><span style="font-size: 14px;">NOTICE</span></a>
	<a id="btn2" href="admin_eventBoard" class="btn tab tabOff"><span style="font-size: 14px;">EVENT</span></a>
		
	<div class="container">
		<div id="admin_mainTab"></div>
	</div>
</div>


<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->


<script>
$(document).ready(function() {
	$("#btn1").click(function(e) {
		e.preventDefault();
		$.ajax({
			url: "admin_noticeBoard",
			type: "get",
			data: "",
			success: function(d) {
				$("#admin_mainTab").html(d);
			},
			error: function() {
				alert("에러");
			}
		});
		document.getElementById("btn1").setAttribute('class', 'btn tab tabOn');
		document.getElementById("btn2").setAttribute('class', 'btn tab tabOff');
	});
		
	$("#btn2").click(function(e) {
		e.preventDefault();
		$.ajax({
			url: "admin_eventBoard",
			type: "get",
			data: "",
			success: function(d) {
				$("#admin_mainTab").html(d);
			},
			error: function() {
				alert("에러");
			}
		});
		document.getElementById("btn2").setAttribute('class', 'btn tab tabOn');
		document.getElementById("btn1").setAttribute('class', 'btn tab tabOff');
	});

	$("#btn1").trigger("click");
});
</script>

</body>

<style>
.tab {
	margin: -2.4px;
	border: 1px solid #F9D142;
	border-bottom: 0;
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
}
.tabOff:hover {
	color: #0056b3;
	border: 1px solid ghostwhite;
	border-bottom: 0;
}
.tabOn {
	border: 1px solid #dee2e6;
	border-bottom: 0;
	background-color: white;
}
</style>

</html>




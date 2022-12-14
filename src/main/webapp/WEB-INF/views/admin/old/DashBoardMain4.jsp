<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page session="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<meta id="_csrf" name="_csrf" content="${_csrf.token}"> <!-- 페이지 위조 요청을 방지한 태그 -->

<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/>
<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<!--fontawesome icon-->
<script src="https://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet" href="css/DashBoardMain.css" />
</head>
<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"></sec:authentication>
</sec:authorize>

    <div class="board-wrap">
        <div class="header-wrap">
            <header>
                <ul class="header-box">
                    <li class="nav-list">
                        <a href="#">예약자 확인</a>
                    </li>
                    <li class="nav-list">
                        홈페이지 관리
                        <ul class="">
                            <li class="nav-sublist">
                                &#8250; 메인페이지 수정 
                                <ul class="nav-line-style">
                                    <li class="nav-lastlist">
                                        <a href="MainRegistration" id="MainRegistration">이미지 최초 등록</a>
                                    </li>
                                    <li class="nav-lastlist">
                                        <a href="MainModify" id="MainModify">이미지 수정</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-sublist">
                                &#8250; 회사소개 수정
                                <ul class="nav-line-style">
                                    <li class="nav-lastlist">
                                        <a href="#">회사소개 수정</a>
                                    </li>
                                    <li class="nav-lastlist">
                                        <a href="#">주의사항 수정</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-sublist">
                                &#8250; 테마 수정
                                <ul class="nav-line-style">
                                    <li class="nav-lastlist">
                                        <a href="#">이미지 수정</a>
                                    </li>
                                    <li class="nav-lastlist">
                                        <a href="#">테마 설명 수정</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-sublist">
                                &#8250; 공지사항/이벤트 수정
                                <ul class="nav-line-style">
                                    <li class="nav-lastlist">
                                        <a id="nav-board" href="board">공지사항/이벤트 수정</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-sublist">
                                &#8250; 정보 수정
                                <ul class="nav-line-style">
                                    <li class="nav-lastlist">
                                        <a href="#">지도 수정</a>
                                    </li>
                                    <li class="nav-lastlist">
                                        <a href="#">footer 수정</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>
            </header>
        </div>

        <section>
            <article class="main-page">

            </article>
        </section>
        
        
		<sec:authorize access="isAuthenticated()">
			<a href="AdminLogoutView">로그아웃</a>
		</sec:authorize>

    </div>

<script src="js/DashBoardMain.js"></script>

<script>
	$(document).ready(function(){
		$("#MainRegistration").click(function(event){
			event.preventDefault();
			$.ajax({
				url : "MainRegistration",
				type : "get",
				data : "",
				success : function(data){
					$(".main-page").html(data);
				},
				error : function(){
					alert("접근 제한");
				}
			});
		});
		
		$("#MainModify").click(function(event){
			event.preventDefault();
			$.ajax({
				url : "MainModify",
				type : "get",
				data : "",
				success : function(data){
					$(".main-page").html(data);
				},
				error : function(){
					alert("접근 제한");
				}
			});
		});
	});
</script>

</body>
</html>
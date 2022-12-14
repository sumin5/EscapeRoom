<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>JSP</title>
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
<script src="https://kit.fontawesome.com/31d5c7a19f.js" crossorigin="anonymous"></script>
	
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<style type="text/css">
.box-step2{
width:100%;
margin: 5% 0;
}

.box-step2-div1{
width: 50%;
margin: auto; 
border: 0.7px solid #d6d6d6;
}
.box-step2-h3{
border-bottom: 0.7px solid #d6d6d6;
text-align: center;
padding: 2% 0 1.5%;
}
.box-step2-div1-div{
    padding: 0 20% 0 22%;
    width: 100%;
}


tbody>tr>th{
width:100px;
height: 75px;
font-family: 'GmarketSansBold';
font-size : 1.0rem;
}

.formSt{
font-family: 'GmarketSansBold';
font-size : 1.0rem;
width: 200px;
}

.step-btn3{
	text-align: center;
    line-height: 3vw;
    width: 11%;
    margin-left: 45%;
    margin-top: 2%;
    margin-bottom: 2%;
    font-size:1.5rem;
    border: 1px solid;
    border-color: #F9D142;
    background: #F9D142;
    color: #292826;
}

</style>
</head>
<body>
	<form action="reserveFind">
		<div class="box-step2">
			
			<div class="box-step2-div1">
				<h3 class="box-step2-h3"><i class="fa-solid fa-pen-nib"></i>&nbsp;????????????/??????</h3>
				<div class="box-step2-div1-div">
					<table>
						<tbody>
							<tr>
								<th>??????</th>
								<td><input id="rName"class="formSt" type="text" placeholder="????????? ???????????????"></td>
							</tr>
							<tr>
								<th>????????????</th>
								<td><input id="rPhone"class="formSt" type="text" placeholder="?????????????????? ???????????????"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<a class="step-btn3 rounded-pill hover1" type="button" id="reserveFind">
				????????????
			</a>
		</div>
	</form>

<script type="text/javascript">
$(document).ready(function name() {
	$(reserveFind).click(function name() {            // ReserveFind ?????? ????????? ?????? ??????
		let name = $("#rName");          
		sessionStorage.setItem("?????????",name[0].value);   // ????????????????????? ??????,Value ??????
		let phone = $("#rPhone");
		sessionStorage.setItem("??????",phone[0].value);
		
		let namekey = "?????????" ;                          // ?????? ????????? ??????
		let phonekey = "??????" ;                                
		
		jsonName1 = sessionStorage.getItem(namekey);     // ????????? ????????? ????????? ?????? ??????
		jsonPhone1 = sessionStorage.getItem(phonekey);
		let json = {                                     // ???????????? ?????? ??????
			nameKey : jsonName1,
			phoneKey : jsonPhone1,
			${_csrf.parameterName}: "${_csrf.token}"	// ?????????????????? ?????? ????????? ??????(?????????,Post??? ???????????????)
		};
		$.ajax({
			url : "reserveFind", 	                    // ajax??? ???????????? reserveFind ??????
			type: "post",
			data : json,
			success : function(data){					// ????????? ???????????? ???????????????
					$("#reserveRegion").html(data);
			},
			error : function name() {
				alert("???????????? ??????");
			}
		});
	});
})	
</script>
	
	
	
	
</body>
</html>
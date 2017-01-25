<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<%@page contentType="text/html; charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>구매 내역</title>
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css" />
<!-- 부트스트렙에서 자바스크립트를 쓰려면, jquery도 있어야 함. jquery가 반드시 먼저, 임포트 -->

<script src="resources/bootstrap/js/jquery-3.1.1.min.js"></script>
<script src="resources/bootstrap/js/bootstrap.min.js"></script>
 
<script>
$( function(){
	$("#btn_search").click(
			function(){
			var before_y = $("#s_year option:selected").val();
			var	before_m = $("#s_month option:selected").val();
			var before_d = $("#s_day option:selected").val();
			var before = before_y+"-"+before_m+"-"+before_d;
			
			var after_y = $("#e_year option:selected").val();
			var	after_m = $("#e_month option:selected").val();
			var after_d = $("#e_day option:selected").val();
			var after = after_y+"-"+after_m+"-"+after_d;
			
			location.href="/pur_history.ItemShop?from="+before+"&to="+after;
	});
	
	$("#btn_delete").click(
			function(){
				if($('input:checkbox[name="delete_pur_num"]:checked').length == 0){
					alert("삭제할 항목을 선택해주세요.");
					return false;
				}
				else{
					$('#delete').submit();
				}
				//location.href="/delete.ItemShop?delete_num="+result;
	});
	
	$("#checkAll").click(function() {
		if($('input:checkbox[name="delete_pur_num"]:checked').length == 0){
			$("input[name=delete_pur_num]:checkbox").each(function() {
			$(this).attr("checked", true);
			});
		}
		else{
			$("input[name=delete_pur_num]:checkbox").each(function() {
				$(this).attr("checked", false);
			});
		}
	});
});
	
</script>
</head>
<body>
<br><br><br>
	<center>
		<div class="container">
			<div class="row">
				<!-- content -->
				<div id="content">
					<!-- title -->

					<!-- title -->
					<div class="title">
						<h3>
							<img
								src="http://www.joara.com/images/content/mypage/t_utilization_mana.gif"
								alt="이용권 관리">
						</h3>
						<br><br>

					</div>

					<div class="date_srch">
						<form name="searchForm" method="POST"
							action="pur_history.ItemShop">
							<input type="hidden" name="mode" value="" /> 
							<input type="hidden" name="old" value="" /> 
							<select id="s_year" name="s_year">

								<option value="">년도</option>
								<c:set var="now" value="<%=new java.util.Date()%>" />
								<fmt:formatDate value="${now}" pattern="yyyy" var="yearStart" />
								<c:forEach begin="0" end="50" var="result" step="1">
									<option value="<c:out value="${yearStart - result}" />"
										<c:if test="${(yearStart - result) == searchVO.bsnsYear}"> 
           								selected="selected"</c:if>><c:out
										value="${yearStart - result}" /></option>
								</c:forEach>
								
							</select> 
							<select id="s_month" name="s_month" class="fe_select">
								<option value='-1' selected>월</option>
								<option value='1'>1 월</option>
								<option value='2'>2 월</option>
								<option value='3'>3 월</option>
								<option value='4'>4 월</option>
								<option value='5'>5 월</option>
								<option value='6'>6 월</option>
								<option value='7'>7 월</option>
								<option value='8'>8 월</option>
								<option value='9'>9 월</option>
								<option value='10'>10 월</option>
								<option value='11'>11 월</option>
								<option value='12'>12 월</option>

							</select> <select id="s_day" name="s_day" class="fe_select">
								<option value='-1' selected>일</option>
								<option value='1'>1 일</option>
								<option value='2'>2 일</option>
								<option value='3'>3 일</option>
								<option value='4'>4 일</option>
								<option value='5'>5 일</option>
								<option value='6'>6 일</option>
								<option value='7'>7 일</option>
								<option value='8'>8 일</option>
								<option value='9'>9 일</option>
								<option value='10'>10 일</option>
								<option value='11'>11 일</option>
								<option value='12'>12 일</option>
								<option value='13'>13 일</option>
								<option value='14'>14 일</option>
								<option value='15'>15 일</option>
								<option value='16'>16 일</option>
								<option value='17'>17 일</option>
								<option value='18'>18 일</option>
								<option value='19'>19 일</option>
								<option value='20'>20 일</option>
								<option value='21'>21 일</option>
								<option value='22'>22 일</option>
								<option value='23'>23 일</option>
								<option value='24'>24 일</option>
								<option value='25'>25 일</option>
								<option value='26'>26 일</option>
								<option value='27'>27 일</option>
								<option value='28'>28 일</option>
								<option value='29'>29 일</option>
								<option value='30'>30 일</option>
								<option value='31'>31 일</option>
							</select> ~ <select id="e_year" name="e_year" class="fe_select">
								<option value=-1 selected>년도</option>
								<option value='2010'>2010년</option>
								<option value='2011'>2011년</option>
								<option value='2012'>2012년</option>
								<option value='2013'>2013년</option>
								<option value='2014'>2014년</option>
								<option value='2015'>2015년</option>
								<option value='2016'>2016년</option>
								<option value='2017'>2017년</option>
							</select> <select id="e_month" name="e_month" class="fe_select">
								<option value='-1' selected>월</option>
								<option value='1'>1 월</option>
								<option value='2'>2 월</option>
								<option value='3'>3 월</option>
								<option value='4'>4 월</option>
								<option value='5'>5 월</option>
								<option value='6'>6 월</option>
								<option value='7'>7 월</option>
								<option value='8'>8 월</option>
								<option value='9'>9 월</option>
								<option value='10'>10 월</option>
								<option value='11'>11 월</option>
								<option value='12'>12 월</option>

							</select> <select id="e_day" name="e_day" class="fe_select">
								<option value='-1' selected>일</option>
								<option value='1'>1 일</option>
								<option value='2'>2 일</option>
								<option value='3'>3 일</option>
								<option value='4'>4 일</option>
								<option value='5'>5 일</option>
								<option value='6'>6 일</option>
								<option value='7'>7 일</option>
								<option value='8'>8 일</option>
								<option value='9'>9 일</option>
								<option value='10'>10 일</option>
								<option value='11'>11 일</option>
								<option value='12'>12 일</option>
								<option value='13'>13 일</option>
								<option value='14'>14 일</option>
								<option value='15'>15 일</option>
								<option value='16'>16 일</option>
								<option value='17'>17 일</option>
								<option value='18'>18 일</option>
								<option value='19'>19 일</option>
								<option value='20'>20 일</option>
								<option value='21'>21 일</option>
								<option value='22'>22 일</option>
								<option value='23'>23 일</option>
								<option value='24'>24 일</option>
								<option value='25'>25 일</option>
								<option value='26'>26 일</option>
								<option value='27'>27 일</option>
								<option value='28'>28 일</option>
								<option value='29'>29 일</option>
								<option value='30'>30 일</option>
								<option value='31'>31 일</option>
							</select> 
							<input type="button" id="btn_search" value="검색" />
					</form>
					</div>
					

				<br/><br>


				<form action = "/delete.ItemShop" id="delete" method="POST">
				<div class="col-md-12">
					<table class="table table-hover table-bordered">
						<colgroup>
							<col style="width: 100px;">
							<col style="width: 100px;">
							<col style="width: 100px;">
							<col style="width: 100px;">
						</colgroup>
						<thead>
							<tr>
								<th style="text-align : center;"><input type="checkbox" id="checkAll" value="check all" /></th>
								<th style="text-align : center;">결제 일시</th>
								<th style="text-align : center;">구매 방법</th>
								<th style="text-align : center;">구매 금액</th>
								<th style="text-align : center;">이용권 종류</th>
							</tr>
						</thead>
							<tbody>
								<c:choose>
									<c:when test="${item.size() eq '0' }">
										<tr>
											<td class="cen" colspan="4">*이용권 내역이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
								
										<c:forEach items="${item}" var="item" >
											<tr>
											<td><center><label><input type ="checkbox" name="delete_pur_num" value="${item.getPur_num()}"></label></center></td>
												<td>${item.getPur_date()}</td>
												<td>${item.getPur_way()}</td>
												<td>${item.getSum()}</td>
												<td>${item.getUtil_kind()}</td>
										
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
					</table>
						<center><input type ="button" id="btn_delete"  value="삭제"></center>
							
				</div>
				</form>
			</div>
		</div>
		</div>
	</center>
</body>
</html>
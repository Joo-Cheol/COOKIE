<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<!-- Custom fonts for this template-->
<link href="a00_com/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="a00_com/css/sb-admin-2.min.css" rel="stylesheet">
<style>
	.input-group-text{width:100%;background-color:linen;
		color:black;font-weight:bolder;}
	.input-group-prepend{width:20%;}	
</style>
<script src="a00_com/vendor/jquery/jquery.min.js"></script>
<script src="a00_com/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="a00_com/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="a00_com/js/sb-admin-2.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var msg = "${msg}"
		if(msg!=""){
			if(confirm(msg+"\n메인화면 이동하시겠습니까?")){
				location.href='prodt_mngList'
			}
		}
	});
</script>
</head>
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<jsp:include page="/sidebar" />
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<jsp:include page="/headerCookie" />
				<!-- End of Topbar -->
				<!-- Begin Page Content -->
				<div class="container-fluid">
<div class="jumbotron text-center">
  <h2>제품입출고기록 등록</h2>
</div>
<div class="container">
	<form method="post">
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">제품코드</span>
		</div>
		<select  name="no" class="form-control" >
			<option value="0">선택하세요</option>
			<c:forEach var="p" items="${plist}">		
			<option value="${p.no}">${p.pname}(${p.no})</option>
			</c:forEach>		
		</select>	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">입출고절대수량</span>
		</div>
		<input name="inc_rels_cnt" class="form-control"  />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">입출고구분(입고1/출고2)</span>
		</div>
		<input name="inc_rels_sort" class="form-control"  />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">현재재고량</span>
		</div>
		<input name="curr_tot_stock" class="form-control"  />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">입출고날짜</span>
		</div>
		<input type="date" name="inc_rels_dteS" class="form-control"  />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">공정별 생산 아이디</span>
		</div>
		<select  name="prd_id_prc" class="form-control" >
			<option value="0">선택하세요</option>
			<c:forEach var="prc" items="${prclist}">		
			<option value="${prc.prc_id}">${prc.prc_nm}(${prc.prc_id})</option>
			</c:forEach>		
		</select>	
	</div>	
		<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">담당자코드</span>
		</div>
		<select  name="empno" class="form-control" >
			<option value="0">선택하세요</option>
			<c:forEach var="e" items="${elist}">		
			<option value="${e.empno}">${e.ename}(${e.empno})</option>
			</c:forEach>		
		</select>
	</div>	
	<div style="text-align:right;">
			<input type="submit" class="btn btn-success" 
				value="등록" id="insBtn"/>
			<input type="button" class="btn btn-info" 
				onclick="location.href='prodt_mngList'" 
				value="조회리스트" id="mainBtn"/>
	</div>	
	</form>	
	
</div></div></div></div></div>
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">로그인 화면으로 돌아갑니다.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">아니오</button>
					<button class="btn btn-primary" type="button" onclick="logout()">예</button>
				</div>
			</div>
		</div>
	</div>
		<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">로그인 화면으로 돌아갑니다.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">아니오</button>
					<button class="btn btn-primary" type="button" onclick="logout()">예</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>
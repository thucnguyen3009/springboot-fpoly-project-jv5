<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Add lib -->
<%@include file="/WEB-INF/views/tool/addlib.jsp"%>
<link href="/css/page-users/index.css" rel="stylesheet">
<link href="/css/page-users/product.css" rel="stylesheet">
<title>Box XXII</title>
</head>
<style>
    .titles{
    	font-size: 35px !important;
    	animation-name: fadeInUp;
    	text-transform: uppercase !important;
    	font-weight: 500;
    	line-height: 1.2;
    	color: #fe8809 !important;
    }
    .titlex{
    	font-weight: 700;
    }
</style>
<body>
	<div class="container-fluid">
		<!-- Menu -->
		<%@include file="/WEB-INF/views/utilities/users/menu.jsp"%> 
		<!-- Silde -->
		<div class="row">
			<jsp:include page="${viewsSlide}" />
		</div>
		<!-- Content -->
			<aside class="col-12">
				<jsp:include page="${viewsListGoiY}" /><!-- /WEB-INF/views/utilities/users/ListMulti.jsp -->
				
				<jsp:include page="${viewAside}" />
				<div><jsp:include page="${viewsPay}" /></div><!-- /WEB-INF/views/utilities/users/QcPay.jsp -->
			</aside>
		</div>
		<!-- Footer -->
		<%@include file="/WEB-INF/views/utilities/users/footer.jsp" %>
</body>
<script type="text/javascript">
	
</script>
</html>
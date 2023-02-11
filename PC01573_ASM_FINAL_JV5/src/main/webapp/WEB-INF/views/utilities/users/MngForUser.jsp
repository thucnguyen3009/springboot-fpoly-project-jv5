<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.active{
	background-color: #fe8809 !important; 
}
</style>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-3">
				<%@include file="/WEB-INF/views/utilities/users/menu2.jsp"%>
			</div>
			<div class="col-9">
				<jsp:include page="${viewsFroMngUser}" />
			</div>
		</div>
	</div>
</body>
</html>
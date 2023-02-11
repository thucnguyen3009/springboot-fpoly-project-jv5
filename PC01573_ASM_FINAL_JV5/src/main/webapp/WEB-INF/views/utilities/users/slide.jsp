<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="col-8 top-100">
		<jsp:include page="/WEB-INF/views/utilities/users/carousel.jsp" />${viewSld}
	</div>
	<div class="col-4 top-100">
		<jsp:include page="${viewQc}" />
		<div class="row">
			<img src="/images/carousel/qc/qc1.png">
		</div>
		<div class="row" style="margin-top: 6px;">
			<img src="/images/carousel/qc/qc2.png">
		</div>
	</div>

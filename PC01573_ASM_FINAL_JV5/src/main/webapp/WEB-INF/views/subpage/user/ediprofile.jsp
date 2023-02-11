<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<style type="text/css">
[id$=".errors"] {
	color: red;
	/* text-shadow: 0 0 0.7rem black;  */
	font-weight: 500;
	font-style: italic;
	padding: 3px;
	margin: 5px;
	display: inline-block;
}
</style>
<form:form action="/botxxii/myaccount" method="POST"
	modelAttribute="editProfileUser" style="margin-top: 105px">
	<h1 class="fs-1">Hồ sơ của tôi</h1>
	<hr>

	<div class="mb-3 row">
		<label for="fullname" class="col-sm-2 col-form-label">Họ và Tên</label>
		<div class="col-sm-10">
			<form:input path="fullname" class="form-control" id="fullname" />
			<form:errors path="fullname" element="span"  />
		</div>

	</div>
	<div class="mb-3 row">
		<label for="mail" class="col-sm-2 col-form-label">Email</label>
		<div class="col-sm-10">
			<form:input path="mail" class="form-control" id="mail"/>
			<div class="<c:if test="${editProfileUser.mail.equals(sessionScope.AccountUser.email)}">visually-hidden</c:if>">
				<form:errors path="mail" element="span" />
			</div>
		</div>
	</div>
	<div class="mb-3 row">
		<label for="sdt" class="col-sm-2 col-form-label">Số Điện Thoại</label>
		<div class="col-sm-10">
			<form:input path="phones" class="form-control" id="sdt"/>
			<div class="<c:if test="${editProfileUser.phones.equals(sessionScope.AccountUser.photo)}">visually-hidden</c:if>">
				<form:errors path="phones" element="span" />
			</div>
		</div>

	</div>
	<div class="text-end">
		<button type="submit" class="btn btn-warning"
			style="background-color: #fe8809 !important; width: 80px; color: #ffffff;" formaction="/botxxii/myaccount/cancel">Hủy</button>
		<button type="submit" class="btn btn-warning"
			style="background-color: #fe8809 !important; width: 80px; color: #ffffff;">Lưu</button>
		
	</div>
</form:form>
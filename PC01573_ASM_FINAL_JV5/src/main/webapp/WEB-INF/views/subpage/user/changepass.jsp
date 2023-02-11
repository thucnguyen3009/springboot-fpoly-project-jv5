<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<style type="text/css">
	[id$=".errors"] {
		color: red;
		/* text-shadow: 0 0 0.7rem black; */
		font-weight: 500 !important;
		font-style: italic !important;
		display: inline-block !important;
		max-height: 10px !important;
	}
</style>
<form:form action="/botxxii/profilechangepass" method="POST" modelAttribute="changePassProfile" style="margin-top: 105px">
	<h1 class="fs-1">Đổi mật khẩu tài khoản</h1>
	<h6>${message}</h6>
	<hr>
	<div class="mb-3 row">
		<label for="oldPass" class="col-sm-2 col-form-label">Mật Khẩu Cũ</label>
		<div class="col-sm-10">
			<form:password path="oldPass" class="form-control" id="oldPass" showPassword="true"/>
			<form:errors path="oldPass" element="span"  />
	    </div>
	</div>
	<div class="mb-3 row">
		<label for="newPass" class="col-sm-2 col-form-label">Mật Khẩu Mới</label>
		<div class="col-sm-10">
			<form:password path="newPass" class="form-control" id="newPass" showPassword="true"/>
			<form:errors path="newPass" element="span"  />
	    </div>
	</div>
	<div class="mb-3 row">
		<label for="cfmPass" class="col-sm-2 col-form-label">Xác Nhận Mật Khẩu</label>
		<div class="col-sm-10">
			<form:password path="cfmPass" class="form-control" id="cfmPass" showPassword="true"/>
			<form:errors path="cfmPass" element="span"  />
	    </div>
	</div>
	<div class="text-end">
  		<button type="submit" class="btn btn-warning" style="background-color: #fe8809 !important; width: 150px; color: #ffffff;">Xác Nhận</button>
    </div>
</form:form>
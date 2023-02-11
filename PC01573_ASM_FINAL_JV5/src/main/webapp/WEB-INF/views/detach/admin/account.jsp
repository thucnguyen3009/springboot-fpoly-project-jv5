<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${fn:replace(req.requestURL, req.requestURI, '')}" />
<c:set var="params" value="${requestScope['javax.servlet.forward.query_string']}"/>
<c:set var="requestPath" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<c:set var="userNow" value="/botxxii/admin/acount/edit/${accountModel.username}"/>
<%-- <c:set var="pageUrl" value="${ baseURL }${ requestPath }${ not empty params?'?'+=params:'' }"/> --%>
<div class="container-fluid px-4">
	<h1 class="mt-4">Quản Lý Tài Khoản</h1>
	<ol class="breadcrumb mb-4">
		<li class="breadcrumb-item"><a href="/views/admin">Bản Điều Khiển</a></li>
		<li class="breadcrumb-item active">Tài Khoản</li>
	</ol>
	<form:form class="card mb-4 p-3" action="" method="POST" modelAttribute="accountModel">
		<div class="row">
			<c:if test="${not empty message}">
				<div class="alert alert-success" role="alert">
					${message}
				</div>
			</c:if>
			<div class="col mb-3">
				<label for="username" class="form-label">
					Tên Đăng Nhập: <c:if test="${!accountModel.username.equals(sessionScope.acc.username)&&urlEdit==true}"><form:errors path="username" element="span" /></c:if>
				</label>
				<c:choose>
					<c:when test="${urlEdit==true}">
						<form:input path="username" class="form-control" id="username" placeholder="" autocomplete="off" disabled="false"/>
					</c:when>
					<c:otherwise>
						<form:input path="username" class="form-control" id="username" placeholder="" autocomplete="off" readonly="true"/>
					</c:otherwise>
				</c:choose>
				
			</div>
			<div class="col mb-3">
				<label for="fullname" class="form-label">
					Họ Và Tên: <form:errors path="fullname" element="span" />
				</label>
				<form:input path="fullname" class="form-control" id="fullname" placeholder="" autocomplete="off"/>
			</div>
		</div>
		<div class="row">
			<div class="col mb-3">
				<label for="password" class="form-label">
					Mật Khẩu: <form:errors path="password" element="span" />
				</label>
				<form:password path="password" class="form-control" id="password"  autocomplete="off" showPassword="true"/>
			</div>
			<div class="col mb-3">
				<label for="cfm" class="form-label">
					Xác Nhận Lại Mật Khẩu: <form:errors path="cfm" element="span" />
				</label>
				<form:password path="cfm" class="form-control" id="cfm"  autocomplete="off" showPassword="true"/>
			</div>
		</div>
		<div class="row">
			<div class="col mb-3">
				<label for="email" class="form-label">
					Email: <c:if test="${errEmail==true}"><form:errors path="email" element="span" /></c:if>
				</label>
				<form:input path="email" class="form-control" id="email"  autocomplete="off"/>
			</div>
			<div class="col mb-3">
				<label for="phone" class="form-label">
					Số Điện Thoại: <c:if test="${errPhone==true}"><form:errors path="phone" element="span" /></c:if>
				</label>
				<form:input path="phone" class="form-control" id="phone"  autocomplete="off"/>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<label class="form-label">Vai trò:</label>
				<div class="input-group mb-3">
					<div class="form-check form-check-inline ms-2">
						<c:choose>
							<c:when test="${sessionScope.AccountUser.username.equals(userEdit)&&userEdit!=null}">
								<form:radiobutton path="admin" value="true" class="form-check-input" disabled="true"/>
							</c:when>
							<c:otherwise>
								<form:radiobutton path="admin" value="true" class="form-check-input" disabled="false"/>
							</c:otherwise>
						</c:choose>
						<label class="form-check-label" for="">Quản trị viên</label>
					</div>
					<div class="form-check form-check-inline">
						<c:choose>
							<c:when test="${sessionScope.AccountUser.username.equals(userEdit)&&userEdit!=null}">
								<form:radiobutton path="admin" value="false" class="form-check-input" disabled="true"/>
							</c:when>
							<c:otherwise>
								<form:radiobutton path="admin" value="false" class="form-check-input" disabled="false"/>
							</c:otherwise>
						</c:choose>
						<label class="form-check-label" for="">Người dùng</label>
					</div>
				</div>
			</div>
			<div class="col">
				<label for="" class="form-label">Trạng Thái Hoạt Động:</label>
				<div class="input-group mb-3">
					<div class="form-check form-check-inline ms-2 ">
						<c:choose>
							<c:when test="${sessionScope.AccountUser.username.equals(userEdit)&&userEdit!=null}">
								<form:radiobutton path="activated" value="true" class="form-check-input" disabled="true"/>
							</c:when>
							<c:otherwise>
								<form:radiobutton path="activated" value="true" class="form-check-input" disabled="false"/>
							</c:otherwise>
						</c:choose>
						<label class="form-check-label" for="">Đang hoạt động</label>
					</div>
					<div class="form-check form-check-inline">
						<c:choose>
							<c:when test="${sessionScope.AccountUser.username.equals(userEdit)&&userEdit!=null}">
								<form:radiobutton path="activated" value="false" class="form-check-input" disabled="true"/>
							</c:when>
							<c:otherwise>
								<form:radiobutton path="activated" value="false" class="form-check-input" disabled="false"/>
							</c:otherwise>
						</c:choose>
						<label class="form-check-label" for="">Đang ngừng hoạt động</label>
					</div>
				</div>
			</div>
		</div>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<c:choose>
				<c:when test="${urlEdit==true}">
					<button class="btn btn-primary me-md-2" type="submit" formaction="/botxxii/admin/acount/create?xuannhi=${listAcc.number}">Tạo Tài Khoản</button>
				</c:when>
				<c:otherwise>
					<button class="btn btn-primary me-md-2" type="submit" formaction="/botxxii/admin/acount/update/<c:if test="${sessionScope.userEdit == null}">0</c:if><c:if test="${sessionScope.userEdit != null}">${sessionScope.userEdit}</c:if>?xuannhi=${listAcc.number}">Cập Nhật Tài Khoản</button>
					<button class="btn btn-primary me-md-2" type="submit" formaction="/botxxii/admin/acount/cancel?xuannhi=${listAcc.number}">Hủy</button>
				</c:otherwise>
			</c:choose>
			<a class="btn btn-primary me-md-2" type="button" href="/botxxii/admin/acount/reset?xuannhi=${listAcc.number}">Làm Mới</a>		
		</div>
		
	</form:form>
	<div class="card mb-4" id="table">
		<div class="card-header">
			<i class="fas fa-table me-1"></i> DANH SÁCH TÀI KHOẢN
		</div>
		<div class="card-body">
			<table class="table table-bordered border-primary">
				<thead>
					<tr>
						<th scope="col">Tên Đăng Nhập</th>
						<th scope="col">Họ Và Tên</th>
						<th scope="col">Email</th>
						<th scope="col">Số Điện Thoại</th>
						<th scope="col">Vai Trò</th>
						<th scope="col">Trạng Thái Hoạt Động</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${listAcc==null}">
								<tr>
									<td colspan="7" class="text-center">Không có dữ liệu.</td>
								</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${listAcc.content}" var="list">
								<tr>
									<td>${list.username}</td>
									<td>${list.fullname}</td>
									<td>${list.email}</td>
									<td>${list.photo}</td>
									<td>
										<c:choose>
											<c:when test="${list.admin==true}">Quản trị viên</c:when>
											<c:otherwise>Người dùng</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${list.activated==true}">Đang hoạt động</c:when>
											<c:otherwise>Ngưng hoạt động</c:otherwise>
										</c:choose>
									</td>
									<td>
										<a href="/botxxii/admin/acount/edit/${list.username}?xuannhi=${listAcc.number}">edit</a>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
				<tfoot>
					<tr>
						<th scope="col">Tên Đăng Nhập</th>
						<th scope="col">Họ Và Tên</th>
						<th scope="col">Email</th>
						<th scope="col">Số Điện Thoại</th>
						<th scope="col">Vai Trò</th>
						<th scope="col">Trạng Thái Hoạt Động</th>
						<th scope="col"></th>
					</tr>
				</tfoot>
			</table>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<a class="btn btn-danger me-md-2" type="button" href="/botxxii/admin/acount/page?xuannhi=0&user=${userEdit==null?'null':userEdit}&/#table">|<</a>
				<a class="btn btn-danger me-md-2" type="button" href="/botxxii/admin/acount/page?xuannhi=${listAcc.number-1<0?0:listAcc.number-1}&user=${userEdit==null?'null':userEdit}&/#table"><<</a>
				<a class="btn btn-danger me-md-2" type="button" href="/botxxii/admin/acount/page?xuannhi=${listAcc.number+1>listAcc.totalPages-1?listAcc.totalPages-1:listAcc.number+1}&user=${userEdit==null?'null':userEdit}&/#table">>></a>
				<a class="btn btn-danger me-md-2" type="button" href="/botxxii/admin/acount/page?xuannhi=${listAcc.totalPages-1}&user=${userEdit==null?'null':userEdit}&/#table">>|</a>
			</div>
		</div>
	</div>
</div>
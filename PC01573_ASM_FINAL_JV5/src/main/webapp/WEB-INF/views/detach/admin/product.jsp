<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="container-fluid px-4">
	<h1 class="mt-4">Quản Lý Sản Phẩm</h1>
	<ol class="breadcrumb mb-4">
		<li class="breadcrumb-item"><a href="/views/admin">Bản Điều Khiển</a></li>
		<li class="breadcrumb-item active">Sản Phẩm</li>
	</ol>
	<form:form class="card mb-4 p-3" action="" method="POST" modelAttribute="productModol" name="productForm" enctype="multipart/form-data">
		<div class="row">
			<div class="col-6 text-center">
				<label for="upload-photo"> 
					<img id="upload-photos" src="/images/product/<c:if test="${not empty imagesPro}">${imagesPro}</c:if><c:if test="${empty imagesPro}">undraw_personal_info_re_ur1n.svg</c:if>" class="img-fluid border border-primary" alt="Chọn Ảnh Sản Phẩm" style="cursor: pointer;">
					<input id="upload-photo" name="upload" type="file" class="row" style="opacity: 0; position:solute; display:none; background-color: red;cursor: pointer;">
				</label>
				<label for="upload-photo" class="btn btn-secondary mt-3">Chọn Ảnh Sản Phẩm</label>
			</div>
			<div class="col-6">
				<div class="row">
					<label for="name" class="form-label">
						Tên Sản Phẩm: <form:errors path="name" element="span" />
					</label>
					<form:input path="name" class="form-control" id="name" placeholder="" autocomplete="off"/>
				</div>
				<br>
				<div class="row">
					<label for="price" class="form-label">
						Giá: <form:errors path="price" element="span" />
					</label>
					<form:input path="price" class="form-control" id="price" placeholder="" autocomplete="off"/>
				</div>
				<br>
				<div class="row">
					<label for="cate" class="form-label">
						Loại Sản Phẩm: <form:errors path="" element="span" />
					</label>
					<form:select path="category.id" class="form-select" aria-label="Default select example" id="cate" placeholder="" autocomplete="off">
						<c:choose>
							<c:when test="${not empty categorys}">
								<form:options items="${categorys}" itemValue="id" itemLabel="name"/>
							</c:when>
							<c:otherwise>
								<option value="No Value">Chưa có loại sản phẩm.</option>
							</c:otherwise>
						</c:choose>
					</form:select>
				</div>
				<br>
				<div class="row">
				<label class="form-label">Trạng Thái:</label>
				<div class="input-group mb-3">
					<div class="form-check form-check-inline ms-2">
						<form:radiobutton path="available" value="true" class="form-check-input"/>
						<label class="form-check-label" for="">Đang kinh doanh</label>
					</div>
					<div class="form-check form-check-inline">
						<form:radiobutton path="available" value="false" class="form-check-input"/>
						<label class="form-check-label" for="">Ngừng kinh doanh</label>
					</div>
				</div>
			</div>
			</div>
		</div>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<c:choose>
				<c:when test="${urlEditPro==true}">
					<button class="btn btn-primary me-md-2" type="submit" formaction="/botxxii/admin/product/create?xuannhi=${listPro.number}">Thêm Sản Phẩm</button>
				</c:when>
				<c:otherwise>
					<button class="btn btn-primary me-md-2" type="submit" formaction="/botxxii/admin/product/update/<c:if test="${sessionScope.proEdit == null}">0</c:if><c:if test="${sessionScope.proEdit != null}">${sessionScope.proEdit}</c:if>?xuannhi=${listPro.number}">Cập Nhật Tài Khoản</button>
					<button class="btn btn-primary me-md-2" type="submit" formaction="/botxxii/admin/product/cancel?xuannhi=${listPro.number}">Hủy</button>
				</c:otherwise>
			</c:choose>
			<a class="btn btn-primary me-md-2" type="button" href="/botxxii/admin/product/reset?xuannhi=${listPro.number}">Làm Mới</a>		
		</div>
	</form:form>
	<div class="card mb-4" id="table">
		<div class="card-header">
			<i class="fas fa-table me-1"></i> DANH SÁCH SẢN PHẨM
		</div>
		<div class="card-body">
			<table class="table table-bordered border-primary">
				<thead>
					<tr>
						<th scope="col">Tên Sản Phẩm</th>
						<th scope="col">Giá</th>
						<th scope="col">Loại</th>
						<th scope="col">Ngày Tạo</th>
						<th scope="col">Trạng Thái</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${listPro==null}">
								<tr>
									<td colspan="7" class="text-center">Không có dữ liệu.</td>					
								</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${listPro.content}" var="list">
								<tr>
									<td>${list.name}</td>
									<td><fmt:formatNumber value = "${list.price}" type = "currency"/></td>
									<td>${list.category.name}</td>
									<td>${list.createDate}</td>
									<td>
										<c:choose>
											<c:when test="${list.available==true}">Đang kinh doanh</c:when>
											<c:otherwise>Ngừng kinh doanh</c:otherwise>
										</c:choose>
									</td>
									<td>
										<a href="/botxxii/admin/product/edit/${list.id}?xuannhi=${listPro.number}">edit</a>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
				<tfoot>
					<tr>
						<th scope="col">Tên Sản Phẩm</th>
						<th scope="col">Giá</th>
						<th scope="col">Loại</th>
						<th scope="col">Ngày Tạo</th>
						<th scope="col">Trạng Thái</th>
						<th scope="col"></th>
					</tr>
				</tfoot>
			</table>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<a class="btn btn-danger me-md-2" type="button" href="/botxxii/admin/product/page?xuannhi=0&idPro=${proEdit==null?'null':proEdit}&/#table">|<</a>
				<a class="btn btn-danger me-md-2" type="button" href="/botxxii/admin/product/page?xuannhi=${listPro.number-1<0?0:listPro.number-1}&idPro=${proEdit==null?'null':proEdit}&/#table"><<</a>
				<a class="btn btn-danger me-md-2" type="button" href="/botxxii/admin/product/page?xuannhi=${listPro.number+1>listPro.totalPages-1?listPro.totalPages-1:listPro.number+1}&idPro=${proEdit==null?'null':proEdit}&/#table">>></a>
				<a class="btn btn-danger me-md-2" type="button" href="/botxxii/admin/product/page?xuannhi=${listPro.totalPages-1}&idPro=${proEdit==null?'null':proEdit}&/#table">>|</a>
			</div>
		</div>
	</div>
</div>
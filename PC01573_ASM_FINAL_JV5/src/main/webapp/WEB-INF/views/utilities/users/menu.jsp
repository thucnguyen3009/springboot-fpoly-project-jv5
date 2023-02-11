<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" style="background-color: #fe8809 !important; padding-top: 2px !important; padding-bottom: 2px !important;">
  	<div class="container-fluid">
	    <a class="navbar-brand" href="/botxxii/index">
	   		<img src="/images/icon/logo.png" class="" height="70" width="70" alt=""/>
	    </a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    	<span class="navbar-toggler-icon"></span>
	    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
   
    <ul class="navbar-nav me-auto mb-2 mb-lg-0" >
	    <li class="nav-item">
	    	<a class="nav-link" href="/botxxii/index"><i class="bi bi-house-fill"></i> Trang Chủ</a>
	    </li>
    	<li class="nav-item me-3 me-lg-0 dropdown">
		    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		    	<i class="bi bi-inboxes-fill"></i> Sản Phẩm
		    </a>
		    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		    	<c:forEach var="list" items="${listCategory}" varStatus="vitri">
		    		<li><a class="dropdown-item" href="/botxxii/product/${list.id}"> <i class="${list.icon}"></i> ${list.name}</a></li>
		    		<c:if test="${vitri.index!=fn:length(listCategory)-1}">
		    			<li><hr class="dropdown-divider"></li> 
		    		</c:if>	
		    	</c:forEach>
		    	<li><hr class="dropdown-divider"></li>
		    	<li><a class="dropdown-item" href="/botxxii/product/all"> <i class=""></i>Tất Cả Sản Phẩm</a></li>
		    </ul>
	    </li>
	    <li class="nav-item me-3 me-lg-0 dropdown">
		    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		    	<i class="bi bi-journals"></i> Chính Sách
		    </a>
		    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			    <li><a class="dropdown-item" href="#"> <i class="bi bi-wrench-adjustable"></i> Bảo Hành</a></li>
			    <li><hr class="dropdown-divider"></li>
			    <li><a class="dropdown-item" href="#"> <i class="bi bi-arrow-left-right"></i> Vận Chuyển</a></li>
		    </ul>
	    </li>
	    <li class="nav-item">
	    	<a class="nav-link" href="#"> <i class="bi bi-envelope-open-heart"></i> Liên Hệ</a>
	    </li>
    </ul>
     <form class="me-3">
    	<div class="form-white input-group">
		  <input type="search" class="form-control rounded" placeholder="Tìm kiếm sản phẩm. . ." aria-label="Search" aria-describedby="search-addon" />
		  <button class="input-group-text" id="basic-addon1" type="submit"><i class="bi bi-search"></i></button>
		</div>
    </form>
    <ul class="navbar-nav d-flex flex-row" style="margin-right: 100px;">
	    <li class="nav-item" style="">
	    	<a class="nav-link position-relative" href="/botxxii/cart">
	    		<img src="/images/icon/cart.png" width="40" height="40" alt="" />
	    		<span class="position-absolute translate-middle badge rounded-pill bg-danger" style="font-size: 10px; background-color:#f81200 !important;">${sl}</span>Giỏ Hàng
			</a>
	    </li>
	    <li class="nav-item me-3 me-lg-0 dropdown" style="margin-top: 1.3%;">
		    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		    	<img src="/images/icon/user.png" class="rounded-circle" height="32" width="32" alt=""/> Tài Khoản
		    </a>
		    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		    	<c:if test="${sessionScope.AccountUser.admin==true}">
		    		<li><a class="dropdown-item" href="/botxxii/admin">Trang Quản Trị</a></li>
		    		<li><hr class="dropdown-divider"></li>
		    	</c:if>
			    <c:choose>
				    <c:when test="${sessionScope.AccountUser.username==null}">
				    	<li><a class="dropdown-item" href="/botxxii/login">Đăng Nhập</a></li>
					    <li><a class="dropdown-item" href="/botxxii/signup">Đăng Ký</a></li>
				    </c:when>
				    <c:otherwise>
				    	<li><a class="dropdown-item" href="/botxxii/myaccount">Tài Khoản Của Tôi</a></li>
					    <li><a class="dropdown-item" href="#">Đơn Mua</a></li>
					    <li><hr class="dropdown-divider"></li>
				    	<li><a class="dropdown-item" href="/botxxii/signout">Đăng Xuất</a></li>
				    </c:otherwise>
			    </c:choose>
		    </ul>
	    </li>
    </ul>
    </div>
    </div>
   </nav>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/tool/addlib.jsp"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
<title>Box XXII</title>
<style>
.centerx{
	display: flex;
	justify-content: center;
	align-items: center;
	/* border: 3px solid green; */
}

.abc {
	position: relative;
	height: 100% border: 3px solid green;
}

.xyz {
	margin: 0;
	position: absolute;
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}

body {
	background-color: #ee4e2e;
	height: 100vh;
}

.bg-image-vertical {
	position: relative;
	overflow: hidden;
	background-repeat: no-repeat;
	background-position: right center;
	background-size: auto 100%;
}

@media ( min-width : 1025px) {
	.h-custom-2 {
		
	}
}

@import url('https://fonts.googleapis.com/css?family=Numans');

html, body {
	/* background-color: #ee4e2e; */
	overflow-y: hidden;
	/*     background-image: url('https://i.gifer.com/GYlk.gif');
    background-size: cover;
    background-repeat: no-repeat;
    height: 100vh;
    font-family: 'Numans', sans-serif; */
	/* background-image: url('/images/icon/bglogin2.png'); */
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
}

a:hover {
	color: #fe8809;
}

a {
	font-weight: 20px;
}

/* img {
    width: 100vw;
    height: 100vh;
    position: fixed;
    top: 0;
    left: 0;
    object-fit: cover;
} */
.container {
	height: 100%;
	align-content: center;
}

.card {
	/* height: 370px; */
	margin-top: auto;
	margin-bottom: auto;
	width: auto;
	background-color: rgba(0, 0, 0, 0) !important;
}

.social_icon span {
	font-size: 60px;
	margin-left: 10px;
	color: rgb(245, 231, 231);
}

.social_icon span:hover {
	color: white;
	cursor: pointer;
}

.card-header h1, h6 {
	color: #ffffff;
	font-weight: bold;
}

.social_icon {
	position: absolute;
	right: 20px;
	top: -45px;
}

.input-group-prepend span {
	width: 50px;
	background-color: #fe8809;
	color: black;
	border: 0 !important;
}

input:focus {
	outline: 0 0 0 0 !important;
	box-shadow: 0 0 0 0.3 !important;
}

.remember {
	color: white;
}

.remember input {
	width: 20px;
	height: 20px;
	margin-left: 15px;
	margin-right: 5px;
}

.login_btn {
	color: black;
	background-color: #cc6600;
	width: 100px;
}

.singup_btn {
	color: white;
	background-color: #fe8809;
	width: auto;
	height: 120%;
}

.singup_btn:hover {
	color: black;
	background-color: white;
}

.login_btn:hover {
	color: black;
	background-color: white;
}

.links {
	color: white;
}

.links a {
	margin-left: 4px;
}
</style>
<style type="text/css">
	[id$=".errors"] {
		color: white;
		/* text-shadow: 0 0 0.7rem black; */
		font-weight: 500;
		font-style: italic;
		display: inline-block;
	}
</style>

</head>

<body>
	<nav class="navbar navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img
				src="/images/icon/LogoLogin.png" alt="" width="40" height="40"
				class="d-inline-block align-text-top"> <b
				style="color: #cc6600;">BOT XXII</b>
			</a>
		</div>
	</nav>
	<section class="vh-100">
		<div class="container-fluid ">
			<div class="row abc centerx">
				<div class="col-sm-7 text-black abc">
					<div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5 xyx">
						<div class="container">
							<div class="d-flex justify-content-center h-100">
								<div class="card" style="width: 850px">
									<div class="card-header">
										<h1>Đăng Kí Tài Khoản</h1>
				                    <div class="d-flex justify-content-end social_icon">
				                        <span><i class="fab fa-facebook-square"></i></span>
				                        <span><i class="fab fa-google-plus-square"></i></span>
				                        <span><i class="fab fa-twitter-square"></i></span>
				                    </div>
				                </div>
				                <div class="card-body" style="width: auto;">
				                	<form:form class="row" action="/botxxii/signup" method="POST" modelAttribute="singupFrm">
				                        <div class="col-md-6">
				                        	<div style="height: 15px; padding-bottom: 20px;">
				                        		<form:errors path="fullname" element="div" />
				                        	</div>
				                            
											<div class="input-group form-group">
												<div class="input-group mb-3 input-group-prepend">
													<span class="input-group-text">
														<i class="fas fa-user links"></i>
													</span>
													<div class="form-floating flex-grow-1">
														<form:input path="fullname" class="form-control" id="fullname" placeholder="Họ & Tên" autocomplete="off"/>
														<label for="fullname">Họ Và Tên</label>
													</div>
												</div>
											</div>
											<div style="height: 15px; padding-bottom: 20px;">
				                        		<form:errors path="email" element="div" />
				                        	</div>
											
											<div class="input-group form-group">
												<div class="input-group mb-3 input-group-prepend">
													<span class="input-group-text">
														<i class="bi bi-envelope-heart-fill links"></i>
													</span>
													<div class="form-floating flex-grow-1">
														<form:input path="email" class="form-control" id="email" placeholder="Gmail" autocomplete="off"/>
														<label for="email">Gmail</label>
													</div>
												</div>
											</div>
											<div style="height: 15px; padding-bottom: 20px;">
				                        		<form:errors path="phones" element="div" />
				                        	</div>
											
											<div class="input-group form-group">
												<div class="input-group mb-3 input-group-prepend">
													<span class="input-group-text">
														<i class="fas fa-user links"></i>
													</span>
													<div class="form-floating flex-grow-1">
														<form:input path="phones" class="form-control" id="sdt" placeholder="Số Điện Thoại" autocomplete="off"/>
														<label for="sdt">Số Điện Thoại</label>
													</div>
												</div>
											</div>
				                        </div>
				                        <div class="col-md-6 ">
				                        	<div style="height: 15px; padding-bottom: 20px;">
				                        		<form:errors path="username" element="div" />
				                        	</div>
				                        	
											<div class="input-group form-group">
												<div class="input-group mb-3 input-group-prepend">
													<span class="input-group-text">
														<i class="bi bi-incognito links"></i>
													</span>
													<div class="form-floating flex-grow-1">
														<form:input path="username" class="form-control" id="usr" placeholder="Tên Đăng Nhập" autocomplete="off"/>
														<label for="usr">Tên Đăng Nhập</label>
													</div>
												</div>
											</div>
											<div style="height: 15px; padding-bottom: 20px;">
				                        		<form:errors path="password" element="div" />
				                        	</div>
											
											<div class="input-group form-group">
												<div class="input-group mb-3 input-group-prepend">
													<span class="input-group-text">
														<i class="fas fa-key links"></i>
													</span>
													<div class="form-floating flex-grow-1">
														<form:password path="password" class="form-control" id="password" placeholder="Mật Khẩu" autocomplete="off" showPassword="true" name="pass"/>
														<label for="password">Mật Khẩu</label>
													</div>
												</div>
											</div>
											<div style="height: 15px; padding-bottom: 20px;">
				                        		<form:errors path="passwordCfm" element="div" />
				                        	</div>
											
											<div class="input-group form-group">
												<div class="input-group mb-3 input-group-prepend">
													<span class="input-group-text">
														<i class="bi bi-shield-fill-check links"></i>
													</span>
													<div class="form-floating flex-grow-1">
														<form:password path="passwordCfm" class="form-control" id="passwordCfm" placeholder="Xác Nhận Mật Khẩu" autocomplete="off" showPassword="true"/>
														<label for="passwordCfm">Xác Nhận Mật Khẩu</label>
													</div>
												</div>
											</div>
				                        </div>
				                        <div class="d-grid gap-2 ">
				                            <button class="btn singup_btn links" type="submit">Đăng Kí</button>
				                        </div>
				                    </form:form>
				                </div>
				                <div class="card-footer ">
				                    <div class="d-flex justify-content-center links">
				                        Bạn đã có tài khoản?<a href="/botxxii/login" class="links">Đăng nhập ngay</a>
				                    </div>
				                    <div class="text-center links" style="background-color: rgba(0, 0, 0, 0.05); font-size: 70%;">
				                        © 2022 Copyright:
				                        <a class="text-reset fw-bold links" href="">Developer Thuc Nguyen</a>
				                    </div>
				                    <div class="d-flex justify-content-center ">
				                    </div>
				                </div>
				            </div>
				        </div>
				    </div>
		        </div>
		      </div>
				<div class="col-5 centerx">
					<img src="/images/icon/bglogin3.png" alt="Login image" class="centerx"> 
				</div>
			</div>
		</div>
	</section>

</body>
</html>
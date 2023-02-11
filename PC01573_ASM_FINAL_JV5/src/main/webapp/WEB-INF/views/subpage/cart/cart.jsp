<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="vi_VN" scope="session"/>
<style type="text/css">
@media (min-width: 1025px) {
.h-custom {
height: 100vh !important;
}
}

.number-input input[type="number"] {
-webkit-appearance: textfield;
-moz-appearance: textfield;
appearance: textfield;
}

.number-input input[type=number]::-webkit-inner-spin-button,
.number-input input[type=number]::-webkit-outer-spin-button {
-webkit-appearance: none;
}

.number-input button {
-webkit-appearance: none;
background-color: transparent;
border: none;
align-items: center;
justify-content: center;
cursor: pointer;
margin: 0;
position: relative;
}

.number-input button:before,
.number-input button:after {
display: inline-block;
position: absolute;
content: '';
height: 2px;
transform: translate(-50%, -50%);
}

.number-input button.plus:after {
transform: translate(-50%, -50%) rotate(90deg);
}

.number-input input[type=number] {
text-align: center;
}

.number-input.number-input {
border: 1px solid #ced4da;
width: 8rem;
border-radius: .25rem;
}

.number-input.number-input button {
width: 2.6rem;
height: .7rem;
}

.number-input.number-input button.minus {
padding-left: 10px;
}

.number-input.number-input button:before,
.number-input.number-input button:after {
width: .7rem;
background-color: #495057;
}

.number-input.number-input input[type=number] {
max-width: 4rem;
padding: .5rem;
border: 1px solid #ced4da;
border-width: 0 1px;
font-size: 1rem;
height: 2rem;
color: #495057;
}

@media not all and (min-resolution:.001dpcm) {
@supports (-webkit-appearance: none) and (stroke-color:transparent) {

.number-input.def-number-input.safari_only button:before,
.number-input.def-number-input.safari_only button:after {
margin-top: -.3rem;
}
}
}

.shopping-cart .def-number-input.number-input {
border: none;
}

.shopping-cart .def-number-input.number-input input[type=number] {
max-width: 5rem;
border: none;
}

.shopping-cart .def-number-input.number-input input[type=number].black-text,
.shopping-cart .def-number-input.number-input input.btn.btn-link[type=number],
.shopping-cart .def-number-input.number-input input.md-toast-close-button[type=number]:hover,
.shopping-cart .def-number-input.number-input input.md-toast-close-button[type=number]:focus {
color: #212529 !important;
}

.shopping-cart .def-number-input.number-input button {
width: 1rem;
}

.shopping-cart .def-number-input.number-input button:before,
.shopping-cart .def-number-input.number-input button:after {
width: .5rem;
}

.shopping-cart .def-number-input.number-input button.minus:before,
.shopping-cart .def-number-input.number-input button.minus:after {
background-color: #9e9e9e;
}

.shopping-cart .def-number-input.number-input button.plus:before,
.shopping-cart .def-number-input.number-input button.plus:after {
background-color: #4285f4;
}
</style>
<section class="" style=" margin-top: 50px;">
	<div class="container h-100 py-5">
		<div class="row d-flex justify-content-center align-items-center h-100">
			<div class="col">
				<div class="card shopping-cart" style="border-radius: 15px;">
					<div class="card-body text-black">
						<div class="row">
							<div class="<c:if test="${carts.getAmount()>0}">col-lg-6 px-5 py-4</c:if>">
								<h3 class="mb-5 pt-2 text-center fw-bold text-uppercase">Sản Phẩm Của Bạn</h3>
								<div class="<c:if test="${carts.getCount()==0}">alert alert-warning</c:if>" role="alert">
								  <h6>${message}</h6>
								</div>
								<c:forEach var="item" items="${carts.items}">
									<form id="form1"action="/botxxii/cart/update/${item.id}" method="post">
									<input class="visually-hidden-focusable" id="dc2" name="dc" type="hidden">
									<div class="d-flex align-items-center mb-5">
										<div class="flex-shrink-0">
											<img src="/images/product/${item.image}" class="img-fluid" style="width: 150px;" alt="Generic placeholder image">
										</div>
										<div class="flex-grow-1 ms-3">
											<a href="/botxxii/cart/remove/${item.id}" class="float-end text-black">
												<i class="bi bi-x-square"></i>
											</a>
											<h5 class="text-primary">${item.name}</h5>
											<div class="d-flex align-items-center">
												<c:set var = "price" value = "${item.price}" />
												<p class="fw-bold mb-0 me-5 pe-3"><fmt:formatNumber value = "${price}" type = "currency"/></p>
												<div class="def-number-input number-input safari_only">
													<button type="submit" onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="minus" formaction="/botxxii/cart/update/${item.id}"></button>
													<input id="quantity"  class="quantity fw-bold text-black" min="1" name="quantity" value="${item.amount}" type="number" onblur="xyz()" >
													<button type="submit" onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus" formaction="/botxxii/cart/update/${item.id}"></button>
												</div>
											</div>
										</div>
									</div>
									</form>
								</c:forEach>
								<hr class="mb-4" style="height: 2px; background-color: #fe8809; opacity: 1;">
								<div class="d-flex justify-content-between px-x">
									<p class="fw-bold">Tổng phí ship áp dụng trên toàn quốc:</p>
									<p class="fw-bold">30.000VND</p>
								</div>
								<div class="d-flex justify-content-between p-2 mb-2" style="background-color: #e1f5fe;">
								<c:set var = "amount" value = "${carts.getAmount()}" />
												
									<h5 class="fw-bold mb-0">Tồng tiền:</h5>
									<h5 class="fw-bold mb-0"><fmt:formatNumber value = "${amount}" type = "currency"/></h5>
								</div>
								
							</div>
							<c:if test="${carts.getAmount()>0}">
								<div class="col-lg-6 px-5 py-4">
									<h3 class="mb-5 pt-2 text-center fw-bold text-uppercase">Thanh Toán</h3>
									<form id="form2" class="mb-5" method="post" action="/botxxii/cart/pay">
										<div class="mb-3">
											<label for="exampleFormControlInput1" class="form-label">Tên người nhận</label>
											<input type="text" class="form-control form-control-lg " id="exampleFormControlInput1" disabled name="name" value="${AccountUser.fullname}">
										</div>
										<div class="mb-3">
											<label for="exampleFormControlInput1" class="form-label">Số điện thoại</label>
											<input type="text" class="form-control form-control-lg " id="exampleFormControlInput1" disabled name="sdt"  value="${AccountUser.photo}">
										</div>
										<div class="mb-3">
											<label for="exampleFormControlTextarea1" class="form-label">Địa chỉ</label>
											<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="dc" onkeyup="abc()" onblur="xyz()">${vldc}</textarea>
										</div>
										<span style="color: red;">${vluDc}</span><br><br>
										<button type="submit" class="btn btn-warning btn-block btn-lg" style="background: #fe8809;" formaction="/botxxii/cart/pay" >Thanh Toán</button>
									</form>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
this.abc();
$(document).ready(function() {
	  $(window).keydown(function(event){
	    if(event.keyCode == 13) {
	      event.preventDefault();
	      return false;
	    }
	  });
	});
function abc(){
	document.getElementById('dc2').value = document.getElementById('exampleFormControlTextarea1').value;
}
function xyz(){
	document.getElementById('form1').submit();
}
</script>
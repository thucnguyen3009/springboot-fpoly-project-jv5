<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="mydiv carousel slide" style="margin: 50px auto;">
	<div class="row" style="margin-top: 100px">
		<div class="display-5 text-uppercase mb-3">
			<span class="text-primary titles titlex">${titleProduct}</span>
		</div>
		<c:forEach var="list" items="${listProByCate}"> 
			<div class="col-md-3">
				<div class="bbb_deals">
					<div class="ribbon ribbon-top-right">
						<span><small class="cross">x </small>2</span>
					</div>
					<div class="bbb_deals_title">${list.category.name}</div>
					<div class="bbb_deals_slider_container">
						<div class=" bbb_deals_item" onclick="window.location.href = '/botxxii/details/${list.id}';" >
							<div class="bbb_deals_image">
								<img src="/images/product/${list.image}" alt="">
							</div>
							<div class="bbb_deals_content">
								<div
									class="bbb_deals_info_line d-flex flex-row justify-content-start">
									<div class="bbb_deals_item_category">
										<b>${list.category.name}</b>
									</div>
									<div class="bbb_deals_item_price_a ml-auto">
										
									</div>
								</div>
								<div
									class="bbb_deals_info_line d-flex flex-row justify-content-start">
									<div class="bbb_deals_item_name"style="min-height: 20vh;">${list.name}</div>
									<c:set var = "price" value = "${list.price}" />
									<div class="bbb_deals_item_price ml-auto"><fmt:formatNumber value = "${price}" type = "currency"/></div>
								</div>
								<div class="available">
									<div
										class="available_line d-flex flex-row justify-content-start">
										<div class="available_title">
											Trạng thái: 
											<span>
	                                    		<c:choose>
													<c:when test = "${list.available==true}">Còn hàng</c:when>
													<c:otherwise>Hết hàng</c:otherwise>
												</c:choose>      	
											</span>
										</div>
										<div class="sold_stars ml-auto">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
									</div>
									<div class="available_bar">
										<span style="width: 17%"></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		 </c:forEach>
	</div>
</div>
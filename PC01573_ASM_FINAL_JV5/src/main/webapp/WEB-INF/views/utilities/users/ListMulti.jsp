<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
   <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <style>
        .container {
            padding-right: 15px;
            padding-left: 15px;
            margin-right: auto;
            margin-left: auto;
        }
        
        @media (min-width: 768px) {
            .container {
                width: 750px;
            }
        }
        
        @media (min-width: 992px) {
            .container {
                width: 970px;
            }
        }
        
        @media (min-width: 1200px) {
            .container {
                width: 1170px;
            }
        }
        
        @media (max-width: 767px) {
            #featureContainer .carousel-inner .carousel-item>div {
                display: none;
            }
            #featureContainer .carousel-inner .carousel-item>div:first-child {
                display: block;
            }
        }
        
        #featureContainer .carousel-inner .carousel-item.active,
        #featureContainer .carousel-inner .carousel-item-next,
        #featureContainer .carousel-inner .carousel-item-prev {
            display: flex;
        }
        /* medium and up screens */
        
        @media (min-width: 768px) {
            #featureContainer .carousel-inner .carousel-item-end.active,
            #featureContainer .carousel-inner .carousel-item-next {
                transform: translateX(25%);
            }
            #featureContainer .carousel-inner .carousel-item-start.active,
            #featureContainer .carousel-inner .carousel-item-prev {
                transform: translateX(-25%);
            }
            #featureContainer .card img {
                width: 90%;
                height: 40vh;
            }
            #featureContainer .carousel-item {
                justify-content: space-between;
            }
        }
        
        @media (max-width: 767px) {
            #featureContainer .card img {
                width: 100%;
                height: 75vh;
            }
        }
        
        #featureContainer .carousel-inner .carousel-item-end,
        #featureContainer .carousel-inner .carousel-item-start {
            transform: translateX(0);
        }
        
        #featureContainer .card {
            border: 0;
        }
        
        #featureContainer .card {
            position: relative;
        }
        
        #featureContainer .card .card-img-overlays {
            position: absolute;
            bottom: 15%;
            left: 10%;
            color: #fff;
            font-weight: bolder;
        }
        
        #featureContainer a {
            text-decoration: none;
        }
        
        #featureContainer .indicator {
            border: 1px solid rgb(202, 202, 202);
            padding: 3px 6px 3px 6px;
        }
        
        #featureContainer .indicator:hover {
            background-color: blue;
            border: 1px solid blue;
            transition: 200ms;
        }
        
        #featureContainer .indicator:hover {
            color: white;
            transition: 200ms;
        }
        
        #featureContainer .indicator {
            color: lightgray;
        }
        
        #featureContainer .float-end {
            padding-top: 10px;
        }
        .titles{
        	font-size: 35px !important;
        	animation-name: fadeInUp;
        	text-transform: uppercase !important;
        	font-weight: 500;
        	line-height: 1.2;
        	color: #fe8809 !important;
        }
    </style>
    <div class="" id="featureContainer" style="margin:50px auto;">
        <div class="row mx-auto my-auto justify-content-center">
            <div id="featureCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="display-5 text-uppercase mb-3">
				<span class="text-primary titles">Gợi Ý Hôm Nay</span>
                </div>
                <div class="float-end pe-md-4">
                    <a class="indicator" href="#featureCarousel" role="button" data-bs-slide="prev">
                        <span aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
                    </a> &nbsp;&nbsp;
                    <a class="w-aut indicator" href="#featureCarousel" role="button" data-bs-slide="next">
                        <span aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
                    </a>
                </div>
                <div class="carousel-inner h-100" role="listbox">
	                <c:forEach items="${listProductTrue}" var="list" varStatus="vitri">
	    				<div class="carousel-item <c:if test = "${vitri.index == 0}">active</c:if> h-100">
	                        <div class="col-3"  >
	                            <!-- bbb_deals -->
					            <div class="bbb_deals" style="min-height: 85vh;">
					                <div class="ribbon ribbon-top-right"><span><small class="cross">x </small>2</span></div>
					                <div class="bbb_deals_title">${list.category.name}</div>
					                <div class="bbb_deals_slider_container">
					                    <div class=" bbb_deals_item h-100" onclick="window.location.href = '/botxxii/details/${list.id}';">
					                        <div class="bbb_deals_image"><img src="/images/product/${list.image}" alt=""></div>
					                        <div class="bbb_deals_content h-100">
					                            <div class="bbb_deals_info_line d-flex flex-row justify-content-start">
					                                <div class="bbb_deals_item_category"><a href="">${list.category.name}</a></div>
					                            </div>
					                            <div class="bbb_deals_info_line d-flex flex-row justify-content-start h-100">
					                                <div class="bbb_deals_item_name h-100">${list.name}</div>
					                                
					                            </div>
					                            <c:set var = "price" value = "${list.price}" />
					                                <div class="bbb_deals_item_price ml-auto">
					                                	<fmt:formatNumber value = "${price}" type = "currency"/>
					                                </div>
					                            <div class="available h-100">
					                                <div class="available_line d-flex flex-row justify-content-start">
					                                    <div class="available_title">Trạng thái: 
					                                    	<span>
					                                    		<c:choose>
																	<c:when test = "${list.available==true}">Còn hàng</c:when>
																	<c:otherwise>Hết hàng</c:otherwise>
																</c:choose>
					                                    	</span>
				                                    	</div>
					                                    <div class="sold_stars ml-auto"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> </div>
					                                </div>

					                                <div class="available_bar"><span style="width:17%"></span></div>
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
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"></script>
    <script>
        let items = document.querySelectorAll('#featureContainer .carousel .carousel-item');
        items.forEach((el) => {
            const minPerSlide = 4
            let next = el.nextElementSibling
            for (var i = 1; i < minPerSlide; i++) {
                if (!next) {
                    // wrap carousel by using first child
                    next = items[0]
                }
                let cloneChild = next.cloneNode(true)
                el.appendChild(cloneChild.children[0])
                next = next.nextElementSibling
            }
        })
        $(document).ready(function() {
            $('#featureCarousel').carousel({
                interval: false
            });
            $('#featureCarousel').carousel('pause');
        });
    </script>
    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-36251023-1']);
        _gaq.push(['_setDomainName', 'jqueryscript.net']);
        _gaq.push(['_trackPageview']);

        (function() {
            var ga = document.createElement('script');
            ga.type = 'text/javascript';
            ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(ga, s);
        })();
    </script>
    <script>
        try {
            fetch(new Request("https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js", {
                method: 'HEAD',
                mode: 'no-cors'
            })).then(function(response) {
                return true;
            }).catch(function(e) {
                var carbonScript = document.createElement("script");
                carbonScript.src = "//cdn.carbonads.com/carbon.js?serve=CK7DKKQU&placement=wwwjqueryscriptnet";
                carbonScript.id = "_carbonads_js";
                document.getElementById("carbon-block").appendChild(carbonScript);
            });
        } catch (error) {
            console.log(error);
        }
    </script>
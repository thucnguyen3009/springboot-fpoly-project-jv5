<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            #featureContainer2 .carousel-inner .carousel-item>div {
                display: none;
            }
            #featureContainer2 .carousel-inner .carousel-item>div:first-child {
                display: block;
            }
        }
        
        #featureContainer2 .carousel-inner .carousel-item.active,
        #featureContainer2 .carousel-inner .carousel-item-next,
        #featureContainer2 .carousel-inner .carousel-item-prev {
            display: flex;
        }
        /* medium and up screens */
        
        @media (min-width: 768px) {
            #featureContainer2 .carousel-inner .carousel-item-end.active,
            #featureContainer2 .carousel-inner .carousel-item-next {
                transform: translateX(25%);
            }
            #featureContainer2 .carousel-inner .carousel-item-start.active,
            #featureContainer2 .carousel-inner .carousel-item-prev {
                transform: translateX(-25%);
            }
            #featureContainer2 .card img {
                width: 90%;
                height: 40vh;
            }
            #featureContainer2 .carousel-item {
                justify-content: space-between;
            }
        }
        
        @media (max-width: 767px) {
            #featureContainer2 .card img {
                width: 100%;
                height: 75vh;
            }
        }
        
        #featureContainer2 .carousel-inner .carousel-item-end,
        #featureContainer2 .carousel-inner .carousel-item-start {
            transform: translateX(0);
        }
        
        #featureContainer .card {
            border: 0;
        }
        
        #featureContainer2 .card {
            position: relative;
        }
        
        #featureContainer2 .card .card-img-overlays {
            position: absolute;
            bottom: 15%;
            left: 10%;
            color: #fff;
            font-weight: bolder;
        }
        
        #featureContainer2 a {
            text-decoration: none;
        }
        
        #featureContainer2 .indicator {
            border: 1px solid rgb(202, 202, 202);
            padding: 3px 6px 3px 6px;
        }
        
        #featureContainer2 .indicator:hover {
            background-color: blue;
            border: 1px solid blue;
            transition: 200ms;
        }
        
        #featureContainer2 .indicator:hover {
            color: white;
            transition: 200ms;
        }
        
        #featureContainer2 .indicator {
            color: lightgray;
        }
        
        #featureContainer2 .float-end {
            padding-top: 10px;
        }
        .titles{
        	font-size: 35px !important;
        	animation-name: fadeInUp;
        	text-transform: uppercase !important;
        	font-weight: 700;
        	line-height: 1.2;
        	color: #fe8809 !important;
        }
    </style>
    <div class="" id="featureContainer2" style="margin:50px auto;">
        <div class="row mx-auto my-auto justify-content-center">
            <div id="featureCarouse2" class="carousel slide" data-bs-ride="carousel">
                <div class="display-5 text-uppercase mb-3">
				<span class="text-primary titles">GIẢM THÊM KHI THANH TOÁN ONLINE</span>
                </div>
                <div class="float-end pe-md-4">
                    <a class="indicator" href="#featureCarouse2" role="button" data-bs-slide="prev">
                        <span aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
                    </a> &nbsp;&nbsp;
                    <a class="w-aut indicator" href="#featureCarouse2" role="button" data-bs-slide="next">
                        <span aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
                    </a>
                </div>
                <div class="carousel-inner" role="listbox" style="padding-top:  20px">
                    <div class="carousel-item active">
                        <div class="col-md-3">
                            <!-- bbb_deals -->
				            <div class="bbb_deals_image">
			            		<img src="/images/carousel/qc/MocadongHo(2)-380x200.png" alt="">
		            		</div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="col-md-3">
                            <!-- bbb_deals -->
				            <div class="bbb_deals_image">
			            		<img src="/images/carousel/qc/MocadongHo(2)-380x200.png" alt="">
		            		</div>
                        </div>
                    </div>
                    <div class="carousel-item">
                       <div class="col-md-3">
                            <!-- bbb_deals -->
				            <div class="bbb_deals_image">
			            		<img src="/images/carousel/qc/MocadongHo(2)-380x200.png" alt="">
		            		</div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="col-md-3">
                            <!-- bbb_deals -->
				            <div class="bbb_deals_image">
			            		<img src="/images/carousel/qc/MocadongHo(2)-380x200.png" alt="">
		            		</div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="col-md-3">
                            <!-- bbb_deals -->
				            <div class="bbb_deals_image">
			            		<img src="/images/carousel/qc/MocadongHo(2)-380x200.png" alt="">
		            		</div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="col-md-3">
                            <!-- bbb_deals -->
			            	<div class="bbb_deals_image">
			            		<img src="/images/carousel/qc/MocadongHo(2)-380x200.png" alt="">
		            		</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        let items2 = document.querySelectorAll('#featureContainer2 .carousel .carousel-item');
        items2.forEach((el) => {
            const minPerSlide = 4
            let next = el.nextElementSibling
            for (var i = 1; i < minPerSlide; i++) {
                if (!next) {
                    // wrap carousel by using first child
                    next = items2[0]
                }
                let cloneChild = next.cloneNode(true)
                el.appendChild(cloneChild.children[0])
                next = next.nextElementSibling
            }
        })
        $(document).ready(function() {
            $('#featureCarousel2').carousel({
                interval: false
            });
            $('#featureCarousel2').carousel('pause');
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
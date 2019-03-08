<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="/haroobang/resources/img/fav.png">
<!-- Author Meta -->
<meta name="author" content="CodePixar">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>Loom List</title>

<!-- CSS ============================================= -->
<jsp:include page="/WEB-INF/views/include/css.jsp" />
</head>

<body id="category">

	<!-- Start Header Area -->
	<jsp:include page="/WEB-INF/views/include/navbar.jsp" />
	<!-- End Header Area -->

	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>Shop Category page</h1>
					<nav class="d-flex align-items-center">
						<a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
						<a href="#">Shop<span class="lnr lnr-arrow-right"></span></a> <a
							href="category.html">Fashon Category</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	
	<!-- End Banner Area -->
	<div class="container">
		<div class="row">
			<div class="col-xl-12 col-lg-11 col-md-10">
			<c:if test='${ not empty login and login.userType eq "admin" }'>
			<!-- Start Filter Bar -->
			<h3 class="text-heading">미승인 목록</h3>
				<div class="filter-bar d-flex flex-wrap align-items-center">
					<div class="sorting">
						<select>
							<option value="1">Default sorting</option>
							<option value="1">Default sorting</option>
							<option value="1">Default sorting</option>
						</select>
					</div>
					<div class="sorting mr-auto">
						<select>
							<option value="1">Show 12</option>
							<option value="1">Show 12</option>
							<option value="1">Show 12</option>
						</select>
					</div>
					<div class="pagination">
						<a href="#" class="prev-arrow"><i
							class="fa fa-long-arrow-left" aria-hidden="true"></i></a> <a href="#"
							class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a
							href="#" class="dot-dot"><i class="fa fa-ellipsis-h"
							aria-hidden="true"></i></a> <a href="#">6</a> <a href="#"
							class="next-arrow"><i class="fa fa-long-arrow-right"
							aria-hidden="true"></i></a>
					</div>
				</div>
				<!-- End Filter Bar -->
				<!-- Start Best Seller -->
				<section class="lattest-product-area pb-40 category-list" id="disapprovalRoom">
					<div class="row">
						<c:forEach var="disapproval" items="${disapproval}">
						<a href="/haroobang/room/roomDetail.action?roomNo=${disapproval.roomNo}">
						<div class="col-lg-3 col-md-5 disapprovalNo" data-roomno="${disapproval.roomNo}" >
							<div class="single-product">
								<%-- <c:choose>
									<c:when test="${not empty disapproval.roomAttachList}">
										<c:forEach var="attach" items="${disapproval.roomAttachList}">
											<img class="img-fluid" src="/haroobang/resources/upload/${attach.savedFileName}" alt=""
											onerror="this.src = '/haroobang/resources/upload/default.jpg'">
										</c:forEach>
									</c:when>
									<c:otherwise>
										<img class="img-fluid" src="/haroobang/resources/img/product/p1.jpg" alt="">
									</c:otherwise>
								</c:choose> --%>
								<img class="img-fluid" src="/haroobang/resources/img/product/p1.jpg" alt="">
								<div class="product-details">
									<h6>${disapproval.roomName}</h6>
									<div class="price">
										<h6>${disapproval.price}</h6>
										<h6 class="l-through">$210.00</h6>
									</div>
									<div class="prd-bottom">
										<a href="" class="social-info"> <span class="ti-bag"></span>
											<p class="hover-text">add to bag</p>
										</a> <a href="" class="social-info"> <span
											class="lnr lnr-heart"></span>
											<p class="hover-text">Wishlist</p>
										</a> <a href="" class="social-info"> <span
											class="lnr lnr-sync"></span>
											<p class="hover-text">compare</p>
										</a> <a href="" class="social-info"> <span
											class="lnr lnr-move"></span>
											<p class="hover-text">view more</p>
										</a>
										
										<div class="button-group-area mt-40">
											<a href="javascript:;" class="genric-btn success circle" id='roomapproval${disapproval.roomNo}'>승인</a>
											<a href="javascript:;" class="genric-btn danger circle" id='roomdelete${disapproval.roomNo}'>삭제</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						</a>
						</c:forEach>
					</div>
				</section>
				<!-- End Best Seller -->
				<!-- Start Filter Bar -->
				<div class="filter-bar d-flex flex-wrap align-items-center">
					<div class="sorting mr-auto">
						<select>
							<option value="1">Show 12</option>
							<option value="1">Show 12</option>
							<option value="1">Show 12</option>
						</select>
					</div>
					<div class="pagination">
						<a href="#" class="prev-arrow"><i
							class="fa fa-long-arrow-left" aria-hidden="true"></i></a> <a href="#"
							class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a
							href="#" class="dot-dot"><i class="fa fa-ellipsis-h"
							aria-hidden="true"></i></a> <a href="#">6</a> <a href="#"
							class="next-arrow"><i class="fa fa-long-arrow-right"
							aria-hidden="true"></i></a>
					</div>
				</div>
				<!-- End Filter Bar -->
				<!-- Start related-product Area -->
					<section class="related-product-area section_gap"></section>
					<!-- End related-product Area -->
				</c:if>
				<!-- Start Filter Bar -->
				<c:if test='${ not empty login and login.userType eq "admin" }'>
				<h3 class="text-heading">승인 목록</h3>
				</c:if>
				<div class="filter-bar d-flex flex-wrap align-items-center">
					<div class="sorting">
						<select>
							<option value="1">Default sorting</option>
							<option value="1">Default sorting</option>
							<option value="1">Default sorting</option>
						</select>
					</div>
					<div class="sorting mr-auto">
						<select>
							<option value="1">Show 12</option>
							<option value="1">Show 12</option>
							<option value="1">Show 12</option>
						</select>
					</div>
					<div class="pagination">
						<a href="#" class="prev-arrow"><i
							class="fa fa-long-arrow-left" aria-hidden="true"></i></a> <a href="#"
							class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a
							href="#" class="dot-dot"><i class="fa fa-ellipsis-h"
							aria-hidden="true"></i></a> <a href="#">6</a> <a href="#"
							class="next-arrow"><i class="fa fa-long-arrow-right"
							aria-hidden="true"></i></a>
					</div>
				</div>
				<!-- End Filter Bar -->
				<!-- Start Best Seller -->
				<section class="lattest-product-area pb-40 category-list">
					<div class="row">
						<c:forEach var="room" items="${rooms}">
						<a href="/haroobang/room/roomDetail.action?roomNo=${room.roomNo}">
						<div class="col-lg-3 col-md-5">
							<div class="single-product">
								<%-- <c:choose>
									<c:when test="${not empty room.roomAttachList}">
										<c:forEach var="attach" items="${room.roomAttachList}">
											<img class="img-fluid" src="/haroobang/resources/upload/${attach.savedFileName}" alt=""
											onerror="this.src = '/haroobang/resources/upload/default.jpg'">
										</c:forEach>
									</c:when>
									<c:otherwise>
										<img class="img-fluid" src="/haroobang/resources/img/product/p1.jpg" alt="">
									</c:otherwise>
								</c:choose> --%>
								<img class="img-fluid" src="/haroobang/resources/img/product/p1.jpg" alt="">
								<div class="product-details">
									<h6>${room.roomName}</h6>
									<div class="price">
										<h6>$${room.price}</h6>
										<h6 class="l-through">$210.00</h6>
									</div>
									<div class="prd-bottom">
										<a href="" class="social-info"> <span class="ti-bag"></span>
											<p class="hover-text">add to bag</p>
										</a> <a href="" class="social-info"> <span
											class="lnr lnr-heart"></span>
											<p class="hover-text">Wishlist</p>
										</a> <a href="" class="social-info"> <span
											class="lnr lnr-sync"></span>
											<p class="hover-text">compare</p>
										</a> <a href="" class="social-info"> <span
											class="lnr lnr-move"></span>
											<p class="hover-text">view more</p>
										</a>
										<c:if test='${ not empty login and login.userType eq "admin" }'>
										<div class="button-group-area mt-40">
											<a href="#" class="genric-btn danger circle">삭제</a>
										</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
						</a>
						</c:forEach>
					</div>
				</section>
				<!-- End Best Seller -->
				<!-- Start Filter Bar -->
				<div class="filter-bar d-flex flex-wrap align-items-center">
					<div class="sorting mr-auto">
						<select>
							<option value="1">Show 12</option>
							<option value="1">Show 12</option>
							<option value="1">Show 12</option>
						</select>
					</div>
					<div class="pagination">
						<a href="#" class="prev-arrow"><i
							class="fa fa-long-arrow-left" aria-hidden="true"></i></a> <a href="#"
							class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a
							href="#" class="dot-dot"><i class="fa fa-ellipsis-h"
							aria-hidden="true"></i></a> <a href="#">6</a> <a href="#"
							class="next-arrow"><i class="fa fa-long-arrow-right"
							aria-hidden="true"></i></a>
					</div>
				</div>
				<!-- End Filter Bar -->
			</div>
		</div>
	  </div>
	<!-- Start related-product Area -->
	<section class="related-product-area section_gap">		
	</section>
	<!-- End related-product Area -->

	<!-- start footer Area -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	<!-- End footer Area -->

	<!-- Modal Quick Product View -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="container relative">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<div class="product-quick-view">
					<div class="row align-items-center">
						<div class="col-lg-6">
							<div class="quick-view-carousel">
								<div class="item"
									style="background: url(/haroobang/resources/img/organic-food/q1.jpg);">

								</div>
								<div class="item"
									style="background: url(/haroobang/resources/img/organic-food/q1.jpg);">

								</div>
								<div class="item"
									style="background: url(/haroobang/resources/img/organic-food/q1.jpg);">

								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="quick-view-content">
								<div class="top">
									<h3 class="head">Mill Oil 1000W Heater, White</h3>
									<div class="price d-flex align-items-center">
										<span class="lnr lnr-tag"></span> <span class="ml-10">$149.99</span>
									</div>
									<div class="category">
										Category: <span>Household</span>
									</div>
									<div class="available">
										Availibility: <span>In Stock</span>
									</div>
								</div>
								<div class="middle">
									<p class="content">Mill Oil is an innovative oil filled
										radiator with the most modern technology. If you are looking
										for something that can make your interior look awesome, and at
										the same time give you the pleasant warm feeling during the
										winter.</p>
									<a href="#" class="view-full">View full Details <span
										class="lnr lnr-arrow-right"></span></a>
								</div>
								<div class="bottom">
									<div class="color-picker d-flex align-items-center">
										Color: <span class="single-pick"></span> <span
											class="single-pick"></span> <span class="single-pick"></span>
										<span class="single-pick"></span> <span class="single-pick"></span>
									</div>
									<div class="quantity-container d-flex align-items-center mt-15">
										Quantity: <input type="text" class="quantity-amount ml-15"
											value="1" />
										<div class="arrow-btn d-inline-flex flex-column">
											<button class="increase arrow" type="button"
												title="Increase Quantity">
												<span class="lnr lnr-chevron-up"></span>
											</button>
											<button class="decrease arrow" type="button"
												title="Decrease Quantity">
												<span class="lnr lnr-chevron-down"></span>
											</button>
										</div>

									</div>
									<div class="d-flex mt-20">
										<a href="#" class="view-btn color-2"><span>Add to
												Cart</span></a> <a href="#" class="like-btn"><span
											class="lnr lnr-layers"></span></a> <a href="#" class="like-btn"><span
											class="lnr lnr-heart"></span></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<jsp:include page="/WEB-INF/views/include/js.jsp" />
	<script type="text/javascript">
		$(function(){
			$("a[id ^=roomapproval]").on('click',function(event){
				
				var formData = $(this).parents('.disapprovalNo').attr('data-roomno');
				
				$.ajax({
					"url": "roomApproval.action",
					"method": "POST",
					"data": { 'formdate' : formData },
					"success": function(formData, status, xhr) {
						alert('숙소가 승인 되었습니다.');
					},
					"error": function(xhr, status, err) {
						alert('숙소 승인');
						location.reload(true);
					}
				});
			});
			
			 //$("#roomdelete"+roomNo).on('click',function(event){
			$("a[id ^=roomdelete]").on('click',function(event){
				var roomNo = $(this).parents('.disapprovalNo').attr('data-roomno');
				alert(roomNo+'준비중~');
			});
		});
	</script>

</body>

</html>
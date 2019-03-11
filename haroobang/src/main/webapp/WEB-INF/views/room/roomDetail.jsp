<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="/haroobang/resources/img/fav.png">
<meta name="author" content="CodePixar">
<meta name="description" content="">
<meta name="keywords" content="">
<meta charset="UTF-8">
<title>roomDetail</title>
<jsp:include page="/WEB-INF/views/include/css.jsp" />

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(function(){
	
	$('#calendarBox').load("/haroobang/room/calender.action?roomNo="+${room.roomNo})
	
	$('#idCheck').click(function(e){
		alert("로그인페이지로 이동합니다.")
	})
	
	$("#like").click(function(e){
		
			$.ajax({
				url :"addLike.action" ,
				data: {"roomNo":${room.roomNo}},
				method:"GET",
				success:function(data,status,xhr){
					if(data == "success"){
						alert("즐겨찾기에 등록되었습니다")	
					}else if(data =="fail"){
						alert("이미 등록되었습니다.")
					}else{
						alert("로그인 페이지로 이동합니다.")
						location.href = "/haroobang/account/login.action"
					}
				}
			})
	})
	
	$("#roomReservation").click(function(e){
		var checkinDate = $("#checkinDate").val();
		var nights = $("#sst").val();
		if(checkinDate.length == 0 || nights.length == 0){
			alert("날짜를 선택해 주세요")
		}else {
			if(${login == null}){
				alert("로그인페이지로 이동합니다.")
				location.href = "/haroobang/account/login.action"
			}else{
			$.ajax({
				url:"/haroobang/room/checkDate.action",
				data:{"checkinDate":checkinDate,"nights":nights,"roomNo":${room.roomNo}},
				method:"get",
				success:function(data,status,xhr){
					if(data == "fail"){
						alert("선택하신 날짜에는 예약 할 수 없습니다. 날짜를 다시 선택 해 주세요");
					}else {
						location.href = "/haroobang/room/reservationCheckout.action?checkinDate=" + checkinDate+"&nights="+nights+"&roomNo="+${room.roomNo}
					}
				}
			})
		}
		}
	});
	
	$("#roomDelete").click(function(e){
		
		var c = confirm("삭제하시겠습니까?");
		
		if(c == true){
			location.href = "/haroobang/room/roomDelete.action?roomNo="+${room.roomNo}
		}else{	}
		
	});
	
});
			

</script>



</head>

<body>

	<jsp:include page="/WEB-INF/views/include/navbar.jsp" />
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>숙소 상세 설명</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="s_Product_carousel"  style="height:450px;width:500px" >
					<c:forEach var="roomattach" items="${room.roomAttachList }">
						<div class="single-prd-item">
							<img class="img-fluid"
							src="/haroobang/resources/upload/${roomattach.savedFileName}" alt="">
						</div>
					</c:forEach>
						
						
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h2>${room.roomName}</h2>
						<h4>&#8361; ${room.price}&nbsp;</h4>
						<hr>
						<div id="calendarBox" style="height:250px;width:350px;">
						<div id='calendar'></div>
						</div>
						<br>
						<!-- <div class="product_count">
						<label for="qty">Checkin</label> 
						<input type="date" style="width:300px" id="checkinDate"/>
						</div> -->
						<br>
						<div class="product_count">
						<label for="qty">Checkin</label> 
						<input type="date" style="width:150px" id="checkinDate"/>
							<label for="qty">Days&nbsp;&nbsp;</label> 
							<input type="text" name="qty"
								id="sst" maxlength="12" value="1" title="Quantity:"
								class="input-text qty">
								
							<button
								onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
								class="increase items-count" type="button">
								<i class="lnr lnr-chevron-up"></i>
							</button>
							<button
								onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
								class="reduced items-count" type="button">
								<i class="lnr lnr-chevron-down"></i>
							</button>
						</div>
						<!-- <a href="/haroobang/room/calender.action">날짜확인</a> -->
						<div class="card_area d-flex align-items-center">
						<c:choose>
							<c:when test="${login.userType == 'admin'}">
							<a class="primary-btn" href="javascript:" id="roomDelete" style="padding: 0px 150px;">숙소 삭제</a>
							</c:when>
							<c:otherwise>
							<a class="primary-btn" href="javascript:" id="roomReservation">숙소 예약하기</a>
							<a class="icon_btn" href="javascript:" id="like"><i class="lnr lnr lnr-heart"></i></a>
							</c:otherwise>
						</c:choose>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item"><a class="nav-link" id="home-tab"
					data-toggle="tab" href="#home" role="tab" aria-controls="home"
					aria-selected="true">숙소 설명</a></li>
				<li class="nav-item"><a class="nav-link" id="profile-tab"
					data-toggle="tab" href="#profile" role="tab"
					aria-controls="profile" aria-selected="false">판매자 정보</a></li>
				<li class="nav-item"><a class="nav-link active" id="review-tab"
					data-toggle="tab" href="#review" role="tab" aria-controls="review"
					aria-selected="false">숙소 후기</a></li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade" id="home" role="tabpanel"
					aria-labelledby="home-tab">
					<p style="white-space: pre">${room.roomProfile}</p>
				</div>
				<div class="tab-pane fade" id="profile" role="tabpanel"
					aria-labelledby="profile-tab">
					<div class="table-responsive">
						<div class="review_item">
							<div class="media">
								<div class="d-flex">
								<c:choose>
								<c:when test="${login ==null }">
								<a href="/haroobang/account/login.action" id="idCheck">
								</c:when>
								<c:otherwise>
								<a href="/haroobang/message/messageRoomBoxes.action?memberNo=${member.memberNo}&loginMemberNo=${login.memberNo}">
								</c:otherwise>
								</c:choose>
								<img src="/haroobang/resources/upload/default.jpg" class="rounded-circle" style="height: 60px;width:60px" alt=""></a>
								</div>

								<div class="media-body">
									<h4>${member.nickname}님에게 메세지 보내기</h4>
									<p>${member.profile}</p>
								</div>
							</div>

						</div>
					</div>
				</div>

				<div class="tab-pane fade show active" id="review" role="tabpanel"
					aria-labelledby="review-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="row total_rate">
								<div class="col-6">
									<div class="box_total">
										<h5>Overall</h5>
										<h4>${room.averageRates }점</h4>
										<h6>(${room.roomCommentList.size() } Reviews)</h6>
									</div>
								</div>
								<div class="col-6">
									<div class="rating_list">
										<h3>Based on ${room.roomCommentList.size() } Reviews</h3>
										<ul class="list">
										<c:forEach var="i" begin="1" end="5" >
										<li>	
											${i}점
											<c:forEach var="y" begin="1" end="${i}">
											<a href="#"><i class="fa fa-star"></i></a>
										
											</c:forEach>
												<c:forEach var="z" begin="1" end="${5-i}">
											<i class="fa fa-star"></i>	
											</c:forEach>
										&nbsp;&nbsp;${i}
										</li>
										</c:forEach>
										</ul>
									</div>
								</div>
							</div>
							<div class="review_list">
								<div class="review_item" style="width: 1050px">
								<c:forEach var="comment" items="${room.roomCommentList }">
								<div class="media">
										<div class="d-flex">
										<c:choose>
										<c:when test="${empty comment.member.savedFileName }">
											<a href="#"><img style="width:50px;height:50px;border-radius:50px" src="/haroobang/resources/upload/default.jpg"
												alt=""></a>
										</c:when>
										<c:otherwise>
										<a href="#"><img style="width:50px;height:50px;border-radius:50px" src="/haroobang/resources/upload/${comment.member.savedFileName }"
												alt=""></a>
										</c:otherwise>
										</c:choose>
											
										</div>
										<div class="media-body">
											<h4>${comment.nickName }</h4>
											
											<c:forEach var="y" begin="1" end="${comment.rates}">
											<a href="#"><i class="fa fa-star"></i></a>
											</c:forEach>
											<%-- <c:forEach var="z" begin="1" end="${5 - comment.rates}">
											<i class="fa fa-star"></i>	
											</c:forEach> --%>
										</div>
										
									</div>
								
									<div style="display: inline;width: 500px">
									<p>${comment.content }</p>
										<a class="reply_btn" href="#" style="color:gray;font-size: 10px;">신고하기</a>
										<hr>
									</div>
									
									<br>
								</c:forEach>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Product Description Area =================-->
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/js.jsp" />

</body>

</html>
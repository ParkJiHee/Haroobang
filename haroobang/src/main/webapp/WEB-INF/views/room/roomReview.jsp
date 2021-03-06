
<div class="col-lg-6">
	<div class="review_box">
		<h4>Add a Review</h4>
		<p>Your Rating:</p>
		<ul class="list">
			<li><a href="#"><i class="fa fa-star"></i></a></li>
			<li><a href="#"><i class="fa fa-star"></i></a></li>
			<li><a href="#"><i class="fa fa-star"></i></a></li>
			<li><a href="#"><i class="fa fa-star"></i></a></li>
			<li><a href="#"><i class="fa fa-star"></i></a></li>
		</ul>
		<p>Outstanding</p>
		<form class="row contact_form" action="contact_process.php"
			method="post" id="contactForm" novalidate="novalidate">
			<div class="col-md-12">
				<div class="form-group">
					<input type="text" class="form-control" id="name" name="name"
						placeholder="Your Full name" onfocus="this.placeholder = ''"
						onblur="this.placeholder = 'Your Full name'">
				</div>
			</div>
			<div class="col-md-12">
				<div class="form-group">
					<input type="email" class="form-control" id="email" name="email"
						placeholder="Email Address" onfocus="this.placeholder = ''"
						onblur="this.placeholder = 'Email Address'">
				</div>
			</div>
			<div class="col-md-12">
				<div class="form-group">
					<input type="text" class="form-control" id="number" name="number"
						placeholder="Phone Number" onfocus="this.placeholder = ''"
						onblur="this.placeholder = 'Phone Number'">
				</div>
			</div>
			<div class="col-md-12">
				<div class="form-group">
					<textarea class="form-control" name="message" id="message" rows="1"
						placeholder="Review" onfocus="this.placeholder = ''"
						onblur="this.placeholder = 'Review'"></textarea>
					</textarea>
				</div>
			</div>
			<div class="col-md-12 text-right">
				<button type="submit" value="submit" class="primary-btn">Submit
					Now</button>
			</div>
		</form>
	</div>
</div>
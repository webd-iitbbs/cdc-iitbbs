<!DOCTYPE html>
<html lang="zxx">

<head>
	<title>Career Development Cell : IIT Bhubaneswar : Home</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="csrf-token" content="{{ csrf_token() }}">

	<meta charset="UTF-8" />
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<!-- //Meta tag Keywords -->
	<link rel="shortcut icon" href="{{ URL::to('/') }}/images/favicon.ico">
	<!-- Custom-Files -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Bootstrap-Core-CSS -->
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<!-- Style-CSS -->
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //Custom-Files -->
	<link rel="stylesheet" type="text/css" href="slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>

	<!-- Web-Fonts -->
	<link href="//fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=devanagari,latin-ext" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:300,600|Raleway:600,300|Josefin+Slab:400,700,600italic,600,400italic' rel='stylesheet' type='text/css'>
	<!-- //Web-Fonts -->
	<!--bootstrap cdn-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<!--bootstrap cdn-->
<style type="text/css">
	.text-field-box {
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 40px;
    height: 60px;
    line-height: 60px;
    text-align: left;
    color: #666;
    font-size: 14px;
    padding: 0 35px;
    margin-bottom: 30px;
    width: 100%;
    outline: none;
    appearance: none;
    -webkit-appearance: none;
}
</style>
</head>

<body>
	<!-- main banner -->
	<div class="main-top" id="home">
		<!-- header -->
		<header>
			<div class="container-fluid">
				<div class="header d-lg-flex justify-content-between align-items-center py-3 px-sm-3">
					<!-- logo -->
					<div id="logo">
						<h1><a href="/"><img class="img-fluid" src="images/header.png"></a></h1>
					</div>
					<!-- logo -->
					<!-- nav -->
					<div class="nav_w3ls">
						<nav>
							<label for="drop" class="toggle">Menu</label>
							<input type="checkbox" id="drop" />
							<ul class="menu">
								<li><a href="/" >Home</a></li>
								<li><a href="pandp.php">Procedure & Policy</a></li>
								<li><a href="facilities.php">Facilities</a></li>
								<li><a href="hop.php">Highlights of Placement</a></li>
								<li><a href="fcoordinators.php">Faculty Coordinators</a></li>
								<li><a href="scoordinators.php">Student Coordinators</a></li>								
								<li><a href="http://www.iitbbs.ac.in/">About Campus</a></li>
								<li><a href="http://www.iitbbs.ac.in/cdc/doc/IIT%20BBSR%20Placement%20Brochure%202019-20%20updated-final.pdf" class="drop-text" target="_blank">Placement Brochure</a></li>
								<li><a href="gallery.php">Gallery</a></li>
								<li><a href="/redirect">Log in</a></li>
								<li><a href="/contact.php" class="active">Contact</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</header>
		<!-- //header -->


	<!--contactus-->
   <div id="contact" class="section-padding">
    <div class="container">
      <div class="row">
        <div class="page-title text-center">
          <h2>Quick Contact</h2>
          <hr class="pg-titl-bdr-btm"></hr>
        </div>
        <div id="sendmessage">Your message has been sent. Thank you!</div>
        <div id="errormessage"></div>

        <div class="form-sec">
          <form action="" method="post" role="form" class="contactForm">
		  @csrf
            <div class="form-row">
	            <div class="col-md-4 form-group">
	              <input type="text" name="name" class="form-control contact-form text-field-box" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
	              <div class="validation"></div>
	            </div>
	            <div class="col-md-4 form-group">
	              <input type="email" class="form-control contact-form text-field-box" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
	              <div class="validation"></div>
	            </div>
	            <div class="col-md-4 form-group">
	              <input type="text" class="form-control contact-form text-field-box" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
	              <div class="validation"></div>
	            </div>
            </div>
            <div class="col-md-12 form-group">
              <textarea class="form-control contact-form text-field-box" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
              <div class="validation"></div>

              <button class="button-medium" id="contact-submit" type="submit" name="contact">Submit Now</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
	<!--contactus-->

	<!-- slideshow -->
	<div class="page-title text-center">
      <h2>Top Recruiters</h2>
      <hr class="pg-titl-bdr-btm"></hr>
    </div>

	<div class="container slider align-items-center">
	  <div class="align-self-center mb-5" style="padding-right:10px;">
	  	<img class="img-fluid align-self-center" style="max-width:100%; width:auto; height:120px; padding:0; margin:auto; width: 200px;" src="images/adobe.png" width="200px">
	  </div>
	  <div class="align-self-center mb-5" style="margin-top:40px; padding-right:10px;">
	  	<img class="img-fluid align-self-center" style="max-width:100%; width:auto; height:auto; margin-top:20px; padding:0; margin:auto; width: 200px;" src="images/amazon.png" width="200px">
	  </div>
	  <div class="align-self-center mb-5" style="margin-top:40px; padding-right:10px;">
	  	<img class="img-fluid align-self-center" style="max-width:100%; width:auto; height:auto; margin-top:20px; padding:0; margin:auto; width: 200px;" src="images/cap.png" width="200px">
	  </div>
	  <div class="align-self-center mb-5" style="margin-top:40px; padding-right:10px;">
	  	<img class="img-fluid align-self-center" style="max-width:100%; width:auto; height:auto; margin-top:20px; padding:0; margin:auto; width: 200px;" src="images/delloit.png" width="200px">
	  </div>
	  <div class="align-self-center mb-5" style="margin-top:40px; padding-right:10px;">
	  	<img class="img-fluid align-self-center" style="max-width:100%; width:auto; height:auto; margin-top:20px; padding:0; margin:auto; width: 200px;" src="images/directi.png" width="200px">
	  </div>
	  <div class="align-self-center mb-5" style="padding-right:10px;">
	  	<img class="img-fluid align-self-center" style="max-width:100%; width:auto; height:130px; padding:0; margin:auto; width: 200px;" src="images/hpcl.png" width="200px">
	  </div>
	  <div class="align-self-center mb-5" style="margin-top: 10px; padding-right:10px;">
	  	<img class="img-fluid align-self-center" style="max-width:100%; width:auto; height:130px; padding:0; margin:auto; width: 200px;" src="images/iocl.png" width="200px">
	  </div>
	  <div class="align-self-center mb-5" style="margin-top:30px; padding-right:10px;">
	  	<img class="img-fluid align-self-center" style="max-width:100%; width:auto; height:auto; margin-top:40px; padding:0; margin:auto; width: 200px;" src="images/isro.png" width="200px">
	  </div>
	  <div class="align-self-center mb-5" style="padding-right:10px;">
	  	<img class="img-fluid align-self-center" style="max-width:100%; width:auto; height:130px; padding:0; margin:auto; width: 200px;" src="images/jio.png" width="200px">
	  </div>
	  <div class="align-self-center mb-5" style="margin-top:50px; padding-right:10px;">
	  	<img class="img-fluid align-self-center" style="max-width:100%; width:auto; height:auto; margin-top:40px; padding:0; margin:auto; width: 200px;" src="images/kpit.png" width="200px">
	  </div>
	  <div class="align-self-center mb-5" style="margin-top:50px; padding-right:10px;">
	  	<img class="img-fluid align-self-center" style="max-width:100%; width:auto; height:auto; margin-top:40px; padding:0; margin:auto; width: 200px;" src="images/larsen.png" width="200px">
	  </div>
	  <div class="align-self-center mb-5" style="margin-top:50px; padding-right:10px;">
	  	<img class="img-fluid align-self-center" style="max-width:100%; width:auto; height:auto; margin-top:40px; padding:0; margin:auto; width: 200px;" src="images/maruti.png" width="200px">
	  </div>
	  <div class="align-self-center mb-5" style="margin-top:50px; padding-right:10px;">
	  	<img class="img-fluid align-self-center" style="max-width:100%; width:auto; height:auto; margin-top:40px; padding:0; margin:auto; width: 200px;" src="images/microsoft.png" width="200px">
	  </div>
	  <div class="align-self-center mb-5" style="padding-right:10px;">
	  	<img class="img-fluid align-self-center" style="max-width:100%; width:auto; height:120px; padding:0; margin:auto; width: 200px;" src="images/ncb.png" width="200px">
	  </div>
	  <div class="align-self-center mb-5" style="margin-top:40px; padding-right:10px;">
	  	<img class="img-fluid align-self-center" style="max-width:100%; width:auto; height:auto; margin-top:40px; padding:0; margin:auto; width: 200px;" src="images/renault.png" width="200px">
	  </div>
	  <div class="align-self-center mb-5" style="margin-top:40px; padding-right:10px;">
	  	<img class="img-fluid align-self-center" style="max-width:100%; width:auto; height:auto; margin-top:40px; padding:0; margin:auto; width: 200px;" src="images/samsung.png" width="200px">
	  </div>
	  <div class="align-self-center mb-5" style="margin-top:40px; padding-right:10px;">
	  	<img class="img-fluid align-self-center" style="max-width:100%; width:auto; height:auto; margin-top:40px; padding:0; margin:auto; width: 200px;" src="images/tatamo.png" width="200px">
	  </div>
	  <div class="align-self-center mb-5" style="margin-top:50px; padding-right:10px;">
	  	<img class="img-fluid align-self-center" style="max-width:100%; width:auto; height:auto; margin-top:60px; padding:0; margin:auto; width: 200px;" src="images/tcs.png" width="200px">
	  </div>
	  <div class="align-self-center mb-5" style="margin-top:50px; padding-right:10px;">
	  	<img class="img-fluid align-self-center" style="max-width:100%; width:auto; height:auto; margin-top:60px; padding:0; margin:auto; width: 200px;" src="images/tesco.png" width="200px">
	  </div>
	  <div class="align-self-center mb-5" style="margin-top:40px; padding-right:10px;">
	  	<img class="img-fluid align-self-center" style="max-width:100%; width:auto; height:auto; margin-top:40px; padding:0; margin:auto; width: 200px;" src="images/uhg.png" width="200px">
	  </div>
	  <div class="align-self-center mb-5" style="margin-top:45px; padding-right:10px;">
	  	<img class="img-fluid align-self-center" style="max-width:100%; width:auto; height:auto; margin-top:40px; padding:0; margin:auto; width: 200px;" src="images/vedanta.png" width="200px">
	  </div>
	  <div class="align-self-center mb-5" style="margin-top: 50px; padding-right:10px;">
	  	<img class="img-fluid align-self-center" style="max-width:100%; width:auto; height:auto; padding:0; margin:auto; width: 200px;" src="images/wipro.jpg" width="200px">
	  </div>
	</div>
	<!-- slideshow -->

	<!-- Map -->
	<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d4929.4681337376105!2d85.6750479!3d20.1429561!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a19ac2e5ccc1ba3%3A0x1a21460f6ccade59!2sCareer+Development+cell!5e1!3m2!1sen!2s!4v1503483844096" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen=""></iframe>
	<!-- Map -->

	<div class="copy-bottom bg-li py-4 border-top">
		<div class="container-fluid">
			<div class="d-md-flex px-md-3 position-relative text-center">
				<!-- copyright -->
				<div class="copy_right mx-md-auto mb-md-0 mb-3">
					<p class="text-bl let">© 2020 Indian Institute of Technology Bhubaneswar.</p>
				</div>
				<!-- //copyright -->
				<!-- move top icon -->
				<a href="#home" class="move-top text-center">
					<span class="fa fa-level-up" aria-hidden="true"></span>
				</a>
				<!-- //move top icon -->
			</div>
		</div>
	</div>
	<!-- //copyright bottom -->
	<script type="text/javascript" src="slick/slick.min.js"></script>
	<script type="text/javascript" src="contactform.js"></script>
	<script type="text/javascript">
		function pic() {
			document.getElementById('pic').innerHTML = "<p align='justify' class='mt-4'>Many of our students regularly visit foreign universities/industries to broaden their knowledge and experience. To highlight about student-industry interaction, at the end of 3rd year students from undergraduate engineering streams go for a summer internship as a part of the course curriculum. This summer internship programme helps the industries to harness our talents. Our postgraduate students and research scholars often visit their collaborators (India and abroad) for their research work.</p><p align='justify' class='mt-4'>It is my pleasure to introduce Career Development Cell which looks after the placement activities of the students at IIT Bhubaneswar. We are equipped with the required infrastructure to conduct placement sessions, video conferencing, etc. to organize campus placement activities. We provide all the possible support and guidance to the students for this purpose.</p><p align='justify' class='mt-4'>I invite esteemed organizations to visit our campus for the recruitment. Your visit shall provide a platform to utilize the technical knowledge and motivated young talent of our students establishing a synergetic interface. Besides I also invite the companies to take our third year undergraduate students for summer training/internship.</p><p align='justify' class='mt-4'>For any clarifications/discussions please do feel free to contact me at <b>hod.cdc@iitbbs.ac.in.</b></p>";
		}
	</script>
	<script type="text/javascript">
	$(document).ready(function(){
      $('.slider').slick({
      	  dots:false,
      	  arrows:false,
		  slidesToShow: 3,
		  slidesToScroll: 1,
		  autoplay: true,
		  autoplaySpeed: 2000,
		});
    });
	</script>
</body>

</html>
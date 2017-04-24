<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<link rel="stylesheet" type="text/css" href="cssfiles/im.css">
<link rel="stylesheet" type="text/css" href="cssfiles/login.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="js/jquery-min.js"></script>

<%
	String userName = (String) session.getAttribute("givenName");
	String loggedInUser = (String) session.getAttribute("email");
	if (request.getSession().getAttribute("email") != null) {
		response.sendRedirect("/index");
	}
%>
<style>
.popup {
    top: 0;
    position: fixed;
    width: 100%;
    z-index: 1005;
    height: 100%;
    background: url(images/black-overlay.png) left top;
    display: none;
}

#email:focus, #name:focus, #password:focus {
	border: 1px solid #d5dce0;
	background: #fff;
	outline-offset: -2px;
	outline: -webkit-focus-ring-color auto;
}
/* The Modal (background) */
.modal {
	display: none;
	/* Hidden by default */
	position: fixed;
	/* Stay in place */
	z-index: 1;
	/* Sit on top */
	padding-top: 100px;
	/* Location of the box */
	left: 0;
	top: 0;
	width: 100%;
	/* Full width */
	height: 100%;
	/* Full height */
	overflow: auto;
	/* Enable scroll if needed */
	background-color: rgb(0, 0, 0);
	/* Fallback color */
	background-color: rgba(0, 0, 0, 0.4);
	/* Black w/ opacity */
}

.alreadybutton{
-webkit-appearance: none;
    position: relative;
    display: inline-block;
    border-radius: .25em;
    cursor: pointer;
    border: 0;
    color: #fff;
    text-align: center;
    text-decoration: none;
    -moz-transition: all .25s ease-in-out;
    -webkit-transition: all .25s ease-in-out;
    -o-transition: all .25s ease-in-out;
    -ms-transition: all .25s ease-in-out;
    transition: all .25s ease-in-out;
    margin-top: 10px;
    padding: 1em;
    width: 100%;
    font-weight: 500;
    line-height: 1.5em;
    margin-bottom: 0;
    font-size: 19px;
	background : #9C27B0;
}

.alreadybutton:hover {
	background: #bb4cce;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

a {
	text-decoration: none;
}


@media only screen and (min-width: 40.063em) {
	.button, button {
		display: inline-block;
	}
}

.gbutton {
	display: inline-block;
	margin-bottom: 0;
	text-align: center;
	white-space: nowrap;
	background: #e85f61;
	color: white;
	width: 50%;
	padding: 10px 16px;
	font-size: 18px;
	line-height: 1.3333333;
	border-radius: 6px;
	touch-action: manipulation;
	cursor: pointer;
	user-select: none;
	background-image: none;
	border: 1px solid transparent;
}

.googlebutton:hover {
	background: #ed6e6e;
}




.cta {
	font-size: 1.3em;
	margin-top: 20px;
	background: #e55151;
	border-radius: 4px;
	padding: 1em 2em;
	line-height: 1.75em;
	cursor: pointer;
}

.cta:hover {
	background: #d84040;
}



@media ( min-width : 768px) {
	.popup-wrapper {
		position: fixed;
		height: 200px;
		width: 85%;
		margin: -100px 0 0 -375px;
		top: 25%;
		left: 50%;
	}
}

body, h1, h2, h3, h4, h5, h6 {
	font-family: "Lato", sans-serif;
	color: black;
}

p {
	color: black;
}

body, html {
	height: 100%;
	color: white;
	line-height: 1.8;
}
/* Create a Parallax Effect */
.bgimg-1, .bgimg-2, .bgimg-3 {
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
/* First image (Logo. Full height) */
.bgimg-1 {
	background-image: url('images/bg8.jpg');
	min-height: 100%;
}
/* Second image (mycollections) */
.bgimg-2 {
	background-image: url("images/bg3.jpg");
	min-height: 400px;
}
/* Third image (Contact) */
.bgimg-3 {
	background-image: url("images/bg7.jpg");
	min-height: 400px;
}
/* Fourth image (todo) */
.bgimg-4 {
	background-image: url("images/Todoapp.png");
	min-height: 400px;
	background-repeat: round;
}

.im-wide {
	letter-spacing: 10px;
}

@media only screen and (max-device-width: 500px) {
	.imgsmall {
		height: 100% !important;
	}
	.im-btn-load {
		right: 0px !important;
	}
	.im-collections {
		position: relative;
		left: 100px;
	}
	.im-input-email {
		position: relative;
		top: 4px;
	}
}
/* Turn off parallax scrolling for tablets and phones */
@media only screen and (max-device-width: 1024px) {
	.bgimg-1, .bgimg-2, .bgimg-3 {
		background-attachment: scroll;
	}
}

#email:focus, #name:focus, #password:focus {
	border: 1px solid #d5dce0;
	background: #fff;
	outline-offset: -2px;
	outline: -webkit-focus-ring-color auto;
}
/* The 
@media ( min-width : 768px) {
	.popup-wrapper {
		position: fixed;
		height: 200px;
		width: 85%;
		margin: -100px 0 0 -375px;
		top: 25%;
		left: 50%;
	}
}

body, h1, h2, h3, h4, h5, h6 {
	font-family: "Lato", sans-serif;
	color: black;
}

p {
	color: black;
}

body, html {
	height: 100%;
	color: white;
	line-height: 1.8;
}
/* Create a Parallax Effect */
.bgimg-1, .bgimg-2, .bgimg-3 {
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
/* First image (Logo. Full height) */
.bgimg-1 {
	background-image: url('images/bg8.jpg');
	min-height: 100%;
}
/* Second image (mycollections) */
.bgimg-2 {
	background-image: url("images/bg3.jpg");
	min-height: 400px;
}
/* Third image (Contact) */
.bgimg-3 {
	background-image: url("images/bg7.jpg");
	min-height: 400px;
}
/* Fourth image (todo) */
.bgimg-4 {
	background-image: url("images/Todoapp.png");
	min-height: 400px;
	background-repeat: round;
}

.im-wide {
	letter-spacing: 10px;
}

@media only screen and (max-device-width: 500px) {
	.imgsmall {
		height: 100% !important;
	}
	.im-btn-load {
		right: 0px !important;
	}
	.im-collections {
		position: relative;
		left: 100px;
	}
	.im-input-email {
		position: relative;
		top: 4px;
	}
}
/* Turn off parallax scrolling for tablets and phones */
@media only screen and (max-device-width: 1024px) {
	.bgimg-1, .bgimg-2, .bgimg-3 {
		background-attachment: scroll;
	}
}

.img1 {
	width: 100%;
	height: 137px;
}

.img2 {
	width: 100%;
}

.img3 {
	width: 100%;
}

.img4 {
	width: 100%;
}

.img5 {
	width: 100%;
}

.img6 {
	width: 100%;
	height: 146px;
}

.img7 {
	width: 100%;
	height: 146px;
}

.img8 {
	width: 100%;
	height: 146px;
}
</style>








<body>
	<!-- Navbar (sit on top) -->
	<div class="im-top">
		<ul class="im-navbar" id="myNavbar">
			<li class="im-hide-medium im-hide-large im-opennav im-right"><a
				class="im-hover-black" href="javascript:void(0);"
				onclick="toggleFunction()" title="Toggle Navigation Menu"> <i
					class="fa fa-bars"></i>
			</a></li>
			<li class="im-left-align"><a href="#home">HOME</a></li>
			<li class="im-hide-small"><a href="#about"><i
					class="fa fa-user"></i> ABOUT</a></li>
			<li class="im-hide-small"><a href="#mycollections"><i
					class="fa fa-th"></i> MY COLLECTIONS</a></li>
			<li class="im-hide-small"><a href="#todoapp"><i
					class="fa fa-list"></i> TODO APP</a></li>
			<li class="im-hide-small"><a href="#contact"><i
					class="fa fa-envelope"></i> CONTACT</a></li>
		</ul>
		<!-- Navbar on small screens -->
		<div id="navDemo" class="im-hide im-hide-large im-hide-medium">
			<ul class="im-navbar im-left-align im-white">
				<li><a href="#about" onclick="toggleFunction()">ABOUT</a></li>
				<li><a href="mycollections" onclick="toggleFunction()">MY
						COLLECTIONS</a></li>
				<li><a href="#contact" onclick="toggleFunction()">CONTACT</a></li>
				<li><a href="#">SEARCH</a></li>
			</ul>
		</div>
	</div>
	<!-- First Parallax Image with Logo Text -->
	<div class="bgimg-1 im-display-container im-opacity-min" id="home">
		<div class="im-display-middle" style="white-space: nowrap;">
			<span
				class="im-center im-padding-xlarge im-black im-xlarge im-wide im-animate-opacity"
				style="color: dodgerblue !important; font-family: cursive;">Todo
				List</span>
		</div>
	</div>
	<!-- Container (About Section) -->
	<div class="im-content im-container im-padding-64" id="about">
		<h3 class="im-center">ABOUT ME</h3>
		<p class="im-center">
			<em>I love programming</em>
		</p>
		<p style="text-align: justify;">
			I'm Udhaya, Junior Support engineer, working in Full creative. If you
			need any support in Setmore, then that's where I come. My Job is to
			make people feel easy and comfortable as well as happy by providing
			the answers to their questions. This includes the problem solving,
			which the customer faces with the product. I'd love to help others.
			As many struggle I face in my life has given me many lessons. Here
			the lesson means my experience. You lose only you think you cannot
			move further. If you move further when you face failure then it is a
			hurdle. <b style="font-weight: bold; font-family: cursive;">I've
				never failed, but I have found 10,000 ways that doesn't work</b> -
			Thomas Edison
		</p>
		<script id="setmore_script" type="text/javascript"
			src="https://my.setmore.com/js/iframe/setmore_iframe.js"></script>
		<a id="Setmore_button_iframe"
			style="float: none; position: relative; left: 70px;"
			style="float:none" href="https://udhayaprakasha.setmore.com"><img
			border="none"
			src="https://my.setmore.com/images/bookappt/SetMore-book-button.png"
			alt="Book an appointment with softSolutions using SetMore" /></a>
		<div class="im-row">
			<div class="im-col m6 im-center im-padding-large">
				<p>
					<b><i class="fa fa-user im-margin-right"></i>Udhayaprakasha</b>
				</p>
				<br> <img src="images/mypic.jpg"
					class="im-round im-image im-opacity im-hover-opacity-off"
					alt="Photo of Me" width="500" height="333">
			</div>
			<!-- Hide this text on small devices -->
			<div class="im-col m6 im-hide-small im-padding-large">
				<p style="position: relative;top: 70px;text-align: justify;">Welcome to my website. This is a website which is built by me. You can also reach me out by contacting me for your
					queries that you have in Setmore. I've also learned how to assemble
					the desktop and OS installation. You can also book
					appointments/sessions with me. I love to collect the pictures which
					I have added here.</p>
			</div>
		</div>
		<p class="im-large im-center im-padding-16">Im really good at:</p>
		<p class="im-wide">
			<i class="fa fa-coffee"></i>Java
		</p>
		<div class="im-light-grey">
			<div class="im-container im-padding-small im-dark-grey im-center"
				style="width: 90%">90%</div>
		</div>
		<p class="im-wide">
			<i class="fa fa-laptop"></i>Web Design
		</p>
		<div class="im-light-grey">
			<div class="im-container im-padding-small im-dark-grey im-center"
				style="width: 85%">85%</div>
		</div>
		<p class="im-wide">
			<i class="fa fa-photo"></i>App engine Services
		</p>
		<div class="im-light-grey">
			<div class="im-container im-padding-small im-dark-grey im-center"
				style="width: 75%">75%</div>
		</div>
	</div>
	<div class="im-row im-center im-dark-grey im-padding-16">
		<div class="im-quarter im-section">
			<span class="im-xlarge">50+</span><br> Customer
		</div>
		<div class="im-quarter im-section">
			<span class="im-xlarge">55+</span><br> OS Installation
		</div>
		<div class="im-quarter im-section">
			<span class="im-xlarge">89+</span><br> Happy Clients
		</div>
		<div class="im-quarter im-section">
			<span class="im-xlarge">150+</span><br> Meetings
		</div>
	</div>
	<!-- Second Parallax Image with mycollections Text -->
	<div class="bgimg-2 im-display-container im-opacity-min">
		<div class="im-display-middle">
			<span class="im-xxlarge im-text-light-grey im-wide im-collections"
				style="color: black !important;">My </span><span
				class="im-xxlarge im-text-light-grey im-wide"
				style="color: black !important;">Collections</span>
		</div>
	</div>
	
	<!-- Container (mycollections Section) -->
	<div class="im-content im-container im-padding-64" id="mycollections">
		<h3 class="im-center">My Collections</h3>
		<p class="im-center">
			<em>Here are some of my latest collections.<br>Click on the
				images to make them bigger
			</em>
		</p>
		<br>
		<!-- Responsive Grid. Four columns on tablets, laptops and desktops. Will stack on mobile devices/small screens (100% width) -->
		<div class="im-row-padding im-center">
			<div class="im-col m3">
				<img src="images/bg1.png" class="imgsmall img1" onclick="onClick(this)"
					class="im-hover-opacity" alt="Reach me any time">
			</div>
			<div class="im-col m3">
				<img src="images/bg2.jpg" class="imgsmall img2" onclick="onClick(this)"
					class="im-hover-opacity" alt="Waterproof">
			</div>
			<div class="im-col m3">
				<img src="images/bg4.jpg" class="imgsmall img3" onclick="onClick(this)"
					class="im-hover-opacity" alt="Keyboard">
			</div>
			<div class="im-col m3">
				<img src="images/bbg5.jpg" class="imgsmall img4" onclick="onClick(this)"
					class="im-hover-opacity" alt="Processor">
			</div>
			<button class="im-btn-load im-btn im-light-grey im-padding-xlarge"
				style="margin-top: 64px; margin-bottom: 64px; position: relative; right: 100px;"
				id="loadmore" onclick="loadmore();">Load My Favorite
				Personalities</button>
		</div>
		<div class="im-row-padding im-center im-section" id="favperson"
			style="display: none;">
			<div class="im-col m3">
				<img src="images/jonyive.jpg" class="imgsmall img5" onclick="onClick(this)"
					class="im-hover-opacity" alt="Jony Ive">
			</div>
			<div class="im-col m3">
				<img src="images/elon.jpg" class="imgsmall img6" onclick="onClick(this)"
					class="im-hover-opacity" alt="Elon Musk">
			</div>
			<div class="im-col m3">
				<img src="images/sundar.jpg" class="imgsmall img7" onclick="onClick(this)"
					class="im-hover-opacity" alt="Sundar Pichai">
			</div>
			<div class="im-col m3">
				<img src="images/steve.jpg" class="imgsmall img8" onclick="onClick(this)"
					class="im-hover-opacity" alt="Steve Jobs">
			</div>
		</div>
	</div>
	<!-- Modal for full size images on click-->
	<div id="modal01" class="im-modal im-black"
		onclick="this.style.display='none'">
		<span
			class="im-closebtn im-text-white im-opacity im-hover-opacity-off im-xxlarge im-container im-display-topright"
			title="Close Modal Image"><i class="fa fa-remove"></i></span>
		<div
			class="im-modal-content im-animate-zoom im-center im-transparent im-padding-64">
			<img id="img01" class="im-image">
			<p id="caption" class="im-opacity im-large" style="color: #ffebcd;"></p>
		</div>
	</div>
	<div class="bgimg-4 im-display-container im-opacity-min">
		<div class="im-display-middle">
			<span class="im-xxlarge im-text-light-grey im-wide"
				style="color: black !important;"></span>
		</div>
	</div>
	<!-- Container (Todoapp Section) -->
	<div class="im-content im-container im-padding-64" id="todoapp">
		<h3 class="im-center" style="font-size: 40px;">Todo App</h3>
		<p>Todo is used by millions of individuals, families and teams for
			GETTING THINGS DONE. Todoist is another thoughtfully designed,
			powerful, and intuitive app for managing your tasks. "Todo has stood
			the test of time" -Silicon Slopes.</p>
		<div id="mybtn" class="im-center">
			<a class="button cta open-signup">Create an account</a>
		</div>
		<div id="myModal" class="modal">
			<div class="popup" id="signup" style="display: block;">	</div>
			<div id="backgroundPopup">
		
		<div class="popup-wrapper" style="display: block;">
				<div class="icon-close popup-close"></div>
				<div class="popup-header">
					<h2>Create a Free Account!</h2>
					<p>Get a Todo List account in 30 seconds. No credit card required!</p>
					<div id="error-status" class="error-signup"></div>
				</div>
				<div class="popup-body">
					<div id="social-login">
						<p>Sign in quick with your social login</p>
						<div>
							<a class="button button-facebook" href="https://www.facebook.com/v2.8/dialog/oauth? &redirect_uri=https://todo-dot-website-imagic.appspot.com/facebookLogin&response_type=code&display=popup&client_id=155149575014412&scope=email">Sign in with Facebook</a>
						</div>
						<div>
							<a class="button button-google" href="https://accounts.google.com/o/oauth2/v2/auth?scope=email profile&redirect_uri=https://todo-dot-website-imagic.appspot.com/oauth2callback&response_type=code&client_id=477743159334-md889q8177sdgpb22t3l3ce5jsjmonm7.apps.googleusercontent.com" class="button-content">Sign in with Google</a>
						</div>
						<div>
							<button class="alreadybutton" class="button-content">Already have an account</button>
						</div>
					</div>
					<div id="signup-popup-form">
						<form action="/signup" id="login_form" name="login_form" method="post" style="text-align: left;">
								<input id="name" name="name" class="blue_glow input" type="text" placeholder="Name">
								<input id="email" name="email" class="blue_glow input" type="text" placeholder="Email">
								<input id="password" name="password" class="blue_glow input" type="password" placeholder="Password">
							<input type="hidden" id="company" name="company" value="company-name">
							<input type="hidden" id="currentDate" name="currentDate">
						<div onclick="signup();" id="create-account" class="button create-account-button inactive">
							<span  id="create-account" class="create-account-text">Create my account!</span>
						</div>
						<div class="sign-in-checkbox">
							<!-- <input class="sign-in-checkbox-input" type="checkbox" name="subscribed-checkbox" checked=""><span>Get app Updates and marketing tutorials</span><br>
							<input type="hidden" name="subscribed" value="false"> -->
						</div>
						</form>
					</div>
					<div class="clear-fix"></div>
				</div>
			</div>
			</div>
		</div>
		
		
		<!-- Sign in Container -->
		<div id="signupModal" class="modal">
			<div class="popup" id="signup" style="display: block;">	</div>
			<div id="backgroundPopup">
		
		<div class="popup-wrapper" style="display: block;">
				<div class="icon-close popup-close"></div>
				<div class="popup-header">
					<h2>Sign in</h2>
					<p>Get into your Todo List account in 30 seconds.</p>
					<div id="error-status-login" class="error-signup"></div>
				</div>
				<div class="popup-body">
					<div id="social-login">
						<p>Sign in quick with your social login</p>
						<div>
							<a class="button button-facebook" href="https://www.facebook.com/v2.8/dialog/oauth? &redirect_uri=https://todo-dot-website-imagic.appspot.com/facebookLogin&response_type=code&display=popup&client_id=155149575014412&scope=email">Sign in with Facebook</a>
						</div>
						<div>
							<a class="button button-google" href="https://accounts.google.com/o/oauth2/v2/auth?scope=email profile&redirect_uri=https://todo-dot-website-imagic.appspot.com/oauth2callback&response_type=code&client_id=477743159334-md889q8177sdgpb22t3l3ce5jsjmonm7.apps.googleusercontent.com" class="button-content">Sign in with Google</a>
						</div>
					</div>
					<div id="signup-popup-form">
						<form action="/signIn" id="signin_form" name="signin_form" method="post" style="text-align: left;">
								<input id="emailid" name="emailid" class="blue_glow input" type="text" placeholder="Email">
								<input id="passwordNew" name="passwordNew" class="blue_glow input" type="password" placeholder="Password">
							<input type="hidden" id="company" name="company" value="company-name">
							<input type="hidden" id="currentDate" name="currentDate">
						<div onclick="signin();" id="create-account" class="button create-account-button inactive">
							<span  id="create-account" class="create-account-text">Sign In</span>
						</div>
						</form>
					</div>
					<div class="clear-fix"></div>
				</div>
			</div>
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
	</div>
	<!-- Third Parallax Image with mycollections Text -->
	<div class="bgimg-3 im-display-container im-opacity-min">
		<div class="im-display-middle">
			<span class="im-xxlarge im-text-light-grey im-wide"
				style="color: black !important;">CONTACT</span>
		</div>
	</div>
	<!-- Container (Contact Section) -->
	<div class="im-content im-container im-padding-64" id="contact">
		<h3 class="im-center">WHERE I WORK</h3>
		<p class="im-center">
			<em>I'd love your feedback!</em>
		</p>
		<div class="im-row im-padding-32 im-section">
			<div class="im-col m4 im-container">
				<!-- Add Google Maps -->
				<div id="googleMap" class="im-round-large im-greyscale"
					style="width: 100%; height: 400px;"></div>
			</div>
			<div class="im-col m8 im-container im-section">
				<div class="im-large im-margin-bottom" style="color: black;">
					<i
						class="fa fa-map-marker fa-fw im-hover-text-black im-xlarge im-margin-right"
						style="color: red !important;"></i> Chennai, India<br> <i
						class="fa fa-phone fa-fw im-hover-text-black im-xlarge im-margin-right"
						style="color: greenyellow !important;"></i> Phone: +91 9940020612<br>
					<i
						class="fa fa-envelope fa-fw im-hover-text-black im-xlarge im-margin-right"
						style="color: blueviolet !important;"></i> Email:
					prakashaudhaya@gmail.com<br>
				</div>
				<p>
					Swing by for a cup of <i class="fa fa-coffee"></i>, or leave me a
					note:
				</p>
				<form method="POST">
					<div class="im-row-padding" style="margin: 0 -16px 8px -16px">
						<div class="im-half">
							<input class="im-input im-border" type="text" placeholder="Name"
								required name="Name" id="name">
						</div>
						<div class="im-half">
							<input class="im-input im-border im-input-email" type="email"
								placeholder="Email" required name="Email" id="email">
						</div>
					</div>
					<input class="im-input im-border" type="text" placeholder="Message"
						required name="Message" id="message">
					<button class="im-btn im-black im-right im-padding im-section"
						onclick="sendEmail();">
						<i class="fa fa-paper-plane"></i> SEND MESSAGE
					</button>
					<input type="RESET"
						class="im-btn im-black im-left im-padding im-section">
					RESET
				</form>
				<span id="ack"></span>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<footer
		class="im-center im-black im-padding-64 im-opacity im-hover-opacity-off">
	<a href="#home" class="im-btn im-padding im-light-grey im-hover-grey"><i
		class="fa fa-arrow-up im-margin-right"></i>To the top</a>
	<div class="im-xlarge im-section">
		<a href="https://www.facebook.com/udhaya.prakasha"><i
			class="fa fa-facebook-official im-hover-text-indigo"></i></a>
	</div>
	<p style="color: white;">
		Powered by<a target="_blank" href="https://www.setmore.com"><span
			style="font-family: cursive;">Setmore</span></a>
	</p>
	</footer>
	<!-- Add Google Maps -->
	<script>
		function myMap() {
			myCenter = new google.maps.LatLng(12.900980, 80.066276);
			var mapOptions = {
				center : myCenter,
				zoom : 12,
				scrollwheel : false,
				draggable : false,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map(document.getElementById("googleMap"),
					mapOptions);

			var marker = new google.maps.Marker({
				position : myCenter,
			});
			marker.setMap(map);
		}

		// Modal Image Gallery
		function onClick(element) {
			document.getElementById("img01").src = element.src;
			document.getElementById("modal01").style.display = "block";
			var captionText = document.getElementById("caption");
			captionText.innerHTML = element.alt;
		}

		// Change style of navbar on scroll
		window.onscroll = function() {
			myFunction()
		};
		function myFunction() {
			var navbar = document.getElementById("myNavbar");
			if (document.body.scrollTop > 100
					|| document.documentElement.scrollTop > 100) {
				navbar.className = "im-navbar" + " im-card-2"
						+ " im-animate-top" + " im-white";
			} else {
				navbar.className = navbar.className.replace(
						" im-card-2 im-animate-top im-white", "");
			}
		}

		//Used to load many pictures
		function loadmore() {
			var x = document.getElementById("favperson");
			if (x.style.display === 'none') {
				x.style.display = 'block';
			} else {
				x.style.display = 'none';
			}
		}
		// Used to toggle the menu on small screens when clicking on the menu button
		function toggleFunction() {
			var x = document.getElementById("navDemo");
			if (x.className.indexOf("im-show") == -1) {
				x.className += " im-show";
			} else {
				x.className = x.className.replace(" im-show", "");
			}
		}

		function sendEmail() {
			var name = document.getElementById("name").value;
			var email = document.getElementById("email").value;
			var message = document.getElementById("message").value;
			if (name != "" && email != "" && message != "") {
				loadDoc();
			} else {
				alert("Information is insufficient. Please fill out all the fields");
			}
		}

		//send email
		function loadDoc() {
			var xhttp = new XMLHttpRequest();
			var name = document.getElementById("name").value;
			var email = document.getElementById("email").value;
			var message = document.getElementById("message").value;
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					alert("Message received. Thank you !");
					document.getElementById("ack").innerHTML = this.responseText;
				}
			};
			xhttp.open("POST", "/email?name=" + name + "&email=" + email
					+ "&message=" + message, true);
			xhttp.send();
		}
	</script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAivnyhvMqYG1UuDBmEhJOJpYI0w9JpFp8&callback=myMap"></script>
	
	<script>
		// Get the modal
		var modal = document.getElementById('myModal');

		// Get the button that opens the modal
		var btn = document.getElementById("mybtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks the button, open the modal 
		btn.onclick = function() {
			modal.style.display = "block";
		}

		

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
	
	<script>
	var flag_validation		= true;
	var statusOfEmail = "Failure";
	var ajax_done = false;
	
	function validateEmailSignin()
	{
		var flag_email = true;
		
		var validateemail = document.getElementById('emailid').value;
		
		if(validateemail == "")
			{
				flag_email = false
			}
	
		var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;  
		flag_email = emailPattern.test(validateemail);  
		 
		if(flag_email == false && validateemail != "")
			{
				document.getElementById("email").className = "blue_glow input error";
			}
		return flag_email;
	}
	function showStatusMessageLogin(message)
	{
		$('#error-status-login').html(message);
		$('#error-status-login').fadeIn();
	}
	function hideStatusMessageLogin()
	{
		$('#error-status-login').fadeOut();
	}
	
	function signin(){
		validateSigninFields();
		var validateEmail = document.getElementById('emailid').value;
		var password	= document.getElementById('passwordNew').value;
		validateEmail	=	validateEmail.toLowerCase();
		flag_email = validateEmailSignin();
		if(flag_email == true)
		{
			showStatusMessage("<img src='/images/spinner.gif' alt='Spinner Image' class='loading-spinner'/>Checking Availability...");
			$.ajax({
				type: "get",
				url : "/signInCheck?emailid="+validateEmail+"&password="+password,
				contentType:"text/html",
				success : function(results)
				{
					if(results.match("Success"))
					{
						$('#email').removeClass('error');
						statusOfEmail = results;								
						ajax_done = true;
					}
					else if(results.match("emailIdFailure"))
					{
						showStatusMessageLogin("Invalid Email address!");
						document.getElementById("emailid").className = 'blue_glow input error';
						ajax_done = false;
						return;
					} 
					else if(results.match("passwordFailure"))
					{
						showStatusMessageLogin("Password Doesn't Match!");
						document.getElementById("passwordNew").className = 'blue_glow input error';
						ajax_done = false;
						return;
					} 
					validateSigninFields();
				}
			});
		}
		return false;
	}
	function validateSigninFields(){
		flag_validation	= true;
		 var mailId	 	= document.getElementById('emailid').value.toLowerCase();;
		 var password	= document.getElementById('passwordNew').value;
		 
		if(ajax_done == false)
		{
			flag_validation	= false;
		}
		
	 if ((mailId == "") ) 
		{
			showStatusMessageLogin("Email field cannot be blank...");
			document.getElementById("emailid").className = "blue_glow input error";
			flag_validation	= false;
			return;
		} 
		else
		{
			$('#emailid').removeClass('error_input_field');
		}
		var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;  
		flag_email = emailPattern.test(mailId);  
			
	
		if(flag_email ==  false)
		{
			showStatusMessageLogin("Invalid Email...");
			document.getElementById("emailid").className = "blue_glow input error";
			return;
		}
		else
		{
			$('#emailid').removeClass('error_input_field');
		}
		if(password == "")
		{
			showStatusMessageLogin("Password field cannot be blank...");
			document.getElementById("passwordNew").className = "blue_glow input error";
			flag_validation	= false;
			return;
		}
		else
		{
			$('#passwordNew').removeClass('error');
		}
		if(flag_validation)
		{
			if($('.sign-in-checkbox-input').is(":checked")){
                $('input[name="subscribed"]').val('true');
            }else{
            	$('input[name="subscribed"]').val('false');
            	}
			showStatusMessageLogin("<img src='/images/spinner.gif'/>Logging in Please wait...");
			//changing to UA
			document.signin_form.submit();
		}
	};
	var signupscreen='null';
		signupscreen=signupscreen?signupscreen:"false";
	$(document).ready(function(){
		$("#emailid,#passwordNew").keypress(function(event) {
			if(event.which==13)
			{
				signin();
			}
			
		});
		
	});
	
	$( "#emailid,#passwordNew" ).focus(function() {
		 $(this).removeClass("error");
	});
	</script>
	
	
	<script>
	$( document ).ready(function() {
	    $('.popup-close,#signup').click(function(){
	    	$('#myModal').hide();
	    	$('#signupModal').hide();
	    	hideStatusMessageLogin();
	    	hideStatusMessage();
	    	$( "#name,#email,#password,#emailid,#passwordNew" ).removeClass("error");
	    });
	   
	    $('.alreadybutton').click(function(){
	    	$('#myModal').hide();
	    	$('#signupModal').show();
	    });
	    
	
	});
	
	</script>
	
	
	<script type="text/javascript">
		var flag_validation		= true;
		var statusOfEmail = "Failure";
		var ajax_done = false;
		
		function validateEmail()
		{
			var flag_email = true;
			
			var validateemail = document.getElementById('email').value;
			
			if(validateemail == "")
				{
					flag_email = false
				}
		
			var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;  
			flag_email = emailPattern.test(validateemail);  
			 
			if(flag_email == false && validateemail != "")
				{
					document.getElementById("email").className = "blue_glow input error";
				}
			return flag_email;
		}
		function showStatusMessage(message)
		{
			$('#error-status').html(message);
			$('#error-status').fadeIn();
		}
		function hideStatusMessage()
		{
			$('#error-status').fadeOut();
		}
		function signup()
		{
			validateFields();
			var validateemail = document.getElementById('email').value;
			validateemail	=	validateemail.toLowerCase();
			flag_email = validateEmail();
			if(flag_email == true)
			{
				showStatusMessage("<img src='/images/spinner.gif' alt='Spinner Image' class='loading-spinner'/>Checking Availability...");
				$.ajax({
					type: "get",
					url : "/register?emailid="+validateemail,
					contentType:"text/html",
					success : function(results)
					{
						if(results.match("Success"))
						{
							$('#email').removeClass('error');
				 			showStatusMessage("Is Available...");
							statusOfEmail = results;								
							ajax_done = true;
						}
						else if(results.match("Failure"))
						{
							showStatusMessage("Email Address already exists!");
							document.getElementById("email").className = 'blue_glow input error';
							ajax_done = false;
							return;
						} 
					 	validateFields();
					}
				});
			}
			return false;
		}
		function validateFields()
		{
			flag_validation	= true;
			 var name		= document.getElementById('name').value;
			 var mailId	 	= document.getElementById('email').value.toLowerCase();;
			 var password	= document.getElementById('password').value;

			if(ajax_done == false)
			{
				flag_validation	= false;
			}
			 //For name 
			if ((name == "") ) 
			{
				showStatusMessage("Name field cannot be blank...");
				document.getElementById("name").className = "blue_glow input error";
				flag_validation	= false;
				return;
			} 
			else
			{
				$('#name').removeClass('error_input_field');
			}
			
			 //For Mail id
			 
			if ((mailId == "") ) 
			{
				showStatusMessage("Email field cannot be blank...");
				document.getElementById("email").className = "blue_glow input error";
				flag_validation	= false;
				return;
			} 
			else
			{
				$('#email').removeClass('error_input_field');
			}
			var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;  
			flag_email = emailPattern.test(mailId);  
				
		
			if(flag_email ==  false)
			{
				showStatusMessage("Invalid Email...");
				document.getElementById("email").className = "blue_glow input error";
				return;
			}
			else
			{
				$('#email').removeClass('error_input_field');
			}
			if(password == "")
			{
				showStatusMessage("Password field cannot be blank...");
				document.getElementById("password").className = "blue_glow input error";
				flag_validation	= false;
				return;
			}
			else if(password.length<6)
			{
				showStatusMessage("Password should have minimum 6 characters...");
				document.getElementById("password").className = "blue_glow input error";
				flag_validation	= false;
				return;
			}
			else
			{
				$('#password').removeClass('error');
			}
			if(flag_validation)
			{
				if($('.sign-in-checkbox-input').is(":checked")){
	                $('input[name="subscribed"]').val('true');
	            }else{
	            	$('input[name="subscribed"]').val('false');
	            	}
				showStatusMessage("<img src='/images/spinner.gif'/>Signing up please wait...");
				//changing to UA
				document.login_form.submit();
			}
		};
		var signupscreen='null';
			signupscreen=signupscreen?signupscreen:"false";
		$(document).ready(function(){
			$("#name,#email,#password").keypress(function(event) {
				if(event.which==13)
				{
					signup();
				}
			});
			
			
		});
		
		$( "#name,#email,#password" ).focus(function() {
			 $(this).removeClass("error");
		});
	</script>


</body>
</html>

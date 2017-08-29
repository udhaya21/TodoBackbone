<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<title>Jasmine Spec Runner v2.6.4</title>

<script src="js/jquery-min.js"></script>
<script src="js/underscore-min.js"></script>
<script src="js/backbone-min.js"></script>
<link rel="shortcut icon" type="image/png"
	href="views/jasmine/lib/jasmine/jasmine_favicon.png">
<link rel="stylesheet" href="views/jasmine/lib/jasmine/jasmine.css">

<script src="views/jasmine/lib/jasmine/jasmine.js"></script>
<script src="views/jasmine/lib/jasmine/jasmine-html.js"></script>
<script src="views/jasmine/lib/jasmine/boot.js"></script>
<%
	HttpSession session1 = request.getSession();
	session1.setAttribute("givenName", "udhaya");
	session1.setAttribute("email", "test@gmail.com");
%>
<script>
function load(){
	<% 
		session = request.getSession(false);
	   	session.setAttribute("cursor",null);
	 %>

}
</script>
<script>
var email = "test@gmail.com";
</script>
<script src="https://www.gstatic.com/firebasejs/4.2.0/firebase.js"></script>
<script>
	// Initialize Firebase
	var config = {
			apiKey: "AIzaSyA5CZk3BTEf65hx9BFPgPlvGNOogEwiBS8",
			authDomain: "website-imagic.firebaseapp.com",
		    databaseURL: "https://website-imagic.firebaseio.com",
		    projectId: "website-imagic",
		    storageBucket: "website-imagic.appspot.com",
		    messagingSenderId: "477743159334"	    
	  };
	  firebase.initializeApp(config);

	  // Get a reference to the database service
	  var database = firebase.database();
</script>
<script>
	var email,title,key,completed;
	if(email == null || email == undefined){
		email = "udhaya.venu@a-cti.com";
	}
	if(title == null || title == undefined){
		title = "test";
	}
	if(key == null || key == undefined){
		key = "test124";
	}
	if(completed == null || completed == undefined){
		completed = false;
	}
</script>

<!-- include source files here... -->
<script src="views/jasmine/src/source.js"></script>
<script src="views/allListView.js"></script>

<!-- include spec files here... -->
<script src="views/jasmine/spec/spec.js"></script>
<script src="views/jasmine/spec/allListViewSpec.js"></script>


</head>

<body>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>To-do</title>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="js/jquery-min.js"></script>
<script src="js/underscore-min.js"></script>
<script src="js/backbone-min.js"></script>

<%
	String userName = (String) session.getAttribute("givenName");
	String cursor = (String) session.getAttribute("cursor");
	System.out.println(cursor);
	String loggedInUser = (String) session.getAttribute("email");
	if (request.getSession().getAttribute("email") == null) {
		response.sendRedirect("/home");
	}
%>

<script src="https://www.gstatic.com/firebasejs/3.7.8/firebase.js"></script>
<script type="text/javascript">
    (function(){
    	if (window.location.hash && window.location.hash == '#_=_'){
        window.location = '';
    	}
        else if (window.location.hash && window.location.hash == '#todoapp'){
            window.location = '';
    }else if (window.location.hash && window.location.hash == '#home'){
            window.location = '';
    }else if (window.location.hash && window.location.hash == '#about'){
            window.location = '';
    }
    else if (window.location.hash && window.location.hash == '#mycollections'){
        window.location = '';
	}else if (window.location.hash && window.location.hash == '#contact'){
            window.location = '';
    }
    	
    })();
</script>
<script>
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
var email = '<%=loggedInUser%>';
</script>
<style type="text/css">
body{
    background-image: linear-gradient(90deg,#00a1ff 0,#5a41e2 100%);
}
.signout {
	position: relative;
	bottom: 115px;
	right: 10px;
	float: right;
}

.signout-icon {
	font-size: 36px;
	color: #9C27B0;
	cursor: pointer;
    color: rgba(245, 255, 92, 0.7);
}

.signout-icon:hover{
    	color: rgb(245, 255, 92);
    
}

ul#all
{
	overflow: auto;
    max-height: 200px;
}
.new {
	position: relative;
	margin: 0;
	width: 100%;
	font-size: 24px;
	font-family: inherit;
	font-weight: inherit;
	line-height: 1.4em;
	border: 0;
	outline: none;
	color: inherit;
	padding: 6px;
	border: 1px solid #999;
	box-shadow: inset 0 -1px 5px 0 rgba(0, 0, 0, 0.2);
	box-sizing: border-box;
	-webkit-font-smoothing: antialiased;
	-moz-font-smoothing: antialiased;
	font-smoothing: antialiased;
}

.edit {
	display: none;
	position: relative;
	margin: 0;
	width: 100%;
	font-size: 24px;
	font-family: inherit;
	font-weight: inherit;
	line-height: 1.4em;
	border: 0;
	outline: none;
	color: inherit;
	padding: 6px;
	border: 1px solid #999;
	box-shadow: inset 0 -1px 5px 0 rgba(0, 0, 0, 0.2);
	box-sizing: border-box;
	-webkit-font-smoothing: antialiased;
	-moz-font-smoothing: antialiased;
	font-smoothing: antialiased;
}

.destroy {
	display: block;
	position: relative;
	float: right;
	top: 0;
	right: 10px;
	bottom: 0;
	width: 40px;
	height: 40px;
	margin: auto 0;
	font-size: 30px;
	color: #cc9a9a;
	margin-bottom: 11px;
	transition: color 0.2s ease-out;
}

.destroy:hover {
	color: #af5b5e;
}

.destroy:after {
	content: '×';
}

.allheader {
    background: rgb(18, 45, 68);
    text-align: center;
	height: 40px;
}

.allh1 {
	position: relative;
	top: 7px;
	color:#fff;
}

.new {
	padding: 16px 16px 16px 60px;
	border: none;
	background: rgba(0, 0, 0, 0.003);
	box-shadow: inset 0 -2px 1px rgba(0, 0, 0, 0.03);
}

.todoapp {
	background: #fff;
	margin: 130px 0 40px 0;
	position: relative;
	box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 25px 50px 0
		rgba(0, 0, 0, 0.1);
}

.todoapp input::-webkit-input-placeholder {
	font-style: italic;
	font-weight: 300;
	color: #e6e6e6;
}

.todoapp input::-moz-placeholder {
	font-style: italic;
	font-weight: 300;
	color: #e6e6e6;
}

.todoapp input::input-placeholder {
	font-style: italic;
	font-weight: 300;
	color: #e6e6e6;
}

.todoapp h1 {
	position: absolute;
	top: -155px;
	width: 100%;
	font-size: 100px;
	font-weight: 200;
	text-align: center;
	color: rgb(255, 255, 255);
	-webkit-text-rendering: optimizeLegibility;
	-moz-text-rendering: optimizeLegibility;
	text-rendering: optimizeLegibility;
}

.todoBody {
	position: relative;
	top: 100px;
	font: 14px 'Helvetica Neue', Helvetica, Arial, sans-serif;
	line-height: 1.4em;
	background: #f5f5f5;
	color: #4d4d4d;
	min-width: 230px;
	max-width: 550px;
	margin: 0 auto;
	-webkit-font-smoothing: antialiased;
	-moz-font-smoothing: antialiased;
	font-smoothing: antialiased;
	font-weight: 300;
	padding: 0;
}

.toggle-all {
	position: absolute;
	top: 16px;
	left: -8px;
	width: 60px;
	height: 34px;
	text-align: center;
	outline: none;
	border: none; /* Mobile Safari */
}

.toggle-all:before {
	content: '✓';
	font-size: 22px;
	color: #e6e6e6;
	padding: 10px 27px 10px 27px;
}

.toggle-all:checked:before {
	color: #737373;
}

.toggle-all {
	-webkit-appearance: none;
	appearance: none;
}

input[type="checkbox"]:checked {
	outline: none;
}

.dall:hover {
	box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 25px 50px 0
		rgba(0, 0, 0, 0.1);
}

.dactive:hover {
	box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 25px 50px 0
		rgba(0, 0, 0, 0.1);
}

.dcompleted:hover {
	box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 25px 50px 0
		rgba(0, 0, 0, 0.1);
}

.list:hover {
	box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 25px 50px 0
		rgba(0, 0, 0, 0.1);
}

body {
	background: #f5f5f5;
}

.all {
	word-break: break-word;
	width: 30.5%;
	height: 100%;
	float: left;
	position: relative;
	top: 100px;
	left:500px;
}

.active {
	word-break: break-word;
	width: 30.5%;
	height: 100%;
	float: left;
	padding: 5px 15px;
	margin: 0px 5px 5px 5px;
}

.completed {
	word-break: break-word;
	width: 30.5%;
	height: 100%;
	padding: 5px 15px;
	float: left;
}

.color {
	background: white;
}

.pagewrap {
	padding: 5px;
	width: 960px;
	margin: 20px auto;
}

.list {
	list-style: none;
	width: 100%;
	overflow: auto;
}

.toggle {
	float: left;
	text-align: center;
	width: 35px;
	border: none; /* Mobile Safari */
	-webkit-appearance: none;
	appearance: none;
	cursor: pointer;
}

.toggle:after {
	content:
		url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="-10 -18 100 135"><circle cx="50" cy="50" r="50" fill="none" stroke="#ededed" stroke-width="3"/></svg>');
}

.toggle:checked:after {
	content:
		url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="-10 -18 100 135"><circle cx="50" cy="50" r="50" fill="none" stroke="#bddad5" stroke-width="3"/><path fill="#5dc2af" d="M72 25L42 71 27 56l-4 4 20 20 34-52z"/></svg>');
}

.toggle:focus {
	outline: none;
}

.toggleCompleted {
	text-decoration: line-through;
}

#all {
	padding: 0px;
}

#all li label {
	position: relative;
	float: left;
	margin-left: 10px;
	width: 76%;;
	font-size: 20px;
	line-height: 42px;
}

button {
	margin: 0;
	padding: 0;
	border: 0;
	background: none;
	font-size: 100%;
	vertical-align: baseline;
	font-family: inherit;
	font-weight: inherit;
	color: inherit;
	-webkit-appearance: none;
	appearance: none;
	-webkit-font-smoothing: antialiased;
	-moz-font-smoothing: antialiased;
	font-smoothing: antialiased;
	outline: none;
	cursor: pointer;
}

.editing {
	border-bottom: none;
	padding: 0;
}

.editing .edit {
	display: block;
	width: 391px;
	height: 50px;
	padding: 13px 17px 12px 17px;
	margin: 0 0 0 43px;
}

.editing .list {
	display: none;
}

.editing .toggle {
	display: none;
}

.editing .destroy {
	display: none;
}

.editing .label {
	display: none;
}

.p-hi {
	float: left;
	position: relative;
	bottom: 150px;
	left: 20px;
	font-size: 30px;
	color: #fff;
}
.hide{
	display:none;
}
.p-name {
	float: left;
	position: relative;
	bottom: 180px;
	right: 10px;
	font-size: 30px;
}
</style>
</head>
<body style="background-image: linear-gradient(90deg,#00a1ff 0,#5a41e2 100%);" onload="load();">
	<div>
		<p class="p-hi">
			Hello!
			<%=userName%></p>
	</div>
	<div class="signout">
		<a onclick="logOut();"><i class="fa fa-power-off signout-icon" id="signout"></i></a>
	</div>
	<div class="todoBody"></div>
	<div>
		<section class="all" id="all">
			<header class="allheader">
			<h1 class="allh1">Task<h1></header>
			<ul id="all" class="todoList">
			</ul>
		 </section>
		<section class="active" id="active"> </section>
		<section class="completed" id="completed"> </section>
	</div>
	<script type="text/template" id="singleTodoView">
					<li id="<@=key@>" class="list <@=key!=null ? 'color' :'' @> <@=status!="inactive" ? '' :'hide' @>">
					<input id="<@=key @>" class="toggle" type="checkbox"  <@= completed ? 'checked' : '' @> />
					<label class="label <@= completed ? 'toggleCompleted' : '' @>"  id="<@=key @>"><@=title@></label>
					<button class="destroy" id="<@=key @>"></button>
					<input class="edit <@=key @>" id="<@=key @>" value="<@=title@>" onfocus="this.value = this.value;">
				</li>		
		</script>
	   <script>
		_.templateSettings = {
		interpolate : /\<\@\=(.+?)\@\>/gim,
		evaluate : /\<\@([\s\S]+?)\@\>/gim,
		escape : /\<\@\-(.+?)\@\>/gim
		};
</script>
	
	<script type="text/template" id="mainView">
		<div id="todoapp" class="todoapp">
		<h1>Todo</h1>
		<input class="new addItem" id="newItem" placeholder="Add that needs to be done :)" autofocus>
		<div class=main>
		<input class="toggle-all" id="toggle-all" type="checkbox">
		</div>
		</script>
	<script type="text/template" id="all-list-view">
			
			<@ var myCollection = todoCollection.models;@>
			<@ _.each(myCollection, function(todoItem) { 
			@>
         		<li id="<@=todoItem.get("key")@>" class="list <@=(todoItem.get("key"))!=null ? 'color' :'' @> <@=(todoItem.get("status"))!="inactive" ? '' :'hide' @>">
					<input id="<@=todoItem.get("key") @>" class="toggle" type="checkbox"  <@= todoItem.get("completed") ? 'checked' : '' @> />
					<label class="label <@= todoItem.get("completed") ? 'toggleCompleted' : '' @>"  id="<@=todoItem.get("key") @>"><@=todoItem.get("title")@></label>
					<button class="destroy" id="<@=todoItem.get("key") @>"></button>
					<input class="edit <@=todoItem.get("key") @>" id="<@=todoItem.get("key") @>" value="<@-todoItem.get("title")@>" onfocus="this.value = this.value;">
				</li>
				
    		<@ }); @>
			
		</script>
<script>
function load(){
	<% 
		session = request.getSession(false);
	   	session.setAttribute("cursor",null);
	 %>

}
function logOut() {
    var x;
    if (confirm("Press OK to Logout") == true) {
        window.location = "/signOut"
    }
}

$(document).ready(function(){
	
	//var fireObj = firebase.database().ref("Todo/").remove();
	
	jQuery(function($) {

	    $('ul#all').on('scroll', function() {
	        if($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
	        	todoCollectionCursor.fetch({
	    			success: function(collection, response, options) {
	    				var myCollections = collection.models;
	    				_.each(myCollections , function(model){
	    					model.toJSON();
	    					var newKey = model.get("key");
	    					var existing = todoCollection.findWhere({key : newKey});
	    					if(todoCollection.contains(existing)){
	    						return;
	    					}else{
	    					todoCollection.push(model);
	    					}
	    				});			
	    			}
	    		});
	        }
	        
	        todoCollection.sort();
	    })
	});
})

</script>
	<script src="views/allListView.js"></script>
	<script src="views/router.js"></script>

</body>
</html>
function validateSignup(element) {
          //Checking the fields
          var name = document.login_form.name.value;
             var email = document.login_form.email.value;
             var password = document.login_form.password.value;
         if(element.id == 'create-account'){
          if (name == null || name == "") {
            		document.getElementById("error_status").innerHTML = "Name can't be empty";
            	}else{
            		document.getElementById("error-status").innerHTML = "";
            		
            }
//         if (email == null || email == "") {
//            		document.getElementById("error-status").innerHTML = "Email can't be empty";
//            	}else{
//            		document.getElementById("error-status").innerHTML = "";
//            		
//            	}
//          		if (password.length < 6) {
//                		document.getElementById("error-status").innerHTML = "The password should be greater than six";
//                }else{
//                		document.getElementById("error-status").innerHTML = "";
//                		
//                }
//         
//         if((name != "" || name != null) && (email != "" || email != null) && (password.length >= 6)){
//         	loadDoc();
//         }else{
//         	return false;
//         } 
         }

         
         
//          if(element.id == 'name'){
//         	 if (name == null || name == "") {
//              		document.getElementById("error-status").innerHTML = "Name can't be empty";
//              	}else{
//              		document.getElementById("error-status").innerHTML = "";
//              		
//              	}
//          }
//          if(element.id == 'email'){
//              var atpos = email.indexOf("@");
//              var dotpos = email.lastIndexOf(".");  
//         
//         	 if (email == null || email == "") {
//              		document.getElementById("error-status").innerHTML = "Email can't be empty";
//              	}else if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length) {
//               	 document.getElementById("error-status").innerHTML=  "Please enter valid email";
//              	}else{
//              		document.getElementById("error-status").innerHTML = "";
//              	}
//          }
//         	if(element.id == 'password'){
//            		if (password.length < 6) {
//                  		document.getElementById("error-status").innerHTML = "The password should be greater than six";
//                  }else{
//                  		document.getElementById("error-status").innerHTML = "";
//                  		
//                  }
//          }
//         	
//         		
        }
//         function loadDoc() {
//          var name = document.login_form.name.value;
//          var email = document.login_form.email.value;
//          var password = document.login_form.password.value;
//          var xhttp = new XMLHttpRequest();
//          xhttp.onreadystatechange = function() {
//            if (this.readyState == 4 && this.status == 200) {
//              alert(this.responseText);
//            }
//          };
//          xhttp.open("POST", "/signUp?email="+email+"&name="+name+"&password="+password, true);
//          xhttp.send();
//         }
         
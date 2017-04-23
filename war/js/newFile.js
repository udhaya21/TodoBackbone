
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
					url : "/register.do?emailid="+validateemail,
					contentType:"text/html",
					success : function(results)
					{
						if(results.match("Success"))
						{
							$('#email').removeClass('error');
				 			showStatusMessage("Is Available...");
							statusOfEmail = results;
							console.log("writing the details into google analytics!");
								
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
				ga('send', 'event', 'Email', mailId, 'New Home Page');
				document.login_form.submit();
				/*_gaq.push(['_trackEvent', 'New Signup', validateemail , 'New Home Page']);//moving this line to validateFields function
				_gaq.push(function() { document.login_form.submit(); });*/
			}
		};
		var serverurl='https://my.setmore.com';
		var signupscreen='null';
			signupscreen=signupscreen?signupscreen:"false";
		$(document).ready(function(){
			$(".input").keypress(function(event) {
				if(event.which==13)
				{
					signup();
				}
			});
			$('.button-google').click(function(){
				ga('send', 'event', 'GPlusclick', 'google+', 'New Home Page');
				showStatusMessage("<img src='spinner.gif'/>Signing up with Google please wait...");
				$('.input').removeClass('error').val('').trigger('blur');
				window.location.replace(serverurl+'/oauth2callback.do');
			});
			$('.button-facebook').click(function(){
				ga('send', 'event', 'FBclick', 'facebook', 'New Home Page');
				showStatusMessage("<img src='spinner.gif'/>Signing up with Facebook please wait...");
				$('.input').removeClass('error').val('').trigger('blur');			
				window.location.replace(serverurl+'/facebookOauthCallback.do');
			});
			$( "#name,#email,#password" ).focus(function() {
				 $(this).removeClass("error");
			});
			
		});

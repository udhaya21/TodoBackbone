/**
 * 
 */
var myObj = {
	ajaxCall: function (){
	$.get("/ajaxcall",function(data){
		return data;
	});
	}
};

/**
 * 
 */
mockajax = function() {
};
var result;

function cb(result) {
	console.log(result);
	if (result != undefined || "") {
		return result;
	}
}
mockajax.prototype.fetch = function() {
	$.ajax({
		url : "/ajaxcall",
		success : function(response) {
			// alert("Success: " + response);
			result = response;
			cb(result);
		},
	});
};

/**
 * 
 */
describe("Ajax Called", function() {
	var result;
	it("should Return Ajax Called", function() {
		 var async = new mockajax();
		   //async.fetch();
		expect(cb()).toBe("Ajax Called");
	});
	
});
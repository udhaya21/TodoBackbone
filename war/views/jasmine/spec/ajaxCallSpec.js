/**
 * 
 */
describe("Ajax Call", function() {
    it("should return Ajax Called", function() {
        spyOn(myObj,'ajaxCall').and.returnValue("Ajax Called");
    }); 
});
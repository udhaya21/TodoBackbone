/**
 * Backbone Test cases
 */

describe("Test for Backbone model", function() {
	var todoModel;
	beforeEach(function() {
		todoModel = new app.TodoModel();
		allView	= new app.AllView();
	});

	it("toggle should be defined ", function() {
		// spyOn(obj.TodoModel.prototype.toggle("test",true)).and.callThrough();
		expect(todoModel.toggle).toBeDefined();
	});

	it("spyOn toggle function", function() {
		spyOn(todoModel, 'toggle').and.callFake(function(arguments, can, be, received) {
		      return 200;
	    });
		todoModel.initialize();
		todoModel.toggle();
		expect(todoModel.toggle).toHaveBeenCalled();
	});
	
	it("should check the default attributes", function() {
		expect(todoModel.attributes.completed).toEqual(false);
		expect(todoModel.attributes.title).toEqual("No title");
		expect(todoModel.attributes.key).toEqual("");
	});
	
	
});
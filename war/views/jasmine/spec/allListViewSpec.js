/**
 * Backbone Test cases
 */

describe("Test for Backbone model", function() {
	var todoModel, allView, mainView, success, valueReturned;
	
	beforeEach(function() {
		todoModel = new app.TodoModel();
		allView	= new app.AllView();
	});

	it("whether the functions are defined ", function() {
		// spyOn(obj.TodoModel.prototype.toggle("test",true)).and.callThrough();
		expect(allView).toBeDefined();
		expect(todoModel.toggle).toBeDefined();
		expect(allView.render).toBeDefined();
		expect(allView.toggleCompletedCheck).toBeDefined();
		expect(allView.editBlur).toBeDefined();
		expect(allView.edit).toBeDefined();
		expect(allView.updateFireObj).toBeDefined();
		expect(allView.updatedTemplate).toBeDefined();
		expect(allView.updateOnEnter).toBeDefined();
		expect(allView.close).toBeDefined();
		expect(allView.updateOnEnter).toBeDefined();
		expect(allView.updateUserData).toBeDefined();
		expect(allView.revertOnEscape).toBeDefined();
		expect(allView.removeListen).toBeDefined();
		expect(allView.clear).toBeDefined();
		
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
		expect(todoModel.urlRoot).toBeDefined();
		expect(todoModel.urlRoot).toEqual("/save");
	});
	
	it("should check the functions", function() {
		spyOn(allView,'toggleCompletedCheck').and.returnValue("Saved");
		valueReturned = allView.toggleCompletedCheck();
		//console.log(valueReturned);
		expect(allView.toggleCompletedCheck).toHaveBeenCalled();
		expect(valueReturned).toEqual("Saved");
		//expect(success).to();
	});
	
});
/**
 * Backbone Test cases
 */

describe("Test for Backbone model", function() {
	var todoModel, allView, mainView, success, valueReturned, responseTxt, fetchRespone;
	
	beforeEach(function() {
		todoModel = new app.TodoModel();
		allView	= new app.AllView();
	});
	
	
	afterEach(function(){
		valueReturned = "";
	});
	
	it("whether the functions are defined ", function() {
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
	
	it("should check the toggleCompletedCheck to return response", function() {
		spyOn(allView,'toggleCompletedCheck').and.returnValue("Saved");
		valueReturned = allView.toggleCompletedCheck();
		expect(allView.toggleCompletedCheck).toHaveBeenCalled();
		expect(valueReturned).toEqual("Saved");
	});
	
	it("should check the fetch call", function() {
		
		expect(typeof valueReturned).toEqual("string");
	});
});

describe("fetch call", function() {
//	jasmine.DEFAULT_TIMEOUT_INTERVAL = 10000;
//	var valueReturned;
//    beforeAll(function(done) {
//    	todoCollectionCursor.fetch({
//			success : function(collection, response, options) {
//				valueReturned = options.xhr.responseText; 
//				return valueReturned;
//			}
//		});
//    });
	
	beforeEach(function() {
		  jasmine.Ajax.install();
		});

	   it("specifying response when you need it", function() {
		   
		      var doneFn = jasmine.createSpy("success");
		      $.ajax({
		    	 url: '/fetch',
		    	 method: 'GET',
		    	 success : function(data)
		    	 {
		    		 doneFn(data);
		    	 }
		      })
		      console.log(jasmine.Ajax.requests.mostRecent());
		      expect(jasmine.Ajax.requests.mostRecent().url).toBe('/fetch');
	   });   
		      it("Response check response when you need it", function() {

			      var doneFn = jasmine.createSpy("success");
			      $.ajax({
			    	 url: '/fetch',
			    	 method: 'GET',
			    	 success : function(data)
			    	 {
			    		 doneFn(data);
			    	 }
			      })
		      jasmine.Ajax.requests.mostRecent().respondWith({
			        "status": 200,
			        "contentType": 'text/plain',
			        "responseText": '[{title:"Aravinth"}]'
			   });
		      expect(jasmine.Ajax.requests.mostRecent().responseText).toEqual('[{title:"Aravinth"}]');
	   });      
	   it("Status check response when you need it", function() {
		   var doneFn = jasmine.createSpy("success");
		   var xhr = new XMLHttpRequest();
		      xhr.onreadystatechange = function(args) {
		        if (this.readyState == this.DONE) {
		          doneFn(this.responseText);
		        }
		      };
		      xhr.open("GET", "/fetch");
		      xhr.send();
		      jasmine.Ajax.requests.mostRecent().respondWith({
		        "status": 200,
		        "contentType": 'text/plain',
		        "responseText": 'awesome response'
		      });
		      expect(jasmine.Ajax.requests.mostRecent().status).toEqual(200);
		      
		    });
		

		    it("allows responses to be setup ahead of time", function () {
		      var doneFn = jasmine.createSpy("success");
		
		

		      jasmine.Ajax.stubRequest('/fetch').andReturn({
		        "responseText": 'immediate response'
		      });
		
		

		      var xhr = new XMLHttpRequest();
		      xhr.onreadystatechange = function(args) {
		        if (this.readyState == this.DONE) {
		          doneFn(this.responseText);
		        }
		      };

		      xhr.open("GET", "/fetch");
		      xhr.send();

		      expect(doneFn).toHaveBeenCalledWith('immediate response');
		    });
		    
		    afterEach(function() {
		        jasmine.Ajax.uninstall();
		      });
});
		// don't forget to uninstall as well...
//		afterEach(function() {
//		  jasmine.Ajax.uninstall();
//		  
//		});
//
//    it("should return string", function(done) {
//    	console.log(valueReturned);
//    	console.log(typeof valueReturned);
//        expect(typeof valueReturned).toEqual('string');
//
//    });
//    
//  
//  });



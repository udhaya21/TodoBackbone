describe("A spy, when configured to fake a return value", function() {
  var foo, bar, fetchedBar;

  beforeEach(function() {
    foo = {
      setBar: function() {
        $.get("/ajaxcall", function(data) {
        	bar = data;
		});
      },
      getBar: function() {
        return bar;
      }
    };

    spyOn(foo, "getBar").and.returnValue("Ajax Called");

    foo.setBar();
    fetchedBar = foo.getBar();
  });

  it("tracks that the spy was called", function() {
    expect(foo.getBar).toHaveBeenCalled();
  });

  it("when called returns the requested value", function() {
    expect(fetchedBar).toEqual("Ajax Called");
  });
});

describe("Function should be ", function() {
	it("defined",function(){
		expect(myFunctionT).toBeDefined();
	});
});


/*
 * Testing matchers 
 */

describe("Testing", function(){
	var a,b,c,d, statement, myArray;
	
	beforeEach(function(){
		a = 100;
		b = new Number(100);
		d = null;
		statement = "The unit testing is amazing with Jasmine";
		myArray = [100, 200, 300, "Udhaya"]
	});
	
	it("tobe matcher should act as ===", function(){
		//expect(a).toBe(b);
		expect(a).not.toBe(b);
	});
	
	it("toEqual matcher should act as ==", function(){
		expect(a).toEqual(b);
	});
	
	it("toMatch with Regex", function(){
		expect(statement).toMatch("unit");
		expect(statement).toMatch(/testing/);
	});
	
	it("toBeDefined matcher should check literals or function is defined", function() {
		expect(statement).toBeDefined();
		//expect(c).toBeDefined();
	});
	
	it("toBeUndefined matcher should check literals or function is defined", function() {
		//expect(statement).toBeUndefined();
		expect(c).toBeUndefined();
	});
	
	it("toBeNull matcher should check literals or function is defined", function() {
		//expect(c).toBeNull();
		expect(c==null).toEqual(true);
		expect(d).toBeNull();
	});
	
	it("toBeTruthy and toBeFalsy should check whether the input is truthy or falsy", function() {
		//expect(c).toBeTruthy();
		expect(a).toBeTruthy();
		expect(c).toBeFalsy();
	});
	
	it("toContain should check whether the item is in array", function() {
		expect(myArray).toContain(100);
		expect(myArray).toContain("Udhaya");
	});
	
	it("toBeLessThan should check whether the input is less", function() {
		expect(99).toBeLessThan(a);
		expect(a).not.toBeLessThan(99);
	});
	
	it("toBeGreaterThan should check whether the input is greater", function() {
		expect(a).toBeGreaterThan(99);
	});
	
	it("toBeCloseTo should check whether the input is closer", function() {
		expect(10.77).toBeCloseTo(11,0);
	});
	
	it("toThrow should check whether the function throws", function() {
		
		var add = function() {
			return 2+1;
		};
		
		var addError = function(){
			return a+1;
		};
		
		var throwError = function(){
			throw 'Error_occurred';
		};
		
		expect(add).not.toThrow();
		//expect(addError).toThrow();
		expect(throwError).toThrow('Error_occurred');
	});
	
	it("toThrowError should check whether specific expection thrown", function() {
		var myTest = function() {
			throw new TypeError("Setmore Free Premium");
		};
		
		expect(myTest).toThrowError("Setmore Free Premium");
		expect(myTest).toThrowError(TypeError);
		expect(myTest).toThrowError(/Free/);
	});
	
	describe("A spec using the fail function", function() {
		  var myFailFunction = function(x, callBack) {
		    if (x) {
		      callBack();
		    }
		  };
		  
		  var callBack = function(){
			  console.log("Callback function is called");
		  };

		  it("should not call the callBack", function() {
			  myFailFunction(false, function() {
				  fail("Callback has been called");
		    });
		  });
		});
	
	afterEach(function(){
		a = 0;
		b = 0;
	});
});

/*
 * Disabling a spec
 */
	
	xdescribe("This spec", function() {
		it("should not run", function() {
			expect(1).toBeTruthy();
		});
	});
	
	describe("This spec", function() {
		xit("should be pending", function(){
			expect(1).toBeTruthy();
		});
	});
	
/*
 * Spies
 */
	describe("Testing when a spy configured to callThrough", function() {
		var obj,val,returnValue;
		
		beforeEach(function(){
			obj = {
					setValue : function(value) {
						val = value;
					},
					getValue : function() {
						return val;
					}
				};
			spyOn(obj,'getValue').and.callThrough();
			obj.setValue("Full_Creative");
			returnValue = obj.getValue();
		});
		
		it("whether the spy was called", function() {
			expect(obj.getValue).toHaveBeenCalled();
		});
		
		it("should not affect other functions", function () {
			expect(val).toEqual("Full_Creative");
		})
		
		it("when called returns the requested value", function() {
			expect(returnValue).toEqual("Full_Creative");
		});
	});

	describe("Testing when a spy configured to returnValue", function() {
		var obj,val,returnValue;
		
		beforeEach(function(){
			obj = {
					setValue : function(value) {
						val = value;
					},
					getValue : function() {
						return val;
					}
				};
			spyOn(obj,'getValue').and.returnValue("Full_Creative");
			obj.setValue("Full_Creative");
			returnValue = obj.getValue();
		});
		
		it("whether the spy was called", function() {
			expect(obj.getValue).toHaveBeenCalled();
		});
		
		it("should not affect other functions", function () {
			expect(val).toEqual("Full_Creative");
		})
		
		it("when called returns the requested value", function() {
			expect(returnValue).toEqual("Full_Creative");
		});
	});
	
	describe("Spy when configured to fake a series of return values", function() {
		beforeEach(function(){
			obj = {
					setValue : function(value) {
						val = value;
					},
					getValue : function() {
						return val;
					}
				};
			spyOn(obj,'getValue').and.returnValues("Full_Creative","Setmore");
			obj.setValue("Jasmine");
			
		});
		
		it("whether the spy was called", function() {
			obj.getValue("Full_Creative")
		})
	})
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
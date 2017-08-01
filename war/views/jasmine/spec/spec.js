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
 * 
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
	
	afterEach(function(){
		a = 0;
		b = 0;
	});
});

/*
 * 
 */

package com.testcases;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class TestJunit {
	String str;
	int c;
	String a, aNull;

	@Before
	public void setUp() {
		aNull = null;
		a = "Setmore";
		str = "Junit is working fine";
		c = 30;
	}

	@Test
	public void testAdd() {
		assertEquals("Junit is working fine", str);
	}

	@Test
	public void testFalseCondition() {

		assertFalse(c > 30);
	}

	@Test
	public void testNotNull() {
		assertNotNull(a);
	}

	@Test
	public void testNull() {
		assertNull(aNull);
	}

	@Test
	public void testTrueCondition() {
		assertTrue(c == 30);
	}
	
	@Test
	public void testFail() {
		fail();
	}

	@After
	public void tearDown() {
	
	}
	
}

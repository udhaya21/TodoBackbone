package com.testing;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FetchController {
	@RequestMapping(value = "/fetchCollectionModels", method = RequestMethod.POST)
	public @ResponseBody Object fetch(HttpServletRequest request, HttpServletResponse response,@PathVariable String key) throws IOException, ServletException{
		Object collectionModel = "";
		return collectionModel;
	
}
}

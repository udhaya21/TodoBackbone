package com.testing;

import java.io.IOException;
import com.google.appengine.api.datastore.Cursor;
import com.google.appengine.api.datastore.QueryResultIterator;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.cmd.Query;

@Controller
public class ObjectifyActions {
	

	@RequestMapping(value = "/fetch", method = RequestMethod.GET)
	public @ResponseBody String fetchBasedOnCursor(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		List<TodoBackbone> todoList = new ArrayList<TodoBackbone>();
		HttpSession session = request.getSession(false);
		String LoggedInUser = (String) session.getAttribute("email");
		Query<TodoBackbone> query = ObjectifyService.ofy().load().type(TodoBackbone.class)
				.filter("email =", LoggedInUser).order("order").limit(5);

		String cursorStr = (String) session.getAttribute("cursor");
		if (cursorStr != null) {
			query = query.startAt(Cursor.fromWebSafeString(cursorStr));
		}
		boolean continu = false;
		QueryResultIterator<TodoBackbone> iterator = query.iterator();
		while (iterator.hasNext()) {
			TodoBackbone todo = iterator.next();
			todoList.add(todo);
			continu = true;
		}

		if (continu) {
			Cursor cursor = iterator.getCursor();
			String cursorValue = cursor.toWebSafeString();
			session.setAttribute("cursor", cursorValue);

		}

		Gson gson = new Gson();
		String todoJsonObj = gson.toJson(todoList);
		System.out.println(todoJsonObj);
		return todoJsonObj;
	}

	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public @ResponseBody String todoSaveOnEnter(HttpServletRequest request, HttpServletResponse response,
			@RequestBody String todoJsonObj) throws IOException, ServletException {
		Gson gson = new Gson();
		TodoBackbone todoSave = gson.fromJson(todoJsonObj, TodoBackbone.class);
		ObjectifyService.ofy().save().entity(todoSave).now();
		return "Saved";
	}

}

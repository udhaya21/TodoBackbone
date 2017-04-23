package com.testing;

import com.googlecode.objectify.annotation.Cache;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Entity
@Cache
public class TodoBackbone {
	// Logger log = Logger.getLogger(todoBackbone.class.getName());
	// @Parent Key todoList;

	
	
	@Index String email;

	public String getEmailId() {
		return email;
	}

	public void setEmailId(String email) {
		this.email = email;
	}
	
	@Id
	String key;
	
	

	@Index String title;
	@Index Boolean completed;

	public String getId() {
		return key;
	}

	public void setId(String key) {
		this.key = key;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Boolean getCompleted() {
		return completed;
	}

	public void setCompleted(Boolean completed) {
		this.completed = completed;
	}

}

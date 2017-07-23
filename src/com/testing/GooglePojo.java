package com.testing;

import java.io.Serializable;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;

@PersistenceCapable
public class GooglePojo implements Serializable {
	/**
	* 
	*/
	private static final long serialVersionUID = 1L;
	@Persistent
	String picture;

	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	@Persistent
	String id;

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Persistent
	String token;

	public String getToken() {
		return this.token;

	}

	public void setToken(String token) {
		this.token = token;
	}

	@Persistent
	String email;

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Persistent
	boolean verified_email;

	public boolean isVerified_email() {
		return this.verified_email;
	}

	public void setVerified_email(boolean verified_email) {
		this.verified_email = verified_email;
	}

	@Persistent
	String password;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Persistent
	String name;

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Persistent
	String given_name;

	public String getGiven_name() {
		return this.given_name;
	}

	public void setGiven_name(String given_name) {
		this.given_name = given_name;
	}

	@Persistent
	String family_name;

	public String getFamily_name() {
		return this.family_name;
	}

	public void setFamily_name(String family_name) {
		this.family_name = family_name;
	}

	public String toString() {
		return

		"GooglePojo [id=" + this.id + ", email=" + this.email + ", verified_email=" + this.verified_email + ", name="
				+ this.name + ", given_name=" + this.given_name + ", family_name=" + this.family_name + "]";
	}
}

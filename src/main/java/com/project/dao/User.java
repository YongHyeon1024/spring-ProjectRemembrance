package com.project.dao;

public class User {

	private String user_id;
	private String user_pw;
	private String user_pw_confirm;
	private String user_motto;
	private String user_name;
	private String user_age;
	private String user_grade;
	private String user_sign_date;
	private int user_hit;
	
	
	public User() {
		super();
	}
	
	public User(String user_id, String user_pw, String user_pw_confirm, String user_motto, String user_name,
			String user_age, String user_grade, String user_sign_date, int user_hit) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_pw_confirm = user_pw_confirm;
		this.user_motto = user_motto;
		this.user_name = user_name;
		this.user_age = user_age;
		this.user_grade = user_grade;
		this.user_sign_date = user_sign_date;
		this.user_hit = user_hit;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_pw_confirm() {
		return user_pw_confirm;
	}
	public void setUser_pw_confirm(String user_pw_confirm) {
		this.user_pw_confirm = user_pw_confirm;
	}
	public String getUser_motto() {
		return user_motto;
	}
	public void setUser_motto(String user_motto) {
		this.user_motto = user_motto;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_age() {
		return user_age;
	}
	public void setUser_age(String user_age) {
		this.user_age = user_age;
	}
	public String getUser_grade() {
		return user_grade;
	}
	public void setUser_grade(String user_grade) {
		this.user_grade = user_grade;
	}
	public String getUser_sign_date() {
		return user_sign_date;
	}
	public void setUser_sign_date(String user_sign_date) {
		this.user_sign_date = user_sign_date;
	}
	public int getUser_hit() {
		return user_hit;
	}
	public void setUser_hit(int user_hit) {
		this.user_hit = user_hit;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_pw=" + user_pw + ", user_pw_confirm=" + user_pw_confirm
				+ ", user_motto=" + user_motto + ", user_name=" + user_name + ", user_age=" + user_age + ", user_grade="
				+ user_grade + ", user_sign_date=" + user_sign_date + ", user_hit=" + user_hit + "]";
	}
	
}

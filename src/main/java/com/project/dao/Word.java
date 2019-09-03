package com.project.dao;

public class Word {
	
	private String level;
	private String q_id;
	private int q_no;
	private String q_front;
	private String q_back;
	private int q_hit;
	
	
	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getQ_id() {
		return q_id;
	}
	
	public void setQ_id(String q_id) {
		this.q_id = q_id;
	}
	
	public int getQ_no() {
		return q_no;
	}
	
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	
	public String getQ_front() {
		return q_front;
	}
	
	public void setQ_front(String q_front) {
		this.q_front = q_front;
	}
	
	public String getQ_back() {
		return q_back;
	}
	
	public void setQ_back(String q_back) {
		this.q_back = q_back;
	}
	
	public int getQ_hit() {
		return q_hit;
	}
	
	public void setQ_hit(int q_hit) {
		this.q_hit = q_hit;
	}

	@Override
	public String toString() {
		return "Word [q_id=" + q_id + ", q_no=" + q_no + ", q_front=" + q_front + ", q_back=" + q_back + ", q_hit="
				+ q_hit + "]";
	}

	
}

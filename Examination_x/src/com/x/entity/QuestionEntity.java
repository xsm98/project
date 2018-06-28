package com.x.entity;

public class QuestionEntity {
	
	private int qus_id;
	private String qus_stion;
	private String qus_A;
	private String qus_B;
	private String qus_C;
	private String qus_D;
	private String qus_answer;
	private int subject_type;
	public int getQus_id() {
		return qus_id;
	}
	public void setQus_id(int qus_id) {
		this.qus_id = qus_id;
	}
	public String getQus_stion() {
		return qus_stion;
	}
	public void setQus_stion(String qus_stion) {
		this.qus_stion = qus_stion;
	}
	public String getQus_A() {
		return qus_A;
	}
	public void setQus_A(String qus_A) {
		this.qus_A = qus_A;
	}
	public String getQus_B() {
		return qus_B;
	}
	public void setQus_B(String qus_B) {
		this.qus_B = qus_B;
	}
	public String getQus_C() {
		return qus_C;
	}
	public void setQus_C(String qus_C) {
		this.qus_C = qus_C;
	}
	public String getQus_D() {
		return qus_D;
	}
	public void setQus_D(String qus_D) {
		this.qus_D = qus_D;
	}
	public String getQus_answer() {
		return qus_answer;
	}
	public void setQus_answer(String qus_answer) {
		this.qus_answer = qus_answer;
	}
	public int getSubject_type() {
		return subject_type;
	}
	public void setSubject_type(int subject_type) {
		this.subject_type = subject_type;
	}
	public QuestionEntity(int qus_id, String qus_stion, String qus_answer,
			int subject_type) {
		super();
		this.qus_id = qus_id;
		this.qus_stion = qus_stion;
		this.qus_answer = qus_answer;
		this.subject_type = subject_type;
	}
	public QuestionEntity(int qus_id, String qus_stion, String qus_A, String qus_B,
			String qus_C, String qus_D) {
		super();
		this.qus_id=qus_id;
		this.qus_stion = qus_stion;
		this.qus_A = qus_A;
		this.qus_B = qus_B;
		this.qus_C = qus_C;
		this.qus_D = qus_D;
	}
	
	
}

package com.x.entity;

public class StudentEntity {

	private  int stu_id;
	private String stu_name;
	private  int stu_age;
	private String stu_sex;
	private  int stu_classId;
	private String stu_addres;
	private int stu_phone;
	private String  stu_pwd;
	public String getStu_pwd() {
		return stu_pwd;
	}
	public void setStu_pwd(String stu_pwd) {
		this.stu_pwd = stu_pwd;
	}
	public int getStu_id() {
		return stu_id;
	}
	public void setStu_id(int stu_id) {
		this.stu_id = stu_id;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public int getStu_age() {
		return stu_age;
	}
	public void setStu_age(int stu_age) {
		this.stu_age = stu_age;
	}
	public String getStu_sex() {
		return stu_sex;
	}
	public void setStu_sex(String stu_sex) {
		this.stu_sex = stu_sex;
	}
	public int getStu_classId() {
		return stu_classId;
	}
	public void setStu_classId(int stu_classId) {
		this.stu_classId = stu_classId;
	}
	public String getStu_addres() {
		return stu_addres;
	}
	public void setStu_addres(String stu_addres) {
		this.stu_addres = stu_addres;
	}
	public int getStu_phone() {
		return stu_phone;
	}
	public void setStu_phone(int stu_phone) {
		this.stu_phone = stu_phone;
	}
	public StudentEntity(int stu_id, String stu_name, int stu_age,
			String stu_sex, int stu_classId, String stu_addres, int stu_phone) {
		super();
		this.stu_id = stu_id;
		this.stu_name = stu_name;
		this.stu_age = stu_age;
		this.stu_sex = stu_sex;
		this.stu_classId = stu_classId;
		this.stu_addres = stu_addres;
		this.stu_phone = stu_phone;
	}
	
	
	
	
	
	
	
}

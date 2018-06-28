package com.x.entity;

public class ClassEntity {
  private int class_id;
  private String class_name;
  private int sum;
public int getSum() {
	return sum;
}
public void setSum(int sum) {
	this.sum = sum;
}
public int getClass_id() {
	return class_id;
}
public void setClass_id(int class_id) {
	this.class_id = class_id;
}
public String getClass_name() {
	return class_name;
}
public void setClass_name(String class_name) {
	this.class_name = class_name;
}
public ClassEntity(int class_id, String class_name) {
	super();
	this.class_id = class_id;
	this.class_name = class_name;
}
public ClassEntity(int class_id, String class_name, int sum) {
	super();
	this.class_id = class_id;
	this.class_name = class_name;
	this.sum = sum;
}


}

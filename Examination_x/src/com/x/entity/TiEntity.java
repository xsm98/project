package com.x.entity;

public class TiEntity {
private int ti_id;
private  String ti_stion;
private String ti_A;
private String ti_B;
private String ti_C;
private String ti_D;
private int qus_id;


public int getTi_id() {
	return ti_id;
}
public void setTi_id(int ti_id) {
	this.ti_id = ti_id;
}
public String getTi_stion() {
	return ti_stion;
}
public void setTi_stion(String ti_stion) {
	this.ti_stion = ti_stion;
}
public String getTi_A() {
	return ti_A;
}
public void setTi_A(String ti_A) {
	this.ti_A = ti_A;
}
public String getTi_B() {
	return ti_B;
}
public void setTi_B(String ti_B) {
	this.ti_B = ti_B;
}
public String getTi_C() {
	return ti_C;
}
public void setTi_C(String ti_C) {
	this.ti_C = ti_C;
}
public String getTi_D() {
	return ti_D;
}
public void setTi_D(String ti_D) {
	this.ti_D = ti_D;
}
public int getQus_id() {
	return qus_id;
}
public void setQus_id(int qus_id) {
	this.qus_id = qus_id;
}
public TiEntity(String ti_stion, String ti_A, String ti_B, String ti_C,
		String ti_D, int qus_id) {
	super();
	this.ti_stion = ti_stion;
	this.ti_A = ti_A;
	this.ti_B = ti_B;
	this.ti_C = ti_C;
	this.ti_D = ti_D;
	this.qus_id = qus_id;
}
	

	
}

package com.x.entity;

public class AdminEntity {
  private int id;
  private String userName;
  private String userpwd;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getUserpwd() {
	return userpwd;
}
public void setUserpwd(String userpwd) {
	this.userpwd = userpwd;
}
public AdminEntity(int id, String userName, String userpwd) {
	super();
	this.id = id;
	this.userName = userName;
	this.userpwd = userpwd;
}
	

}

package com.x.entity;

public class PaperEntity {
    private int paper_id;
    private String paper_name;
    private int paper_class;
    private int paper_ti;
	public int getPaper_id() {
		return paper_id;
	}
	public void setPaper_id(int paper_id) {
		this.paper_id = paper_id;
	}
	public String getPaper_name() {
		return paper_name;
	}
	public void setPaper_name(String paper_name) {
		this.paper_name = paper_name;
	}
	public int getPaper_class() {
		return paper_class;
	}
	public void setPaper_class(int paper_class) {
		this.paper_class = paper_class;
	}
	public int getPaper_ti() {
		return paper_ti;
	}
	public void setPaper_ti(int paper_ti) {
		this.paper_ti = paper_ti;
	}
	public PaperEntity(int paper_id, String paper_name, int paper_class,
			int paper_ti) {
		super();
		this.paper_id = paper_id;
		this.paper_name = paper_name;
		this.paper_class = paper_class;
		this.paper_ti = paper_ti;
	}
    
	
	
}

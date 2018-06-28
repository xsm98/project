package com.x.util;

import java.util.ArrayList;

public class PageModel<T> {

	private int pageNo;//��ǰҳ��
	private int pageSize;//��ʾ����
	private int count;//�ܼ�¼��
	private int pageFirst=1;
	private ArrayList<T> list;//��ʾ����
    public int getPageFirst() {
		return pageFirst;
	}
	public void setPageFirst(int pageFirst) {
		this.pageFirst = pageFirst;
	}

	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public ArrayList<T> getList() {
		return list;
	}
	public void setList(ArrayList<T> list) {
		this.list = list;
	}
    
	//���ҳ��
	public int Max(){
		int num=0;
		  if(count%pageSize==0){
			num=count/pageSize;
			  
		  }else{
			  num=count/pageSize+1;
		  }
		return num;
	}
	
	//��ҳ
  public int getFirst(){
	  return pageFirst;
  }
	
  //��һҳ
	public int getup(){
	 if(pageNo>=Max()){
		 return Max();
	 }else {
		 return pageNo+1;
	 }
		
	}
	//��һҳ
	public int getDow(){
		if(pageNo<=1){
			return getFirst();
		}else{
			return pageNo-1;
		}
	}
	
	//βҳ
	public int getEnd(){
		return Max();
	}
}

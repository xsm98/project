package com.x.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.x.entity.StudentEntity;
import com.x.util.DB;
import com.x.util.PageModel;

public class StudentDao {

Connection con;
PreparedStatement smt;
ResultSet rs;
 DB db=new DB();
	//查询学生信息
 
   public PageModel<StudentEntity>  getStu(int pageNo,int pageSize){
	   PageModel<StudentEntity> pm=new PageModel<StudentEntity>();
	   ArrayList<StudentEntity> list =new ArrayList<StudentEntity>();
	   con=db.getcon();
	   String sql="select *from student LIMIT "+(pageNo-1)*pageSize+","+pageSize+"";
	   try {
		smt=con.prepareStatement(sql);
		rs=smt.executeQuery();
		while(rs.next()){
StudentEntity stu=new StudentEntity(rs.getInt(1),rs.getString(2) , rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getInt(7));
		  list.add(stu);
		  }
		    pm.setList(list);
			pm.setPageNo(pageNo);
			pm.setPageSize(pageSize);
			pm.setCount(getcount());
			
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   return pm;
   }
	  
	  //添加学生信息 
	  public boolean getStuAdd(String user,int age,String sex,int Class,String addres,int phone,String stu_pwd){
		  boolean flag=false;
		  con=db.getcon();
		  String sql="insert into student(stu_name,stu_age,stu_sex,stu_classId,stu_addres,stu_phone,stu_pwd)  values(?,?,?,?,?,?,?);";
		  try {
			smt=con.prepareStatement(sql);
			smt.setString(1, user);
			smt.setInt(2, age);
			smt.setString(3, sex);
			smt.setInt(4, Class);
			smt.setString(5, addres);
			smt.setInt(6, phone);
			smt.setString(7, stu_pwd);
			int num=smt.executeUpdate();
			if(num>0){
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
		  return flag;
	  }
	  
	  //修改
	  public boolean getStuUpdate(int stu_id, String user,int age,String sex,int Class,String addres,int phone,String stu_pwd){
		  boolean flag=false;
		  con=db.getcon();
		  String sql="update student set stu_name=?,stu_age=?,stu_sex=?,stu_classId=?,stu_addres=?,stu_phone=?,stu_pwd=?  where stu_id=?";
		  try {
			smt=con.prepareStatement(sql);
			smt.setString(1, user);
			smt.setInt(2, age);
			smt.setString(3, sex);
			smt.setInt(4, Class);
			smt.setString(5, addres);
			smt.setInt(6, phone);
			smt.setString(7, stu_pwd);
			smt.setInt(8, stu_id);
			int num =smt.executeUpdate();
			if(num>0){
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
		  return flag;
	  }
	  //删除
	  public boolean getStuDelete(int id){
		  boolean flag=false;
		  con=db.getcon();
		  String sql="delete from student where stu_id=? ";
		  try {
			smt=con.prepareStatement(sql);
			smt.setInt(1, id);
			int num =smt.executeUpdate();
			if(num>0){
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  return flag;
	  }
	  //查询学生总条数
	  public int getcount(){
		  int num=0;
		  con=db.getcon();
		  String sql="select count(*) from student";
		  try {
			smt=con.prepareStatement(sql);
			rs=smt.executeQuery();
			if(rs.next()){
				num=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return num;
	  }
	 //模糊查询
	  public ArrayList<StudentEntity> stu(String zi,int pageNo,int pageSize){
		  ArrayList<StudentEntity> list =new ArrayList<StudentEntity>();
		  con=db.getcon();
		  String sql="select * from student where stu_name like '%?%' LIMIT "+(pageNo-1)*pageSize+","+pageSize+"";
		  try {
			smt=con.prepareStatement(sql);
			smt.setString(1, zi);
			rs=smt.executeQuery();
			if(rs.next()){
				StudentEntity stu=new StudentEntity(rs.getInt(1),rs.getString(2) , rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getInt(7));  
				list.add(stu);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  return list;
	  }
	  
	 
}

package com.x.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.x.entity.SubjectEntity;
import com.x.util.DB;


public class SubjectDao {
	DB db=new DB();
	Connection con;
	PreparedStatement smt;
	ResultSet rs;
	//查询科目总数
	public int getCount(){
		int num=0;
		con=db.getcon();
		String sql="select count(*) from subject; ";
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
	//查询科目信息
	public ArrayList<SubjectEntity>  getSubject(){
		ArrayList<SubjectEntity> list =new ArrayList<SubjectEntity>();
		  con=db.getcon();
		  String sql="select* from subject";
		  try {
			smt=con.prepareStatement(sql);
			rs=smt.executeQuery();
			while(rs.next()){
		SubjectEntity se=new SubjectEntity(rs.getInt(1), rs.getString(2));
		list.add(se);
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	//添加科目
	public boolean getSubjectAdd(String subjectName){
		boolean flag=false;
		con=db.getcon();
		String sql="insert into  subject(subject_name) values(?)";
		try {
			smt=con.prepareStatement(sql);
			smt.setString(1, subjectName);
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

	
	//返回该科目是否可以删除
	public int getpd(int id){
		int num=0;
		con=db.getcon();
		String sql="select count(*)>0 from question  where subject_type=?";
		try {
			smt=con.prepareStatement(sql);
			smt.setInt(1, id);
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
	
	//删除科目
	public boolean getSubjectDelete(int id){
		boolean flag=false;
		con=db.getcon();
		String sql="delete from subject where subject_id=?";
		try {
			smt=con.prepareStatement(sql);
			smt.setInt(1, id);
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
}

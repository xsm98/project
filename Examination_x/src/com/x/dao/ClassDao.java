package com.x.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.x.entity.ClassEntity;
import com.x.util.DB;

public class ClassDao {

	DB db=new DB();
	Connection con;
	PreparedStatement smt;
	ResultSet rs;
	//查询班级总数目
	public int getCount(){
		int num=0;
		con=db.getcon();
		String sql="select count(*) from class; ";
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
	
	//查询班级信息
	public ArrayList<ClassEntity>  getclass(){
		ArrayList<ClassEntity> list =new ArrayList<ClassEntity>();
		  con=db.getcon();
		  String sql="select class_id,class_name ,count(*) as '总人数'  from student, class where  stu_classId=class_id GROUP BY stu_classId";
		  try {
			smt=con.prepareStatement(sql);
			rs=smt.executeQuery();
			while(rs.next()){
				ClassEntity cs=new ClassEntity(rs.getInt(1), rs.getString(2), rs.getInt(3));
				list.add(cs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	//返回该班级是否可以删除
	public int getJudge(int id){
		int num=0;
		con=db.getcon();
		String sql="select count(*)>0 from student where  stu_classId=?";
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
	
	public boolean getClassDelete(int id){
		boolean flag=false;
		con=db.getcon();
		String sql="delete from class where class_id=?;";
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

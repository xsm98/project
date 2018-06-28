package com.x.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.x.entity.AdminEntity;
import com.x.entity.PaperEntity;
import com.x.entity.TiEntity;
import com.x.util.DB;

public class AdminDao {
	DB db=new DB();
	Connection con;
	PreparedStatement smt;
	ResultSet rs;
	
	//查询管理员用户名和密码是否正确
	public boolean getAdmin(String userName,String userpwd){
		boolean flag=false;
		con=db.getcon();
		String sql="select *from admin where userName=? and userpwd=?";
		try {
			smt=con.prepareStatement(sql);
			smt.setString(1, userName);
			smt.setString(2, userpwd);
			rs=smt.executeQuery();
			while(rs.next()){
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	//查询管理员的信息
	public ArrayList<AdminEntity> getSelect(){
		ArrayList<AdminEntity> list =new ArrayList<AdminEntity>();
		con=db.getcon();
		String sql="select *from admin";
		try {
			smt=con.prepareStatement(sql);
			rs=smt.executeQuery();
			while(rs.next()){
				AdminEntity aEntity=new AdminEntity(rs.getInt(1), rs.getString(2), rs.getString(3));
				list.add(aEntity);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	//添加管理员
	public boolean getAdminAdd(String userName, String userpwd){
		boolean flag=false;
      con=db.getcon();
      String sql="insert into admin(userName,userpwd)  values (?,?);";
      try {
		smt=con.prepareStatement(sql);
		smt.setString(1, userName);
		smt.setString(2, userpwd);
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
	
	//查询学生登录是否正确
	public int getStuLogin(int  stuId,String stu_pwd){
		int num=0;
		con=db.getcon();
		String sql ="select  stu_classId from student where stu_id=?  and stu_pwd=?";
		try {
			smt=con.prepareStatement(sql);
			smt.setInt(1, stuId);
			smt.setString(2, stu_pwd);
			rs=smt.executeQuery();
			while(rs.next()){
				num=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}
	
	//根据班级id查询有多少张试卷
	public  ArrayList<PaperEntity> getPaper(int paper_class){
		ArrayList<PaperEntity> list=new ArrayList<PaperEntity>();
		con=db.getcon();
		String sql="select  *from paper where paper_class=?";
		try {
			smt=con.prepareStatement(sql);
			smt.setInt(1, paper_class);
			rs=smt.executeQuery();
			while(rs.next()){
				PaperEntity pa=new PaperEntity(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4));
				list.add(pa);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list ;
	}
	
	//根据试卷id查询该试卷考题
	public ArrayList<TiEntity> getTi(int paper_id){
		ArrayList<TiEntity> list =new ArrayList<TiEntity>();
		con=db.getcon();
		String sql="select *from ti where ti_id=?";
		try {
			smt=con.prepareStatement(sql);
			smt.setInt(1, paper_id);
			rs=smt.executeQuery();
			while(rs.next()){
				TiEntity tiEntity=new TiEntity(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
			  list.add(tiEntity);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	
	//根据题目id查询题目正确答案
	public String getAnswer(int qus_id){
		String Answer=null;
		con=db.getcon();
		String sql="select qus_answer from question where qus_id=?";
		try {
			smt=con.prepareStatement(sql);
			smt.setInt(1, qus_id);
			rs=smt.executeQuery();
			if(rs.next()){
				Answer=rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Answer;
	}
}

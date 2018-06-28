package com.x.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.x.entity.QuestionEntity;
import com.x.util.DB;
import com.x.util.PageModel;

public class QuestionDao {
	DB db=new DB();
	Connection con;
	PreparedStatement smt;
	ResultSet rs;
/*	
	public ArrayList<QuestionEntity>  getQuestion(){
		ArrayList<QuestionEntity> list =new ArrayList<QuestionEntity>();
		  con=db.getcon();
		  String sql="select  qus_id,qus_stion,qus_answer,subject_type from question";
		  try {
			smt=con.prepareStatement(sql);
			rs=smt.executeQuery();
			while(rs.next()){
				QuestionEntity qu=new QuestionEntity(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
				list.add(qu);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	*/
	//分页查询题目
	public  PageModel<QuestionEntity> getQuestion(int pageNo,int pageSize){
		PageModel<QuestionEntity>  pm= new PageModel<QuestionEntity>();
		ArrayList<QuestionEntity> list=new ArrayList<QuestionEntity>();
		con=db.getcon();
		String sql="select qus_id,qus_stion,qus_answer,subject_type from question LIMIT "+(pageNo-1)*pageSize+","+pageSize+"";
		try {                                               
			smt=con.prepareStatement(sql);
			rs=smt.executeQuery();
			while(rs.next()){
				QuestionEntity qu=new QuestionEntity(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));	
				list.add(qu);
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
      
	//查询题目总数
	public int getcount(){
		int num=0;
		con=db.getcon();
		String sql="select count(*) from question";
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
	
	//插入式题
	public boolean getAddQuestion(String title, String qus_A,String qus_B,String qus_C,String qus_D,String qus_answer,int subject_type){
		boolean flag=false;
		con=db.getcon();
		String sql="insert into question(qus_stion,qus_A,qus_B,qus_C,qus_D,qus_answer,subject_type) values(?,?,?,?,?,?,?);";
        try {
			smt=con.prepareStatement(sql);
			smt.setString(1, title);
			smt.setString(2, qus_A);
			smt.setString(3, qus_B);
			smt.setString(4, qus_C);
			smt.setString(5, qus_D);
			smt.setString(6, qus_answer);
			smt.setInt(7, subject_type);
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
	
	//删除试题
	public boolean getQuestionDelete(int id){
		boolean flag=false;
		con=db.getcon();
		String sql="delete from question where qus_id=?";
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
	
	//根据类型查询有多少题目
	public int getQuestionType(int type){
		int count=0;
		con=db.getcon();
		String sql="select  count(*) from  question  where subject_type=?";
		try {
			smt=con.prepareStatement(sql);
			smt.setInt(1, type);
			rs=smt.executeQuery();
			if(rs.next()){
				count=rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
}

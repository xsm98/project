package com.x.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.x.entity.QuestionEntity;
import com.x.util.DB;

public class PaperDao {
	Connection con;
	PreparedStatement smt;
	ResultSet rs;
	 DB db=new DB();

	 //插入试卷信息
	 public boolean getPaperAdd(String paper_name,int paper_class,int paper_ti){
		 boolean flag=false;
		 con=db.getcon();
		 String sql ="insert into paper(paper_name,paper_class,paper_ti) values(?,?,?);";
		 try {
			smt=con.prepareStatement(sql);
			smt.setString(1,paper_name);
			smt.setInt(2, paper_class);
			smt.setInt(3, paper_ti);
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
	 
	 //插入考试的试题
	 public boolean getTiAdd(int paper_id,String qus_stion,String qus_A,String qus_B,String qus_C,String qus_D,int qus_id){
      boolean flag=false;
		 con=db.getcon();
		String sql="insert into  ti values(?,?,?,?,?,?,?);";
		try {
			smt=con.prepareStatement(sql);
			smt.setInt(1, paper_id);
			smt.setString(2, qus_stion);
			smt.setString(3, qus_A);
			smt.setString(4, qus_B);
			smt.setString(5, qus_C);
			smt.setString(6, qus_D);
			smt.setInt(7, qus_id);
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
	 
	 //根据试卷名字查询试卷id
	 public int getPaperId(String paper_name){
		 int num =0;
		 con=db.getcon();
		 String sql="select paper_id from paper where paper_name=?";
		 try {
			smt=con.prepareStatement(sql);
			smt.setString(1, paper_name);
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
	 
	 //根据科目类型和题目数量生成提目
	 public ArrayList<QuestionEntity> getTypeNum(int subject_type,int num){
		 ArrayList<QuestionEntity> list=new ArrayList<QuestionEntity>();
		 con=db.getcon();
		 String sql="select qus_id, qus_stion,qus_A,qus_B,qus_C,qus_D from question  where subject_type=? order by RAND() limit  ?";
		 try {
			smt=con.prepareStatement(sql);
			smt.setInt(1, subject_type);
			smt.setInt(2, num);
			rs=smt.executeQuery();
			while(rs.next()){
				QuestionEntity qu=new QuestionEntity(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
			   list.add(qu);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return list;
	 }
	 
	 //根据试卷id查询试卷题目总数量
	 public int getPaperTi(int paperid){
		 int num=0;
		 con=db.getcon();
		 String sql ="select paper_ti from paper where paper_id=? ";
		 try {
			smt=con.prepareStatement(sql);
			smt.setInt(1, paperid);
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
}

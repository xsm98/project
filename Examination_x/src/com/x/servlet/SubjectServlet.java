package com.x.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.x.dao.QuestionDao;
import com.x.dao.SubjectDao;
import com.x.entity.SubjectEntity;

/**
 * Servlet implementation class SubjectServlet
 */
public class SubjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    SubjectDao sDao=new SubjectDao();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<SubjectEntity> list =new ArrayList<SubjectEntity>();
		list=sDao.getSubject();
		response.setContentType("application/json;charset=utf-8");
//		HashMap<String , ArrayList<SubjectEntity>> data=new HashMap<String , ArrayList<SubjectEntity>>();
//		data.put("data", list);
		PrintWriter pw=response.getWriter();
		pw.write(JSON.toJSONString(list));
		pw.flush();
		pw.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	QuestionDao qDao=new QuestionDao();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int  subject_type=Integer.parseInt(request.getParameter("subject"));
		int data=Integer.parseInt(request.getParameter("data"));
		 int count=qDao.getQuestionType(data);
		response.setContentType("application/json;charset=utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(JSON.toJSONString(count));
		pw.flush();
		pw.close();
	}

}

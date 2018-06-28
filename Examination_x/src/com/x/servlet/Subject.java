package com.x.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.x.dao.SubjectDao;
import com.x.entity.SubjectEntity;

/**
 * Servlet implementation class Subject
 */
public class Subject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Subject() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	SubjectDao sDao=new SubjectDao();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");    
		     String op=request.getParameter("op");
		     if(op.equals("select")||"".equals(op)){
			    	ArrayList<SubjectEntity> list=new ArrayList<SubjectEntity>();
			         list=sDao.getSubject();
			         int count=sDao.getCount();
			    	request.setAttribute("list", list);
			    	request.setAttribute("count", count);
			    	request.getRequestDispatcher("HT/subjectManage.jsp").forward(request, response);
			    
			    }else if(op.equals("add")){
			    	String subjectName=request.getParameter("subjectName");
			    	boolean flag=sDao.getSubjectAdd(subjectName);
			    	if(flag){
			    		  request.getRequestDispatcher("Subject?op=select").forward(request, response);
			    	}else{
			    		request.getRequestDispatcher("err.jsp").forward(request, response);
			    	}
			    }else if(op.equals("delete")){
			    	int id=Integer.parseInt(request.getParameter("id") );
			    	boolean flag=sDao.getSubjectDelete(id);
			    	if(flag){
			    		 request.getRequestDispatcher("Subject?op=select").forward(request, response);
			    	}else{
			    		request.getRequestDispatcher("err.jsp").forward(request, response);
			    	}
			    	
			    }
	}

}

package com.x.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.x.dao.ClassDao;
import com.x.entity.ClassEntity;

/**
 * Servlet implementation class ClassServlet
 */
public class ClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int  id=Integer.parseInt(request.getParameter("id"));
//		 ClassDao classDao=new ClassDao();
//		int num=classDao.getJudge(id);
//		boolean flag=(num==0);
//		 response.setContentType("application/json;charset=utf-8");
//		 PrintWriter pw=response.getWriter();
		doPost(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ClassDao classDao=new ClassDao();
		  String op=request.getParameter("op");
		  if(op.equals("class")||"".equals(op)){
			  int count=classDao.getCount();
			  request.setAttribute("count", count);
			  ArrayList<ClassEntity> list=classDao.getclass();
			  request.setAttribute("list", list);
			  request.getRequestDispatcher("HT/ClassManage.jsp").forward(request, response);
		  }else if(op.equals("delete")){
			   int id=Integer.parseInt(request.getParameter("id"));
			   boolean flag=classDao.getClassDelete(id);
			   if(flag){
				   request.getRequestDispatcher("ClassServlet?op=class").forward(request, response);
			   }else{
				   request.getRequestDispatcher("err.jsp").forward(request, response);
			   }
		  }
		  
	}

}

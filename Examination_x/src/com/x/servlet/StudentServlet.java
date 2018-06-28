package com.x.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.x.dao.StudentDao;
import com.x.entity.StudentEntity;
import com.x.util.PageModel;

/**
 * Servlet implementation class StudentServlet
 */
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public StudentServlet() {
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
	 */StudentDao studao=new StudentDao();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
		request.setCharacterEncoding("utf-8");
		String op=request.getParameter("op");
		    if(op.equals("select")||"".equals(op)){
		    	int pageNo=Integer.parseInt(request.getParameter("pageNo"));
		    	request.setAttribute("pageNo", pageNo);
		    PageModel<StudentEntity> pm=new PageModel<StudentEntity>();
		         pm=studao.getStu(pageNo, 5);
		    	request.setAttribute("pm", pm);
		    	request.getRequestDispatcher("HT/StudentManage.jsp").forward(request, response);
		    
		    }else if(op.equals("add")){
		    	String user=request.getParameter("user");
		    	int age=Integer.parseInt(request.getParameter("age"));
		    	String sex=request.getParameter("sex");
		    	int Class=Integer.parseInt(request.getParameter("class"));
		    	String addres=request.getParameter("addres");
		    	int phone=Integer.parseInt(request.getParameter("phone"));
		    	String stu_pwd=request.getParameter("stu_pwd");
		         boolean flag=studao.getStuAdd(user, age, sex, Class, addres, phone,stu_pwd);
		         if(flag){
		        	 request.getRequestDispatcher("StudentServlet?op=select&pageNo=1").forward(request, response);
		         }else{
		        	 request.getRequestDispatcher("err.jsp").forward(request, response);
		         }
		    }else if(op.equals("update")){
		    	int id=Integer.parseInt(request.getParameter("id"));
		    	String user=request.getParameter("user");
		    	int age=Integer.parseInt(request.getParameter("age"));
		    	String sex=request.getParameter("sex");
		    	int Class=Integer.parseInt(request.getParameter("class"));
		    	String addres=request.getParameter("addres");
		    	int phone=Integer.parseInt(request.getParameter("phone"));
		    	String stu_pwd=request.getParameter("stu_pwd");
		    	boolean flag=studao.getStuUpdate(id, user, age, sex, Class, addres, phone,stu_pwd);
		    	if(flag){
		    		request.getRequestDispatcher("StudentServlet?op=select&pageNo=1").forward(request, response);
		    	}else {
		    		request.getRequestDispatcher("err.jsp").forward(request, response);
		    	}
		    }else if(op.equals("delete")){
		    	int id=Integer.parseInt(request.getParameter("id"));
		    	boolean flag=studao.getStuDelete(id);
		    	if(flag){
		    		request.getRequestDispatcher("StudentServlet?op=select&pageNo=1").forward(request, response);
		    	}else{
		    		request.getRequestDispatcher("err.jsp").forward(request, response);
		    	}
		    }else if(op.equals("stu")){
		    	String zi=request.getParameter("zi");
		    	int pageNo=Integer.parseInt(request.getParameter("pageNo"));
		    	ArrayList<StudentEntity> list=new ArrayList<StudentEntity>();
		         list=studao.stu(zi, pageNo, 1);
		    	request.setAttribute("stu", list);
		    	System.out.println("1234654");
		    	request.getRequestDispatcher("HT/StudentManage.jsp").forward(request, response);
		    	
		    }
		   
		
	}

}

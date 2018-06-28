package com.x.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.x.dao.AdminDao;
import com.x.entity.AdminEntity;

/**
 * Servlet implementation class AdminServlet
 */
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
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
	AdminDao aDao=new AdminDao();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String op=request.getParameter("op");  
		if(op.equals("yz")){
		  String userName=request.getParameter("userName");
		   String  userpwd=request.getParameter("userpwd");
		   boolean flag=aDao.getAdmin(userName, userpwd);
		   if(flag){
			   request.getRequestDispatcher("HT/index.jsp").forward(request, response);
		   }else{
			   request.getRequestDispatcher("login/demo.jsp").forward(request, response);
		   }
		}else if(op.equals("select")||"".equals(op)){
			ArrayList<AdminEntity> list=new ArrayList<AdminEntity>();
			list=aDao.getSelect();
			request.setAttribute("list", list);
			request.getRequestDispatcher("HT/admin.jsp").forward(request, response);
		}else if(op.equals("add")){
			String userName=request.getParameter("userName");
			String  userpwd=request.getParameter("userpwd");
			boolean flag=aDao.getAdminAdd(userName, userpwd);
			if(flag){
				request.getRequestDispatcher("AdminServlet?op=select").forward(request, response);
			}else{
				 request.getRequestDispatcher("err.jsp").forward(request, response);
			}
		}else if(op.equals("stuyz")){
			String stuPwd=request.getParameter("stuPwd");
			   int  stuId=Integer.parseInt(request.getParameter("stuId"));
			    int class_id=aDao.getStuLogin(stuId, stuPwd);
			    request.setAttribute("class_id", class_id);
			if(class_id>0){
				request.getRequestDispatcher("HT/choose.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("login/demo.jsp").forward(request, response);
			}
		}
	}

}

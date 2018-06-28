package com.x.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.x.dao.AdminDao;
import com.x.entity.TiEntity;

/**
 * Servlet implementation class ScoreServlet
 */
public class ScoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScoreServlet() {
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
		  int count=Integer.parseInt(request.getParameter("count"));
		  int  qusid;
		  String answer;
		  int num=0;
		  int zong=count*2;
		  for(int i=1;i<=count;i++){
					  answer=request.getParameter("answer1"+i+"");
					  qusid=Integer.parseInt(request.getParameter("qusid"+i+""));
					  String a=aDao.getAnswer(qusid);
					  if(a.equals(answer)){
						  num=num+2;
					  }
		  }
		  request.setAttribute("num", num);
		  request.setAttribute("count", count);
		  request.setAttribute("zong", zong);
	     request.getRequestDispatcher("login/settlement.jsp").forward(request, response);
	}

}

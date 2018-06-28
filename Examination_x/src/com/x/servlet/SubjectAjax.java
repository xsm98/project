package com.x.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.x.dao.SubjectDao;

/**
 * Servlet implementation class SubjectAjax
 */
public class SubjectAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    SubjectDao sDao=new SubjectDao();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   int id=Integer.parseInt(request.getParameter("id"));
		   int q=sDao.getpd(id);
		   boolean flag;
		  if(q>0){
			  flag=true;
		  }else{
			  flag=false;
		  }
		  response.setContentType("application/json;charset=utf-8");
		  PrintWriter pw=response.getWriter();
		    pw.write(JSON.toJSONString(flag));
		    pw.flush();
		    pw.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}

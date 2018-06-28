package com.x.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.x.dao.ClassDao;
import com.x.entity.ClassEntity;

/**
 * Servlet implementation class ClassAjax
 */
public class ClassAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    ClassDao classDao=new ClassDao();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   ArrayList<ClassEntity> list=new ArrayList<ClassEntity>();
		   list=classDao.getclass();
		   response.setContentType("application/json;charset=utf-8");
		   PrintWriter pw=response.getWriter();
			pw.write(JSON.toJSONString(list));
			pw.flush();
			pw.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    int id=Integer.parseInt(request.getParameter("id"));
		 int   q=classDao.getJudge(id);
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

}

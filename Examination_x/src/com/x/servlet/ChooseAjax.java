package com.x.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.x.dao.AdminDao;
import com.x.dao.PaperDao;
import com.x.entity.PaperEntity;

/**
 * Servlet implementation class ChooseAjax
 */
public class ChooseAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChooseAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    AdminDao aDao=new AdminDao();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		     ArrayList<PaperEntity> list =new ArrayList<PaperEntity>();
		     int class_id=Integer.parseInt(request.getParameter("data"));
		     list=aDao.getPaper(class_id);
		     response.setContentType("application/json;charset=utf-8");
		     PrintWriter pw=response.getWriter();
				pw.write(JSON.toJSONString(list));
				pw.flush();
				pw.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	PaperDao pDao=new PaperDao();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int paperid=Integer.parseInt(request.getParameter("data"));
	      int count=pDao.getPaperTi(paperid);
	      response.setContentType("application/json;charset=utf-8");
		   PrintWriter pw=response.getWriter();
			pw.write(JSON.toJSONString(count));
			pw.flush();
			pw.close();
	      
	}

}

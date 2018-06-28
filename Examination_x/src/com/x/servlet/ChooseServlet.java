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
 * Servlet implementation class ChooseServlet
 */
public class ChooseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChooseServlet() {
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
		     int paper_id=Integer.parseInt(request.getParameter("paper_class"));
		     ArrayList<TiEntity> list =new ArrayList<TiEntity>();
		     list=aDao.getTi(paper_id);
		     request.setAttribute("list", list);
		     request.getRequestDispatcher("OnlineExaminationSystem/Answer.jsp").forward(request, response);
	}

}

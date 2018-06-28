package com.x.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.x.dao.PaperDao;
import com.x.entity.QuestionEntity;

/**
 * Servlet implementation class PaperServlet
 */
public class PaperServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaperServlet() {
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
	
	PaperDao pDao=new PaperDao();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		     request.setCharacterEncoding("utf-8");
		   String paper_name=request.getParameter("paper_name");
		   int subject_id=Integer.parseInt(request.getParameter("subject_type"));
		   int paper_class=Integer.parseInt(request.getParameter("paper_class"));
		   int paper_ti=Integer.parseInt(request.getParameter("paper_ti"));
		   boolean flag=pDao.getPaperAdd(paper_name, paper_class, paper_ti);
		   int id =pDao.getPaperId(paper_name);
		   ArrayList<QuestionEntity> list=new ArrayList<QuestionEntity>();
		   list=pDao.getTypeNum(subject_id, paper_ti);
		   boolean flag1=true;
		   for(int i=0;i<list.size();i++){
			   if (flag1){
				   flag1=pDao.getTiAdd(id, list.get(i).getQus_stion(),list.get(i).getQus_A(), list.get(i).getQus_B(), list.get(i).getQus_C(), list.get(i).getQus_D(),list.get(i).getQus_id());
			   }else{
				   System.err.println("´íÎó");
				   break;
			   }
			   
		   }
		  
		   if(flag&&flag1){
			      request.getRequestDispatcher("HT/GeneratingTestPaper.jsp").forward(request, response);
		   }else{
			   request.getRequestDispatcher("err.jsp").forward(request, response);
		   }
	}

}

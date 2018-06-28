package com.x.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.x.dao.QuestionDao;
import com.x.entity.QuestionEntity;
import com.x.util.PageModel;

/**
 * Servlet implementation class QuestionServlet
 */
public class QuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionServlet() {
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
	 */QuestionDao qu=new QuestionDao();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String op=request.getParameter("op");
		if(op.equals("select")||"".equals(op)){
			int pageNo=Integer.parseInt(request.getParameter("pageNo"));
			request.setAttribute("pageNo", pageNo);
			PageModel<QuestionEntity> pm=new PageModel<QuestionEntity>();
			pm=qu.getQuestion(pageNo, 5);
			request.setAttribute("pm", pm);
	    	request.getRequestDispatcher("HT/Thetitle.jsp").forward(request, response);
		}else if(op.equals("add")){
			String title=request.getParameter("title");
			String qus_A=request.getParameter("qus_A");
			String qus_B=request.getParameter("qus_B");
			String qus_C=request.getParameter("qus_C");
			String qus_D=request.getParameter("qus_D");
			String qus_answer=request.getParameter("qus_answer");
			int  subject_type=Integer.parseInt(request.getParameter("subject_type"));
			boolean flag=qu.getAddQuestion(title, qus_A, qus_B, qus_C, qus_D, qus_answer, subject_type);
			if(flag){
				request.getRequestDispatcher("QuestionServlet?op=select&pageNo=1").forward(request, response);
			}else{
				request.getRequestDispatcher("err.jsp").forward(request, response);
			}
		}else if(op.equals("delete")){
			int id=Integer.parseInt(request.getParameter("id"));
			boolean flag=qu.getQuestionDelete(id);
			if(flag){
				request.getRequestDispatcher("QuestionServlet?op=select&pageNo=1").forward(request, response);
			}else{
				request.getRequestDispatcher("err.jsp").forward(request, response);
			}
		}
	
	
	}

}

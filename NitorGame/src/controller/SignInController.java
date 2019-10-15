package controller;

import java.io.IOException;

import javax.servlet.http.*;

import security.Password;

public class SignInController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException {
		Password pobject=new Password();
		String gname=request.getParameter("gname");
		String password=request.getParameter("password");
		
		if(pobject.verifyPassword(gname, password))
			response.sendRedirect("gamepage.jsp");
		else
			response.sendRedirect("signin.jsp");
	}
}

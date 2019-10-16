package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.*;

import dao.DBConnection;
import random.RandomGenerator;
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
		int user_id=-1;
		RandomGenerator rg=new RandomGenerator();
		HttpSession s=request.getSession();
		if(pobject.verifyPassword(gname, password)) {
			Statement st;
			try {
				st = DBConnection.getConnection().createStatement();
				ResultSet rs=st.executeQuery("select user_id from user where gname='"+gname+"'");
				if(rs.next()) {
					user_id=rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			s.setAttribute("user_id", user_id);
			int []que_seq=rg.rand_array();
			s.setAttribute("que_seq", que_seq);
			s.setAttribute("level", 1);
			s.setAttribute("hint",0);
			s.setAttribute("score", 0);
			s.setAttribute("prev_que_num", 0);
			s.setAttribute("curr_que_num", 0);
			response.sendRedirect("gamepage.jsp");
		}
		else {
			response.sendRedirect("signin.jsp");
			s.setAttribute("err_msg","Invalid Credentials");
		}
	}
}

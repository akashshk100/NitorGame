package controller;
import java.io.*;


import javax.servlet.http.*;

import options.GameOptions;
public class VerifyAnsController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException{
		GameOptions go=new GameOptions();
		String ans=request.getParameter("ans");
		int curr_que_num=(int) request.getSession().getAttribute("curr_que_num");
		int level=(int) request.getSession().getAttribute("level");
		int dmn_cnt=(int) request.getSession().getAttribute("dmn_cnt");
		int score=(int) request.getSession().getAttribute("score");
		if(go.verifyAns(curr_que_num, ans)) {
			level++;
			request.getSession().setAttribute("level",level);
			if(dmn_cnt==1) {
				score+=5;
				request.getSession().setAttribute("score",score);
			}
			else if(dmn_cnt==2) {
				score+=3;
				request.getSession().setAttribute("score",score);
			}
			else if(dmn_cnt==3) {
				score+=2;
				request.getSession().setAttribute("score",score);
			}
			else{
				score+=1;
				request.getSession().setAttribute("score",score);
			}
			dmn_cnt=1;
			request.getSession().setAttribute("dmn_cnt",dmn_cnt);
			response.sendRedirect("gamepage.jsp");
		}
		else {
			curr_que_num++;
			dmn_cnt++;
			request.getSession().setAttribute("curr_que_num",curr_que_num);
			request.getSession().setAttribute("dmn_cnt",dmn_cnt);
			response.sendRedirect("gamepage.jsp");
		}
	}
}

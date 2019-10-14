package controller;
import java.io.IOException;
import security.Password;
import javax.servlet.http.*;
import options.GameOptions;

public class SignUpController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException {
		Password pobject=new Password();
		String name=request.getParameter("name");
		String gname=request.getParameter("gname");
		String password=pobject.encrypt(request.getParameter("password"));
		
		GameOptions go=new GameOptions();
		go.addUser(name, gname, password);
		response.sendRedirect("signin.jsp");
	}
	

}

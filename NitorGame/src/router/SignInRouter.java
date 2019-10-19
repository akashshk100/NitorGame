package router;
import javax.servlet.http.*;

import java.io.IOException;

import javax.servlet.*;

public class SignInRouter extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException {
			response.sendRedirect("sigin.jsp");
	}
}

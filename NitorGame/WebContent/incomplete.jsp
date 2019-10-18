<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Registration Form</title>
  <style>
  	body {
  font: 14px/20px 'Helvetica Neue', Helvetica, Arial, sans-serif;
  color: #404040;
  background-image: url('6-min_resize_md.png');
  background-color: #2d4259;
	}
	
	a:link {
	  color: white;
	  background-color: transparent;
	  text-decoration: none;
	}
	a:visited {
	  color: white;
	  background-color: transparent;
	  text-decoration: none;
	}
	a:hover {
	  color: white;
	  background-color: transparent;
	  text-decoration: underline;
	}

.register-title {
  width: 500px;
  line-height: 43px;
  margin: 50px auto 20px;
  font-size: 19px;
  font-weight: 500;
  color: white;
  color: rgba(white, .95);
  text-align: center;
  text-shadow: 0 1px rgba(black, .3);
  background: #d7604b;
  border-radius: 3px;
  @include linear-gradient(top, #dc745e, #d45742);
  @include box-shadow(inset 0 1px rgba(white, .1),
                      inset 0 0 0 1px rgba(white, .05),
                      0 0 1px 1px rgba(black, .1),
                      0 1px 3px rgba(black, .3));
}
  </style>
</head>
<body>
	<%
	@SuppressWarnings("unchecked")
	ArrayList<Integer> un_ans=(ArrayList<Integer>) request.getSession().getAttribute("un_ans");
	int score=(int)session.getAttribute("score"); 
	%>
  <h1 class="register-title"><br><br>Sorry you could not reach the destination in stipulated attempts<br><br>Your Score:<br><%=score %><br><br></h1>
  <br><br>
  <h1 class="register-title"><a href="signin.jsp">New Game</a></h1>
</body>
</html>

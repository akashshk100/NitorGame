<%@ page import="java.sql.*"%>
<%@ page import="dao.DBConnection"%>
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
	.white-space-pre{
		white-space: pre-wrap;
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
  width: 270px;
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

.register {
  margin: 0 auto;
  width: 1000px;
  padding: 20px;
  background: #f4f4f4;
  border-radius: 3px;
  @include box-shadow(0 0 1px 1px rgba(black, .1),
                      0 1px 3px rgba(black, .3));
}

input {
  font-family: inherit;
  font-size: inherit;
  color: inherit;
  @include box-sizing(border-box);
}

.register-input {
  display: block;
  width: 100%;
  height: 38px;
  margin-top: 2px;
  font-weight: 500;
  background: none;
  border: 0;
  border-bottom: 1px solid #d8d8d8;

  &:focus {
    border-color: #1e9ce6;
    outline: 0;
  }
}

.register-button {
  display: block;
  width: 100%;
  height: 42px;
  margin-top: 25px;
  font-size: 16px;
  font-weight: bold;
  color: #494d59;
  text-align: center;
  text-shadow: 0 1px rgba(white, .5);
  background: #fcfcfc;
  border: 1px solid;
  border-color: #d8d8d8 #d1d1d1 #c3c3c3;
  border-radius: 2px;
  cursor: pointer;
  @include linear-gradient(top, #fefefe, #eee);
  @include box-shadow(inset 0 -1px rgba(black, .03),
                      0 1px rgba(black, .04));

  &:active {
    background: #eee;
    border-color: #c3c3c3 #d1d1d1 #d8d8d8;
    @include linear-gradient(top, #eee, #fcfcfc);
    @include box-shadow(inset 0 1px rgba(black, .03));
  }

  &:focus { outline: 0; }
}
  </style>
</head>
<body>

	<%
	int que_num=0;
	int curr_que_num=(int)session.getAttribute("curr_que_num");
	int prev_que_num=(int)session.getAttribute("prev_que_num");
	int dmn_cnt=(int)session.getAttribute("dmn_cnt");
	if(curr_que_num==prev_que_num){
		int []que_seq=(int[])session.getAttribute("que_seq");
		int level=(int)session.getAttribute("level");
		if(level==13){
			response.sendRedirect("complete.jsp");
		}
		else{
		que_num=4*(que_seq[level-1]-1)+1;
		session.setAttribute("curr_que_num",que_num);
		session.setAttribute("prev_que_num",que_num);
		}
	}
	else{
		prev_que_num=curr_que_num;
		session.setAttribute("prev_que_num",prev_que_num);
		que_num=curr_que_num;
	}
	if(dmn_cnt==5){
		response.sendRedirect("incomplete.jsp");
	}
	else{
		String que=null;
		String domain=null;
		Statement st=DBConnection.getConnection().createStatement();
		ResultSet rs=st.executeQuery("select que,domain from QnA where q_id="+que_num);
		if(rs.next()){
			que=rs.getString(1);
			domain=rs.getString(2);
		}
	%>
	
  <h1 class="register-title"><%=domain %></h1>
  <form class="register" action="verifyAns.html" method="post">
  	<div class="white-space-pre"><%=que %></div>
    <input type="text" name="ans" class="register-input" placeholder="Your Answer">
    <input type="submit" value="Submit" name="submit" class="register-button">
  </form>
  <%}%>
</body>
</html>

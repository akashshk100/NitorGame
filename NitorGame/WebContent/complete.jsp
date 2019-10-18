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
	
	.white-space-pre{
		white-space: pre-wrap;
		text-align: center;
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
  width: 50%;
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
	@SuppressWarnings("unchecked")
	ArrayList<Integer> un_ans=(ArrayList<Integer>) request.getSession().getAttribute("un_ans");
	System.out.println(un_ans);
	int un_ans_size=un_ans.size();
	int score=(int)session.getAttribute("score"); 
	String inst2="Congratulations you've reached your destination<br><br>Your Score:";
	%>
  <br><br>
  <form class="register">
  <br><br>
  	<div class="white-space-pre"><%=inst2 %></div><br>
  	<div class="white-space-pre"><%=score %></div><br>
  </form>
  <h1 class="register-title"><a href="signin.jsp">New Game</a></h1>
</body>
</html>

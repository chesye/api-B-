<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	String oper = request.getParameter("oper");
	
	double result = 0.0;
	if(oper.equals("+")){
		result = Double.parseDouble(num1) + Double.parseDouble(num2);
	}else if(oper.equals("-")){
		result = Double.parseDouble(num1) - Double.parseDouble(num2);
	}else if(oper.equals("*")){
		result = Double.parseDouble(num1) * Double.parseDouble(num2);
	}else if(oper.equals("/")){
		result = Double.parseDouble(num1) / Double.parseDouble(num2);
	}
%>
<%=result%>
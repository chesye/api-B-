<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//데이터 가져오기
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	String oper = request.getParameter("oper");
	
	Double num1D = Double.parseDouble(num1);
	Double num2D = Double.parseDouble(num2);
	
	Double result;
	if(oper.equals("+")){
		result= (num1D+num2D);
	}else if(oper.equals("-")){
		
	}else if(oper.equals("*")){
		
	}else if(oper.equals("/")){
		
	}else{
		
	}
	
%>
<%= result%>
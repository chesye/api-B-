<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//데이터 가져오기 위해서는 스크립트릿 사용하고
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	
	Double num1D = Double.parseDouble(num1);
	Double num2D = Double.parseDouble(num2);
	
	Double result = num1D+num2D;
	//화면에 result 출력
	//out.print(result);
%>
<%=result%>
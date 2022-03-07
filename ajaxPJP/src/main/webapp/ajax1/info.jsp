<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	
	
%>
이름 : <%= name%><br>
나이 : <%= age%><br>
연락처 : <%= phone%><br>
주소 : <%= addr%><br>
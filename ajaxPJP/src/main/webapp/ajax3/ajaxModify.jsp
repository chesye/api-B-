<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,org.json.simple.*" %>

<%
	request.setCharacterEncoding("utf-8");
	
	String departmentId = request.getParameter("departmentId");
	String departmentName = request.getParameter("departmentName");
	
	Connection conn = null;
	PreparedStatement psmt = null;
	//응답데이터를 줄 필요 없으므로 Resultset은 지운다
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "hr";
	String password = "1234";
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);
		
		//departments 테이블에 있는 모든 데이터를 가져오기 위한 sql문
		String sql = "update departments set department_name = "
						+"'"+departmentName+"'"+"where department_id="
						+departmentId;
		
		psmt = conn.prepareStatement(sql);
		
		psmt.executeUpdate();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn != null) conn.close();
		if(psmt != null) psmt.close();
	}
%>
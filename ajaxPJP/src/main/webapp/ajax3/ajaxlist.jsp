<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,org.json.simple.*" %>
<%
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "hr";
	String password = "1234";
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);
		
		//departments 테이블에 있는 모든 데이터를 가져오기 위한 sql문
		String sql = "select * from departments";
		
		psmt = conn.prepareStatement(sql);
		
		rs = psmt.executeQuery();
		
		JSONArray jArray = new JSONArray();//list개념
		
		while(rs.next()){//while문에서 next는 한번씩 접근해야한다
			JSONObject jObj = new JSONObject();//map개념
			//put : 꺼내오기
			jObj.put("department_id",rs.getInt("department_id")); //키,값
			jObj.put("department_name",rs.getString("department_name"));
			
			jArray.add(jObj);
		}
		out.print(jArray.toJSONString());//toString()은 안에있는 문자열 데이터를 가져오는것
										//반드시 toJSONString()을 사용할 것
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn != null) conn.close();
		if(psmt != null) psmt.close();
		if(rs != null) rs.close();
	}
%>
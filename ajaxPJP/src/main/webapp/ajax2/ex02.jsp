<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script>
	function sumGet(){
		/*var num1= $("input[name=num1]").val();
		var num2= $("input[name=num2]").val();*/
		
		$.ajax({
			type:"get",
			url : "sum.jsp",
			data: $("#frm").serialize(), //num1=??&num2=??
			success:function(data){
				$("#result").text(data);
			}
		});
		
	}
	function sumPost(){
		$.ajax({
			type:"post",
			url : "sum.jsp",
			data: $("#frm").serialize(), //num1=??&num2=??
			success:function(data){
				$("#result").text(data);
			}
		});
	}
</script>
</head>
<body>
	<button onclick="sumGet()">get</button>
	<button onclick="sumPost()">post</button>
	<form id="frm">
		<input type="text" name="num1">
		+
		<input type="text" name="num2">
		=
		<span id="result">
		
		</span>
	</form>
</body>
</html>
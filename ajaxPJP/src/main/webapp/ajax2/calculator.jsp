<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script>
	var radioVal;
	
	
	function operFn(){
		var param = $("form").serialize();
		$.ajax({
			type:"get",
			url:"oper.jsp",
			data:param,
			success:function(data){
				$("#result").text(data);
			}
				
		});
	}
</script>
</head>
<body>
	<!-- 아래 입력 양식에서 입력한 피연산자와 연산자를 활용하여 ajax로 연산의 결과를 반환하여 출력하여 보세요 -->
	<h2>ajax를 통한 계산기 만들기</h2>
	<button onclick="operFn()">계산하기</button>
	<form id="frm">
		<p>
			피연산자1 : <input type="number" name="num1">
		</p>
		<p>
			연산자 :
			<input type="radio" name="oper" value="+">+
			<input type="radio" name="oper" value="-">-
			<input type="radio" name="oper" value="*">*
			<input type="radio" name="oper" value="/">/
		</p>
		<p>
			피연산자2 : <input type="number" name="num2">
		</p>
		<p>
			결과 : <span id="result"></span>
		</p>
	</form>
</body>
</html>
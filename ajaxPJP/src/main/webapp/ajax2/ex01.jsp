<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script>
	function click1(){
		$.ajax({
			type:"get",
			url:"<%=request.getContextPath()%>/data/data1.txt",
			success:function(data){
				$("#result").text(data);
			}
		});
	}
	//클릭2를 클릭했을 때 data/data1.html 데이터를 불러와 result에 출력하세요(jQuery 사용)
	function click2(){
		$.ajax({
			type:"get",
			url:"<%=request.getContextPath()%>/data/data1.html",
			success:function(data){
				$("#result").html(data);
			}
		});
	}
	function click3(){
		$.ajax({
			type:"get",
			url:"<%=request.getContextPath()%>/data/data1.json",
			success:function(data){
				//json은 객체로 변환해야 쓸 수 있다만
				//jQuery로 ajax통신의 경우 요청 경로의 확장자가 json이면
				//응답데이터를 javascript객체로 변환하여 반환하여 반환한다
				//즉, JSON.parse() 불필요
				for(var i=0 ; i<data.length ; i++){
					var jsonData = data[i];
					console.log(jsonData.name);
				}
				
			}
		});
	}
	/*
		버튼 4 클릭시 data/data2.json데이터를 jQuery 를 사용하여 ajax 통신후 result에 전부 출력해주세요
	*/
	function click4(){
		$.ajax({
			type:"get",
			url:"<%=request.getContextPath()%>/data/data2.json",
			success:function(json){
				var result="";
				result+="["+json[0].name+"]<br>";
				for(var i=0 ; i<json[0].students.length ; i++){
					result+="name : "+json[0].students[i].name+"<br>";
					result+="age : "+json[0].students[i].age+"<br><br>";
				}
				$("#result").html(result);
			}
		});
	}
	function click5(){
		$.ajax({
			type:"get",
			url:"<%=request.getContextPath()%>/data/data1.xml",
			success:function(data){
				var $data = $(data); //제이쿼리로 요소들을 찾아다닐 수 있다
				
				//var books = $data.find("book");
				//book이 여기저기 있는경우
				var books = $data.children("books").children("book");
				console.log(books);
				
				books.each(function(){
					console.log($(this).children("name").text());
					console.log($(this).children("publisher").text());	
					console.log($(this).children("author").text());	
					console.log($(this).children("price").text());	
				});
			}
			
		});
	}
	//6번 버튼 클릭시 data/data2.xml의 데이터를 전부 result영역에 ajax(jQuery)를 통하여 출력하시오
	function click6(){
		$.ajax({
			type:"get",
			url:"<%=request.getContextPath()%>/data/data2.xml",
			success:function(data){
				var $data = $(data);//제이쿼리로 변환

				var scName = $data.children("school").children("name").text();
				
				var students = $data.children("school").find("student");
				var studentInfo="";
				students.each(function(){
					var name = $(this).find("name").text();
					var age = $(this).find("age").text()+"<br>";
					studentInfo += "이름 : "+name+"/ 나이 : "+age+"<br>";
				})
				
				/*
				for(students student : students){
					result+=student.find("name").text();
					result+=student.find("age").text();
				}
				*/
				$("#result").html("["+scName+"]의 학생정보 <br>"+studentInfo);
				
			}
		})
	}
</script>
</head>
<body>
	<button onclick="click1()">클릭1</button>
	<button onclick="click2()">클릭2</button>
	<button onclick="click3()">클릭3</button>
	<button onclick="click4()">클릭4</button>
	<button onclick="click5()">클릭5</button>
	<button onclick="click6()">클릭6</button>
	<div id="result"></div>
</body>
</html>
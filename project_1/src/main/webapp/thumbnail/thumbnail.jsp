<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest, java.io.*, java.util.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%@ page import="java.awt.Graphics2D" %>
<%@ page import="java.awt.image.renderable.ParameterBlock" %>
<%@ page import="java.awt.image.BufferedImage" %>

<%@ page import="javax.media.jai.JAI" %>
<%@ page import="javax.media.jai.RenderedOp" %>
<%@ page import="javax.imageio.ImageIO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	String uploadPath = request.getServletContext().getRealPath("image");
	//프로젝트 폴더 안에 생성한 경로 -> 나중에 업로드 폴더를 이런식으로 여기 만들면 된다
	//프로젝트 폴더에 있는 image폴더는 가상의 경로이고 실제 파일 상의 경로를 uploadPath로 세팅함
	//상대경로로 잡아두는게 좋음.. 보안상의 문제떄문에
	int maxSize=10*1024*1024;
	MultipartRequest mr = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());

	//클라이언트가 업로드한 파일명을 MultipartRequest객체를 통해서 얻음
	
	Enumeration fileTypeNames = mr.getFileNames();
	
	//2. <input type="file"> 태그의 name을 이용해 value값(업로드한 파일명)을 얻음
	String fileName = (String)fileTypeNames.nextElement();
	String systemFileName = mr.getFilesystemName(fileName);
	
	ParameterBlock pb = new ParameterBlock();//변환 이미지 저장소
	pb.add(uploadPath+"/"+systemFileName);//업로드된 이미지를 ParameterBlock에 저장함
	RenderedOp rOp = JAI.create("fileload", pb);//fileload : JAI가 제공하는 코덱을 사용한다는 옵션
	
	BufferedImage bi = rOp.getAsBufferedImage();//불러온 이미지를 BufferedImage에 저장함
	BufferedImage thumb= new BufferedImage(100,100, BufferedImage.TYPE_INT_BGR);
	
	Graphics2D g = thumb.createGraphics();
	g.drawImage(bi, 0, 0, 100,100,null);
	
	File file = new File(uploadPath+"/sm_"+systemFileName);
	
	ImageIO.write(thumb, "jpg", file);
%>

<title>이미지 섬네일 예제</title>
</head>
<body>
	<h4>원본 이미지</h4><br> <!-- 웹서버에서 img태그 src값 세팅시 절대경로는 보안상의 문제로 세팅안됨 -->
	<img src="../image/<%= systemFileName %>"/><p>
	<h4>섬네일 이미지</h4><br>
	<img src="../image/sm_<%= systemFileName %>"/>
</body>
</html>
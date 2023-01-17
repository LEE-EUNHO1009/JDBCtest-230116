<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 성공</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		String mid =request.getParameter("id");
		String mpw= request.getParameter("password");
		String mname= request.getParameter("name");
		String memail= request.getParameter("email");
	
		String driverName= "com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/webdb";
		String username="root";
		String password="1234";
		
		String sql="INSERT INTO members(id, password, name, email) VALUES ('"+mid+"','"+mpw+"','"+mname+"','"+memail+"')";
		Connection conn=null;  //DB 연결 선언
		
		try{
			Class.forName(driverName); //드라이버 불러오기
			conn=DriverManager.getConnection(url, username, password); //데이터 베이스 연동
			Statement stmt=conn.createStatement();
			
			int dbCheck=stmt.executeUpdate(sql);
			
			if(dbCheck == 1){
				out.println("회원 가입 성공");
			} else {
			out.println("회원 가입 실패");
			}
			
			stmt.close(); //커넥션을 닫기 전에 먼저 닫아야 함
			
		 	//System.out.println(conn);
		} catch(Exception e){
			e.printStackTrace();
		}finally{ //예외처리구문->다른 페이지에서 연결되서 충돌되지 않도록
			try{
				if(conn !=null){
					conn.close();   //닫아주기(여기도 트라이캐치문 사용해야함)
					}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	%>
	<br>
	<a href="withdraw.jsp">회원탈퇴로 가기</a>
</body>
</html>
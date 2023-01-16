<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC 테스트</title>
</head>
<body>
	<% 
		String driverName= "com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/webdb";
		String username="root";
		String password="1234";
		
		Connection conn=null;  //DB 연결 선언
		
		try{
			Class.forName(driverName); //드라이버 불러오기
		
			conn=DriverManager.getConnection(url, username, password); //데이터 베이스 연동
			
		 	System.out.println(conn);
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

</body>
</html>
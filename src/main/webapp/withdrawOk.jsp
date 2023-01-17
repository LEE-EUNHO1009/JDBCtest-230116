<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 성공</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String mid = request.getParameter("id");
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/webdb";
		String username = "root";
		String password = "1234";
		
		String sql = "DELETE FROM members WHERE id = ?"; //PreparedStatement의 특징: ? 사용
		
		Connection conn = null;//DB 연결 선언
		
		try {
			Class.forName(driverName);//드라이버 불러오기
			conn = DriverManager.getConnection(url, username, password);//DB 연동
			//Statement stmt = conn.createStatement();
			PreparedStatement pstmt=conn.prepareStatement(sql);  //sql문은 여기에 들어가게 됨
			pstmt.setString(1, mid); //?에 이 내용이 들어가게 됨, 0부터 아님
			
			int dbCheck = pstmt.executeUpdate();
			
			if(dbCheck == 1) {
				out.println("회원 탈퇴 성공!!");
			} else {
				out.println("회원 탈퇴 실패!!");
			}
			
			pstmt.close();
			
			//System.out.println(conn);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {				
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	%>
	<br>
	<a href="join.jsp">회원가입으로 가기</a>
</body>
</html>
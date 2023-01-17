<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 리스트</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("utf-8");
	
		String driverName= "com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/webdb";
		String username="root";
		String password="1234";
		
		String sql="SELECT * FROM members";
		
		Connection conn=null;  //DB 연결 선언
		
		try{
			Class.forName(driverName); //드라이버 불러오기
			conn=DriverManager.getConnection(url, username, password); //데이터 베이스 연동
			Statement stmt=conn.createStatement();
			
			ResultSet rs = stmt.executeQuery(sql); //sql문의 결과 값이 저장(select문이 반환하는 레코드 저장)
			
			while(rs.next()){
				//----------
				String db_id = rs.getString("id");
				String db_password = rs.getString("password");
				String db_name = rs.getString("name");
				String db_email = rs.getString("email");
				String db_jointime = rs.getString("jointime");
				//--------레코드 이것만 쓰면 한명 분 쓰는 거임, 백명쓰면 이거 백개 만들어야 해서 반복문 사용해야 함
			
			out.println(db_id+"/"+db_password+"/"+db_name+"/"+db_email+"/"+db_jointime +"<br>");
			}
			
			rs.close();
			stmt.close();
			
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
</body>
</html>
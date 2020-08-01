<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.jy.kios.MenuVO" %>
<%@ page import="com.jy.kios.Dao" %>


<%
	String i_num = request.getParameter("i_num");
	int intI_num = Integer.parseInt(i_num);
	
	Dao dao = new Dao();
	
	Connection con = null;
	PreparedStatement ps = null;
	
	String sql = " INSERT INTO mycart(i_num) VALUES (?) ";
	
	try {
		con = dao.getCon();
		ps = con.prepareStatement(sql);
		ps.setInt(1,intI_num);
		ps.executeQuery();		
		
	} catch(Exception e) {
		e.printStackTrace();
		out.println("Error!");
	} finally {
		if(ps != null) try{ps.close();} catch(Exception e) {}
		if(con != null) try{con.close();} catch(Exception e) {}
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert("장바구니에 추가하였습니다");
		location.href="menu.jsp";
	</script>
</body>
</html>
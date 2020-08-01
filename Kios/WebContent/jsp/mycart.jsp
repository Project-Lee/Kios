<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.jy.kios.MenuVO" %>
<%@ page import="com.jy.kios.Dao" %>

<%
	Dao dao = new Dao(); // Connection getCon() 객체화
	
	List<MenuVO> daoList = new ArrayList();

	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;	
	
	String sql = " SELECT i_num, i_name, i_price, i_ctnt FROM mycart ORDER BY i_num ";
	
	try {
		
		con = dao.getCon();
		ps = con.prepareStatement(sql);
		
		rs = ps.executeQuery();
		

		while(rs.next()) {
			int i_num = rs.getInt("i_num");
			String i_name = rs.getNString("i_name");
			int i_price = rs.getInt("i_price");
			String i_ctnt = rs.getNString("i_ctnt");
			
			MenuVO vo = new MenuVO();
			
			vo.setI_num(i_num);
			vo.setI_name(i_name);
			vo.setI_price(i_price);
			vo.setI_ctnt(i_ctnt);
			
			daoList.add(vo);			
		}
		
		
	} catch(Exception e) {
		e.printStackTrace();
		out.println("try - Error!!");
				
	} finally {
		if(rs != null) try{rs.close();} catch(Exception e) { }
		if(ps != null) try{ps.close();} catch(Exception e) { }
		if(con != null) try{con.close();} catch(Exception e) { }
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	table { width: 700px; border: 1px solid black; border-collapse: collapse; border-color: red;}
    td { width: 300px; border: 1px solid black; text-align:center; }
    tr { height: 60px; }
    span {color : red;}
    
    
</style>
</head>
<body>
	<div>
		<a href="menu.jsp"><button><span>메뉴</span>로 돌아가기</button></a>
	</div>
	
	
	<div class="container">
			<table>
				<tr>
					<th>메뉴번호</th>
					<th>메뉴이름</th>
					<th>메뉴가격</th>
					<th>메뉴내용</th>
				</tr>
				<tr>
					<%for(MenuVO vo : daoList) { %>
					<td><%=vo.getI_num() %></td>
					<td><%=vo.getI_name() %></td>
					<td><%=vo.getI_price() %></td>
					<td><%=vo.getI_ctnt() %></td>
				</tr>
				<%} %>
			</table>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.jy.kios.MenuVO" %>
<%@ page import="com.jy.kios.Dao" %>


<%
	Dao dao = new Dao();
	
	List<MenuVO> menuList = new ArrayList();
	
	MenuVO vo = new MenuVO();
	
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	String strI_num = request.getParameter("i_num");
	int intI_num = Integer.parseInt(strI_num);
	
	String sql = " SELECT i_num, i_name, i_price, i_ctnt FROM kios WHERE i_num = ? ";
	
	try {
		con = dao.getCon();
		ps = con.prepareStatement(sql);
		ps.setInt(1,intI_num);
		rs = ps.executeQuery();
		
		if(rs.next()) {
			int i_num = rs.getInt("i_num");
			String i_name = rs.getNString("i_name");
			int i_price = rs.getInt("i_price");
			String i_ctnt = rs.getNString("i_ctnt");
			
			vo.setI_num(i_num);
			vo.setI_name(i_name);
			vo.setI_price(i_price);
			vo.setI_ctnt(i_ctnt);			
		}
		
	} catch(Exception e) {
		e.printStackTrace();
		out.println("try - Error!");
				
	} finally {
		if(rs != null) try{rs.close();} catch(Exception e) {}
		if(ps != null) try{ps.close();} catch(Exception e) {}
		if(con != null) try{con.close();} catch(Exception e) {}
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=vo.getI_name() %></title>
<style>
	table { width: 700px; border: 1px solid black; border-collapse: collapse;}
    td { width: 300px; border: 1px solid black; text-align:center;}
    tr { height: 60px;}
    #f { text-align: center; color: red;}
    img { width: 300px; height: 300px; display: inline-block;;}
</style>
</head>
<body>
	<div class="container">
			<table>
				<tr>
					<th>메뉴번호</th>
					<th>메뉴이름</th>
					<th>메뉴가격</th>
					<th>메뉴내용</th>
				</tr>
				<tr>
					
					<td><%=vo.getI_num() %></td>
					<td><%=vo.getI_name() %></td>
					<td><%=vo.getI_price() %></td>
					<td><%=vo.getI_ctnt() %></td>
				</tr>
			</table>
				
				<a href="insert.jsp?i_num=<%=vo.getI_num()%>">
				<input type="button" value="장바구니 담기"></a>
				<a href="menu.jsp">
				<input type="button" value="메뉴로 돌아가기"></a>
				<br>			
				<img src = "C:\picture\burger<%=intI_num %>.jpg">
			
	</div>
</body>
</html>
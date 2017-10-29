<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%
	PreparedStatement pstatement = null;
    String user = request.getParameter("username");    
    String pwd = request.getParameter("password");
    String email = request.getParameter("email");
    String id = "4";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webshop",
            "root", "");
    
    String queryString = "INSERT INTO users(id, name, passwort, mail) VALUES (null, ?, ?, ?)";
    pstatement = con.prepareStatement(queryString);
    pstatement.setString(1, user);
    pstatement.setString(2, pwd);
    pstatement.setString(3, email);
%>
</body>
</html>
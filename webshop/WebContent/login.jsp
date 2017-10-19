<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="webshop.Benutzer"%>
<%@page import="javax.crypto.*" %>
<%@page import="java.security.MessageDigest"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

	Benutzer user = new Benutzer();

	String username  = request.getParameter("username");
	String pass      = request.getParameter("password");
%>
<h2><%= user.login(username, pass) %></h2>
	
</body>
</html>
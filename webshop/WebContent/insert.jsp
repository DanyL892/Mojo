<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="webshop.Benutzer"%>
<%@page import="javax.crypto.*" %>
<%@page import="java.security.MessageDigest"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Bucks Money</title>
  <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta charset="utf-8">
  <link href="style_home.css" rel="stylesheet">
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
  <div class="header">
  <%@include file="menu_part.jsp" %>
      <h1>Registrierung</h1>
      <hr/>
      
 <%
	Benutzer user = new Benutzer();

	String username  = request.getParameter("username");
	String pass      = request.getParameter("password");
	String mail      = request.getParameter("email");
%>
	<h2><%= user.register(username, pass, mail) %></h2>

  </div>
  
</body>
</html>
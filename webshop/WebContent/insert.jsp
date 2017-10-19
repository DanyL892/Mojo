<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="webshop.user.*"%>
<%@page import="javax.crypto.*" %>
<%@page import="java.security.MessageDigest"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Bucks Money</title>
  <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta charset="utf-8">
  <link href="style_shop.css" rel="stylesheet">
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
  <div class="header">
      <h1>Welcome</h1>
      <hr/>
<%
	boolean success = false;
    String error = "";
	String name  = request.getParameter("username");
	String pass  = request.getParameter("password");
	String mail  = request.getParameter("email");
	
	//Eingabe prüfen
	if (name == "") {
		error = "Bitte gib einen Nutzernamen ein.";
	} else if (pass == "") {
		error = "Bitte gib ein Passwort ein.";
	} else if (mail == "") {
		error = "Bitte gib eine E-Mail Adresse ein.";
	}
	
	try {
          Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webshop", "root", "");
          Statement st=con.createStatement();
          
          //prüfe ob Username bereits existiert
          String sql;
      	  sql="SELECT name FROM users WHERE name='"+name+"'";
      	  ResultSet rs = null;
    	  rs=st.executeQuery(sql);
          if (rs.next()) {
        	  error = "Ein User mit diesem Namen existiert bereits!";
          } 
          
          //prüfe ob die Mail bereits verwendet wird
          sql="SELECT mail FROM users WHERE mail='"+mail+"'";
          ResultSet rs2 = null;
          rs2=st.executeQuery(sql);
       	  if (rs2.next()) {
       		  error = "Diese E-Mail wird bereits verwendet.";
       	  } 
          if (error == "") {
       		  MessageDigest alg = MessageDigest.getInstance("MD5");
       		  alg.reset();
       		  alg.update(pass.getBytes());
       		  byte[] digest = alg.digest();
       		  StringBuffer hashedpasswd = new StringBuffer();
       		  String hx;
	       	  for (int m=0; m<digest.length; m++){
	       			hx =  Integer.toHexString(0xFF & digest[m]);
	       			if(hx.length() == 1){hx = "0" + hx;}
	       			hashedpasswd.append(hx);
	       	  }
	       	  pass = hashedpasswd.toString();
	       	  int i=st.executeUpdate("insert into users(name,passwort,mail) values('"+name+"','"+pass+"','"+mail+"')");
       		  success = true;
          }
       }
	
       catch(Exception e){
       System.out.print(e);
       e.printStackTrace();
       success = false;
       }
	
		if (error != "") {%>
			<h2><%= error %></h2><%
		}
		else if (success == true) {
		%>
		<h2>Du hast dich erfolgreich registriert</h2>
		<%	
		} else if (success == false) { %>
		<h2>Es gab einen Fehler bei der Registrierung. Bitte versuche es später erneut.</h2>
	<% } %>

  </div>
  <div class="col-md-12">
    <h1>Lorem ipsum dolor</h1>
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
  </div>
  <div class="content" id="content">
  </div>
  <div class="footer">
  </div>
  
</body>
</html>
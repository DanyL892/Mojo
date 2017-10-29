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
	boolean success  = false;
    String error     = "";
	String username  = request.getParameter("username");
	String pass      = request.getParameter("password");
	String passwort  = "";
	
	//Eingabe prüfen
	if (username == "") {
		error = "Bitte gib einen Nutzernamen ein.";
	} else if (pass == "") {
		error = "Bitte gib ein Passwort ein.";
	} 
	
	try {
          Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webshop", "root", "");
          Statement st=con.createStatement();
          
          //prüfe ob Username existiert
          String sql;
      	  sql="SELECT * FROM users WHERE name='"+username+"'";
    	  ResultSet rs=st.executeQuery(sql);
          if (rs.next() == false) {
        	  error = "Ein User mit diesem Namen existiert nicht";
          } else {
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
	       	  
	       	  //Prüfe Passwort auf Gültigkeit
	       	  passwort = rs.getString("passwort");
	       	  if (pass.equals(passwort)) {
	       		  success = true;
	       	  } 
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
		<h2>Welcome</h2>
		<%	
		} else if (success == false) { %>
		<h2>Es gab einen Fehler beim Login. Bitte versuche es später erneut.</h2>
	<% } %>
</body>
</html>
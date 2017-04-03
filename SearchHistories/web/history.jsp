<%-- 
    Document   : userslist
    Created on : Mar 5, 2015, 1:02:25 PM
    Author     : dell
--%>
<%@page import="query.Config"%>
<%@page import="query.Index"%>
<%@page import="query.Resource"%>
<%@page import="java.util.LinkedHashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.HashSet"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.File"%>

<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String email = (String) session.getAttribute("user");
query.dbfunction dbfunc = new query.dbfunction();
dbfunc.createConnection();
String queryu = "";
queryu="select keyword, wid,searchdate from activity where email='"+email+"'order by searchdate";
ResultSet rs=dbfunc.queryRecord(queryu);

%>
        

<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<title>Users List</title>
  	 <link rel="stylesheet" href="css/2.css" type="text/css" />
        <link rel="stylesheet" href="css/style.css" type="text/css" />
</head>

<body>
    <a href="userlogin.jsp"><h4 align="center">(Home)</h4></a>
	<div id="main">
		<h1>History</h1>

		<table>
                    <tr>
			<th>Keyword</th>
  			<th>Wid</th>
                        <th>Searched Date</th>
 			</tr>
			
                        <% while(rs.next())
{ %>
            <TR>
                <TD> <%= rs.getString(1) %></td>
                <TD> <%= rs.getString(2) %></TD>
                <TD> <%= rs.getString(3) %></TD>
            </TR>
            <% } %>
    
		</table>
	</div>

</body>
</html> 


<%-- 
    Document   : userslist
    Created on : Mar 5, 2015, 1:02:25 PM
    Author     : dell
--%>
<%@page import="query.dbfunction"%>
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
<%@page import="java.sql.*" %>

<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<title>Admin Page</title>
  	 <link rel="stylesheet" href="css/2.css" type="text/css" />
         <link rel="stylesheet" href="css/style.css" type="text/css" />
</head>      
        <body>
    <form name="f1" action="web_webinsertion.jsp" method="post">
        <h1>Insert Link Details</h1>
                <table border=0 cellspacing=0>
                <tr><td><label>id</label></td><td><input type="text" name="wid" value="" style="width: 400px;"/></td></tr><br>
                <tr><td><label>key id</label></td><td><input type="text" name="grank" value="" style="width: 400px;"/></td></tr><br>
                <tr><td><label>Keyword</label></td><td><input type="text" name="keyword" value="" style="width: 400px;"/></td></tr><br>
                <tr><td><label>Title</label></td><td><input type="text" name="title" value="" style="width: 400px;"/></td></tr><br>
                <tr><td><label>URL</label></td><td><input type="text" name="url" value="" style="width: 400px;"/></td></tr><br>
                <tr><td><label>Description</label></td><td><input type="text" name="description" value="" style="width: 400px;"/></td></tr><br>
                <tr><td><label>Category</label></td><td><input type="text" name="category" value="" style="width: 400px;"/></td></tr><br>
                <tr><td><label>Hits</label></td><td><input type="text" name="hits" value="" style="width: 400px;"/></td></tr><br>
                <tr><td></td><td><input type="submit" name="submit" value="Register" />&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="b2" value="Reset"></td></tr>
                </table>
    </form>
                                                     
     </body>
</html> 


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
  	<title>Users List</title>
  	 <link rel="stylesheet" href="css/2.css" type="text/css" />
         
</head>

    
       <%!
        public class Actor{
            String URL="jdbc:mysql://localhost/searchhistories";
            String USERNAME="root";
            String PASSWORD="123456";
            Connection connection=null;
            PreparedStatement insertActors=null;
            public Actor(){
                try{
                    connection=DriverManager.getConnection(URL,USERNAME,PASSWORD);
                    insertActors=connection.prepareStatement(
                            "insert into web_web(wid,grank,keyword,title,url,description,category,hits)"
                             +"values(?,?,?,?,?,?,?,?)");
                }
                catch(SQLException e){
                 e.printStackTrace();
                }
            }
                public int setActors(String wid,String grank,String keyword,String title,String url,String description,String category,String hits){
                    int result=0;
                    try{
                    insertActors.setString(1,wid);
                    insertActors.setString(2,grank);
                    insertActors.setString(3, keyword);
                    insertActors.setString(4,title);
                    insertActors.setString(5,url);
                    insertActors.setString(6,description);
                    insertActors.setString(7, category);
                    insertActors.setString(8,hits);
                    result=insertActors.executeUpdate();
                                       }catch(SQLException e){
                 e.printStackTrace();
                }
                    return result;   
             }         
        }
        %>
    <%
        int result= 0;      
if(request.getParameter("submit")!=null){
String wid=new String();
String grank=new String();
String keyword=new String();
String title=new String();
String url=new String();
String description=new String();
String category=new String();
String hits=new String(); 
        if(request.getParameter("wid")!=null){
            wid=request.getParameter("wid");
           }
        if( request.getParameter("grank")!=null){
            grank=request.getParameter("grank");
           }
        if(request.getParameter("keyword")!=null){
            keyword=request.getParameter("keyword");
           }
        if(request.getParameter("title")!=null){
              title=request.getParameter("title"); 
           }
        if(request.getParameter("url")!=null){
             url=request.getParameter("url");
           }
        if(request.getParameter("description")!=null){
               description=request.getParameter("description");
           }
        if(request.getParameter("category")!=null){
               category=request.getParameter("category");
           }
        if(request.getParameter("hits")!=null){
                  hits=request.getParameter("hits");           
           }
               
            Actor actor=new Actor();
            result=actor.setActors("+wid+","+grank+","+keyword+","+title+","+url+","+description+","+category+","+hits+");
                       }
        %>
        <body>
            <h1>Successfully inserted!!!</h1>                                         
     </body>
</html> 


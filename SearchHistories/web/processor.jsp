<%-- 
    Document   : processor
    Created on : Feb 25, 2015, 10:57:05 AM
    Author     : user
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Processor</title>
    </head>
    <body>        

        <jsp:useBean id="dbfunc" scope="page" class="query.dbfunction" />
        <%

            String option = "web";
            String keyword = request.getParameter("keyword");
            String wid = request.getParameter("wid");
            String redirect = request.getParameter("redirect");
            String email = (String) session.getAttribute("user");

            dbfunc.createConnection();

            String queryz = "";
            String updateQuery = "";

            if (email != null) {

                queryz = "select * from activity where email='" + email.trim() + "' and keyword='" + keyword.trim() + "'";
                updateQuery = "";

                ResultSet rsett = dbfunc.queryRecord(queryz);

                if (rsett.next()) {
                    String dbwid = rsett.getString("wid").trim();
                    dbwid = dbwid + "," + wid.trim();
                    updateQuery = "update activity set wid='" + dbwid + "' where email='" + email.trim() + "' and keyword='" + keyword.trim() + "'";
                } else {
                    updateQuery = "insert into  activity (email,keyword,wid,searchdate) values";
                    updateQuery += "('" + email + "','" + keyword + "','" + wid + "',now())";
                }

            }

            String query = "update " + option + "_web set hits=hits+1 where wid=" + wid;

            //out.println(query);
            if(email!=null)
                               {
            try {
                if (dbfunc.updateRecord(updateQuery) && dbfunc.updateRecord(query)) {
                    out.println("<p><b>Updating Hits Success!</b></p>");
                } else {
                    out.println("<p><b>Updating Hits failed!</b></p>");
                }
            } catch (Exception e) {
                out.println("<br /><b>Exception : " + e.toString() + "</b>");
            }
                       }
                       else{
                           try {
                if (dbfunc.updateRecord(query)) {
                    out.println("<p><b>Updating Hits Success!</b></p>");
                } else {
                    out.println("<p><b>Updating Hits failed!</b></p>");
                }
            } catch (Exception e) {
                out.println("<br /><b>Exception : " + e.toString() + "</b>");
            }
                       }
            dbfunc.closeConnection();

            response.sendRedirect(redirect);


        %>
    </body>
</html>
<%-- 
    Document   : dbResults
    Created on : Feb 25, 2015, 3:10:31 PM
    Author     : user
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


<%!    // preload a list of faked names   
    String option = "web";
    ArrayList<String> arrayList1 = new ArrayList<String>();
    ArrayList<String> enharrayList = new ArrayList<String>();
    // ...perform one time initialization.
    // ...this method is called only once per JSP, not per request
    query.dbfunction dbfunc = new query.dbfunction();

    public void jspInit() {
        try {

            dbfunc.createConnection();

            //String queryz = "SELECT *,CASE WHEN keyword = '" + keyword + "' THEN 1 ELSE 0 END AS score, MATCH (keyword, title)  AGAINST('" + keyword + "') AS score2 FROM " + option + "_web order by score DESC, hits DESC,score2 desc";               
            //String queryz = "select distinct keyword from " + option + "_web";
            String queryz = "select distinct keyword from " + option + "_web limit 32";

            //System.out.println("Query  : " + queryz);

            ResultSet rset = dbfunc.queryRecord(queryz);

            boolean found = rset.next();
            //out.println("<br><b>Sql Result</b>+"+query+"==>"+found);
            if (found) {
                rset.last();
                int count = rset.getRow();
                int row = 0;

                rset.beforeFirst();
                while (rset.next()) {
                    row++;
                    arrayList1.add(rset.getString(1));
                    //resultHtml += "<tr><td>" + row + "</td><td>" + rset.getString(4) + "</td><td><a href=>" + rset.getString(5) + "</a></td></tr>";
                }
            } else {
                arrayList1.add("Data Not Found In Database");
            }
            dbfunc.closeConnection();
        } catch (SQLException ex) {
            arrayList1.add("<p><b>" + ex.toString() + "</b></p>");
        } catch (Exception ex) {
            arrayList1.add("<p><b>" + ex.toString() + "</b></p>");
        }

        // for enhancement
        if (Config.isProposed) {
        } else {
            //String query = "SELECT *,CASE WHEN keyword = '" + keyword + "' THEN 1 ELSE 0 END AS score, MATCH (keyword) AGAINST('" + keyword + "') AS score2 FROM activity having score > 0 order by score DESC, score2 desc";
            try {

                dbfunc.createConnection();

                //String queryz = "SELECT *,CASE WHEN keyword = '" + keyword + "' THEN 1 ELSE 0 END AS score, MATCH (keyword, title)  AGAINST('" + keyword + "') AS score2 FROM " + option + "_web order by score DESC, hits DESC,score2 desc";               
                String queryz = "select distinct keyword from activity";
                //String queryz = "select distinct keyword from " + option + "_web limit 5";

                System.out.println("Query  : " + queryz);

                ResultSet rset = dbfunc.queryRecord(queryz);

                boolean found = rset.next();
                //out.println("<br><b>Sql Result</b>+"+query+"==>"+found);
                if (found) {
                    rset.last();
                    int count = rset.getRow();
                    int row = 0;

                    rset.beforeFirst();
                    while (rset.next()) {
                        row++;
                        enharrayList.add(rset.getString(1));
                        //resultHtml += "<tr><td>" + row + "</td><td>" + rset.getString(4) + "</td><td><a href=>" + rset.getString(5) + "</a></td></tr>";
                    }
                } else {
                    enharrayList.add("No Custom Results Found In Database");
                }
                dbfunc.closeConnection();
            } catch (SQLException ex) {
                arrayList1.add("<p><b>" + ex.toString() + "</b></p>");
            } catch (Exception ex) {
                arrayList1.add("<p><b>" + ex.toString() + "</b></p>");
            }
        }
    }

%>

<%
    // get the parameter from the query string
    String s = request.getParameter("search");
    if (s == null) {
        s = "";
    } else {
        s = s.toLowerCase();
    }

    // go through the name list to find all the matches	
    String hint = null;
    String enhint = "<li>-------Recent Popular Patterns-----</li>";

    if (s.length() > 0) {
        int count = 0;
        for (int k = 0; k < arrayList1.size(); k++) {
            String name = arrayList1.get(k).toLowerCase();
            if (name.startsWith(s)) {
                count++;
                if (count == 1) {
                    hint = "<li>" + arrayList1.get(k) + "</li>";
                } else {
                    hint += "<li>" + arrayList1.get(k) + "</li>";
                }
            }

        }
        if (Config.isProposed) {
            enhint = "";
        } else {
            for (int k = 0; k < enharrayList.size(); k++) {
                String name = enharrayList.get(k).toLowerCase();
                if (name.startsWith(s)) {
                    count++;
                    if (count == 1) {
                        enhint += "<li>" + enharrayList.get(k) + "</li>";
                    } else {
                        enhint += "<li>" + enharrayList.get(k) + "</li>";
                    }
                }

            }
        }
    }


    if (Config.isProposed) {
        out.print("");
    } else {
        if (hint == null) {
            out.print("no suggestion");
        } else {
            out.print("<ul>" + hint+enhint + "</ul>");
            System.out.print("<ul>" + hint + "</ul>");
        }
    }

%>

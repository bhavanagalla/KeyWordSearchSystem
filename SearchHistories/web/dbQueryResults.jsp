<%-- 
    Document   : dbQueryResults
    Created on : Feb 25, 2015, 11:27:03 PM
    Author     : user
--%>

<%@page import="query.Config"%>
<%@page import="msg.Graph"%>
<%@page import="msg.Edge"%>
<%@page import="query.Storage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSetMetaData"%>
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

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Query Results</title>

        <script src="js/jquery.min.js" type="text/javascript" ></script>
        <script type="text/javascript" language="javascript" src="media/js/jquery.dataTables.js"></script>

        <style type="text/css" title="currentStyle">
            @import "media/css/demo_page.css";
            @import "media/css/demo_table.css";
        </style>

        <script type="text/javascript" charset="utf-8"> 
            $(document).ready(function() {
                $('#example').dataTable( {                                        
                    "sPaginationType": "full_numbers",                    
                    "bPaginate": true,
                    "bLengthChange": false,
                    "bFilter": true,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": true
                } );
            } );
        </script> 

    </head>
    <body>        

        <jsp:useBean id="dbfunc" scope="page" class="query.dbfunction" />
        <%
            long start = -1, stop = -1;


            // start
            start = System.nanoTime();


            double threshold = 1.0;

            String option = "web";
            String keyword = request.getParameter("search");
            String email = (String) session.getAttribute("user");

            String queryw = "";
            String wid = "";
            String list[] = null;

            dbfunc.createConnection();

            if (email != null) {

                queryw = "select * from activity where email='" + email.trim() + "' and keyword='" + keyword.trim() + "'";
                ResultSet rsett = dbfunc.queryRecord(queryw);
                if (rsett.next()) {
                    wid = rsett.getString("wid").trim();
                } else {
                    wid = "";
                }
                list = wid.split(",");
            }



///////////////////

            ArrayList<Storage> arrayList1 = new ArrayList<Storage>();
            ArrayList<Storage> arrayList2 = new ArrayList<Storage>();

//////////////////////////



            String resultHtml = "<form action=\"" + query.Resource.getMyUrl() + "UpdateDB\" method=\"post\">";

            resultHtml += "<table id=\"example\" class=\"display\"><caption><h4><a href='userlogin.jsp'>Home</a>&nbsp;&nbsp;&nbsp;" + (email == null ? "" : "<a href='logout.jsp'>Logout</a>&nbsp;&nbsp;&nbsp;") + "</h4><h3><font color='red'> " + (Config.isProposed ? "" : "") + "<br /></font></h3></caption><thead>";
            resultHtml += "<tr>";
            String headings = "";

            try {

                String queryz = "SELECT *,CASE WHEN keyword = '" + keyword + "' THEN 1 ELSE 0 END AS score, MATCH (keyword, title)  AGAINST('" + keyword + "') AS score2 FROM " + option + "_web having score > 0 order by score DESC, hits DESC,score2 desc";

                //out.println("---------"+queryz);
                ResultSet rset = dbfunc.queryRecord(queryz);

                ResultSetMetaData rsmd = rset.getMetaData();
                int numColumns = rsmd.getColumnCount();

                for (int i = 1; i <= numColumns; i++) {
                    if (i == 1 || i == 2 || i == 6 || i == 7 || i == 8 || i == 9) {
                        continue;
                    }

                    //resultHtml += "<th>" + rsmd.getColumnName(i).toUpperCase() + "</th>";
                    headings += rsmd.getColumnName(i).toUpperCase() + "~";
                }
                headings = headings.substring(0, headings.length() - 1);

                resultHtml += "</tr></thead><tbody>";

                boolean found = rset.next();

                String clickSets = "";
                String nonClickSets = "";
                int totalRecords = 0;

                if (found) {
                    rset.last();
                    int count = rset.getRow();
                    int row = 0;
                    String line = "";
                    rset.beforeFirst();
                    while (rset.next()) {

                        arrayList1.add(new Storage(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4), rset.getString(5), rset.getString(6), rset.getString(7), rset.getString(8), rset.getString(9)));
                        row++;

                        if (email != null) {

                            String searchingFor = rset.getString(1);
                            for (String s : list) {
                                if (searchingFor.trim().equals(s.trim())) {
                                    if (row % 2 == 0) {
                                        clickSets += "<tr><td>";
                                        line = "";
                                        for (int i = 1; i <= numColumns; i++) {

                                            if (i == 1 || i == 3 || i == 2 || i == 7 || i == 8 || i == 9 || i == 10) {
                                                continue;
                                            }
                                            if (i == 4) {
                                                clickSets += "<br /><h3><a href='processor.jsp?wid=" + rset.getString(1) + "&keyword=" + keyword + "&redirect=" + rset.getString(5) + "' >" + rset.getString(i) + "</a></h3>(" + rset.getString(8) + "-hits)";
                                            } else {
                                                if (i == 6) {
                                                    clickSets += "<br />" + rset.getString(i) + "";
                                                } else {
                                                    clickSets += "<br /><a href='processor.jsp?wid=" + rset.getString(1) + "&keyword=" + keyword + "&redirect=" + rset.getString(5) + "' >" + rset.getString(i) + "</a><br />";
                                                }

                                            }
                                        }
                                        clickSets += "</td></tr><tr><td><hr /></td><tr /><tr><td>&nbsp;&nbsp;&nbsp;</td><tr />";
                                    } else {
                                        clickSets += "<tr><td>";
                                        line = "";
                                        for (int i = 1; i <= numColumns; i++) {

                                            if (i == 1 || i == 3 || i == 2 || i == 7 || i == 8 || i == 9 || i == 10) {
                                                continue;
                                            }
                                            if (i == 4) {
                                                clickSets += "<br /><h3><a href='processor.jsp?wid=" + rset.getString(1) + "&keyword=" + keyword + "&redirect=" + rset.getString(5) + "' >" + rset.getString(i) + "</a></h3>(" + rset.getString(8) + "-hits)";
                                            } else {
                                                if (i == 6) {
                                                    clickSets += "<br />" + rset.getString(i) + "";
                                                } else {
                                                    clickSets += "<br /><a href='processor.jsp?wid=" + rset.getString(1) + "&keyword=" + keyword + "&redirect=" + rset.getString(5) + "' >" + rset.getString(i) + "</a><br />";
                                                }

                                            }
                                        }
                                        clickSets += "</td></tr><tr><td><hr /></td><tr /><tr><td>&nbsp;&nbsp;&nbsp;</td><tr />";

                                    }
                                    break;
                                } else {
                                    if (row % 2 == 0) {
                                        nonClickSets += "<tr><td>";
                                        line = "";
                                        for (int i = 1; i <= numColumns; i++) {

                                            if (i == 1 || i == 3 || i == 2 || i == 7 || i == 8 || i == 9 || i == 10) {
                                                continue;
                                            }
                                            if (i == 4) {
                                                nonClickSets += "<br /><h3><a href='processor.jsp?wid=" + rset.getString(1) + "&keyword=" + keyword + "&redirect=" + rset.getString(5) + "' >" + rset.getString(i) + "</a></h3>(" + rset.getString(8) + "-hits)";
                                            } else {
                                                if (i == 6) {
                                                    nonClickSets += "<br />" + rset.getString(i) + "";
                                                } else {
                                                    nonClickSets += "<br /><a href='processor.jsp?wid=" + rset.getString(1) + "&keyword=" + keyword + "&redirect=" + rset.getString(5) + "' >" + rset.getString(i) + "</a><br />";
                                                }

                                            }
                                        }
                                        nonClickSets += "</td></tr><tr><td><hr /></td><tr /><tr><td>&nbsp;&nbsp;&nbsp;</td><tr />";
                                    } else {
                                        nonClickSets += "<tr><td>";
                                        line = "";
                                        for (int i = 1; i <= numColumns; i++) {

                                            if (i == 1 || i == 3 || i == 2 || i == 7 || i == 8 || i == 9 || i == 10) {
                                                continue;
                                            }
                                            if (i == 4) {
                                                nonClickSets += "<br /><h3><a href='processor.jsp?wid=" + rset.getString(1) + "&keyword=" + keyword + "&redirect=" + rset.getString(5) + "' >" + rset.getString(i) + "</a></h3>(" + rset.getString(8) + "-hits)";
                                            } else {
                                                if (i == 6) {
                                                    nonClickSets += "<br />" + rset.getString(i) + "";
                                                } else {
                                                    nonClickSets += "<br /><a href='processor.jsp?wid=" + rset.getString(1) + "&keyword=" + keyword + "&redirect=" + rset.getString(5) + "' >" + rset.getString(i) + "</a><br />";
                                                }

                                            }
                                        }
                                        nonClickSets += "</td></tr><tr><td><hr /></td><tr /><tr><td>&nbsp;&nbsp;&nbsp;</td><tr />";

                                    }
                                    break;
                                }
                            }
                        } else {

                            if (row % 2 == 0) {
                                resultHtml += "<tr><td>";
                                line = "";
                                for (int i = 1; i <= numColumns; i++) {

                                    if (i == 1 || i == 3 || i == 2 || i == 7 || i == 8 || i == 9 || i == 10) {
                                        continue;
                                    }
                                    if (i == 4) {
                                        resultHtml += "<br /><h3><a href='processor.jsp?wid=" + rset.getString(1) + "&keyword=" + keyword + "&redirect=" + rset.getString(5) + "' >" + rset.getString(i) + "</a></h3>(" + rset.getString(8) + "-hits)";
                                    } else {
                                        if (i == 6) {
                                            resultHtml += "<br />" + rset.getString(i) + "";
                                        } else {
                                            resultHtml += "<br /><a href='processor.jsp?wid=" + rset.getString(1) + "&keyword=" + keyword + "&redirect=" + rset.getString(5) + "' >" + rset.getString(i) + "</a><br />";
                                        }

                                    }
                                }
                                resultHtml += "</td></tr><tr><td><hr /></td><tr /><tr><td>&nbsp;&nbsp;&nbsp;</td><tr />";
                            } else {
                                resultHtml += "<tr><td>";
                                line = "";
                                for (int i = 1; i <= numColumns; i++) {

                                    if (i == 1 || i == 3 || i == 2 || i == 7 || i == 8 || i == 9 || i == 10) {
                                        continue;
                                    }
                                    if (i == 4) {
                                        resultHtml += "<br /><h3><a href='processor.jsp?wid=" + rset.getString(1) + "&keyword=" + keyword + "&redirect=" + rset.getString(5) + "' >" + rset.getString(i) + "</a></h3>(" + rset.getString(8) + "-hits)";
                                    } else {
                                        if (i == 6) {
                                            resultHtml += "<br />" + rset.getString(i) + "";
                                        } else {
                                            resultHtml += "<br /><a href='processor.jsp?wid=" + rset.getString(1) + "&keyword=" + keyword + "&redirect=" + rset.getString(5) + "' >" + rset.getString(i) + "</a><br />";
                                        }

                                    }
                                }
                                resultHtml += "</td></tr><tr><td><hr /></td><tr /><tr><td>&nbsp;&nbsp;&nbsp;</td><tr />";

                            }

                        }


                    }
                    if (email != null) {
                        resultHtml += clickSets + nonClickSets;
                    }

                    try {

                        Edge[] contents = new Edge[arrayList1.size()];
                        Graph obj = new Graph();

                        // creating graph edges
                        for (int i = 0; i < arrayList1.size(); i++) {
                            String x = arrayList1.get(i).getScore();
                            int y = x.indexOf('.');
                            String rez = x.substring(0, y).trim() + "." + x.substring(y + 1, y + 2).trim();
                            contents[i] = new Edge(arrayList1.get(i), Integer.parseInt(x.substring(0, y).trim()));
                            contents[i].toString();
                        }

                        // creating graph
                        for (int i = 0; i < contents.length; i++) {

                            // to see edges with weights enable the following
                            Storage r = (Storage)contents[i].getElem();                        
                            String x = r.getScore();
                            int y = x.indexOf('.');
                            String rez = x.substring(0, y).trim() + "." + x.substring(y + 1, y + 2).trim();                        
                            out.println(r.getTitle()+" (with a weight of "+rez+")<br />");

                            // add edges to graph
                            obj.addEdge(contents[i]);
                        }
                        //to see size of Click Graphs enable the following
                       out.println("Size of Click Graphs is :" + obj.count() + "<br />");

                    } catch (Exception ex) {
                        
                    }

                    totalRecords = row;
                } else {
                    out.println("<p><b>Data Not Found In Database</b></p>");
                }

                dbfunc.closeConnection();

                resultHtml += "</table><br /><input type=\"hidden\" name=\"columnNames\" value=" + headings + "><br />";
                resultHtml += "</form>";
                
                // End
                    stop = System.nanoTime();
                    long elapsedTime = stop - start;
                    double seconds = (double) elapsedTime / 1000000000.0;

                    out.println("<center><p><b>About " + totalRecords + " results acquired in " + seconds + " Milliseconds.</b></p></center>");

                out.println(resultHtml);
            } catch (SQLException ex) {
                out.println("<p><b>" + ex.toString() + "</b></p>");
            } catch (Exception ex) {
                out.println("<p><b>" + ex.toString() + "</b></p>");
            }

        %>
        
        <h2>View Graph by clicking Click Graph</h2>  <a href="graph.jsp"><input type="button" name="graph" value="Click Graphs" />
         

    </body>
</html>
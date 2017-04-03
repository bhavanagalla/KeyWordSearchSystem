<%-- 
    Document   : admin
    Created on : Mar 4, 2015, 9:18:35 PM
    Author     : dell
--%>

<%@page import="query.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title><%=Config.title%></title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />

        <script src="javascript/prototype.js" type="text/javascript"></script>
        <script src="javascript/effects.js" type="text/javascript"></script>
        <script src="javascript/controls.js" type="text/javascript"></script>
        <link rel="stylesheet" href="css/style.css" type="text/css" />

        <link rel="stylesheet" type="text/css" href="css/Ultoo_Redirect_Page.css" />

        <script type="text/javascript" src="js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js/jquery.loginfocus.js"></script>
        



    </head>
    <body>
        <div id="main1">
		<br /><br /><br /><br /><br /><h1 align="center">An Empirical Performance Evaluation of Relational Keyword Search Systems</h1>
         </div>
         
        <%

            String user = (String) session.getAttribute("user");


            /////////////// fancy html /////////////////
            String msg = request.getParameter("msg");
            msg = (msg == null ? "" : msg);

            String fancyhtml = "";
            fancyhtml += "<link rel=\"stylesheet\" href=\"css/fancydropdown.css\">";
            fancyhtml += "<div id=\"menu\">";
            fancyhtml += "<ul class=\"tabs\">";

            if (user != null) {

                fancyhtml += "<li class=\"hasmore\"><a href=\"#\"><span>WELCOME !!! " + user + "</span></a>";
                fancyhtml += "<ul class=\"dropdown\">";
                fancyhtml += "<li><a href=\"hhhh\">Manage Orders Data</a></li>";
                fancyhtml += "<li><a href=\"iiii\">View Orders Data</a></li>";
                fancyhtml += "<li class=\"last\"><a href=\"jjjj\">View Order Details Data</a></li>";
                fancyhtml += "</ul>";
                fancyhtml += "</li>";

                fancyhtml += "<li class=\"last\"><a href=\"logout.jsp\"><span>(Logout)</span></a>";
            } else {
                fancyhtml += "<li class=\"hasmore\"><a href=\"#\"><span>WELCOME !!! GUEST</span></a>";
                fancyhtml += "<ul class=\"dropdown\">";
                fancyhtml += "<li><a href=\"hhhh\">Manage Orders Data</a></li>";
                fancyhtml += "<li><a href=\"iiii\">View Orders Data</a></li>";
                fancyhtml += "<li class=\"last\"><a href=\"jjjj\">View Order Details Data</a></li>";
                fancyhtml += "</ul>";
                fancyhtml += "</li>";
            }

            fancyhtml += "</li>";
            fancyhtml += "</ul>";
            fancyhtml += "</div>";
            //fancyhtml += "<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><center><h2><font color='red'>" + Config.title + "</font></h2></center>";
            fancyhtml += "";
            //fancyhtml += "<script type=\"text/javascript\" src=\"js/fancydropdown.js\"></script>";

            out.println(fancyhtml);
        %>


        <div style="background:#ff7031; width:100%; " id="earn-top">
            
        <table align="center" cellspacing="0">
            <tr>&nbsp;
			<td align="center">&nbsp;&nbsp;&nbsp;&nbsp;<a href="userslist.jsp" target="bottomframe"><img src="images\userslist.png" width="40%" ></td>
			<td align="center"><a href="uploadfiles.jsp" target="bottomframe"><img src="images\upload.png" width="40%" ></td>
			<td align="center">&nbsp;&nbsp;&nbsp;&nbsp;<a href="keylist.jsp" target="bottomframe"><img src="images\keylist.png" width="40%" ></td>
			</tr>
		</table>
            </div>
        <div class="main_page">            
            <div class="mid_content">
                <div class="home_inner_panel">
                    <div class="home_top_panel">
                        <div class="home_left_panel"></div></div></div></div>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            
		
        </div>
     </body>
</html>

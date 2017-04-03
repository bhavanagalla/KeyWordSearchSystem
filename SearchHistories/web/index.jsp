<%-- 
    Document   : index
    Created on : Feb 25, 2015, 10:45:10 AM
    Author     : user
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

        <script type="text/javascript">
            $(document).ready(function() {
                $('#cross-earn').click(function(){
                    $('#earn-top').hide(50);
                });
            });
            
            function sam()
            {
                var uval=document.getElementById('LoginForm_username').value;
                var pval=document.getElementById('LoginForm_password').value;
                if(uval.trim()=='Login ID')
                    document.getElementById('LoginForm_username').value = "";
        
                if(pval.trim()=='password')
                    document.getElementById('LoginForm_password').value = "";
                
                
            }
            
            function checkToc()
            {
                var uval=document.getElementById('search').value;
               alert(uval);
                
                
            }
        </script>


    </head>
    <body>
         <div id="main2">
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
                fancyhtml +="";
                fancyhtml += "</li>";

                fancyhtml += "<li class=\"last\"><a href=\"logout.jsp\"><span>(Logout)<a href=\"history.jsp\"><img src=\"images\\history.png\"target=\"_top\" width=\"50px\"></a></span></a>";
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
            </div>
<br/><br/><br/><br/>
        <div class="main_page">            
            <div class="mid_content">
                <div class="home_inner_panel">
                    <div class="home_top_panel">
                        <div class="home_left_panel">
                            <div class="home_logo"><img src="images/Empty.png" alt="" height="50px"/></div> 
                        </div>
                        
                        <%
                            if (user == null) {
                        %>
                        <form id="login-form" action="LoginValidator" method="post">		
                            <div class="home_right_panel">
                                <div class="right_login_box">
                                    <div class="login_id_box"><input class="login_id_box_text_box" value="Login ID" name="LoginForm[username]" id="LoginForm_username" type="text" onclick="sam();"/>&nbsp;</div>
                                    <div class="login_id_box"><input class="login_id_box_text_box" value="password" name="LoginForm[password]" id="LoginForm_password" type="password" onclick="sam();" />&nbsp;</div>
                                    <div class="login_button_home"><input class="btn_login" type="submit" name="yt0" value="Login" /></div>
                                </div>
                                
                        </form>	
                        <%                            }
                        %>
                    </div>   
                </div> 

                <div id="container">
                    <form method="get" action="dbQueryResults.jsp">
                        <label for="testinput"><font color='white'>Enter Your Search Term</font></label><br />
                        <input type="text" id="search" name="search" autocomplete="off" class="input" value="" width="255" /><br />
                        <input type="submit" value="" class="submit-btn"/>

                        <div id="update" style="display: none; position:relative;"></div>
                        
                    </form>
                    
                    <script type="text/javascript">   
                                    
                        new Ajax.Autocompleter('search','update','<%=Config.xmlResource%>', { tokens: ','} );        
                
                    </script>
                </div>       
                <%
                    if (user == null) {
                %>
                <div class="left_sec">
                    <p class="sign_up">
                        <a href="registration.jsp"><font color="white">Register here...</font><img src="images/sign_up.png" alt="" width="70px"/></a>
                    </p>
                </div>
                <%                            }
                %>
            </div>
        </div> 
    </div>
</div>

<div class="bottom_icon">
    <div class="mid_content">
        <div class="mid_content_inner">
            <div class="bottom_icons_home">
                <h2 align="center"><font color="white"><%=msg%></font></h2>                
            </div>
        </div>
    </div>
</div>            
</body>
</html>
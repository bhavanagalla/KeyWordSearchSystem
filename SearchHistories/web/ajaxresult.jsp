<%-- 
    Document   : ajaxresult
    Created on : Feb 25, 2015, 10:53:35 AM
    Author     : user
--%>

<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!    // preload a list of faked names    
    String[] names = {
        "Albania", "Algeria", "Argentina", "Australia", "Austria",
        "Bahrain", "Belarus", "Belgium", "Bolivia", "Bosnia and Herzegovina", "Brazil", "Bulgaria",
        "Canada", "Chile", "China", "Colombia", "Costa Rica", "Croatia", "Cyprus", "Czech Republic",
        "Denmark", "Dominican Republic",
        "Ecuador", "Egypt", "El Salvador", "Estonia", "Finland", "France",
        "Germany", "Greece", "Guatemala",
        "Honduras", "Hong Kong", "Hungary",
        "Iceland", "India", "Indonesia", "Iraq", "Ireland", "Israel", "Italy",
        "Japan", "Jordan", "Kuwait",
        "Latvia", "Lebanon", "Libya", "Lithuania", "Luxembourg",
        "Macedonia", "Malaysia", "Malta", "Mexico", "Montenegro", "Morocco",
        "Netherlands", "New Zealand", "Nicaragua", "Norway",
        "Oman",
        "Panama", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Puerto Rico",
        "Qatar",
        "Romania", "Russia",
        "Saudi Arabia", "Serbia", "Serbia and Montenegro", "Singapore", "Slovakia", "Slovenia", "South Africa", "South Korea", "Spain", "Sudan", "Sweden", "Switzerland", "Syria",
        "Taiwan", "Thailand", "Tunisia", "Turkey",
        "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "Uruguay",
        "Venezuela", "Vietnam",
        "Yemen",
        
        "Anna", "Apple","Nestle","An", "America", "Ali", "Ahmed", "Brittany", "Ball", "Cinderella", "Car", "Diana", "Door", "Eva", "Ear", "Fiona", "Fan", "Gunda", "Game", "Hege", "High", "Inga", "Johanna", "Joomla", "Kitty", "Kitkat", "Linda", "Loser", "Nina", "Noise", "Ophelia", "Open", "Petunia", "People", "Amanda", "Area", "Raquel", "Rar", "Cindy", "Close", "Doris", "Do", "Eve", "Event", "Evita", "Sunniva", "Sun", "Tove", "Tall", "Unni", "Under", "Violet", "Vote", "Liza", "Land", "Elizabeth", "English", "Ellen", "Wenche", "Water", "Vicky", "Vila"
    };
%>

<%
    // get the parameter from the query string
    String s = request.getParameter("search");
    if (s == null) {
        s = "";
    }else {
        s = s.toLowerCase();
    }

    // go through the name list to find all the matches	
    String hint = null;
    if (s.length() > 0) {
        int count = 0;
        for (int k = 0; k < names.length; k++) {
            String name = names[k].toLowerCase();
            if (name.startsWith(s)) {
                count++;
                if (count == 1) {
                    hint = "<li>"+names[k]+"</li>";
                } else {
                    hint += "<li>" + names[k]+"</li>";
                }
            }

        }
    }

    if (hint == null) {
        out.print("no suggestion");
    } else {
        out.print("<ul>"+hint+"</ul>");
    }
%>

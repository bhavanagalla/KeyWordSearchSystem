<%-- 
    Document   : graphBG
    Created on : Mar 8, 2015, 10:04:15 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>

<%@ page import="java.io.OutputStream" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="java.awt.*" %>
<%@ page import="com.sun.image.codec.jpeg.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
public class graphBG
{

Font font = new Font("ARIAL", Font.BOLD , 11);
Color headerColor = new Color(20,50,100);

public Graphics2D draw(Graphics2D biContext, int WIDTH, int HEIGHT, String headerText, String averageText)
{
//Grey color for the drop shadow
Color dropShadow = new Color(200,200,200);

//Graph and header dimensions
Dimension dim = new Dimension(WIDTH,HEIGHT);
Dimension dimGraph = new Dimension(WIDTH-21,HEIGHT-51);
Dimension dimHeader = new Dimension(WIDTH-21,20);

//Define Rectangles:
Rectangle area = new Rectangle(dim);
Rectangle graphArea = new Rectangle(dimGraph);
Rectangle headerArea = new Rectangle(dimHeader);

/////////////////////////////////////////////////////////////////////////////////////
//Set up the graph:
/////////////////////////////////////////////////////////////////////////////////////

//Set background color to white:
biContext.setColor(Color.white);
biContext.fill(area);

//Drop shadow for the graph area:
//graphArea.setLocation(18, 42); //This is the drop shadow's location
//biContext.setColor(dropShadow);
//biContext.fill(graphArea);

//Fill the graph area (white):
graphArea.setLocation(11, 36);
biContext.setColor(Color.white);
biContext.fill(graphArea);

//Draw the graph border (black):
biContext.setColor(Color.black);
biContext.draw(graphArea);


//Header Drop Shadow:
//headerArea.setLocation(18, 12); //This is the drop shadow's location
//biContext.setColor(dropShadow);
//biContext.fill(headerArea);

//Fill the header (blue):
//headerArea.setLocation(11, 5);
//biContext.setColor(headerColor);
//biContext.fill(headerArea);

//Draw the header border (white):
biContext.setColor(Color.white);
biContext.draw(headerArea);

//Insert Header Text:
//biContext.setFont(font);
//biContext.setColor(Color.white);
//biContext.drawString(headerText, 21, 18);

//Display the average
//biContext.setColor(Color.white);
//biContext.drawString(averageText, 350, 18);


return biContext;
}
}
%>
        <h1>Hello World!</h1>
    </body>
</html>

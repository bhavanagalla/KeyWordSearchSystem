<%--  
    Document   : index
    Created on : Mar 8, 2015, 10:02:39 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>

<%@page import="java.io.OutputStream"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.awt.*"%>
<%@page import="com.sun.image.codec.jpeg.*"%> 


<%@include file = "graphBG.jsp"%>

<% 

//Data arrays

String datanames[] =  { "apple",
 "apple india",
 "apple iphone 5",
 "apple fruit",
 "apple free apps",
 "apple ipad",
 "apple mac",
 "appsc",
 "appsc results",
 "appsc material",
 "appsc notification",
 "apsrtc",
 "axis bank",
 "abdul kalam",
 "acharya nagarjuna university",
 "adobe",
 "aeroplane",
 "after effects",
 "age calculator",
 "apj abdul kalam quotes",
 "apj abdul kalam speech",
 "nestle",
 "nestle baby food",
 "nestle coffee",
 "mondial",
 "IMDb",
 "Wikipedia"
   };
int datavalues[] = {19, 1, 3, 8, 12, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,3,2,1,0,1,0};

//current y position
int y_pos = 0;

//y offset to cater for header space
int headerOffset = 50; 

//inner padding to make sure bars never touch the outer border
int innerOffset = 20;

//height of bar, text and total
int barHeight= 10;
int textHeight= 20;
int displayHeight = barHeight + textHeight;

//Color used for the bars
Color barColor = new Color(153,19,19);

//Set the graph's outer width
int WIDTH = 500;

//Set the graph's outer height
int HEIGHT = (datavalues.length * displayHeight) + headerOffset + innerOffset;

//Width of the graphable area
int innerWIDTH = WIDTH - (innerOffset * 2);

//Calculate average
int average = 0;
for(int i=0; i<datavalues.length; i++)
{
average += datavalues[i];
}
average = average / datavalues.length;

//Calculate maximum
int maximum = 0;
for(int i=0; i<datavalues.length; i++)
{
if(datavalues[i] > maximum)
{
maximum = datavalues[i];
}
}



///////////////////////////////////////////////////////////////////////////////////////
//Draw Graph Background and Header:
///////////////////////////////////////////////////////////////////////////////////////

response.setContentType("image/jpeg");
BufferedImage bi = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
Graphics2D biContext = bi.createGraphics();
graphBG gr = new graphBG();
gr.draw(biContext, WIDTH, HEIGHT, "Sales Analysis of Client :", "from " );



/////////////////////////////////////////////////////////////////////////////////////
//Draw data onto the graph:
/////////////////////////////////////////////////////////////////////////////////////


//Loop through & draw the bars

for(int i=0; i<datavalues.length; i++)
{
int currentValue = datavalues[i];

//Set y position for bar
y_pos = i * displayHeight + headerOffset;

//Set bar width
int barWidth = (innerWIDTH * currentValue) / maximum;

//Display the current value
String display = datanames[i] + " (" + currentValue + ")";
biContext.setColor(Color.black);
biContext.drawString(display, 20, y_pos);

//Set dimensions of the bar
biContext.setColor(barColor);
Dimension bar = new Dimension(barWidth , barHeight);
Dimension barBorder = new Dimension(barWidth - 3 , barHeight - 3);
Rectangle barRect = new Rectangle(bar);
Rectangle barRectBorder = new Rectangle(barBorder);

//Draw bar and border:
barRect.setLocation(21, 5 + y_pos);
barRectBorder.setLocation(22, 6 + y_pos);
biContext.setColor(barColor);
biContext.fill(barRect);
biContext.setColor(Color.white);
biContext.draw(barRectBorder);
}



/////////////////////////////////////////////////////////////////////////////////////
//Display the graph
/////////////////////////////////////////////////////////////////////////////////////

//Encode:
OutputStream output = response.getOutputStream();
JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(output);
encoder.encode(bi);
output.close();

%>
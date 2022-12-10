<%-- 
    Document   : homePage1
    Created on : 13 Oct, 2021, 9:43:01 PM
    Author     : dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Parking System</title>
        <link href="externalCss.css" rel="stylesheet" type="text/css" />
    </head>
    <body background="img/home2.png">
        <%
           
                        Statement st = null;
                        Calendar calendar = Calendar.getInstance();
                        String username1 = "", vehicleNumber1 = "", contact1 = "", vehicleType1 = "", address1 = "";
                        st = database.DBConnector.getStatement();
                        String username  = (String)session.getAttribute("username");
                        String userID = (String)session.getAttribute("userID");
                        String userID1= request.getParameter("userID");
                       
                         
                       
                        int day=calendar.get(Calendar.DATE);
                        int month=calendar.get(Calendar.MONTH)+1;
                        int year=calendar.get(Calendar.YEAR);
                        String currentDate = day+"-"+month+"-"+year;
                            
                        String currentTime = calendar.get(Calendar.HOUR)+":"+calendar.get(Calendar.MINUTE)+":"+calendar.get(Calendar.SECOND);
                          session.setAttribute("currentTime", "currentTime");
                          session.setAttribute("currentDate", "currentDate");
                        
           if(username==null)
           {
               response.sendRedirect("firstPage.html");
           }
          
           try
           {
               String query = "Select username,vehicleNumber,contact,vehicleType,address from registeruser where userID='"+userID1+"'";
               System.out.println("home page1 query=  "+query);
               ResultSet rs;
               rs = st.executeQuery(query);
               while(rs.next())
               {
                   username1 = rs.getString(1);
                   System.out.println(rs.getString(1));
                   vehicleNumber1 = rs.getString(2);
                   System.out.println(rs.getString(2));
                   contact1 = rs.getString(3);
                   System.out.println(rs.getString(3));
                   vehicleType1 = rs.getString(4);
                   System.out.println(rs.getString(4));
                   address1 = rs.getString(5);
                   System.out.println(rs.getString(5));
               }
           System.out.println("username = "+username1+"userID = "+userID+"vehicleType = "+vehicleType1+"address = "+address1);
          
        %>
        
        <div style="float: left;width: 100%;">
            <h1></h1>
        </div>
        <%--
        FOR USER REGISTRATION
        --%>
            <form action="UserRegistration" method="post">
                <div style="background-color:lightgray;padding: 10px;width: 10%;float:left;"> 
                 <input type="submit" value="User Registration" />
                  </div>
            </form>
            
        <div style="width: 40%;float: left;">
            <h1></h1>
        </div>
        
            <form action="logOut.jsp">
                <div style="background-color:lightgray;padding: 10px;width: 10%;float:left; ">
                     <input type="submit" value="Log Out" />
                 </div>    
            </form>
       
        <div style="padding: 50px;">
            <h></h>
        </div>
            

            <div style="width: 25%;background-color:lightgray;padding-bottom: 27% ;float: left;">
                
                <h1><font color="black" > For Registered User</font></h1>  
                <form action="homePage1.jsp" method="post">
                   
                    <table>
                        <tr>
                            <td><b>User ID:</b></td>
                            <td><input type="text" placeholder="Enter User Id" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><b><input type="Submit" ></b></td>
                        </tr>
                    </table>
                    
                </form>
                
            </div>
            
            <div style="width: 5%;float: left;">
                <h1></h1>
            </div>
            
            <div style="width: 35%;float: left;background-color: lightgray;padding-bottom: 6%;">
                <h1><font color="black" >&nbsp;&nbsp; Customer Details</font></h1>
                <form action="getToken.jsp" method="post">
                    <table height="300" width="400">
                    <tr>
                        <td><font color="black"><b>Customer Name: </b></font></td>
                        <td><input type="text" name="username" value="<%=username1%>" /></td>
                    </tr>
                     <tr>
                        <td><font color="black"><b>Vehicle Number: </b></font></td>
                        <td> <input type="text" name="vehicleNumber" value="<%=vehicleNumber1%>" /></td>
                    </tr>
                    
                     <tr>
                         <td><b><font color="black">Date: </font></b></td>
                        <td><input type="text" name="currentDate" value="<%=currentDate%>" /></td>
                    </tr>
                     <tr>
                         <td><b><font color="black">Time: </font></b></td>
                        <td><input type="text" name="currentTime" value="<%=currentTime%>" /></td>
                    </tr>
                     <tr>
                         <td><b><font color="black">Vehicle Type: </font></b></td>
                        <td><input type="text" name="vehicleType" value="<%=vehicleType1%>" /></td>
                    </tr>
                     <tr>
                         <td><b><font color="black">Address: </font></b></td>
                        <td><input type="text" name="address" value="<%=address1%>" /></td>
                    </tr>
                     <tr>
                         <td><b><font color="black">Contact: </font></b></td>
                        <td><input type="text" name="contact" value="<%=contact1%>" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Get Token"/></td>
                    </tr>
                </table>
                
                </form>
            </div>
            
        
    </body>
</html>
<%
  }
catch(SQLException e)
{
    System.out.println(e);

}

%>
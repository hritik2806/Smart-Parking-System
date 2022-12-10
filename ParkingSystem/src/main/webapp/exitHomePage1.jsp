<%-- 
    Document   : exitHomePage1
    Created on : 3 Dec, 2021, 10:14:42 PM
    Author     : dell
--%>


<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Parking System</title>
    </head>
    <body background="img/home2.png">
        <form action="logOut.jsp">
                <div style="background-color:lightgray;padding: 10px;width: 10%;float:left; ">
                     <input type="submit" value="Log Out" />
                 </div>    
            </form>
        <br/><br/><br/><br/>
         <%
           
                        Statement st = null;
                        Calendar calendar = Calendar.getInstance();
                        String customerName = "", vehicleNumber = "", vehicleType = "",floorNumber="",slotnumber="";
                        
                        st = database.DBConnector.getStatement();
                        String username  = (String)session.getAttribute("username");
                        String userID = (String)session.getAttribute("userID");
                        String userID1= request.getParameter("userID");
                       String tokenID = request.getParameter("tokenID");
                         
                       
                        int day=calendar.get(Calendar.DATE);
                        int month=calendar.get(Calendar.MONTH)+1;
                        int year=calendar.get(Calendar.YEAR);
                        String currentDate = day+"-"+month+"-"+year;
                            
                        String currentTime = calendar.get(Calendar.HOUR)+":"+calendar.get(Calendar.MINUTE)+":"+calendar.get(Calendar.SECOND);
                           
                        
           if(username==null)
           {
               response.sendRedirect("firstPage.html");
           }
          
           try
           {
               String query = "Select CustomerName,vehicleNumber,vehicleType,floorNumber,slotnumber from tokengenerator where TokenID='"+tokenID+"'";
               System.out.println("tokengenerator  query=  "+query);
               ResultSet rs;
               rs = st.executeQuery(query);
               while(rs.next())
               {
                   customerName = rs.getString(1);
                   System.out.println(rs.getString(1));
                   vehicleNumber = rs.getString(2);
                   System.out.println(rs.getString(2));
                
                   vehicleType = rs.getString(3);
                   System.out.println(rs.getString(3));
                   
                   floorNumber = rs.getString(4);
                   System.out.println(rs.getString(4));
                   
                   slotnumber = rs.getString(5);
                   System.out.println(rs.getString(5));
                   
               }
           System.out.println("customerName = "+customerName+"tokenID = "+tokenID+"vehicleType = "+vehicleType);
          
        %>
        <div style="width: 25%;background-color:lightgray;padding-bottom: 26% ;float: left;">
                
                <h1><font color="black" > For Registered User</font></h1>  
                <form action="exitHomePage1.jsp" method="post">
                   
                    <table>
                        <tr>
                            <td><b>Token Number:</b></td>
                            <td><input type="text" name="tokenID" placeholder="Enter Token Number" /></td>
                        </tr>
                        <tr>
                            <td></td>
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
                <h1><font color="black" >&nbsp;&nbsp;Customer Details</font></h1>
                <form action="generateBill.jsp" method="post">
                    <table height="300" width="400">
                    <tr>
                        <td><font color="black"><b>Customer Name: </b></font></td>
                        <td><input type="text" name="customerName" value="<%=customerName%>" /></td>
                    </tr>
                     <tr>
                        <td><font color="black"><b>Vehicle Number: </b></font></td>
                        <td> <input type="text" name="vehicleNumber" value="<%=vehicleNumber%>" /></td>
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
                         <td><b><font color="black">Floor Number: </font></b></td>
                        <td><input type="text" name="floorNumber" value="<%=floorNumber%>" /></td>
                    </tr>
                    <tr>
                         <td><b><font color="black">Slot Number: </font></b></td>
                        <td><input type="text" name="slotNumber" value="<%=slotnumber%>" /></td>
                    </tr>
                     <tr>
                         <td><b><font color="black">Vehicle Type: </font></b></td>
                        <td><input type="text" name="vehicleType" value="<%=vehicleType%>" /></td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Calculate and Generate Bill"/></td>
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
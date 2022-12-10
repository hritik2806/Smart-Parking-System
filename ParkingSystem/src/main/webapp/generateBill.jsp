<%-- 
    Document   : generateBill
    Created on : 3 Dec, 2021, 11:38:46 PM
    Author     : dell
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="database.DBConnector"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Parking System</title>
    </head>
    <body bgcolor="yellow">
           <form action="logOut.jsp">
                <div style="background-color:lightgray;padding: 10px;width: 10%;float:left; ">
                     <input type="submit" value="Log Out" />
                 </div>    
            </form>
        <br/><br/>
        <%
             Statement st = null;
            ResultSet rs = null;
           String customerName,vehicleNumber,currentTime,currentDate,vehicleType,floorNumber,slotNumber, tokenID="", currenttimemilis1="",currenttimemilis2="";
           long cost=0;
           customerName = request.getParameter("customerName");
           vehicleNumber = request.getParameter("vehicleNumber");
           currentDate = request.getParameter("currentDate");
           currentTime = request.getParameter("currentTime");
           vehicleType = request.getParameter("vehicleType");
           floorNumber = request.getParameter("floorNumber");
           slotNumber = request.getParameter("slotNumber");
           String status="";
           try
        {
            st=DBConnector.getStatement();
            
           String query="select tokenID from tokengenerator where vehicleNumber='"+vehicleNumber+"'";
           rs = st.executeQuery(query);
           while(rs.next())
           {
               tokenID = rs.getString(1);
               System.out.println("tokenID = "+tokenID);
           }
           String query1="select currenttimemilis,status from tokengenerator where tokenid='"+tokenID+"'";
           rs = st.executeQuery(query1);
            while(rs.next())
            {
                currenttimemilis1=rs.getString(1);
                status = rs.getString(2);
                currenttimemilis2=String.valueOf(System.currentTimeMillis());
            }
            if(status.equalsIgnoreCase("active"))
            {
                String query2="update parking.status set status='free' where slotNumber='"+slotNumber+"'";
                
                String query3="update parking.tokengenerator set status='inactive' where tokenid='"+tokenID+"'";
                
                int i=DBConnector.getStatement().executeUpdate(query2);
                int j=DBConnector.getStatement().executeUpdate(query3);
                
                if(i>0 && j>0)
                {
                    System.out.println("Record updated");
                }
                else
                {
                    System.out.println("not Updated");
                }
                long time1=Long.parseLong(currenttimemilis1);
                long time2=Long.parseLong(currenttimemilis2);

                long time3=time2-time1;
                time3=time3/360000+1;
                 cost=time3*25;

                
            }
            %>
    <center> <h1>Total Amount to pay</h1>
            <table width="300" hieght="300">
                <tr>
                    <td><b>Customer Name: </b></td>
                    <td><b><%=customerName%></b></td>
                </tr>
                <tr>
                    <td><b>Vehicle Number: </b></td>
                    <td><b><%=vehicleNumber%></b></td>
                </tr>
                <tr>
                    <td><b>Total Amount: </b></td>
                    <td><b>rs.<%=cost%></b></td>
                </tr>
                
            </table></center>
            
            <%

        }
catch(SQLException e)
{
System.out.println(e);
}
            %>
    </body>
</html>

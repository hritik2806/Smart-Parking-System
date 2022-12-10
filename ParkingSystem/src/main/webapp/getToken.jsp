<%-- 
    Document   : getToken
    Created on : 22 Oct, 2021, 1:22:15 PM
    Author     : dell
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Parking System</title>
    </head>
    <body background="img/token.png">
        
       
  <%
          
        Statement st = null;
        ResultSet rs = null;
        Calendar calendar = Calendar.getInstance();
        int count=0;
        String query="";
        String floorNumber,slotNumber;
        String tokenNumber="";
        st = database.DBConnector.getStatement();
        String customerName = request.getParameter("username");
        String vehicleNumber = request.getParameter("vehicleNumber");
        
        String vehicleType = request.getParameter("vehicleType");
        int day=calendar.get(Calendar.DATE);
        int month=calendar.get(Calendar.MONTH)+1;
        int year=calendar.get(Calendar.YEAR);
        String currentDate = day+"-"+month+"-"+year;
                            
        String currentTime = calendar.get(Calendar.HOUR)+":"+calendar.get(Calendar.MINUTE)+":"+calendar.get(Calendar.SECOND);             
            String username  = (String)session.getAttribute("username");
            if(username==null)
                 {
                     response.sendRedirect("firstPage.html");
                 }
            try
            {
                if(vehicleType.equals("2"))
                {
                     query="insert into status (floornumber,status,vehicletype) values('A','free','"+vehicleType+"')"; 
                }
                else
                {
                    query="insert into status (floornumber,status,vehicletype) values('B','free','"+vehicleType+"')"; 
                }
                System.out.println(query);
                int i=st.executeUpdate(query);
                if(i>0)
                {
                    System.out.println("FloorNumber Inserted");
                }
                String query4 = "select count(status) from status where status='busy'";
                rs = st.executeQuery(query4);
                if(rs.next())
                {
                    count=Integer.parseInt(rs.getString(1));
                }
                if(count == 100)
                {
                    response.sendRedirect("noFreeSlot.jsp");
                }
                String query1="select floorNumber, slotnumber from status where status='free' and vehicletype='"+vehicleType+"'";
            rs=st.executeQuery(query1);
            if(rs.next())
            {
                floorNumber=rs.getString(1);
                slotNumber=rs.getString(2);
                System.out.println("exception Slotnumber = "+slotNumber);
                
                String query2="INSERT INTO tokengenerator(CustomerName,vehicleNumber,CurrentDate,currentTime,vehicleType,floorNumber,slotnumber,currenttimemilis,status) VALUES ('"+customerName+"','"+vehicleNumber+"','"+currentDate+"','"+currentTime+"','"+vehicleType+"','"+floorNumber+"','"+slotNumber+"','"+System.currentTimeMillis()+"','active')";
                int k=st.executeUpdate(query2);
                if(k>0)
                {
                    String query3="Update parking.status set status='busy' where slotnumber='"+slotNumber+"'";
                    System.out.println(query3);
                    int j=st.executeUpdate(query3);
                    if(j>0)
                    {
                        System.out.println("Updated");
                    }
                 rs=st.executeQuery("select tokenID from tokengenerator where customername='"+customerName+"' AND vehicleNumber='"+vehicleNumber+"' AND currentDate='"+currentDate+"' AND currentTime='"+currentTime+"'");
            while(rs.next())
            {
                tokenNumber=rs.getString(1);
            }

                    %>
    <center>
        <h1><font color="black">Your Token Number is: <%=tokenNumber%></font></h1>
                    <table border="1" height = 400 width =400 bgcolor="lightgray">
                        <tr>
                            <td><b>Customer Name:</b></td>
                            <td><b><%=customerName%></b></td>
                        </tr>
                        <tr>
                            <td><b>Vehicle Number:</b></td>
                            <td><b><%=vehicleNumber%></b></td>
                        </tr>
                         <tr>
                            <td><b>Date:</b></td>
                            <td><b><%=currentDate%></b></td>
                        </tr>
                        <tr>
                            <td><b>Time:</b></td>
                            <td><b><%=currentTime%></b></td>
                        </tr>
                        <tr>
                            <td><b>Floor Number:</b></td>
                            <td><b><%=floorNumber%></b></td>
                        </tr>
                        <tr>
                            <td><b>Slot Number:</b></td>
                            <td><b><%=slotNumber%></b></td>
                        </tr>
                        <tr>
                        <form action="firstPage.html" method="post">
                            <td></td>
                            <td><b><input type="submit" value="Logout"/></b></td>
                            </form> 
                        </tr>
                        
                        
                    </table>
    </center>
                    
                    <%
            }
}
}
catch(SQLException e)
{
System.out.println(e);
}

            

            
  %>
        
        
    </body>
</html>


<%-- 


 try
            {
                st = database.DBConnector.getStatement();

                String query1="select floorNumber, slotNumber from status where status='free' and vehicletype='"+vehicleType+"'";
                rs=st.executeQuery(query1);
                if(rs.next())
                {
                    floorNumber=rs.getString(1);
                    slotNumber=rs.getString(2);

                    String query2="INSERT INTO tokengenerator(CustomerName,vehicleNumber,CurrentDate,currentTime,vehicleType,floorNumber,slotNumber,currenttimemilis,status) VALUES ('"+customerName+"','"+vehicleNumber+"','"+currentDate+"','"+currentTime+"','"+vehicleType+"','"+floorNumber+"','"+slotNumber+"','"+System.currentTimeMillis()+"','active')";
                    int i=st.executeUpdate(query2);
                    if(i>0)
                    {
                        String query3="Update parking.status set status='busy' where slotnumber='"+slotNumber+"'";
                        System.out.println(query3);
                        int j=st.executeUpdate(query3);
                        if(j>0)
                        {
                            System.out.println("Updated");
                        }
                        //String tokenNumber = getToken1();
                        
                        String tokenNumber="";
                        try 
                {
                     rs=st.executeQuery("select tokenID from tokengenerator where customername='"+customerName+"' AND vehicleNumber='"+vehicleNumber+"' AND currentDate='"+currentDate+"' AND currentTime='"+currentTime+"'");
                    while(rs.next())
                    {
                        tokenNumber=rs.getString(1);
                    }
                } 
                catch (SQLException e) 
                {
                    System.out.println(e);
                }
                        
                       /* tokenNumber.setText("Token Number: "+getToken());
                        uName.setText(customerName);
                        vNumber.setText(vehicleNumber);
                        vType.setText(vehicleType);
                        cDate.setText(currentDate);
                        cTime.setText(currentTime);
                        fNum.setText(floorNumber);
                        sNum.setText(slotNumber);*/
                       %>
                       
                       
                       
                       
                       <%
                    }
                    else
                    {
                        System.out.println("Record Not Inserted");
                    }
                }
                else
                {
                    response.sendRedirect("noFreeSlot.jsp");
                }
            }
        catch(SQLException e)
        {
            System.out.println(e);
        }
             
             String getToken1()
            {
                String tokenNumber="";
                st=database.DBConnector.getStatement();
                try 
                {
                     rs=st.executeQuery("select tokenID from tokengenerator where customername='"+customerName+"' AND vehicleNumber='"+vehicleNumber+"' AND currentDate='"+currentDate+"' AND currentTime='"+currentTime+"'");
                    while(rs.next())
                    {
                        tokenNumber=rs.getString(1);
                    }
                } 
                catch (SQLException e) 
                {
                    System.out.println(e);
                }
                return tokenNumber;
        }
            
        

--%>
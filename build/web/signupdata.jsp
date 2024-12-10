<%-- 
    Document   : signupdata
    Created on : 23-Dec-2023, 10:25:37 PM
    Author     : apiiit123
--%>

<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileWriter"%>
<%@page import="RRTS.*"%>
<%@ page import ="java.sql.*" %>
<%
    try{
        
        // Get form parameters
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String pass = request.getParameter("password");
        
        Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RRTS?" + "user=root&password=Naveen@30");
        
        PreparedStatement pst = conn.prepareStatement("INSERT INTO USERS (name, email, mobile, password) VALUES (?, ?, ?, ?)");
          
        pst.setString(1, username);
        pst.setString(2, email);
        
        pst.setString(3, phone);
        pst.setString(4, pass);
        
        
        int rowsAffected = pst.executeUpdate();
        
        if (rowsAffected > 0) {
            System.out.println("Your Sign up is Success");
        } else {
            System.out.println("Sign up failed. No rows were affected.");
        }
        
        
        
        
        %> 
        
        <jsp:forward page = "userlogin.html"/>
        
        <jsp:include page = "index.html"/>
        <%
        
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again"+e);       
   }      
%>
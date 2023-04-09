

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
 String id= request.getParameter("id");
 
                              Connection con;
                              PreparedStatement pst;
                              ResultSet rs;
   
                             Class.forName("com.mysql.jdbc.Driver");
                             con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspcrud","root","Sonali7559321912");
                              pst=con.prepareStatement("delete from student where id=? ");
                              pst.setString(1,id);
                              pst.executeUpdate();
                              



                             %>


                             <script>
                                 
                             alert("record deleted");
                             </script>
                             <html>
                                 <head>
                                 </head>
                                 <body>
                                     <div align="center">
                            <p><a href="index.jsp">Click back</a></p>
                        </div>
                                 </body>
                             </html>
                             
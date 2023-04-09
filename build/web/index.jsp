

<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
   if(request.getParameter("submit")!=null)
   {
   String name = request.getParameter("sname");
   String course = request.getParameter("course");
   String fee = request.getParameter("fee");
   
   Connection con;
   PreparedStatement pst;
   ResultSet rs;
   
   Class.forName("com.mysql.jdbc.Driver");
   con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspcrud","root","Sonali7559321912");
   pst= con.prepareStatement("insert into student(stname,course,fee) values(?,?,?)");
   pst.setString(1,name);
   pst.setString(2,course);
   pst.setString(3,fee);
   
   pst.executeUpdate();
   %>
   <script>
       alert("record added");
       </script>
       
       <%
           }
     %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body background-color="pink">
        <h1><b>Student Registration form using JSP<b></h1>
        <div class="row">
            <div class="col-sm-4">
                <form method="post" action="#">
                    <div align="left">
                        <label class="form-label">Student Name</label>
                        <input type="text" class="form-control" placeholder="Student-Name" name="sname" id="sname" required>
                    </div>
                    
                    <div align="left">
                        <label class="form-label">Course</label>
                        <input type="text" class="form-control" placeholder="Course-name" name="course" id="course" required>
                    </div>
                    
                    <div align="left">
                        <label class="form-label">Fee</label>
                        <input type="text" class="form-control" placeholder="Fee" name="fee" id="fee" required>
                    </div>
                    <br>
                    <div align="left">
                        <input type="submit" value="submit"   name="submit" id="submit"  class="btn btn-info">
                        <input type="reset" value="reset"   name="reset" id="reset"  class="btn btn-warning">
                    </div>
                </form>
        </div>
            <div class="col-sm-8">
                <div class="panel-body">
                    <table id="tbl-student" border="1 px solid black" class="table table-responsive tabel-bordered" cellpadding="1" width="80%">
                      
                        <tr>
                               <th>Student Name</th
                                <th>id</th>

                                <th>Course</th>
                                <th>Fee</th>
                                <th>Edit</th>
                                <th>Delete </th>
                            </tr>
                            
                   
                    
                        <%
                              Connection con;
                              PreparedStatement pst;
                              ResultSet rs;
   
                             Class.forName("com.mysql.jdbc.Driver");
                             con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspcrud","root","Sonali7559321912");
                             String query= "select* from student ";
                               //Statement st = con.createStatement();
                                  //Statement st = con.createStatement();
                                     rs = con.createStatement().executeQuery("select * from student");
                             while(rs.next())
                             {
                             String id = rs.getString("id");
                           
                            %>
                            <tr>
                                <td> <%= rs.getString("stname")%></td> 
                                 <td> <%= rs.getString("course")%></td> 
                                  <td> <%= rs.getString("fee")%></td> 
                                   <td> <a href="update.jsp?id=<%= id%>">Edit</a></td>
                                    <td> <a href="delete.jsp?id=<%=id%>">Delete</a></td>
                                     
                                
                            </tr>
                            <%
                                }
                             %>
                        
                    </table>
                             
                             
                    
                    
                </div>
            
            </div>
                             <style>
                                 table,th,td{
                                     border:1px solid black;
                                 }
                                 body{
                                         background-repeat: no-repeat;
                                         background-color: pink;
                                         background-image: url("https://www.wallpapers13.com/nature-lake-bled-desktop-background-image/https://www.wallpapers13.com/nature-lake-bled-desktop-background-image/");
                                 }
                             </style>
                             
            
        
        
    </body>
</html>

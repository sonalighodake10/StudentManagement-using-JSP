

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.sql.PreparedStatement"%>

<%
    if(request.getParameter("submit")!=null)
    {
    String id= request.getParameter("id");
    String name= request.getParameter("sname");
    String course= request.getParameter("course");
    String fee= request.getParameter("fee");
    
                               Connection con;
                              PreparedStatement pst;
                              ResultSet rs;
   
                             Class.forName("com.mysql.jdbc.Driver");
                             con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspcrud","root","Sonali7559321912");
                              pst=con.prepareStatement("update student set stname=?, course=?,fee=? where id=?");
                              pst.setString(1,name);
                              pst.setString(2,course);
                              pst.setString(3,fee);
                              pst.setString(4,id);
                              pst.executeUpdate();
                              
                              %>
                              
                              <script>
                                  alert("Record updated");
                                  
                                  </script>
                                  <%
                                  }
                                 %>


    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>update Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>update data</h1>
        <div class="row">
            <div class="col-sm-4">
                <form method="post" action="#">
                      <%
                               Connection con;
                               //PreparedStatement pst;
                               ResultSet rs;             
   
                               Class.forName("com.mysql.jdbc.Driver");
                              con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspcrud","root","Sonali7559321912");
                              String id = request.getParameter("id");
                               String query="select * from student where id=?";

                                //pst= Connection.createStatement("select * from student where id=?");
                              //PreparedStatement pst = con.createStatement("select * from student where id=?");
                               PreparedStatement pst= con.prepareStatement("select * from student where id=?"); 
                              pst.setString(1,id);
                               rs= pst.executeQuery();
                               while (rs.next())
                               {
                           %>
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
                    <% }
                     %>
                    <div align="left">
                        <input type="submit" value="submit"   name="submit" id="submit"  class="btn btn-info">
                        <input type="reset" value="reset"   name="reset" id="reset"  class="btn btn-warning">
                    </div>
                        <div align="left">
                            <p><a href="index.jsp">Click back</a></p>
                        </div>
                           
                           
                           
                           
                </form>
            </div>
        </div>
    </body>
</html>

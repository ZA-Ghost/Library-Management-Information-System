<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.io.*, java.util.*, java.sql.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="menuHeader.css">
        
    </head>
    <body>
        
        <header>
    <nav>
      <ul class="horizontal-menu">
        <li><a href="addBook.html">Add Book</a></li>
        <li><a href="viewBooks.jsp">View Book</a></li>
        <li><a href="addBorrower.html">Issue Book</a></li>
        <li><a href="issuedBooks.jsp">Issued Books</a></li>
        <li><a href="returnedBooks.jsp">Returned Books</a></li>
        <li><a href="updateOutstandingBooks.jsp">Outstanding Books</a></li>
      </ul>
    </nav>
  
    <form class="logout-form" action="logout.jsp" method="POST">
      <button type="submit">Logout</button>
    </form>
  </header>
  
        <br>
        
       <sql:setDataSource var="libraryMIS" driver="com.mysql.jdbc.Driver"
         url="jdbc:mysql://localhost:3306/librarymis"
          user="root"  password=""/>  
    
    <sql:update dataSource="${libraryMIS}" var="dbResult">
    UPDATE borrowers
    SET firstname = '${param.firstName}',
      lastname = '${param.lastName}',
      email = '${param.email}',
      phone = '${param.phone}',
      address = '${param.address}',
      title = '${param.title}',
      author = '${param.author}',
      edition = '${param.edition}',
      date_issued = '${param.dateIssued}',
      return_date = '${param.returnDate}',
      comment = '${param.comment}'
    WHERE id = ${param.id}
    </sql:update>

  <c:if test="${dbResult>=1}"> 
      <c:redirect url="adminHomePage.html" >
            <c:param name="msg" value="Details Have Been Updated" />
         </c:redirect>
      </c:if>
            


    </body>
</html>

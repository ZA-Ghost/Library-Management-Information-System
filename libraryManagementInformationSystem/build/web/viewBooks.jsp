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
        <title>Library Management Information System</title>
        <link rel="stylesheet" href="tableCSS.css"> 
        <link rel="stylesheet" href="tableMenuCSS.css">
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

   <sql:query dataSource="${libraryMIS}" var="result">
       SELECT * from books;
       </sql:query>    
  
  
        <div class="search-bar">
        <input type="text" id="searchInput" placeholder="Search">
        </div>
        
        <script src="searchTable.js"></script>
        
        <table id="dataTable">

            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>ISBN</th>
                <th>Edition</th>
                <th>Quantity</th>
                <th>Update</th>
            </tr>   
        
        
           <c:forEach var="row" items="${result.rows}">
           
            
            <tr>
            <td><c:out value="${row.id}"/></td>
            <td><c:out value="${row.title}"/></td>
            <td><c:out value="${row.author}"/></td>
            <td><c:out value="${row.isbn}"/></td>
            <td><c:out value="${row.edition}"/></td>
            <td><c:out value="${row.quantity}"/></td>
            <td><a href="updateBookDetails.jsp?id=<c:out value="${row.id}"/>">Update</a> </td>
            </tr>
            </c:forEach>
           </table>
        </center>
    </body> 
</html>

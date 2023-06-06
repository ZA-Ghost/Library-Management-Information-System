
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Library Management Information System</title>
        <link rel="stylesheet" type="text/css" href="addBook.css">
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
       SELECT * from books where id=?;
       <sql:param value="${param.id}" />
       </sql:query>    
  
    
      <c:forEach var="row" items="${result.rows}">
    
  <div class="container">
    <h2>Update Book</h2>
    <form action="updateBookProcess.jsp" method="POST">
       
        <div class="form-group">
        <label>ID:</label>
        <input type="id" id="id" name="id" value="<c:out value="${row.id}"/>" readonly>
      </div>
      <div class="form-group">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" value="<c:out value="${row.title}"/>">
      </div>
      <div class="form-group">
        <label for="author">Author:</label>
        <input type="text" id="author" name="author" value="<c:out value="${row.author}"/>">
      </div>
      <div class="form-group">
        <label for="publisher">Publisher:</label>
        <input type="text" id="publisher" name="publisher" value="<c:out value="${row.publisher}"/>">
      </div>
      <div class="form-group">
        <label for="isbn">ISBN:</label>
        <input type="text" id="isbn" name="isbn" value="<c:out value="${row.isbn}"/>">
      </div>
	  <div class="form-group">
        <label for="edition">Edition:</label>
        <input type="text" id="edition" name="edition" value="<c:out value="${row.edition}"/>">
      </div>
      <div class="form-group">
        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" value="<c:out value="${row.quantity}"/>">
      </div>
      <div class="form-group">
        <button type="submit">Add Book</button>
      </div>
    </form>
    
    </c:forEach>
    
  </div>
    </body>
</html>

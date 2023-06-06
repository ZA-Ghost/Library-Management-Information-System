<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.io.*, java.util.*, java.sql.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <title>Library Management Information System</title>
  <link rel="stylesheet" type="text/css" href="addBorrower.css">
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
       SELECT * from borrowers where id=?
     <sql:param value="${param.id}" />
       </sql:query>     
  
      
       
  <div class="container">
    <h2>Add Book</h2>
    <form action="updateStatus.jsp" method="POST">
        <c:forEach var="row" items="${result.rows}">
      <div class="form-group">
    <div class="form-group">
        <label>ID:</label>
        <input type="id" id="id" name="id" value="<c:out value="${row.id}"/>" readonly>
      </div>
         <div class="form-group">
        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" name="firstName" value="<c:out value="${row.firstname}"/>">
      </div>
      <div class="form-group">
        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lastName" value="<c:out value="${row.lastname}"/>">
      </div>
      <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<c:out value="${row.email}"/>">
      </div>
      <div class="form-group">
        <label for="phone">Phone:</label>
        <input type="tel" id="phone" name="phone" value="<c:out value="${row.phone}"/>">
      </div>
      <div class="form-group">
        <label for="address">Address:</label>
        <input type="text" id="address" name="address" value="<c:out value="${row.address}"/>">
      </div>
	  <h2>Book Details</h2>
	  <div class="form-group">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" value="<c:out value="${row.title}"/>">
      </div>
      <div class="form-group">
        <label for="author">Author:</label>
        <input type="text" id="author" name="author" value="<c:out value="${row.author}"/>">
      </div>
	  <div class="form-group">
        <label for="edition">Edition:</label>
        <input type="text" id="edition" name="edition" value="<c:out value="${row.edition}"/>">
      </div>
	  <h2>Admin</h2>
	  <div class="form-group">
        <label for="date">Date Issued:</label>
        <input type="date" id="dateIssued" name="dateIssued" value="<c:out value="${row.date_issued}"/>">
      </div>
      <div class="form-group">
        <label for="returnDate">Return Date:</label>
        <input type="date" id="returnDate" name="returnDate" value="<c:out value="${row.return_date}"/>">
      </div>
        <div class="form-group">
	<label>Comment:</label>
            <select id="comment" name="comment">
		  <option value="Late Return">Late Return</option>
                  <option value="Not Returned">Not Returned</option>
                  <option value="Returned">Returned</option>
                  <option value="Duration Valid">Duration Valid</option>
             </select>
	  </div>
	 <button type="submit">Update Status</button>
      </div>
        </c:forEach>
    </form>
         
  </div>
</body>
</html>

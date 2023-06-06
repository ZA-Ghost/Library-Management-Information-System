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
        <title>JSP Page</title>
    </head>
    <body>
        
        <c:set var="firstName" value="${param.firstName}" />
        <c:set var="lastName" value="${param.lastName}" />
        <c:set var="email" value="${param.email}" />
        <c:set var="phone" value="${param.phone}" />
        <c:set var="address" value="${param.address}" />
        <c:set var="title" value="${param.title}" />
        <c:set var="author" value="${param.author}" />
        <c:set var="edition" value="${param.edition}" />
        <c:set var="dateIssued" value="${param.dateIssued}" />
        <c:set var="returnDate" value="${param.returnDate}" />
        <c:set var="comment" value="${param.comment}" />
        
        <sql:setDataSource var="libraryMIS" driver="com.mysql.jdbc.Driver"
         url="jdbc:mysql://localhost:3306/librarymis"
          user="root"  password=""/>
       
        <sql:update dataSource="${libraryMIS}" var="dbResult">	
         INSERT INTO borrowers (firstName, lastName, email, phone, address, title, author, edition, date_issued, return_date, comment)
         VALUES ('${firstName}', '${lastName}', '${email}', '${phone}', '${address}', '${title}', '${author}', '${edition}', '${dateIssued}', '${returnDate}', '${comment}');
        </sql:update>
        
        <c:if test="${dbResult>=1}"> <c:redirect url="adminHomePage.html" >
        <c:param name="msg" value="Borrower Details Have Been Uploaded" />
        </c:redirect>
        </c:if>
        
        
        
    </body>
</html>

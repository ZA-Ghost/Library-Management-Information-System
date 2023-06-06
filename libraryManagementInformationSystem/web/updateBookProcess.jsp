
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Library Management Information System - Add Book</title>
        <link rel="stylesheet" type="text/css" href="addBook.css">
</head>
<body>

        <sql:setDataSource var="libraryMIS" driver="com.mysql.jdbc.Driver"
         url="jdbc:mysql://localhost:3306/librarymis"
          user="root"  password=""/>
       
        <c:set var="title" value="${param.title}" />
        <c:set var="author" value="${param.author}" />
        <c:set var="publisher" value="${param.publisher}" />
        <c:set var="isbn" value="${param.isbn}" />
        <c:set var="edition" value="${param.edition}" />
        <c:set var="quantity" value="${param.quantity}" />
        
        <sql:update dataSource="${libraryMIS}" var="dbResult">			
	Update books 
        set title = '${title}', author = '${author}', publisher = '${publisher}', isbn = '${isbn}', edition = '${edition}' ,quantity = ${quantity}
        Where id=?
        <sql:param value="${param.id}"/>
        </sql:update>
                
      <c:if test="${dbResult>=1}"> <c:redirect url="adminHomePage.html" >
            <c:param name="msg" value="Book Details Have Been Updated" />
         </c:redirect>
      </c:if>

    </body>
</html>
        
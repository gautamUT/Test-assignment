<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.error {
    color: red;
} 
</style>
</head>
<body>
Please enter your name and pick the Sectors you are currently involved in.
<br />
<br />
<form action="${pageContext.request.contextPath}" method="post">
Name: 
<input name="name" type="text" value="${user.name}">
<span class="error">${errors.name}</span>
<br />
<br />
Sectors: 
<select name="sectors" multiple size="15">
<c:forEach var="sector" items="${sectors}">
   <option value="<c:out value="${sector.id}"/>"
   <c:forEach items="${user.selectedSectors}" var="value">
    <c:if test="${value == sector.id}">selected="selected"
</c:if> 
</c:forEach>
   >${sector.name}</option>
</c:forEach>
</select>
<span class="error">${errors.sectors}</span>
<br />
<br />
<input name="agree" type="checkbox"
<c:if test="${user.agreed == true}">checked="checked"
</c:if>
> Agree to terms
<span class="error">${errors.agree}</span>
<br />
<br />
<input type="hidden" name="editId" value="${editId}">
<input type="submit" value="${operation}">
</form> 
<br />
<br />
<br />
<br />
<form action="${pageContext.request.contextPath}/destroysession" method="post">
	<input type="submit" value="Destroy session and start again" />
</form>
</body>
</html>
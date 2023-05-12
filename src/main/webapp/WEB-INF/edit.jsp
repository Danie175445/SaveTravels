<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<h1>edit an expense</h1>
	<a href="/home">Home</a>
		<form:form action="/edit/expense/${expense.id }" method="post" modelAttribute="expense">
		<input type="hidden" name="_method" value="put">
			<form:label path="name">Expense Name:</form:label>
			<form:errors path="name" class="red"/>
			<form:input type="text" path="name"/><br />
			<form:label path="vendor">Vendor:</form:label>
			<form:errors path="vendor" class="red"/>
			<form:input type="text" path="vendor"/><br />
			<form:label path="amount">Amount</form:label>
			<form:errors path="amount" class="red"/>
			<form:input type="number" path="amount"/><br />
			<form:label path="description">Description:</form:label>
			<form:errors path="description" class="red"/>
			<form:input type="text" path="description"/><br />
			<input type="submit" />
		</form:form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/style.css" />
</head>
<body>
	<div>
		<h1>Save Travels</h1>
		<table>
			<tr>
				<th>Expense</th>
				<th>Vendor</th>
				<th>Amount</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="expense" items="${expenses }">
				<tr>
					<td><a href="/show/expense/${expense.id }"><c:out value="${expense.name }"/></a></td>
					<td><c:out value="${expense.vendor }" /></td>
					<td><c:out value="${expense.amount }" /></td>
					<td><a href="/edit/expense/${expense.id }">edit  |</a><a href="/delete/expense/${expense.id }">  Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<h1>Add an expense</h1>
		<form:form action="/expense" method="post" modelAttribute="expense">
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
	</div>
</body>
</html>
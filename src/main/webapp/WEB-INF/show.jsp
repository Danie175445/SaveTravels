<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>show</title>
</head>
<body>
	<div style = "display:flex; align-items:center; justify-content: space-around; " >
		<h1>Expense Details</h1>
		<a href="/home">Go Back</a>
	</div>
	<table>
		<tr>
			<td>Expense Name:</td>
			<td><c:out value="${expense.name }"/></td>
		</tr>
		<tr>
			<td>Expense Description:</td>
			<td><c:out value="${expense.description }"/></td>
		</tr>
		<tr>
			<td>Vendor:</td>
			<td><c:out value="${expense.vendor }"/></td>
		</tr>
		<tr>
			<td>Amount spent:</td>
			<td><c:out value="${expense.amount }"/></td>
		</tr>
	</table>
</body>
</html>
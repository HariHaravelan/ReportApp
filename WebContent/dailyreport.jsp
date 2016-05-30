<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.beans.Expense,com.dao.ReportsDAL,java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Daily Report</title>
<link href="css/demo_page.css" rel="stylesheet" type="text/css" />
<link href="css/demo_table.css" rel="stylesheet" type="text/css" />
<link href="css/demo_table_jui.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link href="css/jquery-ui-1.8.24.custom.css" rel="stylesheet"
	type="text/css" media="all" />
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/jquery.dataTables.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#companies").dataTable({
			"bFilter" : false,
			"bPaginate" : false,
			"ordering" : false,
			"bInfo" : false
		});
	});
</script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
	$(function() {
		$("#datepicker").datepicker({  maxDate: new Date() });
	});

	$(document).ready(function() {
		$('#btnViewReport').click(function(event) {
			var date = $.trim($("#datepicker").val());
			if (date.trim()) {
			} else {
				$('#error').text("*Report Date should be selected");
				event.preventDefault();
			}
		});
	});
</script>
<style>
.form {
	margin: auto;
	width: 60%;
	padding: 10px;
	border: 3px solid #ccccff;
}

h2 {
	text-align: center;
}

.errorClass {
	color: red;
	padding: 10px 300px;
}

.center {
	text-align: center;
}
</style>
</head>
<body>
	<form name="frmdailyreport"
		action="ControlServlet?frmName=dailyreportsuccess" method="post">
		<div class="form">
			<h2>Daily Report</h2>
			<p class="center">
				Date: <input type="text" id="datepicker" name="reportdate">
				<input id="btnViewReport" type="submit" value="View Report">
				<a href="ControlServlet?frmName=AddExpense"> Add Expense</a>
			</p>
			<span class="errorClass" id="error"></span>
			<%
				List<Expense> expenses = null;
				expenses = (List<Expense>) request.getAttribute("Expenses");
			%>
			<%
				if (expenses != null) {
			%>
			<table id="companies" class="display">
				<thead>
					<%
						List<String> columnNames = null;
							columnNames = (List<String>) request.getAttribute("columnNames");
					%>
					<tr>
						<%
							
						%>
						<th><u><%=columnNames.get(0)%></u></th>
						<th><u><%=columnNames.get(1)%></u></th>
						<th><u><%=columnNames.get(2)%></u></th>
						<th><u><%=columnNames.get(3)%></u></th>
						<th><u>Edit</u></th>
					</tr>

				</thead>
				<tbody>

					<%
						for (Expense e : expenses) {
					%>
					<tr>

						<td><%=e.getDate()%></td>
						<td><%=e.getExpense()%></td>
						<td><%=e.getCategory()%></td>
						<td><%=e.getAmount()%></td>
						<td><a
							href="ControlServlet?frmName=UpdateCompanyData&id=<%=e.getId()%>">Edit</a></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%
				}
			%>
		</div>
	</form>
</body>
</html>
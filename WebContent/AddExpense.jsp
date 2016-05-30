<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.beans.Expense,com.dao.ReportsDAL,java.util.List,com.beans.Category"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Expense</title>
<link href="css/demo_page.css" rel="stylesheet" type="text/css" />
<link href="css/demo_table.css" rel="stylesheet" type="text/css" />
<link href="css/demo_table_jui.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link href="css/jquery-ui-1.8.24.custom.css" rel="stylesheet"
	type="text/css" media="all" />
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/jquery.dataTables.js" type="text/javascript"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
	$(function() {
		var $datepicker = $('#date');
		$datepicker.datepicker({  maxDate: new Date() });
	});
	$(document).ready(function() {
		$('#Add').click(function(event) {
			var date = $.trim($("#date").val());
			var amount = $('#amount').val();
			var expense = $('#expense').val();
			if (date.trim()) {
			} else {
				$('#error').text("*Report Date should be selected");
				event.preventDefault();
			}
			if(amount.length==0)
				{
				$('#error').text("*Amount should be filled");
				event.preventDefault();
				}
			if(expense.length==0)
				{
				$('#error').text("*Expense should be filled");
				event.preventDefault();
				}
		});
		$("#amount").keydown(function(e) {
			   if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
					$('#error').text("*Only Numbers allowed");
				   e.preventDefault();
			   }
			   }
		);
	});
</script>
<style type="text/css">
.errorClass {
	color: red;
	padding: 10px 50px;
}
h2 {
	text-align: center;
}

form {
	background: -webkit-linear-gradient(bottom, #CCCCCC, #EEEEEE 175px);
	background: -moz-linear-gradient(bottom, #CCCCCC, #EEEEEE 175px);
	background: linear-gradient(bottom, #CCCCCC, #EEEEEE 175px);
	margin: auto;
	position: relative;
	width: 550px;
	height: 450px;
	font-family: Tahoma, Geneva, sans-serif;
	font-size: 14px;
	font-style: italic;
	line-height: 24px;
	font-weight: bold;
	color: #09C;
	text-decoration: none;
	border-radius: 10px;
	padding: 10px;
	border: 1px solid #999;
	border: inset 1px solid #333;
	-webkit-box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.3);
	-moz-box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.3);
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.3);
}

input {
	width: 375px;
	display: block;
	border: 1px solid #999;
	height: 25px;
	-webkit-box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.3);
	-moz-box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.3);
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.3);
}

textarea#feedback {
	width: 375px;
	height: 150px;
	display: block;
}

button {
	width: 100px;
	position: absolute;
	right: 20px;
	bottom: 20px;
	background: #09C;
	color: #fff;
	font-family: Tahoma, Geneva, sans-serif;
	height: 30px;
	border-radius: 15px;
	border: 1p solid #999;
}

input.button:hover {
	background: #fff;
	color: #09C;
}
</style>
</head>
<body>
	<form action="AddExpense" autocomplete="off" method="post">
		<div>
			<h1>Add Expense:</h1>
			<label> <span>Expense</span><input id="expense" type="text"
				name="expense" />
			</label> <label> <span>Amount</span><input id="amount" type="text"
				name="amount" />
			</label> <label> <span>Date</span><input id="date" type="text"
				name="date" />
			</label> <label> <span>Category</span> <select name="category">
					<%
						List<Category> categories = (List<Category>) request.getAttribute("categories");
						for (Category c : categories) {
					%>
					<option value=<%=c.getId()%>><%=c.getName()%></option>
					<%
						}
					%>
			</select> <input id="Add" type="submit" value="Submit" />
			 <span
				class="errorClass" id="error"></span>
			</label>

		</div>
	</form>
</body>
</html>
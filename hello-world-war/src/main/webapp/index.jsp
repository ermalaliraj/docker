<html>
<head>
<title>Hello World!</title>
</head>
<body>
	<h1>Hello World!</h1>
	<p>
		Today is: 
		<%= new java.util.Date() %></p>
	<p>
		You are coming calling from:  
		<%= request.getRemoteAddr()  %></p>
</body>
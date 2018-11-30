<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add</title>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="./AMD/canvas.js"></script>	
<script type="text/javascript">
	
</script>

<style type="text/css">

</style>

<form action="#">
<input type="checkbox" name="c" value="a" />
<input type="checkbox" name="c" value="1" />
<input type="checkbox"  name="c" value="A" />
<input type="submit" value="sssssss" />
</form>
<%
if(null != request.getParameterValues("c")){
	String[] s = request.getParameterValues("c");
	
	for(String st :s){
		out.println(st);
	}
}
%>


</head>
<body>

	

</body>
</html>
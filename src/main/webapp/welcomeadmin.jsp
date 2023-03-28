<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<title>ADMIN PORTAL</title>
<style>
.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 20%;
  margin:20px 100px;
  background-color: LavenderBlush;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.container {
  padding: 2px 16px;
}

.column {
  float: left;
  width: 15%;
  padding: 20px;
}

/* Remove extra left and right margins, due to padding */
.row {
	margin: 0 5px;
}
</style>
</head>
<body style="background-image: url(spikes.png); background-repeat: repeat;">
<center><i class="fas fa-user" style="font-size:60px;color:#4CAF50;"></i><h1>ADMIN PORTAL</h1>
<button onclick="myFunction()">LOGOUT</button>

<script>
function myFunction() {
  location.replace("http://localhost:8095/first/home.html")
}
</script>
<div class="row">
<div class="card column">
<a href="http://localhost:8095/first/userinfo.jsp">
  <img src="user.jpg" alt="Avatar" style="width:100%">
  <div class="container">
    <h4><b>USERS INFO</b></h4>
  </div>
 </a>
</div>
<div class="card column">
<a href="http://localhost:8095/first/orderinfo.jsp">
  <img src="logo.png" alt="Avatar" style="width:100%">
  <div class="container">
    <h4><b>ORDER INFO</b></h4>
  </div>
 </a>
</div>
<div class="card column">
<a href="http://localhost:8095/first/suninfo.jsp">
  <img src="images.png" alt="Avatar" style="width:100%">
  <div class="container">
    <h4><b>SUBSCRIBERS INFO</b></h4>
  </div>
 </a>
</div>
</div>
</center>
</body>
</html>
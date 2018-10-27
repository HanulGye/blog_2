<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>katsura</title>
<script>
	function hideMenu(){
		var obj = document.getElementById("subLmenu");
		
		obj.style.display="none";
	}
	
	function showMenu(){
		var obj = document.getElementById("subLmenu");
		
		obj.style.display = "block";
		
	}
	
	function hiderMenu(){
		var obj2 = document.getElementById("subRmenu");
		
		obj2.style.display="none";
	}
	
	function showrMenu(){
		var obj2 = document.getElementById("subRmenu");
		
		obj2.style.display = "block";
		
	}
	
	function on(){
		var img = document.getElementById('logo');
		img.src = "./img/logoMain.png";
	}
	
	function off(){
		var img2 = document.getElementById('logo');	
		img2.src = "./img/logoMain2.png";
	}
	
</script>
<jsp:include page="./temp/style.jsp"></jsp:include>
</head>
<body>
<jsp:include page="./temp/header.jsp"></jsp:include>
<section>
	<article class="main">
		<div class="menu" id="fLeft">
			<p onmouseenter="showMenu()">HObby</p>
				<dl id="subLmenu" onmouseenter="showMenu()" onmouseleave="hideMenu()">
					<dt><a href="">Game</a></dt>
					<dt><a href="">movie</a></dt>
					<dt><a href="">Anime</a></dt>
				</dl>
		</div>
		
		<a href="./katsura_1.html" onmouseover="on()" onmouseleave="off()">
			<img src="./img/logoMain2.png" width=550px id="logo">
		</a>
		
		<div class="menu" id="fRight">
			<p onmouseenter="showrMenu()">Work?</p>
			<dl id="subRmenu" onmouseenter="showrMenu()" onmouseleave="hiderMenu()">
				<dt><a href="">Coding</a></dt>
				<dt><a href="">Japanese</a></dt>
				<dt><a href="">Recording</a></dt>
			</dl>
		</div>
	</article>
	</section>
<jsp:include page="./temp/footer.jsp"></jsp:include>	
</body>
</html>
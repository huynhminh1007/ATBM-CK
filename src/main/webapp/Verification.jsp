<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<%
String userId = request.getParameter("userId");
if (userId == null) {
	Object userIdObj = request.getAttribute("userId");
	if (userIdObj != null) {
		userId = String.valueOf(userIdObj);
	}
}
String re = request.getAttribute("re") == null ? "" : (String) request.getAttribute("re");
String email = request.getAttribute("email") == null ? "" : (String) request.getAttribute("email");
%>
<head>

<title>Nhập mã xác thực</title>
<link rel="stylesheet" type="text/css" href="styles/bootstrap.css">
<link rel="stylesheet" type="text/css" href="styles/base.css">
<link rel="stylesheet" type="text/css" href="styles/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" type="text/css" href="styles/news.css">
<link rel="stylesheet" type="text/css" href="styles/footer.css">
<link rel="stylesheet" type="text/css" href="styles/nav.css">
<link rel="stylesheet" type="text/css" href="styles/lightslider.css">
<link rel="stylesheet" href="styles/gio-hang.css">
</head>
<body>
	<jsp:include page="Components/header.jsp" />
	<div id="verification">
		<h1>Nhập mã xác thực</h1>
		<p id="otpError" style="color: red;"><%=re%></p>
		<p id="otpRes" style="color: green;"></p>
		<form id="verificationForm" action="Verifier" method="get">
			<input type="text" name="otp" placeholder="Mã xác thực (6 chữ số)"
				maxlength="6" required> <input type="hidden" name="userId"
				value="<%=userId%>">
			<button type="button">Xác nhận</button>
			<input type="hidden" id="second" name="second" value="">
		</form>

		<div class="timer animatable">
			<svg>
    <circle cx="50%" cy="50%" r="90" />
    <circle cx="50%" cy="50%" r="90" pathLength="1" />
    <text x="100" y="100" text-anchor="middle">
			<tspan id="timeLeft"></tspan></text>
    <text x="100" y="120" text-anchor="middle">seconds</text>
 	 </svg>
		</div>
		<p id="resendButton" class="resend-button"
			padding-top: 50px;" onclick="resend()">Gửi lại mã xác thực</p>
	</div>
	<!--    footer-->
	<footer id="footer">
		<jsp:include page="Components/footer.jsp" />
	</footer>
</body>
<style>
h1 {
	color: #333;
}

form {
	display: flex;
	flex-direction: column;
	align-items: center;
}

input[type="text"] {
	padding: 10px;
	margin-bottom: 20px;
	width: 80%;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
}

button {
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	background-color: #3498db;
	color: white;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
	background-color: #2980b9;
}

#verification {
	font-family: Arial, sans-serif;
	margin: 50px auto;
	max-width: 400px;
	text-align: center;
}

.resend-button {
	display: none;
	cursor: pointer;
}

.timer {
	margin-top: 10px;
}

.timer>svg {
	width: 200px;
	height: 200px;
}

.timer>svg>circle {
	fill: none;
	stroke-opacity: 0.3;
	stroke: #0d6efd;
	stroke-width: 10;
	transform-origin: center center;
	transform: rotate(-90deg);
}

.timer>svg>circle+circle {
	stroke-dasharray: 1;
	stroke-dashoffset: 1;
	stroke-linecap: round;
	stroke-opacity: 1;
}

.timer.animatable>svg>circle+circle {
	transition: stroke-dashoffset 0.3s ease;
}

.timer>svg>text {
	font-size: 2rem;
}

.timer>svg>text+text {
	font-size: 1rem;
}
</style>
<script type="text/javascript" src="javascripts/jquery-3.7.1.js"></script>
<script type="text/javascript" src="javascripts/main.js"></script>
<script type="text/javascript" src="javascripts/bootstrap.bundle.js"></script>
<script>
	let timeLeft = ${second};
	let timer = document.getElementById('timeLeft');
	function isTimeLeft() {
		return timeLeft > -1;
	}
	$("#verificationForm button").on("click",()=>{
		event.preventDefault();
		console.log("click");
		$("#second").val(timeLeft);
		$("#verificationForm").submit();
	})
	function runTimer(timerElement) {
		const timerCircle = timerElement.querySelector('svg > circle + circle');
		timerElement.classList.add('animatable');
		timerCircle.style.strokeDashoffset = 1;

		let countdownTimer = setInterval(
				function() {
					if (isTimeLeft()) {
						const timeRemaining = timeLeft--;
						const normalizedTime = (60 - timeRemaining) / 60;
						timerCircle.style.strokeDashoffset = normalizedTime;
						timer.innerHTML = timeRemaining;
					} else {
						clearInterval(countdownTimer);
						timerElement.classList.remove('animatable');
						document.querySelector('.resend-button').style.display = 'block';
					}
				}, 1000);
	}

	runTimer(document.querySelector('.timer'));
	

	function resend() {
	    resetTiming();
		var data ={
			action: 'resend',
			second:	60,
			userId:<%=userId%>
		}
		$.ajax({
			type:'get',
			url:'Verifier',
			data:data,
			success:function(response){
				$("#otpRes").text(response)
			},
			    error: function(xhr, status, error) {
       	
      		  console.error("Error:", error);
    }
		})
	}
	function resetTiming() {
		timeLeft = 60;
		document.querySelector('.resend-button').style.display = 'none';
		const timerElement = document.querySelector('.timer');
		const timerCircle = timerElement.querySelector('svg > circle + circle');
		const timerText = timerElement.querySelector('#timeLeft');
		timerText.textContent = timeLeft; // Reset text content
		timerCircle.style.strokeDashoffset = 1; // Reset circle animation
		runTimer(timerElement);
	}
	
	function resetTimer() {
		timeLeft = ${second};
		document.querySelector('.resend-button').style.display = 'none';
		const timerElement = document.querySelector('.timer');
		const timerCircle = timerElement.querySelector('svg > circle + circle');
		const timerText = timerElement.querySelector('#timeLeft');
		timerText.textContent = timeLeft; // Reset text content
		timerCircle.style.strokeDashoffset = 1; // Reset circle animation
		runTimer(timerElement);
	}
	
	
	document.querySelector('.resend-button').addEventListener('click',
			function() {
				resetTimer();
			});
</script>
</html>
<html>
<script type="text/javascript">
	calcString = "";
	addToCalcString = function addToCalcString(input) {
		calcString += input;
		document.getElementById("calcStringInput").value = calcString;
	}
	// create listeners 
	window.onload = function() {
		var buttons = document.getElementsByClassName('calculatorButton');
 		Array.prototype.forEach.call(buttons, function(button) {
 			document.getElementById(button.id).addEventListener("click",
					function() {
						addToCalcString(button.innerText);
					});		
		}); 
	}
</script>
<body>
	<button class="calculatorButton numberButton" id="calcNum1">1</button>
	<button class="calculatorButton numberButton" id="calcNum2">2</button>
	<button class="calculatorButton numberButton" id="calcNum3">3</button>
	<br>
	<button class="calculatorButton numberButton" id="calcNum4">4</button>
	<button class="calculatorButton numberButton" id="calcNum5">5</button>
	<button class="calculatorButton numberButton" id="calcNum6">6</button>
	<br>
	<button class="calculatorButton numberButton" id="calcNum7">7</button>
	<button class="calculatorButton numberButton" id="calcNum8">8</button>
	<button class="calculatorButton numberButton" id="calcNum9">9</button>
	<br>
	<button class="calculatorButton operationButton" id="calcOpAdd">+</button>
	<button class="calculatorButton numberButton" id="calcNum0">0</button>
	<button class="calculatorButton operationButton" id="calcOpSub">-</button>
	<br>
	<form method="POST" action="/calc/getResults">
		<input id="calcStringInput" readOnly>
	</form>
</body>
</html>

<html>
<script type="text/javascript">
	calcString = "";
	addToCalcString = function addToCalcString(input) {
		calcString += input;
		document.getElementById("calcStringInput").value = calcString;
	}
	// listeners
	document.getElementById("calcNum1").addEventListener("click",
			addToCalcString(1));
</script>
<body>
	<button id="calcNum1">1</button>
	<button id="calcNum2">2</button>
	<button id="calcNum3">3</button>
	<br>
	<button id="calcNum4">4</button>
	<button id="calcNum5">5</button>
	<button id="calcNum6">6</button>
	<br>
	<button id="calcNum7">7</button>
	<button id="calcNum8">8</button>
	<button id="calcNum9">9</button>
	<br>
	<button id="calcOpAdd">+</button>
	<button id="calcNum0">0</button>
	<button id="calcOpSub">-</button>
	<br>
	<input id="calcStringInput" readOnly>
</body>
</html>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<html>
<spring:url value="/resources/main.css" var="mainCSS" />
<link href="${mainCSS}" rel="stylesheet" />

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" > 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" ></script> 
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" ></script> 

<script type="text/javascript">

	setCalcString = function setCalcString(input) {
		document.getElementById("calcStringInput").value = input;
	}
	getCalcString = function setCalcString(input) {
		return document.getElementById("calcStringInput").value;
	}
	
	// create listeners 
	window.onload = function() {
		var buttons = document.querySelectorAll(".numberButton, .operationButton")
		Array.prototype.forEach.call(buttons, function(button) {
			document.getElementById(button.id).addEventListener("click",
					function() {
						setCalcString(getCalcString() + button.innerText);
					});
		});
		
		document.getElementById("calcOpSubmit").addEventListener("click", function() {
			var form = document.getElementById("form");
			console.log(document.getElementById("calcStringInput").value);
			form.submit();
		});
		
		document.getElementById("calcClear").addEventListener("click", function() {
			setCalcString("");
			document.getElementById("errorResponseInput").value = "";
		});
		
		// workaround for springframework form library not respecting readonly. sigh.
/* 		document.getElementById("calcStringInput").setAttribute("readonly", "readonly");
 */
	}
</script>
<body>
	<div style="padding:1em;" class="row">
		<div class="col-sm-9">
			<div class="row">
				<button class="col-xs-1 btn btn-default calculatorButton numberButton" id="calcNum7">7</button>
				<button class="col-xs-1 btn btn-default calculatorButton numberButton" id="calcNum8">8</button>
				<button class="col-xs-1 btn btn-default calculatorButton numberButton" id="calcNum9">9</button>
				<button class="col-xs-1 btn btn-default calculatorButton operationButton" id="calcOpAdd">+</button>
			</div>
			<div class="row">
				<button class="col-xs-1 btn btn-default calculatorButton numberButton" id="calcNum4">4</button>
				<button class="col-xs-1 btn btn-default calculatorButton numberButton" id="calcNum5">5</button>
				<button class="col-xs-1 btn btn-default calculatorButton numberButton" id="calcNum6">6</button>
				<button class="col-xs-1 btn btn-default calculatorButton operationButton" id="calcOpSub">-</button>
			</div>
			<div class="row">
				<button class="col-xs-1 btn btn-default calculatorButton numberButton" id="calcNum1">1</button>
				<button class="col-xs-1 btn btn-default calculatorButton numberButton" id="calcNum2">2</button>
				<button class="col-xs-1 btn btn-default calculatorButton numberButton" id="calcNum3">3</button>
				<button class="col-xs-1 btn btn-default cablculatorButton operationButton" id="calcOpMult">*</button>
			</div>
			<div class="row">
				<button class="col-xs-1 btn btn-default calculatorButton numberButton" id="calcNum0">0</button>
				<button class="col-xs-1 btn btn-default calculatorButton numberButton" id="calcDecimal"> . </button>
				<button class="col-xs-1 btn btn-default calculatorButton" id="calcOpSubmit">=</button>
				<button class="col-xs-1 btn btn-default calculatorButton operationButton" id="calcOpDiv">/</button>
			</div>
			<div class="row">
				<form:form class="col-xs-3" style=" padding:0;margin:0;" method="POST" action="/calculator" modelAttribute="command" id="form">
					<form:input class="form-control" path="calcStr" placeholder="start calculating" value="${result}" id="calcStringInput"></form:input>
				</form:form>
				<button class="col-xs-1 btn btn-default calculatorButton" id="calcClear">ce</button>
			</div>
		</div>
	</div>
	<div class="row errorResponse">
		<p class="errorResponse" id="errorResponseInput">${problem}</p>
	</div>
</body>
</html>

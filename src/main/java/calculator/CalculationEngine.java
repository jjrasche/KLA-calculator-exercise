package calculator;

import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

import java.util.Arrays;
import java.util.List;

import javax.script.ScriptEngine;

public class CalculationEngine {
    static ScriptEngineManager mgr = new ScriptEngineManager();
	static ScriptEngine engine = mgr.getEngineByName("JavaScript");
	
	public static double calculate(String calcStr) throws ScriptException, FormatException {
		ValidateInput(calcStr);		
		return Double.parseDouble(engine.eval(calcStr).toString());
	}

	// for case where someone tries to hijack API to run script
	protected static void ValidateInput(String calcStr) throws FormatException {
		if (!calcStr.matches("[\\s0-9+-.]+")) {
			throw new FormatException(calcStr);
		}
	}
}

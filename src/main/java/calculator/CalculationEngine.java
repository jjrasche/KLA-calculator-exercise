package calculator;

import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.script.ScriptEngine;

public class CalculationEngine {
    static ScriptEngineManager mgr = new ScriptEngineManager();
	static ScriptEngine engine = mgr.getEngineByName("JavaScript");
	
	public static double calculate(String calcStr) throws ScriptException {
		sanatizeInput(calcStr);
		System.out.println(calcStr);
		Object a = engine.eval(calcStr);
		String b = a.toString();
		double c = Double.parseDouble(b);
		System.out.println(a);
		System.out.println(b);
		System.out.println(c);
		return c; 
	}
	protected static void sanatizeInput(String calcStr) {
	}
}

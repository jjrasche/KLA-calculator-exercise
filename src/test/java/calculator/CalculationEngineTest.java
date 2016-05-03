package calculator;

import static org.junit.Assert.*;

import javax.script.ScriptException;

import org.junit.Test;
import calculator.CalculationEngine;

public class CalculationEngineTest {

	@Test
	public void basicCalculations() throws ScriptException {
		assertEquals(CalculationEngine.calculate("5+3"), 8, 0);	//positive addition
		assertEquals(CalculationEngine.calculate("-5+-3"), -8, 0);	//negative addition
		assertEquals(CalculationEngine.calculate("-5+3"), -2, 0);	//mixed addition
		assertEquals(CalculationEngine.calculate("5-3"), 2, 0);	//positive subtraction
		assertEquals(CalculationEngine.calculate("5- -3"), 8, 0);	//negative subtraction
	}

}

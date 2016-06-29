package calculator;

import static org.junit.Assert.*;

import javax.script.ScriptException;

import org.junit.Test;
import calculator.CalculationEngine;

public class CalculationEngineTest {

	@Test
	public void basicCalculations() throws ScriptException, FormatException {
		assertEquals(CalculationEngine.calculate("5+3"), 8, 0);	//positive addition
		assertEquals(CalculationEngine.calculate("-5+-3"), -8, 0);	//negative addition
		assertEquals(CalculationEngine.calculate("-5+3"), -2, 0);	//mixed addition
		assertEquals(CalculationEngine.calculate("5-3"), 2, 0);	//positive subtraction
		assertEquals(CalculationEngine.calculate("5- -3"), 8, 0);	//negative subtraction
	}
	
	@Test
	public void edgeCases() throws ScriptException, FormatException {
		assertEquals(CalculationEngine.calculate("5 - - -3"), 2, 0);	//multiple consecutive operations
		assertEquals(CalculationEngine.calculate("5/0"), Double.POSITIVE_INFINITY, 0);	// divison by zero
	}

    @Test
    public void orderOfOperations() throws ScriptException, FormatException {
		assertEquals(CalculationEngine.calculate("7*((8+3)/(13-12))"), 77, 0);	// kitchen sink
    }
	
    @Test
    public void acceptedCharacters() throws ScriptException, FormatException {
		CalculationEngine.calculate("5+3-7");	// no exception thrown
    }
 
    @Test(expected = FormatException.class)
    public void unAcceptedCharacters() throws ScriptException, FormatException {
		CalculationEngine.calculate("5+3;");	// allow these characters
    }

    @Test(expected = Exception.class)
    public void noOperands() throws ScriptException, FormatException {
		CalculationEngine.calculate("+-*");
    }
    
    @Test
	public void decimals() throws ScriptException, FormatException {
		System.out.println(CalculationEngine.calculate("5.4 - 3.2"));
		assertEquals(CalculationEngine.calculate("5.4 - 3.2"), 2.2, 0);	//multiple consecutive operations
	}
    
}

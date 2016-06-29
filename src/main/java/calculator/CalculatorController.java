package calculator;

import javax.script.ScriptException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.ModelMap;

@Controller
public class CalculatorController {

	@RequestMapping(value = "/calculator", method = RequestMethod.GET)
	public ModelAndView displayCalculator() {
		return new ModelAndView("calculatorUI", "command", new Calculation());
	}

	@RequestMapping(value = "/calculator", method = RequestMethod.POST)
	public String getResults(@ModelAttribute("command") Calculation calc, ModelMap model) throws ScriptException, FormatException {
		String calcStr = calc.getCalcStr();		
		double result = 0;
		try { 
			result = CalculationEngine.calculate(calcStr);
		}
		catch (FormatException e) {
			model.addAttribute("problem", "Formatting issue with " + calcStr + " only allowed to use the following characters: 0123456789+-/*.()");
			return "calculatorUI";
		}
		catch (Exception e) {
			e.printStackTrace(); 
			model.addAttribute("problem", "Internal Server issue: <br>" +  e.getCause() );			
			return "calculatorUI";
		}
		System.out.println(calcStr + "   " + result);		
		model.addAttribute("result", result);
		return "calculatorUI";
	}
}
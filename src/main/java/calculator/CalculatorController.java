package calculator;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.ui.ModelMap;

@Controller
public class CalculatorController{
 
	@RequestMapping(value = "/calculator", method = RequestMethod.GET)
	public String displayCalculator(ModelMap model) {
      return "calculatorUI";
   }
	
	@RequestMapping(value = "/getResults", method = RequestMethod.POST)
	public String getResults(ModelMap model) {
      return "calculatorUI";
   }
}
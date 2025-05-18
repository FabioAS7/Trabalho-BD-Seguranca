package lab.bd.trabalho.empresaseguranca.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PoliticaDePrivacidadeController {
	
	@RequestMapping(name = "politicadeprivacidade", value = "/politicadeprivacidade", method = RequestMethod.GET)
	public ModelAndView politicadeprivacidadeGet(@RequestParam Map<String, String> params, ModelMap model) {
		return new ModelAndView("politicadeprivacidade");
	}

}

package lab.bd.trabalho.empresaseguranca.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FuncionariosDoMesController {
	
	@RequestMapping(name = "funcionarios_do_mes", value = "/funcionarios_do_mes", method = RequestMethod.GET)
	public ModelAndView funcionarios_do_mesGet(@RequestParam Map<String, String> params, ModelMap model) {
		return new ModelAndView("funcionarios_do_mes");
	}

}

package lab.bd.trabalho.empresaseguranca.controller;

import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lab.bd.trabalho.empresaseguranca.model.Senioridade;
import lab.bd.trabalho.empresaseguranca.repository.SenioridadeRepository;

@Controller
public class ValoresSenioridadeController {

	@Autowired
	public SenioridadeRepository SenR;

	@RequestMapping(name = "valores_controller", value = "/valores_controller", method = RequestMethod.GET)
	/**
	 * Funcao responsavel por mapear a requisicao GET e carregar a pagina dos valores
	 * de senioridade /valores_senioridades
	 * 
	 * @param params
	 * @param model
	 * @return A requisicao da pagina GET
	 */
	public ModelAndView indexGet(@RequestParam Map<String, String> params, ModelMap model) {
		Optional<Senioridade> junior = SenR.findByNome("junior");
		Optional<Senioridade> senior = SenR.findByNome("senior");
		Optional<Senioridade> pleno = SenR.findByNome("pleno");
		
		if(junior.isPresent() && senior.isPresent() && pleno.isPresent()) {
			Senioridade j = junior.get();
			Senioridade s = senior.get();
			Senioridade p = pleno.get();
			model.addAttribute("SenioridadeJ", j.getValorHora());
			model.addAttribute("SenioridadeS", s.getValorHora());
			model.addAttribute("SenioridadeP", p.getValorHora());
		} else {
			model.addAttribute("SenioridadeJ", "Não colocado");
			model.addAttribute("SenioridadeS", "Não colocado");
			model.addAttribute("SenioridadeP", "Não colocado");
		}
		
		
		return new ModelAndView("valores_controller");
	}
}

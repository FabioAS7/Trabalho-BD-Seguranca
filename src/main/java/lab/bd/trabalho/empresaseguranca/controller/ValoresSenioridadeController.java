package lab.bd.trabalho.empresaseguranca.controller;

import java.util.Map;

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

	@RequestMapping(name = "valores_senioridade", value = "/valores_senioridade", method = RequestMethod.GET)
	/**
	 * Funcao responsavel por mapear a requisicao GET e carregar a pagina dos
	 * valores de senioridade /valores_senioridades
	 * 
	 * @param params
	 * @param model
	 * @return A requisicao da pagina GET
	 */
	public ModelAndView valoresSenioridadeGet(@RequestParam Map<String, String> params, ModelMap model) {
	
		try {
			Senioridade junior = SenR.findByNome("junior");
			model.addAttribute("SenioridadeJ", junior.getValorHora());
		} catch (Exception e) {
			model.addAttribute("SenioridadeJ", "Não inserirdo");
		}
		
		try {
			Senioridade pleno = SenR.findByNome("pleno");
			model.addAttribute("SenioridadeP", pleno.getValorHora());
		} catch (Exception e) {
			model.addAttribute("SenioridadeP", "Não inserirdo");
		}
		
		try {
			Senioridade senior = SenR.findByNome("senior");
			model.addAttribute("SenioridadeS", senior.getValorHora());
		} catch (Exception e) {
			model.addAttribute("SenioridadeS", "Não inserirdo");
		}
		
		return new ModelAndView("valores_senioridade");
	}

}

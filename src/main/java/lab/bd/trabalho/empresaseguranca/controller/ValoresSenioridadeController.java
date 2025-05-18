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
			Senioridade senior = SenR.findByNome("senior");
			Senioridade pleno = SenR.findByNome("pleno");

			if (junior.getValorHora().intValue() == 0 && senior.getValorHora().intValue() == 0 && pleno.getValorHora().intValue() == 0) {
				model.addAttribute("SenioridadeJ", junior.getValorHora());
				model.addAttribute("SenioridadeS", senior.getValorHora());
				model.addAttribute("SenioridadeP", pleno.getValorHora());
			}
		} catch (Exception e) {
			model.addAttribute("SenioridadeJ", "Não colocado");
			model.addAttribute("SenioridadeS", "Não colocado");
			model.addAttribute("SenioridadeP", "Não colocado");
		}

		return new ModelAndView("valores_senioridade");
	}

	/*
	 * @RequestMapping(name = "controleExemplar", value = "/controleExemplar",
	 * method = RequestMethod.POST)
	 *//**
		 * Realiza as operações de Inserir, Atualizar, Exclur, Buscar e Listar
		 * 
		 * @param params
		 * @param model
		 * @return
		 *//*
			 * public ModelAndView controleExemplarPost(@RequestParam Map<String, String>
			 * params, ModelMap model) {
			 * 
			 * return new ModelAndView("controleExemplar"); }
			 */
}

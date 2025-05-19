package lab.bd.trabalho.empresaseguranca.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lab.bd.trabalho.empresaseguranca.model.Desenvolvedor;
import lab.bd.trabalho.empresaseguranca.model.EspecialidadeDev;
import lab.bd.trabalho.empresaseguranca.model.EspecialidadeDevId;
import lab.bd.trabalho.empresaseguranca.model.Linguagem;
import lab.bd.trabalho.empresaseguranca.repository.DesenvolvedorRepository;
import lab.bd.trabalho.empresaseguranca.repository.EspecialidadeDevRepository;
import lab.bd.trabalho.empresaseguranca.repository.LinguagemRepository;

@Controller
public class EspecialidadeDevController {

	@Autowired
	public DesenvolvedorRepository DR;

	@Autowired
	public LinguagemRepository LR;

	@Autowired
	public EspecialidadeDevRepository EDR;

	@RequestMapping(name = "especialidade_dev", value = "/especialidade_dev", method = RequestMethod.GET)
	/**
	 * Funcao responsavel por mapear a requisicao GET e carregar a pagina de
	 * cadastro de projeto /especialidade_dev
	 * 
	 * @param params
	 * @param model
	 * @return A requisicao da pagina GET
	 */
	public ModelAndView valoresSenioridadeGet(@RequestParam Map<String, String> params, ModelMap model) {

		String acao = params.get("acao");
		Desenvolvedor d = new Desenvolvedor();
		Linguagem l = new Linguagem();
		List<Desenvolvedor> desenvolvedores = new ArrayList<>();
		List<Linguagem> linguagens = new ArrayList<>();
		List<EspecialidadeDev> espDev = new ArrayList<>();
		EspecialidadeDev eD = new EspecialidadeDev();
		Integer idD = null;
		Integer idL = null;
		String erro = "";

		try {
			desenvolvedores = DR.findAll();
			linguagens = LR.findAll();
			model.addAttribute("desenvolvedores", desenvolvedores);
			model.addAttribute("linguagens", linguagens);
			if (acao.equals("excluir")) {
				idD = Integer.parseInt(params.get("desenvolvedor_id"));
				idL = Integer.parseInt(params.get("linguagem_id"));
				d = DR.getReferenceById(idD);
				l = LR.getReferenceById(idL);
				EspecialidadeDevId id = new EspecialidadeDevId();
				id.setDesenvolvedor(d);
				id.setLinguagem(l);
				espDev = EDR.findAll();
				eD = null;
			} else if (acao.equals("editar")) {
				idD = Integer.parseInt(params.get("desenvolvedor_id"));
				idL = Integer.parseInt(params.get("linguagem_id"));
				d = DR.getReferenceById(idD);
				l = LR.getReferenceById(idL);
				eD = EDR.findByDesenvolvedorAndLinguagem(d, l);
				espDev = null;
				model.addAttribute("partiDev", eD);
			}
		} catch (Exception e) {
			e.getMessage();
		} finally {
			model.addAttribute("erro", erro);
			model.addAttribute("partiDevs", espDev);
		}

		return new ModelAndView("especialidade_dev");
	}

	@RequestMapping(name = "especialidade_dev", value = "/especialidade_dev", method = RequestMethod.POST)
	/**
	 * Realiza as operações de Inserir, Atualizar, Exclur, Buscar e Listar
	 * 
	 * @param params
	 * @param model
	 * @return
	 */
	public ModelAndView controleExemplarPost(@RequestParam Map<String, String> params, ModelMap model) {
		String cmd = params.get("botao");
		String saida = "";
		String erro = "";
		Integer idD = null;
		Integer idL = null;
		EspecialidadeDev eD = new EspecialidadeDev();
		List<Desenvolvedor> desenvolvedores = new ArrayList<>();
		List<Linguagem> linguagens = new ArrayList<>();
		List<EspecialidadeDev> especialidadeDosDevs = new ArrayList<>();

		if (params.get("desenvolvedor_id") != null && !params.get("desenvolvedor_id").isEmpty()) {
			idD = Integer.parseInt(params.get("desenvolvedor_id"));
		}
		if (params.get("linguagem_id") != null && !params.get("linguagem_id").isEmpty()) {
			idL = Integer.parseInt(params.get("linguagem_id"));
		}

		try {
			linguagens = LR.findAll();
			desenvolvedores = DR.findAll();
			model.addAttribute("desenvolvedores", desenvolvedores);
			model.addAttribute("linguagens", linguagens);
		} catch (Exception e) {
			erro = e.getMessage();
		}

		try {
			if (!cmd.equalsIgnoreCase("Listar")) {
				Desenvolvedor d = DR.findById(idD).orElse(null);
				Linguagem l = LR.findById(idL).orElse(null);
				if (cmd.contentEquals("Adicionar")) {
					if (d != null && l != null) {
						eD = EDR.findByDesenvolvedorAndLinguagem(d, l);
						if (eD == null) {
							EspecialidadeDev NovoeD = new EspecialidadeDev();
							NovoeD.setDesenvolvedor(d);
							NovoeD.setLinguagem(l);
							EDR.save(NovoeD);
							saida = "Desenvolvedor especializado na linguagem com sucesso";
						}
					}
				}
				if (cmd.equalsIgnoreCase("Remover")) {
					EspecialidadeDevId id = new EspecialidadeDevId();
					id.setDesenvolvedor(d);
					id.setLinguagem(l);
					EDR.deleteById(id);
					saida = "Registro excluido com sucesso";
				}
			} else {
				especialidadeDosDevs = EDR.findAll();
			}
		} catch (Exception e) {
			erro = e.getMessage();
		} finally {
			if (!cmd.equalsIgnoreCase("Listar")) {
				eD = null;
			}
		}
		model.addAttribute("erro", erro);
		model.addAttribute("saida", saida);
		model.addAttribute("partiDevs", especialidadeDosDevs);
		return new ModelAndView("especialidade_dev");
	}
}

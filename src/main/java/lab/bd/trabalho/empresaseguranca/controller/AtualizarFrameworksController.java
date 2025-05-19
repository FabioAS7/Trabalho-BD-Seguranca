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
import lab.bd.trabalho.empresaseguranca.model.Framework;
import lab.bd.trabalho.empresaseguranca.model.FrameworkUtilizado;
import lab.bd.trabalho.empresaseguranca.model.FrameworkUtilizadoId;
import lab.bd.trabalho.empresaseguranca.model.Projeto;
import lab.bd.trabalho.empresaseguranca.repository.FrameworkRepository;
import lab.bd.trabalho.empresaseguranca.repository.FrameworkUtilizadoRepository;
import lab.bd.trabalho.empresaseguranca.repository.ProjetoRepository;

@Controller
public class AtualizarFrameworksController {
	
	@Autowired
	private ProjetoRepository proR;
	
	@Autowired
	private FrameworkRepository fraR;
	
	@Autowired
	private FrameworkUtilizadoRepository futilR;
	
	@RequestMapping(name = "atualizar_frameworks", value = "/atualizar_frameworks", method = RequestMethod.GET)
	public ModelAndView atualizar_frameworksGet(@RequestParam Map<String, String> params, ModelMap model) {
		String acao = params.get("acao");
		Integer idP = null;
		Integer idF = null;
		List<Framework> frameworks = new ArrayList<Framework>();
		List<Projeto> projetos = new ArrayList<Projeto>();
		
		return new ModelAndView("atualizar_frameworks");
	}
	
	
	
	
	@RequestMapping(name = "atualizar_frameworks", value = "/atualizar_frameworks", method = RequestMethod.POST)
	public ModelAndView atualizar_frameworksPost(@RequestParam Map<String, String> params, ModelMap model) {
		String erro = "";
		String saida = "";
		String cmd = params.get("botao");
		Integer idP = null;
		Integer idF = null;
		FrameworkUtilizado frameworkUtilizado = new FrameworkUtilizado();
		List<Framework> frameworks = new ArrayList<Framework>();
		List<Projeto> projetos = new ArrayList<Projeto>();
		List<FrameworkUtilizado> frameworkUtilizados = new ArrayList<FrameworkUtilizado>();
		
		
		if (params.get("idP") != null && !params.get("idP").isEmpty()) {
			idP = Integer.parseInt(params.get("idP"));
		}
		if (params.get("idF") != null && !params.get("idF").isEmpty()) {
			idF = Integer.parseInt(params.get("idF"));
		}
		
		try {
			frameworks = fraR.findAll();
			projetos = proR.findAll();
			model.addAttribute("frameworks", frameworks);
			model.addAttribute("projetos", projetos);
		} catch (Exception e) {
			erro = e.getMessage();
		}
		
		try {
			if(cmd.equalsIgnoreCase("Adicionar")) {
			    if (idP != null && idF != null) {
			        Projeto p = proR.findById(idP).orElse(null);
			        Framework f = fraR.findById(idF).orElse(null);
			        if (p != null && f != null) {
			            FrameworkUtilizado existente = futilR.findByProjetoAndFramework(p, f);
			            if (existente == null) {
			                FrameworkUtilizado novo = new FrameworkUtilizado();
			                novo.setProjeto(p);
			                novo.setFramework(f);
			                futilR.save(novo);
			                saida = "Framework associado ao projeto com sucesso";
			            }
			        }
			    }
			}
			
			if(cmd.equalsIgnoreCase("Listar")) {
				frameworkUtilizados = futilR.findAll();
			}
			
			if (cmd.equalsIgnoreCase("Remover")) {
			    try {
			        if (idP != null && idF != null) {
			            Projeto p = proR.findById(idP).orElse(null);
			            Framework f = fraR.findById(idF).orElse(null);

			            if (p != null && f != null) {
			                FrameworkUtilizadoId chaveComposta = new FrameworkUtilizadoId(p, f);
			                futilR.deleteById(chaveComposta); // agora funciona!
			                saida = "Framework utilizado removido com sucesso!";
			            } 
			        } 
			    } catch (Exception e) {
			        erro = e.getMessage();
			    }
			}
		} catch (Exception e) {
			erro = e.getMessage();
		}
		
		model.addAttribute("erro", erro);
		model.addAttribute("saida", saida);
		model.addAttribute("projetos", projetos);
		model.addAttribute("frameworks", frameworks);
		model.addAttribute("frameworkUtilizado", frameworkUtilizado);
		return new ModelAndView("atualizar_frameworks");
	}

}

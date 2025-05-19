package lab.bd.trabalho.empresaseguranca.controller;

import java.math.BigDecimal;
import java.time.LocalDate;
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

import lab.bd.trabalho.empresaseguranca.model.Linguagem;
import lab.bd.trabalho.empresaseguranca.model.Projeto;
import lab.bd.trabalho.empresaseguranca.repository.LinguagemRepository;
import lab.bd.trabalho.empresaseguranca.repository.ProjetoRepository;

@Controller
public class CadastrarProjetoController {


	@Autowired
	public ProjetoRepository ProR;

	// Para fazer a caixa de opções
	@Autowired
	public LinguagemRepository LinR;

	@RequestMapping(name = "cadastrar_projeto", value = "/cadastrar_projeto", method = RequestMethod.GET)
	/**
	 * Funcao responsavel por mapear a requisicao GET e carregar a pagina de
	 * cadastro de projeto /cadastrar_projeto
	 * 
	 * @param params
	 * @param model
	 * @return A requisicao da pagina GET
	 */
	public ModelAndView valoresSenioridadeGet(@RequestParam Map<String, String> params, ModelMap model) {

		String acao = params.get("acao");
		String id = params.get("id");
		Projeto p = new Projeto();
		List<Projeto> projetos = new ArrayList<>();
		List<Linguagem> linguagens = new ArrayList<>();
		String erro = "";

		try {
			linguagens = LinR.findAll();
			model.addAttribute("linguagens", linguagens);
		} catch (Exception e) {
			erro = e.getMessage();
		}

		try {
			if (id != null && !id.isBlank()) {
				p.setId(Integer.parseInt(id));
			}
			if (acao.equals("excluir")) {
				ProR.delete(p);
				projetos = ProR.findAll();
				p = null;
			} else if (acao.equals("editar")) {
				p = ProR.getReferenceById(p.getId());
				projetos = null;
				model.addAttribute("projeto", p);
			}
		} catch (Exception e) {
			e.getMessage();
		} finally {
			model.addAttribute("erro", erro);
			model.addAttribute("projetos", projetos);
		}
		return new ModelAndView("cadastrar_projeto");
	}

	@RequestMapping(name = "cadastrar_projeto", value = "/cadastrar_projeto", method = RequestMethod.POST)
	/**
	 * Realiza as operações de Inserir, Atualizar, Exclur, Buscar e Listar
	 * 
	 * @param params
	 * @param model
	 * @return
	 */
	public ModelAndView controleExemplarPost(@RequestParam Map<String, String> params, ModelMap model) {
		Integer id = null;
		String nome = params.get("nome");
		String dataInicio = params.get("data_inicio");
		String quantDiasEst = params.get("quant_dias_estimados");
		String orcamento = params.get("orcamento");
		String cmd = params.get("botao");
		String saida = "";
		String erro = "";
		Projeto p = new Projeto();
		List<Projeto> projetos = new ArrayList<Projeto>();
		List<Linguagem> linguagens = new ArrayList<Linguagem>();

		if (params.get("id") != null && !params.get("id").isEmpty()) {
			id = Integer.parseInt(params.get("id"));
		}

		try {
			linguagens = LinR.findAll();
			model.addAttribute("linguagens", linguagens);
		} catch (Exception e) {
			erro = e.getMessage();
		}

		try {
			if (!cmd.equalsIgnoreCase("Listar")) {
				p.setId(id);
			}
			if (cmd.contentEquals("Adicionar")) {
				if (p.getId() != null) {
					p.setNome(nome);
					p.setDataInicio(LocalDate.parse(dataInicio));
					p.setOrcamento(BigDecimal.valueOf(Double.parseDouble(orcamento)));
					p.setQuantDiasEstimados(Integer.parseInt(quantDiasEst));
					Linguagem l = LinR.getReferenceById(Integer.parseInt(params.get("linguagem_id")));
					p.setLinguagem(l);
					ProR.save(p);
					saida = "Atualizado com sucesso!";

				} else {
					p.setNome(nome);
					p.setDataInicio(LocalDate.parse(dataInicio));
					p.setOrcamento(BigDecimal.valueOf(Double.parseDouble(orcamento)));
					p.setQuantDiasEstimados(Integer.parseInt(quantDiasEst));
					Linguagem l = LinR.getReferenceById(Integer.parseInt(params.get("linguagem_id")));
					p.setLinguagem(l);
					ProR.save(p);
					saida = "Salvo com sucesso!";
				}
			}
			if (cmd.equalsIgnoreCase("Listar")) {
				projetos = ProR.findAll();
			} else if (cmd.equalsIgnoreCase("PesquisarAtt")) {
				projetos = ProR.findProjetoAtrasado();
				model.addAttribute("projetosA", projetos);
			} else {
				if (cmd.equalsIgnoreCase("Pesquisar")) {
					p = ProR.findByNome(nome);
					model.addAttribute("projeto", p);
				}
				if (p.getId() != null) {
					if (cmd.equalsIgnoreCase("Remover")) {
						ProR.deleteById(p.getId());
						saida = "Excluido com sucesso!";
					}
				} else {
					erro = "Id nulo";
				}
			}
		} catch (

		Exception e) {
			erro = e.getMessage();
		} finally {
			if (!cmd.equalsIgnoreCase("Pesquisar")) {
				p = null;
			}
			if (!cmd.equalsIgnoreCase("Listar")) {
				projetos = null;
			}
		}
		model.addAttribute("erro", erro);
		model.addAttribute("saida", saida);
		model.addAttribute("projetos", projetos);
		return new ModelAndView("cadastrar_projeto");
	}
}

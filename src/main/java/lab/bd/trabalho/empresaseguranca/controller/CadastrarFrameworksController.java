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
import lab.bd.trabalho.empresaseguranca.model.Linguagem;
import lab.bd.trabalho.empresaseguranca.repository.FrameworkRepository;
import lab.bd.trabalho.empresaseguranca.repository.LinguagemRepository;

@Controller
public class CadastrarFrameworksController {

	@Autowired
	public FrameworkRepository FraR;

	// Para fazer a caixa de opções
	@Autowired
	public LinguagemRepository LinR;

	@RequestMapping(name = "cadastrar_frameworks", value = "/cadastrar_frameworks", method = RequestMethod.GET)
	/**
	 * Funcao responsavel por mapear a requisicao GET e carregar a pagina dos
	 * valores de senioridade /cadastrar_frameworks
	 * 
	 * @param params
	 * @param model
	 * @return A requisicao da pagina GET
	 */
	public ModelAndView valoresSenioridadeGet(@RequestParam Map<String, String> params, ModelMap model) {

		String acao = params.get("acao");
		String id = params.get("id");
		Framework f = new Framework();
		List<Framework> frameworks = new ArrayList<>();
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
				f.setId(Integer.parseInt(id));
			}
			if (acao.equals("excluir")) {
				FraR.delete(f);
				frameworks = FraR.findAll();
				f = null;
			} else if (acao.equals("editar")) {
				f = FraR.getReferenceById(f.getId());
				frameworks = null;
				model.addAttribute("framework", f);
			}
		} catch (Exception e) {
			e.getMessage();
		} finally {
			model.addAttribute("erro", erro);
			model.addAttribute("frameworks", frameworks);
		}
		return new ModelAndView("cadastrar_frameworks");
	}

	@RequestMapping(name = "cadastrar_frameworks", value = "/cadastrar_frameworks", method = RequestMethod.POST)
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
		String versao = params.get("versao");
		String cmd = params.get("botao");
		String saida = "";
		String erro = "";
		Framework f = new Framework();
		List<Framework> frameworks = new ArrayList<Framework>();
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
				f.setId(id);
			}
			if (cmd.contentEquals("Adicionar")) {
				if (f.getId() != null) {
					f.setNome(nome);
					f.setVersao(versao);
					Linguagem l = LinR.getReferenceById(Integer.parseInt(params.get("linguagem_id")));
					f.setLinguagem(l);
					FraR.save(f);
					saida = "Atualizado com sucesso!";

				} else {
					f.setNome(nome);
					f.setVersao(versao);
					Linguagem l = LinR.getReferenceById(Integer.parseInt(params.get("linguagem_id")));
					f.setLinguagem(l);
					FraR.save(f);
					saida = "Salvo com sucesso!";
				}
			}
			if (cmd.equalsIgnoreCase("Listar")) {
				frameworks = FraR.findAll();
			} else if (cmd.equalsIgnoreCase("PesquisarL")) {
				Linguagem l = LinR.getReferenceById(Integer.parseInt(params.get("linguagem_id")));
				frameworks = FraR.findFrameworkNomeLinguagem(l.getNomeLinguagem());
			} else {
				if (cmd.equalsIgnoreCase("Pesquisar")) {
					f = FraR.findByNome(nome);
					model.addAttribute("framework", f);
				}
				if (f.getId() != null) {
					if (cmd.equalsIgnoreCase("Remover")) {
						FraR.deleteById(f.getId());
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
				f = null;
			}
			if (!cmd.equalsIgnoreCase("Listar") && !cmd.equalsIgnoreCase("PesquisarL")) {
				frameworks = null;
			}
		}
		model.addAttribute("erro", erro);
		model.addAttribute("saida", saida);
		model.addAttribute("frameworks", frameworks);
		return new ModelAndView("cadastrar_frameworks");
	}

}

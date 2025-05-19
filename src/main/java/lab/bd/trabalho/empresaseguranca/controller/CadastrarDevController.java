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

import lab.bd.trabalho.empresaseguranca.model.Desenvolvedor;
import lab.bd.trabalho.empresaseguranca.model.Linguagem;
import lab.bd.trabalho.empresaseguranca.model.Senioridade;
import lab.bd.trabalho.empresaseguranca.repository.DesenvolvedorRepository;
import lab.bd.trabalho.empresaseguranca.repository.SenioridadeRepository;

@Controller
public class CadastrarDevController {

	@Autowired
	public DesenvolvedorRepository DesR;

	// Para fazer o salvamento da entidade
	@Autowired
	public SenioridadeRepository SenR;

	@RequestMapping(name = "cadastrar_dev", value = "/cadastrar_dev", method = RequestMethod.GET)
	/**
	 * Funcao responsavel por mapear a requisicao GET e carregar a pagina de
	 * cadastro de desenvolvedor /cadastrar_dev
	 * 
	 * @param params
	 * @param model
	 * @return A requisicao da pagina GET
	 */
	public ModelAndView cadastrarDesenvolvedorGet(@RequestParam Map<String, String> params, ModelMap model) {

		String acao = params.get("acao");
		String id = params.get("id");
		Desenvolvedor d = new Desenvolvedor();
		List<Desenvolvedor> desenvolvedores = new ArrayList<>();
		String erro = "";

		try {
			if (id != null && !id.isBlank()) {
				d.setId(Integer.parseInt(id));
			}
			if (acao.equals("excluir")) {
				DesR.delete(d);
				desenvolvedores = DesR.findAll();
				d = null;
			} else if (acao.equals("editar")) {
				d = DesR.getReferenceById(d.getId());
				desenvolvedores = null;
				model.addAttribute("desenvolvedor", d);
			}
		} catch (Exception e) {
			e.getMessage();
		} finally {
			model.addAttribute("erro", erro);
			model.addAttribute("desenvolvedores", desenvolvedores);
		}
		return new ModelAndView("cadastrar_dev");
	}

	@RequestMapping(name = "cadastrar_dev", value = "/cadastrar_dev", method = RequestMethod.POST)
	/**
	 * Realiza as operações de Inserir, Atualizar, Exclur, Buscar e Listar
	 * 
	 * @param params
	 * @param model
	 * @return
	 */
	public ModelAndView cadastrarDevPost(@RequestParam Map<String, String> params, ModelMap model) {
		Integer id = null;
		String nome = params.get("nome");
		String formacao = params.get("Formacao");
		String senio = params.get("Senioridade");
		String cmd = params.get("botao");
		String saida = "";
		String erro = "";
		Desenvolvedor d = new Desenvolvedor();
		List<Desenvolvedor> desenvolvedores = new ArrayList<Desenvolvedor>();

		if (params.get("id") != null && !params.get("id").isEmpty()) {
			id = Integer.parseInt(params.get("id"));
		}

		try {
			if (!cmd.equalsIgnoreCase("Listar")) {
				d.setId(id);
			}
			if (cmd.contentEquals("Adicionar")) {
				if (d.getId() != null) {
					d.setNome(nome);
					d.setFormacao(formacao);
					Senioridade s = SenR.findByNome(senio);
					d.setSenioridade(s);
					DesR.save(d);
					saida = "Atualizado com sucesso!";
				} else {
					d.setNome(nome);
					d.setFormacao(formacao);
					Senioridade s = SenR.findByNome(senio);
					d.setSenioridade(s);
					DesR.save(d);
					saida = "Salvo com sucesso!";
				}
			}
			if (cmd.equalsIgnoreCase("Listar")) {
				desenvolvedores = DesR.findAll();
			} else if (cmd.equalsIgnoreCase("PesquisarF")) {
				desenvolvedores = DesR.findByFormacao(formacao);
				model.addAttribute("desenvolvedores", desenvolvedores);
			} else if (cmd.equalsIgnoreCase("PesquisarSeni")) {
				desenvolvedores = DesR.findDesenvolvedorSenioridade(senio);
				model.addAttribute("desenvolvedores", desenvolvedores);
			} else {
				if (cmd.equalsIgnoreCase("Pesquisar")) {
					d = DesR.findByNome(nome);
					model.addAttribute("desenvolvedor", d);
				}
				if (d.getId() != null) {
					if (cmd.equalsIgnoreCase("Remover")) {
						DesR.deleteById(d.getId());
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
				d = null;
			}
			if (!cmd.equalsIgnoreCase("Listar") && !cmd.equalsIgnoreCase("PesquisarF") 
					&& !cmd.equalsIgnoreCase("PesquisarSeni")) {
				desenvolvedores = null;
			}
		}
		model.addAttribute("erro", erro);
		model.addAttribute("saida", saida);
		model.addAttribute("desenvolvedores", desenvolvedores);
		return new ModelAndView("cadastrar_dev");
	}
}

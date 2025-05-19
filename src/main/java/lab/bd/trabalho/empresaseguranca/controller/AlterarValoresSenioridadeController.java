package lab.bd.trabalho.empresaseguranca.controller;

import java.math.BigDecimal;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

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
public class AlterarValoresSenioridadeController {

	@Autowired
	public SenioridadeRepository SenR;
	
	public static String deAccent(String str) {
	    String nfdNormalizedString = Normalizer.normalize(str, Normalizer.Form.NFD); 
	    Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
	    return pattern.matcher(nfdNormalizedString).replaceAll("");
	}

	@RequestMapping(name = "alterar_valores_senioridade", value = "/alterar_valores_senioridade", method = RequestMethod.GET)
	/**
	 * Funcao responsavel por mapear a requisicao GET e carregar a pagina dos
	 * valores de senioridade /alterar_valores_senioridade
	 * 
	 * @param params
	 * @param model
	 * @return A requisicao da pagina GET
	 */
	public ModelAndView valoresSenioridadeGet(@RequestParam Map<String, String> params, ModelMap model) {

		String acao = params.get("acao");
		String id = params.get("id");
		Senioridade s = new Senioridade();
		List<Senioridade> senioridades = new ArrayList<>();
		String erro = "";

		try {
			if (id != null && !id.isBlank()) {
				s.setId(Integer.parseInt(id));
			}
			if (acao.equals("excluir")) {
				SenR.delete(s);
				senioridades = SenR.findAll();
				s = null;
			} else if (acao.equals("editar")) {
				s = SenR.getReferenceById(s.getId());
				senioridades = null;
				model.addAttribute("senioridade", s);
			}
		} catch (Exception e) {
			e.getMessage();
		} finally {
			model.addAttribute("erro", erro);
			model.addAttribute("senioridades", senioridades);
		}
		return new ModelAndView("alterar_valores_senioridade");
	}

	@RequestMapping(name = "alterar_valores_senioridade", value = "/alterar_valores_senioridade", method = RequestMethod.POST)
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
		String valorHora = params.get("valorHora");
		String cmd = params.get("botao");
		String saida = "";
		String erro = "";
		Senioridade s = new Senioridade();
		List<Senioridade> senioridades = new ArrayList<Senioridade>();

		if (params.get("id") != null && !params.get("id").isEmpty()) {
			id = Integer.parseInt(params.get("id"));
		}

		try {
			if (!cmd.equalsIgnoreCase("Listar")) {
				s.setId(id);
			}
			if (cmd.contentEquals("Adicionar")) {
				if (s.getId() != null) {
					s.setNome(deAccent(nome.toLowerCase()));
					s.setValorHora(BigDecimal.valueOf(Double.parseDouble(valorHora)));
					SenR.save(s);
					saida = "Atualizado com sucesso!";
					
				} else {
					s.setNome(nome);
					s.setValorHora(BigDecimal.valueOf(Double.parseDouble(valorHora)));
					SenR.save(s);
					saida = "Salvo com sucesso!";
				}
			}
			if (cmd.equalsIgnoreCase("Listar")) {
				senioridades = SenR.findAll();
			} else {
				if (cmd.equalsIgnoreCase("Pesquisar")) {
					s = SenR.findByNome(nome);
					model.addAttribute("senioridade", s);
				}
				if (s.getId() != null) {
					if (cmd.equalsIgnoreCase("Remover")) {
						SenR.deleteById(s.getId());
						saida = "Excluido com sucesso!";
					}
				} else {
					erro = "Id nulo";
				}
			}
		} catch (Exception e) {
			erro = e.getMessage();
		} finally {
			if (!cmd.equalsIgnoreCase("Pesquisar")) {
				s = null;
			}
			if (!cmd.equalsIgnoreCase("Listar")) {
				senioridades = null;
			}
		}
		model.addAttribute("erro", erro);
		model.addAttribute("saida", saida);
		model.addAttribute("senioridades", senioridades);
		return new ModelAndView("alterar_valores_senioridade");
	}
}

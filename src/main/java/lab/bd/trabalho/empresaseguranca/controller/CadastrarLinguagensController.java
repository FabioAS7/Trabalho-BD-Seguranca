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
import lab.bd.trabalho.empresaseguranca.model.Linguagem;
import lab.bd.trabalho.empresaseguranca.repository.LinguagemRepository;

@Controller
public class CadastrarLinguagensController {
	
	@Autowired
	private LinguagemRepository lingRep;
	
	@RequestMapping (name = "cadastrar_linguagens", value = "/cadastrar_linguagens", method = RequestMethod.GET)
	public ModelAndView cadastrarlinguagensGet(@RequestParam Map<String, String> params, ModelMap model){
		
		String cmd = params.get("acao");
		Integer id = null;
		String erro = "";
		String saida = "";
		Linguagem linguagem = new Linguagem();
		List<Linguagem> linguagens = new ArrayList<>();
		
		if(params.get("id") != null && !params.get("id").isEmpty()){
			id = Integer.parseInt(params.get("id"));
		}
		
		try {
			if(id != null) {
				if(cmd.equalsIgnoreCase("editar")) {
					linguagem = lingRep.getReferenceById(id);
					linguagens = null;
				} else if(cmd.equalsIgnoreCase("deletar")) {
					linguagem = lingRep.getReferenceById(id);
					lingRep.deleteById(id);
					saida = "Linguagem " + linguagem.getNomeLinguagem() + " deletada" ;
					linguagem = null;
				}
			}
		} catch (Exception e) {
			erro = e.getMessage();
		}
		
		model.addAttribute("erro", erro);
		model.addAttribute("saida", saida);
		model.addAttribute("linguagem", linguagem);
		model.addAttribute("linguagens", linguagens);
		return new ModelAndView("cadastrar_linguagens");
	}
	
	@RequestMapping (name = "cadastrar_linguagens", value = "/cadastrar_linguagens", method = RequestMethod.POST)
	public ModelAndView cadastrarlinguagensPost(@RequestParam Map<String, String> params, ModelMap model) {
		
		String nomeLinguagem = params.get("nome_linguagem");
		String tipo = params.get("tipo");
		String nomeIDE = params.get("nome_ide");
		String cmd = params.get("botao");
		String saida = "";
		String erro = "";
		List<Linguagem> linguagens = new ArrayList<Linguagem>();
		
		Integer id = null;
		Linguagem linguagem = new Linguagem();
		linguagem.setNomeLinguagem(nomeLinguagem);
		linguagem.setTipo(tipo);
		linguagem.setNomeIDE(nomeIDE);
		
		if(params.get("id") != null && !params.get("id").isEmpty()){
			id = Integer.parseInt(params.get("id"));
		}
		
		try {
			if (cmd.equalsIgnoreCase("Adicionar")) {
				if(linguagem.getNomeLinguagem().isBlank()) {
					erro = "Nenhum campo deve ser branco";
					throw new Exception();
				}
				lingRep.save(linguagem);
				saida = "Linguagem Inserida com Sucesso!";
			}
			
			if(cmd.equalsIgnoreCase("Listar")) {
				linguagens = lingRep.findAll();
			}
			
			if(cmd.equalsIgnoreCase("Remover")) {
				linguagem.setId(id);
				if(id != null) {
					lingRep.deleteById(id);
					saida = "Linguagem excluida com sucesso";
				} else {
					erro = "Não foi possivel excluir a linguagem";
				}
			}
			
			if(cmd.equalsIgnoreCase("PesquisarNome")) {
				if(!nomeLinguagem.isBlank() && !nomeLinguagem.isEmpty()) {
					linguagens = lingRep.findByNomeIDE(nomeIDE);
				} else {
					erro = "O campo de Pesquisa (Nome da linguagem) esta vazio";
				}
			}
			
			if(cmd.equalsIgnoreCase("PesquisarTipo")) {
				if(tipo != null) {
					linguagens = lingRep.findByTipo(tipo);
				}else {
					erro = "O campo de Pesquisa (Tipo) esta vazio";
				}
			}
			
			if(cmd.equalsIgnoreCase("PesquisarIDE")) {
				if(nomeIDE != null) {
					linguagens = lingRep.findByNomeIDE(nomeIDE);
				}else {
					erro = "O campo de Pesquisa (IDE Utilizada) esta vazio";
				}
			}
			
		} catch (Exception e) {
			if(e.getMessage() != null) {
				if (e.getMessage().contains("not-null property references a null or transient value")) {
					erro = "Nenhum campo deve ser branco";
				}
				if(e.getMessage().contains("could not execute statement [Tipo invalido (Apenas Modular")){
					erro = "Tipo invalido (Apenas Modular, Orientada a Objetos ou Funcional sao permitidos";
				}
				erro = e.getMessage();
			}
		} finally {
			
		}
		model.addAttribute("erro", erro);
		model.addAttribute("saida", saida);
		model.addAttribute("linguagens", linguagens);
		return new ModelAndView("cadastrar_linguagens");
	}
	

}

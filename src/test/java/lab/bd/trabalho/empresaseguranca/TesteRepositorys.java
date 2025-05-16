package lab.bd.trabalho.empresaseguranca;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import jakarta.transaction.Transactional;
import lab.bd.trabalho.empresaseguranca.model.Desenvolvedor;
import lab.bd.trabalho.empresaseguranca.model.Framework;
import lab.bd.trabalho.empresaseguranca.model.Linguagem;
import lab.bd.trabalho.empresaseguranca.repository.DesenvolvedorRepository;
import lab.bd.trabalho.empresaseguranca.repository.FrameworkRepository;
import lab.bd.trabalho.empresaseguranca.repository.LinguagemRepository;

@SpringBootTest
public class TesteRepositorys {
	
	@Autowired
	public DesenvolvedorRepository devRep;
	
	@Autowired
	public FrameworkRepository frameRep;
	
	@Autowired 
	public LinguagemRepository lingRep;
	
	@Test
	void contextLoads() {
		
	}
	
	@Test
	@Transactional
	void findDev() {
		//Encontrar Desenvolvedor por Senioridade
		System.out.println("\n Encontrar Devs por Senioridade: ");
		List<Desenvolvedor> devsSenioridade = devRep.findDesenvolvedorSenioridade("pleno");
		for (Desenvolvedor dev: devsSenioridade) {
			System.out.println(dev.toString());
		}
		
		//Encontrar Desenvolvedor por sua formacao
		System.out.println("\n Encontrar Devs por formacao: ");
		List<Desenvolvedor> devsformacao = devRep.findByFormacao("superior");
		for (Desenvolvedor dev: devsformacao) {
			System.out.println(dev.toString());
		}
	}
	
	@Test
	@Transactional
	void findFrame() {
		//Encontrar Framework por Linguagem
		System.out.println("\n Encontrar Frames por Linguagem: ");
		List<Framework> framesLinguagem = frameRep.findFrameworkNomeLinguagem("Java");
		for(Framework frame: framesLinguagem) {
			System.out.println(frame.toString());
		}
	}
	
	@Test
	@Transactional
	void findLing() {
		//Encontrar Linguagem por tipo
		System.out.println("\n Encontrar Lings por tipo: ");
		List<Linguagem> lingstipo = lingRep.findByTipo("Modular");
		for (Linguagem ling: lingstipo) {
			System.out.println(ling.toString());
		}
		
		//Encontrar Linguagem por nome da IDE
		System.out.println("\n Encontrar Lings por nome da IDE: ");
		List<Linguagem> lingsIDE = lingRep.findByNomeIDE("Eclipse");
		for (Linguagem ling: lingsIDE) {
			System.out.println(ling.toString());
		}
	}
}

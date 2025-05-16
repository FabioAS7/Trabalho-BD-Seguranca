package lab.bd.trabalho.empresaseguranca.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import lab.bd.trabalho.empresaseguranca.model.Linguagem;

public interface LinguagemRepository extends JpaRepository<Linguagem, Integer>{
	
	public List<Linguagem> findByTipo(String tipo);
	
	public List<Linguagem> findByNomeIDE(String nomeIDE);

}

package lab.bd.trabalho.empresaseguranca.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import lab.bd.trabalho.empresaseguranca.model.Desenvolvedor;

public interface DesenvolvedorRepository extends JpaRepository<Desenvolvedor, Integer>{
	
	//@Query(value = "SELECT * FROM desenvolvedor WHERE senioridade_id = (SELECT id FROM senioridade WHERE nome LIKE ?1)", nativeQuery = true)
	@Query(value = "SELECT d FROM Desenvolvedor d WHERE d.senioridade.nome LIKE ?1")
	public List<Desenvolvedor> findDesenvolvedorSenioridade(String nomeSenioridade);
	
	public List<Desenvolvedor> findByFormacao(String formacao);
	
	public Desenvolvedor findByNome(String nome);

}

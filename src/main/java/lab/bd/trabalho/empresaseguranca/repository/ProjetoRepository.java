package lab.bd.trabalho.empresaseguranca.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;

import lab.bd.trabalho.empresaseguranca.model.Projeto;

public interface ProjetoRepository extends JpaRepository<Projeto, Integer> {
	
	@Query(value = "SELECT pj FROM ParticipacaoDev par "
			+ "JOIN par.projeto pj "
			+ "JOIN par.desenvolvedor d "
			+ "WHERE d.nome = ?1")
	public List<Projeto> findProjetoNome(String nome);
	
	@Query(name = "SELECT * FROM dbo.function_projetos_atrasados()", nativeQuery= true)
	public List<Projeto> findProjetoAtrasado();

}

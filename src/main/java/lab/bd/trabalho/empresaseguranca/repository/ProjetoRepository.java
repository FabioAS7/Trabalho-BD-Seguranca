package lab.bd.trabalho.empresaseguranca.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import lab.bd.trabalho.empresaseguranca.model.Projeto;

public interface ProjetoRepository extends JpaRepository<Projeto, Integer> {
	
	/*@Query(value = "SELECT pj.nome FROM projeto pj\r\n"
			+ "INNER JOIN participacao_dev pa ON pj.id = pa.projeto_id\r\n"
			+ "INNER JOIN desenvolvedor d ON d.id = pa.desenvolvedor_id\r\n"
			+ "WHERE d.nome = ?", nativeQuery = true)*/
	public List<Projeto> findProjetoNome();

}

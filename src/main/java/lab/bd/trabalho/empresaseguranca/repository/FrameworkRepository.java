package lab.bd.trabalho.empresaseguranca.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import lab.bd.trabalho.empresaseguranca.model.Framework;

public interface FrameworkRepository extends JpaRepository<Framework, Integer>{
	//@Query(value = "SELECT * FROM framework WHERE linguagem_id = (SELECT id FROM linguagem WHERE nome_linguagem LIKE ?1", nativeQuery = true)
	@Query("SELECT f FROM Framework f WHERE f.linguagem.nomeLinguagem LIKE ?1")
	public List<Framework> findFrameworkNomeLinguagem(String nomeLinguagem);

}

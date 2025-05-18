package lab.bd.trabalho.empresaseguranca.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import lab.bd.trabalho.empresaseguranca.model.Senioridade;

public interface SenioridadeRepository extends JpaRepository<Senioridade, Integer>{
	
	public Optional<Senioridade> findByNome(String nome);

}

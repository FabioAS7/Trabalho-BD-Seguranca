package lab.bd.trabalho.empresaseguranca.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import lab.bd.trabalho.empresaseguranca.model.Senioridade;

public interface SenioridadeRepository extends JpaRepository<Senioridade, Integer>{
	
	public Senioridade findByNome(String nome);

}

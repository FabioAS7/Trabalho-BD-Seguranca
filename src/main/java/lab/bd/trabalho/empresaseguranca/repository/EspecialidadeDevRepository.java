package lab.bd.trabalho.empresaseguranca.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import lab.bd.trabalho.empresaseguranca.model.Desenvolvedor;
import lab.bd.trabalho.empresaseguranca.model.EspecialidadeDev;
import lab.bd.trabalho.empresaseguranca.model.EspecialidadeDevId;
import lab.bd.trabalho.empresaseguranca.model.Linguagem;

public interface EspecialidadeDevRepository extends JpaRepository<EspecialidadeDev, EspecialidadeDevId> {

	public EspecialidadeDev findByDesenvolvedorAndLinguagem(Desenvolvedor d, Linguagem l);
}

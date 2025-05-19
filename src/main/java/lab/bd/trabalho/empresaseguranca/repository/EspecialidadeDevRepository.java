package lab.bd.trabalho.empresaseguranca.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import lab.bd.trabalho.empresaseguranca.model.EspecialidadeDev;
import lab.bd.trabalho.empresaseguranca.model.EspecialidadeDevId;

public interface EspecialidadeDevRepository extends JpaRepository<EspecialidadeDev, EspecialidadeDevId> {

}

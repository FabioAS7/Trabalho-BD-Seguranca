package lab.bd.trabalho.empresaseguranca.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import lab.bd.trabalho.empresaseguranca.model.Framework;
import lab.bd.trabalho.empresaseguranca.model.FrameworkUtilizado;
import lab.bd.trabalho.empresaseguranca.model.FrameworkUtilizadoId;
import lab.bd.trabalho.empresaseguranca.model.Projeto;

public interface FrameworkUtilizadoRepository extends JpaRepository<FrameworkUtilizado, FrameworkUtilizadoId>{

	public FrameworkUtilizado findByProjetoAndFramework(Projeto p, Framework f);

}

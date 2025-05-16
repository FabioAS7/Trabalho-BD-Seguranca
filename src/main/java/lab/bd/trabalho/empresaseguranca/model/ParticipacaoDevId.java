package lab.bd.trabalho.empresaseguranca.model;

import java.io.Serializable;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ParticipacaoDevId implements Serializable {

	private static final long serialVersionUID = 1L;
	private Desenvolvedor desenvolvedor;
	private Projeto projeto;

}

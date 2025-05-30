package lab.bd.trabalho.empresaseguranca.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class FrameworkUtilizadoId implements Serializable{

	private static final long serialVersionUID = 1L;
	private Projeto projeto;
	private Framework framework;

}

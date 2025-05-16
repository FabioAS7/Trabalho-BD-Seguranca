package lab.bd.trabalho.empresaseguranca.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "especialidade_dev")
@IdClass(EspecialidadeDevId.class)
public class EspecialidadeDev {
	
	@Id
	@ManyToOne(cascade = CascadeType.ALL, targetEntity = Desenvolvedor.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "desenvolvedor_id", nullable = false)
	private Desenvolvedor desenvolvedor;
	
	@Id
	@ManyToOne(cascade = CascadeType.ALL, targetEntity = Linguagem.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "linguagem_id", nullable = false)
	private Linguagem linguagem;

}

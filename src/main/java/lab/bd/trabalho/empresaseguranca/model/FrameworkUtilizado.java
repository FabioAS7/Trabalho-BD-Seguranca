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
@Table(name = "framework_utilizado")
@IdClass(FrameworkUtilizadoId.class)
public class FrameworkUtilizado {
	
	@Id
	@ManyToOne(cascade = CascadeType.ALL, targetEntity = Projeto.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "projeto_id", nullable = false)
	private Projeto projeto;
	
	@Id
	@ManyToOne(cascade = CascadeType.ALL, targetEntity = Framework.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "framework_id", nullable = false)
	private Framework framework;

}

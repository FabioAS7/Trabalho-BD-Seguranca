package lab.bd.trabalho.empresaseguranca.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
@Table(name = "desenvolvedor")
public class Desenvolvedor {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private int id;
	
	@Column(name = "nome", length = 120, nullable = false)
	private String nome;
	
	@Column(name = "formacao", length = 15, nullable = false)
	private String formacao;
	
	@ManyToOne (targetEntity = Senioridade.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "senioridade_id", nullable = false)
	private Senioridade senioridade;

}

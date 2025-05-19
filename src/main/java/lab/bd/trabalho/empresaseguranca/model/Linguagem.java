package lab.bd.trabalho.empresaseguranca.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
@Table(name = "linguagem")
public class Linguagem {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Integer id;
	
	@Column(name = "nome_linguagem", length = 90, nullable = false)
	private String nomeLinguagem;
	
	@Column(name = "tipo", length = 25, nullable = false)
	private String tipo;
	
	@Column(name = "nome_ide", length = 90, nullable = false)
	private String nomeIDE;

}

package lab.bd.trabalho.empresaseguranca.model;

import java.math.BigDecimal;
import java.time.LocalDate;

import org.hibernate.annotations.Formula;

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
@Table(name = "projeto")
public class Projeto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private int id;
	
	@Column(name = "nome", length = 100, nullable = false)
	private String nome;
	
	@Column(name = "data_inicio", nullable = false)
	private LocalDate dataInicio;
	
	@Column(name = "quant_dias_estimados", nullable = false)
	private int quantDiasEstimados;
	
	@Column(name = "orcamento", precision = 7, scale = 2, nullable = false)
	private BigDecimal orcamento;
	
	@Formula("DATEDIFF(DAY, data_inicio, GETDATE()) - quant_dias_estimados")
	private int quantDiasAtrasados;

	@ManyToOne (targetEntity = Linguagem.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "linguagem_id", nullable = false)
	private Linguagem linguagem;
}

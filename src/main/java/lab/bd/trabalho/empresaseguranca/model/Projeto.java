package lab.bd.trabalho.empresaseguranca.model;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PostLoad;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
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
	private Integer id;
	
	@Column(name = "nome", length = 100, nullable = false)
	private String nome;
	
	@Column(name = "data_inicio", nullable = false)
	private LocalDate dataInicio;
	
	@Column(name = "quant_dias_estimados", nullable = false)
	private int quantDiasEstimados;
	
	@Column(name = "orcamento", precision = 7, scale = 2, nullable = false)
	private BigDecimal orcamento;
	
	@Transient
	private int quantDiasAtrasados;

	@PostLoad
	private void postLoad() {
		this.quantDiasAtrasados = (int) ChronoUnit.DAYS.between(dataInicio, LocalDate.now()) - this.quantDiasEstimados;
	}
	
	@ManyToOne (targetEntity = Linguagem.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "linguagem_id", nullable = false)
	private Linguagem linguagem;
	
	public Projeto(String nome, LocalDate data, int qant, BigDecimal or, Linguagem linguagem) {
		this.nome = nome;
		this.dataInicio = data;
		this.quantDiasEstimados = qant;
		this.orcamento = or;
		this.linguagem = linguagem;
	}
}

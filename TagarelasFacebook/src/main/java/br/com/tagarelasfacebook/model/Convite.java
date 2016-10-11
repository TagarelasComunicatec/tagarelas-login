package br.com.tagarelasfacebook.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "CONVITE")
public class Convite {

	@Id
	@GeneratedValue(generator="increment")
	@GenericGenerator(name = "increment", strategy = "increment")
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name="usuario_fk")
	private Usuario remetente;
	
	@ManyToOne
	@JoinColumn(name="sessao_bate_papo_fk")
	private SessaoBatePapo sessaoBatePapo;
	
	@Column(name = "dia_horario", nullable=false)
	private Date diaHorario;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Usuario getRemetente() {
		return remetente;
	}

	public void setRemetente(Usuario remetente) {
		this.remetente = remetente;
	}

	public SessaoBatePapo getSessaoBatePapo() {
		return sessaoBatePapo;
	}

	public void setSessaoBatePapo(SessaoBatePapo sessaoBatePapo) {
		this.sessaoBatePapo = sessaoBatePapo;
	}

	public Date getDiaHorario() {
		return diaHorario;
	}

	public void setDiaHorario(Date diaHorario) {
		this.diaHorario = diaHorario;
	}

}

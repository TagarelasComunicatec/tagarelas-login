package br.com.tagarelasfacebook.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "SESSAO_BATE_PAPO")
public class SessaoBatePapo implements Comparable<SessaoBatePapo> {

	@Id
	@GeneratedValue(generator="increment")
	@GenericGenerator(name = "increment", strategy = "increment")
	private Integer id;
	
	@Column(name="titulo")
	private String titulo;
	
	@Column(name="descricao", nullable=true)
	private String descricao;
	
	@Column(name="observacao", nullable=true)
	private String observacao;
	
	@Column(name="dia_horario")
	private Date diaHorario;
	
	@Column(name="realizada", nullable=true)
	private Boolean realizada;
	
	@ManyToOne
	@JoinColumn(name="usuario_fk")
	private Usuario proprietario;
	
	@ManyToOne
	@JoinColumn(name="sistema_bate_papo_fk")
	private SistemaBatePapo sistemaBatePapo;
	
	@OneToMany(mappedBy = "sessaoBatePapo")
	private Set<Convite> convites;
	
	@ManyToMany(cascade = {CascadeType.ALL}, fetch=FetchType.EAGER)
	@JoinTable(name="participante_sessao", joinColumns={@JoinColumn(name="sessao_bate_papo_fk")}, inverseJoinColumns={@JoinColumn(name="usuario_fk")})
	private Set<Usuario> participantes = new HashSet<>();

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public Date getDiaHorario() {
		return diaHorario;
	}

	public void setDiaHorario(Date diaHorario) {
		this.diaHorario = diaHorario;
	}

	public Boolean getRealizada() {
		return realizada;
	}

	public void setRealizada(Boolean realizada) {
		this.realizada = realizada;
	}

	public Usuario getProprietario() {
		return proprietario;
	}

	public void setProprietario(Usuario proprietario) {
		this.proprietario = proprietario;
	}

	public SistemaBatePapo getSistemaBatePapo() {
		return sistemaBatePapo;
	}

	public void setSistemaBatePapo(SistemaBatePapo sistemaBatePapo) {
		this.sistemaBatePapo = sistemaBatePapo;
	}
	
	public Set<Convite> getConvites() {
		return convites;
	}

	public void setConvites(Set<Convite> convites) {
		this.convites = convites;
	}

	public Set<Usuario> getParticipantes() {
		return participantes;
	}

	public void setParticipantes(Set<Usuario> participantes) {
		this.participantes = participantes;
	}
	
	public void adicionarParticipante(Usuario participante){
		getParticipantes().add(participante);
	}

	@Override
	public int compareTo(SessaoBatePapo outraSessao) {
		return (this.getDiaHorario().compareTo(outraSessao.getDiaHorario())) * (-1);
	}

}

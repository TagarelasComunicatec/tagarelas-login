package br.com.tagarelasfacebook.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "SISTEMA_BATE_PAPO")
public class SistemaBatePapo {

	@Id
	@GeneratedValue(generator="increment")
	@GenericGenerator(name = "increment", strategy = "increment")
	private Integer id;
	
	@Column(name="nome")
	private String nome;
	
	@Column(name="descricao", nullable=true)
	private String descricao;
	
	@OneToMany(mappedBy="sistemaBatePapo")
	private Set<SessaoBatePapo> sessoesBatePapo;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Set<SessaoBatePapo> getSessoesBatePapo() {
		return sessoesBatePapo;
	}

	public void setSessoesBatePapo(Set<SessaoBatePapo> sessoesBatePapo) {
		this.sessoesBatePapo = sessoesBatePapo;
	}
	
}

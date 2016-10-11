package br.com.tagarelasfacebook.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.apache.commons.codec.binary.Base64;
import org.hibernate.annotations.GenericGenerator;

import br.com.tagarelasfacebook.util.StringUtil;

@Entity
@Table(name = "USUARIO")
public class Usuario implements Comparable<Usuario> {

	@Id
	@GeneratedValue(generator = "increment")
	@GenericGenerator(name = "increment", strategy = "increment")
	private Integer id;

	@Column(name = "nome_completo")
	private String nomeCompleto;

	@Column(name = "nome_curto")
	private String nomeCurto;

	@Column(name = "email", nullable = true)
	private String email;

	@Column(name = "senha", nullable = true)
	private String senha;

	@Column(name = "foto", nullable = true)
	private byte[] foto;

	@Column(name = "facebook_id", nullable = true)
	private String facebookId;

	@OneToMany(mappedBy = "proprietario", fetch=FetchType.EAGER)
	private Set<SessaoBatePapo> sessoesBatePapoCriadas;
	
	@OneToMany(mappedBy = "remetente")
	private Set<Convite> convitesEnviados;
	
	@ManyToMany(mappedBy="participantes", fetch=FetchType.EAGER)
	private Set<SessaoBatePapo> sessoesBatePapoParticipacaoConfirmada;

	public Usuario() {
	}

	public Usuario(Integer id, String nomeCompleto, String nomeCurto, String email, String senha) {
		super();
		this.id = id;
		this.nomeCompleto = nomeCompleto;
		this.nomeCurto = nomeCurto;
		this.email = email;
		this.senha = senha;
	}

	public Usuario(Integer id, String nomeCompleto, String nomeCurto, String email, byte[] foto, String facebookId) {
		super();
		this.id = id;
		this.nomeCompleto = nomeCompleto;
		this.nomeCurto = nomeCurto;
		this.email = email;
		this.foto = foto;
		this.facebookId = facebookId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNomeCompleto() {
		return nomeCompleto;
	}

	public void setNomeCompleto(String nomeCompleto) {
		this.nomeCompleto = nomeCompleto;
	}

	public String getNomeCurto() {
		return nomeCurto;
	}

	public void setNomeCurto(String nomeCurto) {
		this.nomeCurto = nomeCurto;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = StringUtil.criptografarSenha(senha);
	}

	public byte[] getFoto() {
		return foto;
	}

	public void setFoto(byte[] foto) {
		this.foto = foto;
	}

	public String getFacebookId() {
		return facebookId;
	}

	public void setFacebookId(String facebookId) {
		this.facebookId = facebookId;
	}

	public Set<SessaoBatePapo> getSessoesBatePapoCriadas() {
		return sessoesBatePapoCriadas;
	}

	public void setSessoesBatePapoCriadas(Set<SessaoBatePapo> sessoesBatePapoCriadas) {
		this.sessoesBatePapoCriadas = sessoesBatePapoCriadas;
	}
	
	public Set<Convite> getConvitesEnviados() {
		return convitesEnviados;
	}

	public void setConvitesEnviados(Set<Convite> convitesEnviados) {
		this.convitesEnviados = convitesEnviados;
	}

	public Set<SessaoBatePapo> getSessoesBatePapoParticipacaoConfirmada() {
		return sessoesBatePapoParticipacaoConfirmada;
	}

	public void setSessoesBatePapoParticipacaoConfirmada(Set<SessaoBatePapo> sessoesBatePapoParticipacaoConfirmada) {
		this.sessoesBatePapoParticipacaoConfirmada = sessoesBatePapoParticipacaoConfirmada;
	}

	// String usada para exibir a foto numa página Web
	public String getFotoString() {
		return new String(new Base64().encode(foto));
	}
	
	public void clone(Usuario usuario) {
		id = usuario.getId();
		nomeCompleto = usuario.getNomeCompleto();
		nomeCurto = usuario.getNomeCurto();
		email = usuario.getEmail();
		senha = usuario.getSenha();
		facebookId = usuario.getFacebookId();

		if (usuario.getFoto() != null) {
			foto = usuario.getFoto();
		}

	}

	@Override
	public int compareTo(Usuario outroUsuario) {
		return this.getNomeCurto().compareTo(outroUsuario.getNomeCurto());
	}

}

package br.com.tagarelasfacebook.service;

import org.scribe.builder.api.FacebookApi;

public class ConfiguracaoServicoOAuth {
	
	private String idAplicativo;
	private String chaveSecretaAplicativo;
	private String uriRedirecionamento;
	private FacebookApi facebookApi = new FacebookApi();

	public ConfiguracaoServicoOAuth(String idAplicativo, String chaveSecretaAplicativo, String uriRedirecionamento) {
		this.idAplicativo = idAplicativo;
		this.chaveSecretaAplicativo = chaveSecretaAplicativo;
		this.uriRedirecionamento = uriRedirecionamento;
	}

	public String getIdAplicativo() {
		return idAplicativo;
	}

	public void setIdAplicativo(String idAplicativo) {
		this.idAplicativo = idAplicativo;
	}

	public String getChaveSecretaAplicativo() {
		return chaveSecretaAplicativo;
	}

	public void setChaveSecretaAplicativo(String chaveSecretaAplicativo) {
		this.chaveSecretaAplicativo = chaveSecretaAplicativo;
	}

	public String getUriRedirecionamento() {
		return uriRedirecionamento;
	}

	public void setUriRedirecionamento(String uriRedirecionamento) {
		this.uriRedirecionamento = uriRedirecionamento;
	}

	public FacebookApi getFacebookApi() {
		return facebookApi;
	}

	public void setFacebookApi(FacebookApi facebookApi) {
		this.facebookApi = facebookApi;
	}

}

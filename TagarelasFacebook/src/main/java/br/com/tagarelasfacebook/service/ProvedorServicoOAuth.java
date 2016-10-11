package br.com.tagarelasfacebook.service;

import org.scribe.builder.ServiceBuilder;
import org.scribe.oauth.OAuthService;

public class ProvedorServicoOAuth {
	
	private ConfiguracaoServicoOAuth configuracaoServicoOAuth;

	public ProvedorServicoOAuth(ConfiguracaoServicoOAuth configuracaoServicoOAuth) {
		this.configuracaoServicoOAuth = configuracaoServicoOAuth;
	}

	public OAuthService getService() {
		return new ServiceBuilder().provider(configuracaoServicoOAuth.getFacebookApi())
				.apiKey(configuracaoServicoOAuth.getIdAplicativo()).apiSecret(configuracaoServicoOAuth.getChaveSecretaAplicativo())
				.callback(configuracaoServicoOAuth.getUriRedirecionamento()).build();
	}


}

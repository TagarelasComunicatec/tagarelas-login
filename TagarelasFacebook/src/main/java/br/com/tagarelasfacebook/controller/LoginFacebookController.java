package br.com.tagarelasfacebook.controller;

import javax.servlet.http.HttpSession;

import org.scribe.model.Token;
import org.scribe.model.Verifier;
import org.scribe.oauth.OAuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.social.connect.support.ConnectionFactoryRegistry;
import org.springframework.social.facebook.api.User;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import br.com.tagarelasfacebook.exception.UsuarioException;
import br.com.tagarelasfacebook.model.Usuario;
import br.com.tagarelasfacebook.service.ProvedorServicoOAuth;
import br.com.tagarelasfacebook.service.UsuarioService;
import br.com.tagarelasfacebook.util.StringUtil;
import br.com.tagarelasfacebook.vo.UsuarioVO;

@Controller
public class LoginFacebookController {

	@Autowired
	private UsuarioService usuarioService;

	// connectionFactoryRegistry contém o ID e a chave secreta do aplicativo (fornecidos quando o aplicativo é cadastrado no Facebook for developers)
	@Autowired
	private ConnectionFactoryRegistry connectionFactoryRegistry;

	
	// oAuth2Parameters contém a URI de redirecionamento e o escopo (permissões solicitadas ao usuário)
	@Autowired
	private OAuth2Parameters oAuth2Parameters;

	@Autowired
	@Qualifier("provedorServicoOAuth")
	private ProvedorServicoOAuth provedorServicoOAuth;

	@RequestMapping("/logarnofacebook")
	public ModelAndView conectarAoFacebook() throws Exception {

		FacebookConnectionFactory facebookConnectionFactory = (FacebookConnectionFactory) connectionFactoryRegistry.getConnectionFactory(StringUtil.FACEBOOK);
		OAuth2Operations oAuth2Operations = facebookConnectionFactory.getOAuthOperations();
		String urlAutorizacao = oAuth2Operations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, oAuth2Parameters);
		RedirectView redirectView = new RedirectView(urlAutorizacao, true, true, true);

		return new ModelAndView(redirectView);
	}

	@RequestMapping(value = "/callback", method = RequestMethod.GET)
	public ModelAndView logarUsuario(@RequestParam("code") String codigo, HttpSession sessao) {

		OAuthService oAuthService = provedorServicoOAuth.getService();
		Verifier verifier = new Verifier(codigo);
		Token tokenAcesso = oAuthService.getAccessToken(Token.empty(), verifier);
		FacebookTemplate facebookTemplate = new FacebookTemplate(tokenAcesso.getToken());

		User perfilUsuario = facebookTemplate.userOperations().getUserProfile();
		String facebookId = perfilUsuario.getId();

		Usuario usuario;
		ModelAndView modelAndView;

		usuario = usuarioService.loginFacebook(facebookId);

		if (usuario != null) {
			sessao.setAttribute("usuarioLogado", usuario);

		} else {

			try {
				usuario = cadastrarUsuario(perfilUsuario);
				sessao.setAttribute("usuarioLogado", usuario);

			} catch (UsuarioException e) {

				UsuarioVO usuarioCadastro = new UsuarioVO();
				modelAndView = new ModelAndView("cadastro");
				modelAndView.addObject("usuarioCadastro", usuarioCadastro);
				modelAndView.addObject("mensagemFacebook", e.getMessage());

				return modelAndView;

			}

		}

		if (sessao.getAttribute("idSessaoParaParticipar") != null) {
			modelAndView = new ModelAndView(
					"redirect:/participar-sessao?id=" + sessao.getAttribute("idSessaoParaParticipar"));

		} else if (sessao.getAttribute("idSessaoParaConvidar") != null) {
			modelAndView = new ModelAndView(
					"redirect:/convidar?idSessao=" + sessao.getAttribute("idSessaoParaConvidar"));

		} else {
			modelAndView = new ModelAndView("redirect:/perfil");

		}

		return modelAndView;
	}

	private Usuario cadastrarUsuario(User perfilUsuario) throws UsuarioException {

		Usuario usuario = new Usuario();
		usuario.setNomeCompleto(perfilUsuario.getName());
		usuario.setNomeCurto(perfilUsuario.getFirstName());
		usuario.setFacebookId(perfilUsuario.getId());

		if (!StringUtil.stringVazia(perfilUsuario.getEmail())) {
			usuario.setEmail(perfilUsuario.getEmail());
		}

		usuarioService.adicionarUsuarioFacebook(usuario);

		return usuario;

	}

	@RequestMapping(value = "/callback", params = "error_reason", method = RequestMethod.GET)
	public String erro() throws Exception {
		return "redirect:index";
	}

}

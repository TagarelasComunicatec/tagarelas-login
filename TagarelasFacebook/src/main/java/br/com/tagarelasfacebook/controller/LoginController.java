package br.com.tagarelasfacebook.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.tagarelasfacebook.exception.UsuarioException;
import br.com.tagarelasfacebook.model.Usuario;
import br.com.tagarelasfacebook.service.UsuarioService;

@Controller
public class LoginController {
	
	@Autowired
	private UsuarioService usuarioService;
	
	@RequestMapping("/login")
	public ModelAndView exibirLogin(HttpSession sessao){
		ModelAndView modelAndView;
		
		Usuario usuarioLogin = new Usuario();
		modelAndView = new ModelAndView("login");
		modelAndView.addObject("usuarioLogin", usuarioLogin);
		
		adicionarOrientacao(sessao, modelAndView);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/logar", method=RequestMethod.POST)
	public ModelAndView fazerLogin(@ModelAttribute Usuario usuario, HttpSession sessao){
		Usuario usuarioLogado;
		ModelAndView modelAndView;
		
		try {
			usuarioLogado = usuarioService.login(usuario);
			sessao.setAttribute("usuarioLogado", usuarioLogado);
			
			if (sessao.getAttribute("idSessaoParaParticipar") != null){
				modelAndView = new ModelAndView("redirect:/participar-sessao?id=" + sessao.getAttribute("idSessaoParaParticipar"));
				
			} else if (sessao.getAttribute("idSessaoParaConvidar") != null){
				modelAndView = new ModelAndView("redirect:/convidar?idSessao=" + sessao.getAttribute("idSessaoParaConvidar"));
				
			} else {
				modelAndView = new ModelAndView("redirect:/perfil");
			}
				
			
		} catch (UsuarioException e) {
			modelAndView = new ModelAndView("login");
			modelAndView.addObject("usuarioLogin", usuario);
			modelAndView.addObject("mensagem", e.getMessage());
			adicionarOrientacao(sessao, modelAndView);
		}

		return modelAndView;
	}
	
	private void adicionarOrientacao(HttpSession sessao, ModelAndView modelAndView) {
		if (sessao.getAttribute("idSessaoParaParticipar") != null){
			modelAndView.addObject("exibirOrientacao", true);
			modelAndView.addObject("orientacao", "Entre para confirmar a sua participação na sessão de bate-papo.");
			
		} else if (sessao.getAttribute("idSessaoParaConvidar") != null){
			modelAndView.addObject("exibirOrientacao", true);
			modelAndView.addObject("orientacao", "Entre para convidar amigos para participarem da sessão de bate-papo.");
			
		} else {
			modelAndView.addObject("exibirOrientacao", false);
			
		}
	}
	
	@RequestMapping("/logout")
	public String fazerLogout(HttpSession sessao){
		sessao.invalidate();
		return "redirect:index";
	}

}

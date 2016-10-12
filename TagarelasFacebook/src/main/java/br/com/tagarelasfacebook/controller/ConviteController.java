package br.com.tagarelasfacebook.controller;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.tagarelasfacebook.exception.ConviteException;
import br.com.tagarelasfacebook.model.Convite;
import br.com.tagarelasfacebook.model.SessaoBatePapo;
import br.com.tagarelasfacebook.model.Usuario;
import br.com.tagarelasfacebook.service.ConviteService;
import br.com.tagarelasfacebook.service.SessaoBatePapoService;
import br.com.tagarelasfacebook.util.StringUtil;

@Controller
public class ConviteController {
	
	@Autowired
	private ConviteService conviteService;
	
	@Autowired
	private SessaoBatePapoService sessaoBatePapoService;
	
	@RequestMapping(value ="/convidar")
	public ModelAndView convidar(@RequestParam Integer idSessao, HttpSession sessao){
		ModelAndView modelAndView = new ModelAndView("detalhar_sessao");
		
		Convite convite = new Convite();
		SessaoBatePapo sessaoBatePapo = sessaoBatePapoService.getSessaoBatePapo(idSessao);
		
		if (sessaoBatePapo != null){
			modelAndView.addObject("sessao", sessaoBatePapo);
			modelAndView.addObject("idAplicativo", StringUtil.ID_APLICATIVO);
			modelAndView.addObject("dominio", StringUtil.DOMINIO_APLICACAO);
			convite.setSessaoBatePapo(sessaoBatePapo);
			
		} else {
			modelAndView = new ModelAndView("redirect:index");
			return modelAndView;
		}
		
		Usuario remetente = (Usuario) sessao.getAttribute("usuarioLogado");
		
		if (remetente != null){
			convite.setRemetente(remetente);
			
			try {
				conviteService.adicionar(convite);
				modelAndView.addObject("idConvite", convite.getId());
				
			} catch (ConviteException e) {
				modelAndView.addObject("mensagem", e.getMessage());
				e.printStackTrace();
				
			}
			
			
		} else {
			modelAndView = new ModelAndView("redirect:login");
			
			sessao.setAttribute("idSessaoParaConvidar", idSessao);
			sessao.setAttribute("idSessaoParaParticipar", null);
			return modelAndView;
		}
				
		ArrayList<Usuario> participantes = new ArrayList<Usuario>(sessaoBatePapo.getParticipantes());
		Collections.sort(participantes);
		modelAndView.addObject("participantes", participantes);
		
		sessao.setAttribute("idSessaoParaConvidar", null);
		
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/convite")
	public ModelAndView exibirConvite(@RequestParam Integer id){
		ModelAndView modelAndView;
		
		Convite convite = conviteService.get(id);
		
		if (convite == null){
			modelAndView = new ModelAndView("redirect:index");
			
		} else {
			modelAndView = new ModelAndView("detalhar_sessao");
			modelAndView.addObject("mensagem", conviteService.getMensagemConvite(convite));
			
			SessaoBatePapo sessaoBatePapo = convite.getSessaoBatePapo();
			
			modelAndView.addObject("sessao", sessaoBatePapo);
			
			ArrayList<Usuario> participantes = new ArrayList<Usuario>(sessaoBatePapo.getParticipantes());
			Collections.sort(participantes);
			modelAndView.addObject("participantes", participantes);
			
		}
		
		return modelAndView;
	}

}

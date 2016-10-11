package br.com.tagarelasfacebook.controller;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.tagarelasfacebook.exception.SessaoBatePapoException;
import br.com.tagarelasfacebook.model.SessaoBatePapo;
import br.com.tagarelasfacebook.model.Usuario;
import br.com.tagarelasfacebook.service.SessaoBatePapoService;
import br.com.tagarelasfacebook.service.UsuarioService;
import br.com.tagarelasfacebook.util.StringUtil;

@Controller
public class SessaoBatePapoController {
	
	@Autowired
	private SessaoBatePapoService sessaoBatePapoService;
	
	@Autowired
	private UsuarioService usuarioService;
	
	private final String PARTICIPACAO_CONFIRMADA = "Sua participação foi confirmada nesta sessão!";
	
	@RequestMapping("/agenda")
	public ModelAndView exibirAgenda(){
		ModelAndView modelAndView = new ModelAndView("agenda");
		modelAndView.addObject("sessoesBatePapo", sessaoBatePapoService.getListaSessoesBatePapoNaoRealizadas());
		return modelAndView;
	}
	
	@RequestMapping("/arquivo")
	public ModelAndView exibirArquivo(){
		ModelAndView modelAndView = new ModelAndView("arquivo");
		modelAndView.addObject("sessoesBatePapo", sessaoBatePapoService.getListaSessoesBatePapoRealizadas());
		return modelAndView;
	}
	
	@RequestMapping("/detalhes-sessao")
	public ModelAndView detalharSessao(@RequestParam Integer id){
		return detalharSessao(id, "detalhar_sessao");
	}
	
	@RequestMapping("/detalhes_sessao_arquivada")
	public ModelAndView detalharSessaoArquivada(@RequestParam Integer id){
		return detalharSessao(id, "detalhar_sessao_arquivada");
	}

	private ModelAndView detalharSessao(Integer id, String view) {
		ModelAndView modelAndView = new ModelAndView(view);
		
		SessaoBatePapo sessaoBatePapo = sessaoBatePapoService.getSessaoBatePapo(id);
		modelAndView.addObject("sessao", sessaoBatePapo);
		
		ArrayList<Usuario> participantes = new ArrayList<Usuario>(sessaoBatePapo.getParticipantes());
		Collections.sort(participantes);
		modelAndView.addObject("participantes", participantes);
		
		return modelAndView;
	}
	
	@RequestMapping("/log")
	public ModelAndView exibirLog(@RequestParam Integer id){
		
		ModelAndView modelAndView;
		
		SessaoBatePapo sessaoBatePapo = sessaoBatePapoService.getSessaoBatePapo(id);
		
		if (sessaoBatePapo == null || sessaoBatePapo.getRealizada() == null || !sessaoBatePapo.getRealizada()){
			modelAndView = new ModelAndView("redirect:index");
			
		} else {
			modelAndView = new ModelAndView("log");
			modelAndView.addObject("sessao", sessaoBatePapo);
			modelAndView.addObject("dominio", StringUtil.DOMINIO_APLICACAO);
		}
		
		return modelAndView;
	}
	
	@RequestMapping("/participar-sessao")
	public ModelAndView participarSessao(HttpSession sessao, @RequestParam Integer id){
		
		ModelAndView modelAndView;
		
		Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuarioLogado");
		
		
		if (usuarioLogado != null){
			
			Integer idUsuario = usuarioLogado.getId();
			
			modelAndView = new ModelAndView("detalhar_sessao");
			
			SessaoBatePapo sessaoBatePapo = sessaoBatePapoService.getSessaoBatePapo(id);
			
			try {
				sessaoBatePapoService.adicionarParticipante(sessaoBatePapo, usuarioLogado);
				modelAndView.addObject("mensagem", PARTICIPACAO_CONFIRMADA);
				
				usuarioService.evitar(usuarioLogado);
				Usuario usuarioAtualizado = usuarioService.get(idUsuario);
				sessao.setAttribute("usuarioLogado", usuarioAtualizado);
				
			} catch (SessaoBatePapoException e) {
				modelAndView.addObject("mensagem", e.getMessage());
				e.printStackTrace();
			}
			
			modelAndView.addObject("sessao", sessaoBatePapo);
			
			ArrayList<Usuario> participantes = new ArrayList<Usuario>(sessaoBatePapo.getParticipantes());
			Collections.sort(participantes);
			modelAndView.addObject("participantes", participantes);
			
			sessao.setAttribute("idSessaoParaParticipar", null);
			
		} else {
			modelAndView = new ModelAndView("redirect:login");
			sessao.setAttribute("idSessaoParaParticipar", id);
			sessao.setAttribute("idSessaoParaConvidar", null);
		}
		
		return modelAndView;
	}

}

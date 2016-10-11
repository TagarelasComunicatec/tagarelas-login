package br.com.tagarelasfacebook.controller;

import java.awt.image.BufferedImage;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import br.com.tagarelasfacebook.exception.UsuarioException;
import br.com.tagarelasfacebook.model.Usuario;
import br.com.tagarelasfacebook.service.SessaoBatePapoService;
import br.com.tagarelasfacebook.service.UsuarioService;
import br.com.tagarelasfacebook.util.ImagemUtil;
import br.com.tagarelasfacebook.util.StringUtil;
import br.com.tagarelasfacebook.vo.UsuarioVO;

@Controller
public class UsuarioController {
	
	private final int NUMERO_ABA_MINHAS_SESSOES_AGENDADAS = 2;
	private final int NUMERO_ABA_MINHAS_SESSOES_ARQUIVADAS = 3;
	private final int NUMERO_ABA_SESSOES_QUE_JA_PARTICIPEI = 4;
	private final int NUMERO_ABA_SESSOES_QUE_VOU_PARTICIPAR = 5;

	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private SessaoBatePapoService sessaoBatePapoService;

	@RequestMapping("/index")
	public String index() {
		return "index";
	}

	@RequestMapping("/cadastro")
	public ModelAndView exibirCadastro() {
		ModelAndView modelAndView;

		UsuarioVO usuarioCadastro = new UsuarioVO();
		modelAndView = new ModelAndView("cadastro");
		modelAndView.addObject("usuarioCadastro", usuarioCadastro);
		return modelAndView;
	}

	@RequestMapping("/gerenciar_usuarios")
	public String exibirGerenciamentoUsuarios(Map<String, Object> map) {
		Usuario usuario = new Usuario();
		map.put("usuario", usuario);
		map.put("usuarioList", usuarioService.getListaUsuarios());
		return "usuario";
	}

	@RequestMapping(value = "/cadastrar", method = RequestMethod.POST)
	public ModelAndView cadastrar(@ModelAttribute UsuarioVO usuario, HttpSession sessao) {

		ModelAndView modelAndView;
		String mensagem = "";
		Usuario novoUsuario = new Usuario();

		try {
			novoUsuario = usuarioService.adicionarUsuarioConvencional(usuario);

		} catch (UsuarioException e) {
			mensagem = e.getMessage();
			e.printStackTrace();
		}

		if (!mensagem.equals("")) {
			modelAndView = new ModelAndView("cadastro");
			modelAndView.addObject("mensagem", mensagem);
			modelAndView.addObject("usuarioCadastro", usuario);

		} else {

			sessao.setAttribute("usuarioLogado", novoUsuario);
			modelAndView = new ModelAndView("perfil");

		}

		return modelAndView;
	}

	@RequestMapping(value = "/alterar_foto", method = RequestMethod.POST)
	public ModelAndView alterarFoto(@RequestParam("foto") MultipartFile arquivo, @RequestParam("x") double x, @RequestParam("y") double y, @RequestParam("w") double largura, @RequestParam("h") double altura, @RequestParam("scale") double escala, @RequestParam("angle") double angulo, HttpSession sessao) {

		Usuario usuario = (Usuario) sessao.getAttribute("usuarioLogado");
		ModelAndView modelAndView = sessaoBatePapoService.getModelAndViewPerfil(usuario);
		
		String mensagem = "";
		
		if (!arquivo.isEmpty()) {
			
			try {
				
				String extensao = StringUtil.getExtensao(arquivo.getContentType());
				
				// Convertendo o MultipartFile em BufferedImage:
				BufferedImage foto = ImagemUtil.converterMultiPartFileParaBufferedImage(arquivo);
				
				// Girando a imagem:
				int larguraOriginal = foto.getWidth();
				int alturaOriginal = foto.getHeight();
				
				if (angulo != 0){
					foto = ImagemUtil.rotacionar(foto, larguraOriginal, alturaOriginal, angulo);
				}

				// Cortando a imagem:
				// quando a imagem não é quadrada e o ângulo é 90 ou 270, a largura e a altura devem ser invertidas.
				if (larguraOriginal != alturaOriginal && angulo != 0 && angulo != 180.0){
					int temp = larguraOriginal;
					larguraOriginal = alturaOriginal;
					alturaOriginal = temp;
					
				}
				
				BufferedImage fotoCortada = ImagemUtil.cortar(foto, x, y, largura, altura, larguraOriginal, alturaOriginal, escala);
			
				// Convertendo a imagem cortada em ByteArrayOutputStream:				
				usuario.setFoto(ImagemUtil.converterBufferedImageParaByteArray(fotoCortada, extensao));
				
				usuarioService.editarSemValidar(usuario);

			} catch (Exception e) {
				mensagem = "Ocorreu uma falha: " + e.getMessage();
			}
			
		} else {
			mensagem = "Uma foto deve ser selecionada.";
		}

		if (!mensagem.equals("")) {
			modelAndView.addObject("mensagem", mensagem);
		}

		return modelAndView;
	}
	
	@RequestMapping("/usar_foto_facebook")
	public ModelAndView excluirFoto(HttpSession sessao){
		Usuario usuario = (Usuario) sessao.getAttribute("usuarioLogado");
		ModelAndView modelAndView = sessaoBatePapoService.getModelAndViewPerfil(usuario);
		
		usuario.setFoto(null);
		usuarioService.editarSemValidar(usuario);
		
		return modelAndView;
	}

	@RequestMapping("/alteracao_cadastro")
	public ModelAndView exibirCadastroAlteracao(HttpSession sessao) {
		ModelAndView modelAndView;

		Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuarioLogado");
		modelAndView = new ModelAndView("alterar_cadastro");
		modelAndView.addObject("usuarioCadastro", usuarioLogado);

		return modelAndView;
	}
	
	@RequestMapping(value = "/alterar_cadastro", method = RequestMethod.POST)
	public ModelAndView alterarCadastro(@ModelAttribute Usuario usuario, HttpSession sessao) {

		ModelAndView modelAndView;
		String mensagem = "";
		
		Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuarioLogado");
		Usuario usuarioAtualizado = new Usuario();
		usuarioAtualizado.clone(usuarioLogado);
		
		usuarioAtualizado.setNomeCompleto(usuario.getNomeCompleto());
		usuarioAtualizado.setNomeCurto(usuario.getNomeCurto());
		usuarioAtualizado.setEmail(usuario.getEmail());

		try {
			usuarioService.editar(usuarioAtualizado);

		} catch (UsuarioException e) {
			mensagem = e.getMessage();
			e.printStackTrace();
		}

		if (!mensagem.equals("")) {
			modelAndView = new ModelAndView("alterar_cadastro");
			modelAndView.addObject("mensagem", mensagem);
			modelAndView.addObject("usuarioCadastro", usuario);

		} else {
			usuarioAtualizado = usuarioService.get(usuarioAtualizado.getId());
			modelAndView = sessaoBatePapoService.getModelAndViewPerfil(usuarioAtualizado);
			sessao.setAttribute("usuarioLogado", usuarioAtualizado);

		}

		return modelAndView;
	}
	
	@RequestMapping("/alteracao_senha")
	public ModelAndView exibirCadastroAlteracaoSenha(HttpSession sessao) {
		ModelAndView modelAndView;

		modelAndView = new ModelAndView("alterar_senha");
		modelAndView.addObject("usuarioCadastro", new UsuarioVO());

		return modelAndView;
	}
	
	@RequestMapping(value = {"/alterar_senha", "/cadastrar_senha", "/cadastrar_email_senha"}, method = RequestMethod.POST)
	public ModelAndView alterarSenha(@ModelAttribute UsuarioVO usuario, HttpSession sessao, HttpServletRequest requisicao) {

		ModelAndView modelAndView;
		String mensagem = "";
		
		Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuarioLogado");
		
		usuario.setId(usuarioLogado.getId());

		try {
			
			if (requisicao.getRequestURI().endsWith("alterar_senha")){
				usuarioService.editarSenha(usuario, usuarioLogado.getSenha());
				
			} else if (requisicao.getRequestURI().endsWith("cadastrar_senha")){
				usuarioService.adicionarSenha(usuario);	
				
			} else if (requisicao.getRequestURI().endsWith("cadastrar_email_senha")){
				usuarioService.adicionarEmailESenha(usuario);
				
			}
			
		} catch (UsuarioException e) {
			mensagem = e.getMessage();
		}

		if (!mensagem.equals("")) {
			modelAndView = new ModelAndView("alterar_senha");
			modelAndView.addObject("mensagem", mensagem);
			modelAndView.addObject("usuarioCadastro", usuario);

		} else {
			
			Usuario usuarioAtualizado = usuarioService.get(usuarioLogado.getId());
			modelAndView = sessaoBatePapoService.getModelAndViewPerfil(usuarioAtualizado);
			sessao.setAttribute("usuarioLogado", usuarioAtualizado);

		}

		return modelAndView;
	}
	
	@RequestMapping("perfil")
	public ModelAndView exibirPerfil(HttpSession sessao) {
		Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuarioLogado");
		
		return sessaoBatePapoService.getModelAndViewPerfil(usuarioLogado);
	}
	
	@RequestMapping("sessoes_agendadas")
	public ModelAndView exibirSessoesAgendadas(HttpSession sessao) {
		return exibirSessoes(sessao, NUMERO_ABA_MINHAS_SESSOES_AGENDADAS);
	}
	
	@RequestMapping("sessoes_arquivadas")
	public ModelAndView exibirSessoesArquivadas(HttpSession sessao) {
		return exibirSessoes(sessao, NUMERO_ABA_MINHAS_SESSOES_ARQUIVADAS);
	}
	
	@RequestMapping("sessoes_que_participei")
	public ModelAndView exibirSessoesQueParticipou(HttpSession sessao) {
		return exibirSessoes(sessao, NUMERO_ABA_SESSOES_QUE_JA_PARTICIPEI);
	}
	
	@RequestMapping("sessoes_que_participarei")
	public ModelAndView exibirSessoesQueParticipara(HttpSession sessao) {
		return exibirSessoes(sessao, NUMERO_ABA_SESSOES_QUE_VOU_PARTICIPAR);
	}
	
	public ModelAndView exibirSessoes(HttpSession sessao, int numeroAba) {
		Usuario usuarioLogado = (Usuario) sessao.getAttribute("usuarioLogado");

		ModelAndView modelAndView = sessaoBatePapoService.getModelAndViewPerfil(usuarioLogado);
		modelAndView.addObject("abaSelecionada", numeroAba);

		return modelAndView;
	}

}

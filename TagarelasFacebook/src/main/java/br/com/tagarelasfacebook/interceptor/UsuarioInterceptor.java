package br.com.tagarelasfacebook.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UsuarioInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String uri = request.getRequestURI();
		
		// Usuário logado:
		if (request.getSession().getAttribute("usuarioLogado") != null){
			
			if (uri.endsWith("/cadastro") || uri.endsWith("cadastrar") || uri.endsWith("login") || uri.endsWith("logar") || uri.endsWith("logarnofacebook")){
				response.sendRedirect("perfil");
				return false;
			}
			
			return true;
		
		}
		
		// Usuário não logado:
		if (uri.endsWith("perfil") || uri.endsWith("alteracao_cadastro") || uri.endsWith("alterar_cadastro") || uri.endsWith("alterar_foto")
				|| uri.endsWith("alterar_senha") || uri.endsWith("cadastrar_senha") || uri.endsWith("cadastrar_email_senha") || uri.contains("sessoes_agendadas") 
				|| uri.contains("sessoes_arquivadas") || uri.contains("sessoes_que_participei") || uri.contains("sessoes_que_participarei")){
			
			response.sendRedirect("index");
			return false;
		}
		
		return true;
	}

}
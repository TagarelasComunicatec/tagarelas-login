package br.com.tagarelasfacebook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.tagarelasfacebook.dao.UsuarioDao;
import br.com.tagarelasfacebook.exception.UsuarioException;
import br.com.tagarelasfacebook.model.Usuario;
import br.com.tagarelasfacebook.util.StringUtil;
import br.com.tagarelasfacebook.vo.UsuarioVO;

@Service
public class UsuarioService {

	@Autowired
	private UsuarioDao usuarioDao;

	@Transactional
	public Usuario adicionarUsuarioConvencional(UsuarioVO usuario) throws UsuarioException {
		validarCadastroConvencional(usuario);
		Usuario novoUsuario = new Usuario();
		novoUsuario.setEmail(usuario.getEmail());
		novoUsuario.setNomeCompleto(usuario.getNomeCompleto());
		novoUsuario.setNomeCurto(usuario.getNomeCurto());
		novoUsuario.setSenha(usuario.getSenha());

		usuarioDao.adicionar(novoUsuario);

		return novoUsuario;

	}

	@Transactional
	public void adicionarUsuarioFacebook(Usuario usuario) throws UsuarioException {
		validarCadastroFacebook(usuario);
		usuarioDao.adicionar(usuario);

	}

	@Transactional
	public void adicionar(Usuario usuario) throws UsuarioException {
		usuarioDao.adicionar(usuario);

	}

	@Transactional
	public void editar(Usuario usuario) throws UsuarioException {
		validarAlteracaoCadastro(usuario);
		usuarioDao.editar(usuario);

	}

	@Transactional
	public void editarSemValidar(Usuario usuario) {
		usuarioDao.editar(usuario);
	}

	@Transactional
	public void editarSenha(UsuarioVO usuario, String senhaAtual) throws UsuarioException {
		validarAlteracaoSenha(usuario, senhaAtual);

		Usuario usuarioAtualizado = get(usuario.getId());
		usuarioAtualizado.setSenha(usuario.getNovaSenha());

		usuarioDao.editar(usuarioAtualizado);
	}

	@Transactional
	public void adicionarSenha(UsuarioVO usuario) throws UsuarioException {
		validarCadastroSenha(usuario);

		Usuario usuarioAtualizado = get(usuario.getId());
		usuarioAtualizado.setSenha(usuario.getNovaSenha());

		usuarioDao.editar(usuarioAtualizado);
	}

	@Transactional
	public void adicionarEmailESenha(UsuarioVO usuario) throws UsuarioException {
		validarCadastroEmailESenha(usuario);

		Usuario usuarioAtualizado = get(usuario.getId());
		usuarioAtualizado.setEmail(usuario.getEmail());
		usuarioAtualizado.setSenha(usuario.getNovaSenha());

		usuarioDao.editar(usuarioAtualizado);
	}

	@Transactional
	public void deletar(Integer id) {
		usuarioDao.deletar(id);

	}

	@Transactional
	public Usuario get(Integer id) {
		return usuarioDao.get(id);
	}

	@Transactional
	public List<?> getListaUsuarios() {
		return usuarioDao.getLista();
	}

	@Transactional
	public Usuario login(Usuario usuario) throws UsuarioException {
		validarLogin(usuario);
		Usuario usuarioEncontrado = usuarioDao.getUsuario(usuario.getEmail(), usuario.getSenha());

		if (usuarioEncontrado == null) {
			throw new UsuarioException("E-mail e/ou senha incorretos.");
		}

		return usuarioEncontrado;
	}

	@Transactional
	public Usuario loginFacebook(String facebookId) {
		return usuarioDao.getUsuario(facebookId);
	}
	
	@Transactional
	public void evitar(Usuario usuario){
		usuarioDao.evitar(usuario);
	}

	private void validarCadastroConvencional(UsuarioVO usuario) throws UsuarioException {
		if (StringUtil.stringVazia(usuario.getNomeCompleto())) {
			throw new UsuarioException("O nome completo deve ser informado.");

		} else if (StringUtil.stringVazia(usuario.getNomeCurto())) {
			throw new UsuarioException("O nome curto deve ser informado.");

		} else if (StringUtil.stringVazia(usuario.getEmail())) {
			throw new UsuarioException("O e-mail deve ser informado.");

		} else if (usuarioDao.emailCadastrado(usuario.getEmail())) {
			throw new UsuarioException("O e-mail informado já está cadastrado.");

		} else if (StringUtil.stringVazia(usuario.getSenha())) {
			throw new UsuarioException("A senha deve ser informada.");

		} else if (StringUtil.stringVazia(usuario.getConfirmacaoSenha())) {
			throw new UsuarioException("A senha deve ser confirmada.");

		} else if (!usuario.getSenha().equals(usuario.getConfirmacaoSenha())) {
			throw new UsuarioException("A senha não foi confirmada corretamente.");
		}

	}

	private void validarCadastroFacebook(Usuario usuario) throws UsuarioException {
		validarNomes(usuario);
		
		if (StringUtil.stringVazia(usuario.getFacebookId())) {
			throw new UsuarioException("Não foi possível recuperar o Facebook ID.");

		}
		
		if (!StringUtil.stringVazia(usuario.getEmail()) && usuarioDao.emailCadastrado(usuario.getEmail())) {
			throw new UsuarioException("O e-mail informado já está cadastrado.");

		}

	}

	private void validarLogin(Usuario usuario) throws UsuarioException {
		if (StringUtil.stringVazia(usuario.getEmail())) {
			throw new UsuarioException("O e-mail deve ser informado.");

		} else if (StringUtil.stringVazia(usuario.getSenha())) {
			throw new UsuarioException("A senha deve ser informada.");

		}
	}

	private void validarAlteracaoCadastro(Usuario usuario) throws UsuarioException {
		validarNomes(usuario);

		if (!StringUtil.stringVazia(usuario.getFacebookId()) && StringUtil.stringVazia(usuario.getEmail())){
			usuario.setEmail(null);
		}
		
		// O e-mail não é obrigatório para usuário que não tem senha (usuário que acessa APENAS com a conta do Facebook)
		if (!StringUtil.stringVazia(usuario.getSenha()) && StringUtil.stringVazia(usuario.getEmail())) {
			throw new UsuarioException("O e-mail deve ser informado.");
		}
	}

	private void validarNomes(Usuario usuario) throws UsuarioException {
		if (StringUtil.stringVazia(usuario.getNomeCompleto())) {
			throw new UsuarioException("O nome completo deve ser informado.");

		} else if (StringUtil.stringVazia(usuario.getNomeCurto())) {
			throw new UsuarioException("O nome curto deve ser informado.");
		}
	}

	private void validarAlteracaoSenha(UsuarioVO usuario, String senhaAtual) throws UsuarioException {

		if (StringUtil.stringVazia(usuario.getSenha())) {
			throw new UsuarioException("A senha atual deve ser informada.");
		}

		if (!StringUtil.criptografarSenha(usuario.getSenha()).equals(senhaAtual)) {
			throw new UsuarioException("A senha atual está incorreta.");
		}

		if (usuario.getSenha().equals(usuario.getNovaSenha())) {
			throw new UsuarioException("A nova senha é igual à atual.");
		}

		validarCadastroSenha(usuario);

	}

	private void validarCadastroEmailESenha(UsuarioVO usuario) throws UsuarioException {

		if (StringUtil.stringVazia(usuario.getEmail())) {
			throw new UsuarioException("O e-mail deve ser informado.");
		}

		validarCadastroSenha(usuario);
	}

	private void validarCadastroSenha(UsuarioVO usuario) throws UsuarioException {

		if (StringUtil.stringVazia(usuario.getNovaSenha())) {
			throw new UsuarioException("A nova senha deve ser informada.");
		}

		if (StringUtil.stringVazia(usuario.getConfirmacaoNovaSenha())) {
			throw new UsuarioException("A nova senha deve ser confirmada.");
		}

		if (!usuario.getNovaSenha().equals(usuario.getConfirmacaoNovaSenha())) {
			throw new UsuarioException("A nova senha não foi confirmada corretamente.");
		}
	}

}
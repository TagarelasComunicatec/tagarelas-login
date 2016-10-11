package br.com.tagarelasfacebook.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import br.com.tagarelasfacebook.dao.SessaoBatePapoDao;
import br.com.tagarelasfacebook.dao.UsuarioDao;
import br.com.tagarelasfacebook.exception.SessaoBatePapoException;
import br.com.tagarelasfacebook.model.SessaoBatePapo;
import br.com.tagarelasfacebook.model.Usuario;

@Service
public class SessaoBatePapoService {

	@Autowired
	SessaoBatePapoDao sessaoBatePapoDao;
	
	@Autowired
	UsuarioDao usuarioDao;
	
	private final String PARTICIPACAO_CONFIRMADA_PREVIAMENTE = "Sua participação já estava confirmada nesta seção.";
	private final String SESSAO_REALIZADA = "Não é possível confirmar a participação numa sessão que já foi realizada.";
	
	@Transactional
	public List<?> getListaSessoesBatePapo() {
		return sessaoBatePapoDao.getLista();
	}
	
	@Transactional
	public List<SessaoBatePapo> getListaSessoesBatePapoNaoRealizadas() {
		
		@SuppressWarnings("unchecked")
		List<SessaoBatePapo> sessoesBatePapo = (List<SessaoBatePapo>) sessaoBatePapoDao.getSessoesNaoRealizadas();
		
		Map<Integer, SessaoBatePapo> map = new HashMap<>();
		
		for (SessaoBatePapo sessaoBatePapo : sessoesBatePapo) {
			map.put(sessaoBatePapo.getId(), sessaoBatePapo);
		}
		
		List<SessaoBatePapo> sessoesBatePapoSemRepeticoes = new ArrayList<SessaoBatePapo>(map.values());
		
		Collections.sort(sessoesBatePapoSemRepeticoes);
		
		return sessoesBatePapoSemRepeticoes;
	}
	
	@Transactional
	public List<SessaoBatePapo> getListaSessoesBatePapoRealizadas(){
		
		@SuppressWarnings("unchecked")
		List<SessaoBatePapo> sessoesBatePapo = (List<SessaoBatePapo>) sessaoBatePapoDao.getSessoesRealizadas();
		
		Map<Integer, SessaoBatePapo> map = new HashMap<>();
		
		for (SessaoBatePapo sessaoBatePapo : sessoesBatePapo) {
			map.put(sessaoBatePapo.getId(), sessaoBatePapo);
		}
		
		List<SessaoBatePapo> sessoesBatePapoSemRepeticoes = new ArrayList<SessaoBatePapo>(map.values());
		
		Collections.sort(sessoesBatePapoSemRepeticoes);
		
		return sessoesBatePapoSemRepeticoes;
	}
	
	public List<SessaoBatePapo> getSessoesBatePapoArquivadas(Usuario usuario){
		
		List<SessaoBatePapo> sessoesBatePapo = new ArrayList<SessaoBatePapo>();
		
		for (SessaoBatePapo sessaoBatePapo : usuario.getSessoesBatePapoCriadas()) {
			
			if (sessaoBatePapo.getRealizada() != null && sessaoBatePapo.getRealizada()){
				sessoesBatePapo.add(sessaoBatePapo);
			}
			
		}
		
		Collections.sort(sessoesBatePapo);
		
		return sessoesBatePapo;
		
	}
	
	public List<SessaoBatePapo> getSessoesBatePapoQueParticipou(Usuario usuario) {

		List<SessaoBatePapo> sessoesBatePapo = new ArrayList<SessaoBatePapo>();

		for (SessaoBatePapo sessaoBatePapo : usuario.getSessoesBatePapoParticipacaoConfirmada()) {

			if (sessaoBatePapo.getRealizada() != null && sessaoBatePapo.getRealizada()) {
				sessoesBatePapo.add(sessaoBatePapo);
			}

		}
		
		Collections.sort(sessoesBatePapo);

		return sessoesBatePapo;

	}
	
	public List<SessaoBatePapo> getSessoesBatePapoQueParticipara(Usuario usuario) {

		List<SessaoBatePapo> sessoesBatePapo = new ArrayList<SessaoBatePapo>();

		for (SessaoBatePapo sessaoBatePapo : usuario.getSessoesBatePapoParticipacaoConfirmada()) {

			if (sessaoBatePapo.getRealizada() == null) {
				sessoesBatePapo.add(sessaoBatePapo);
			}

		}
		
		Collections.sort(sessoesBatePapo);

		return sessoesBatePapo;

	}
	
	public ModelAndView getModelAndViewPerfil(Usuario usuario){
		ModelAndView modelAndView = new ModelAndView("perfil");
		
		if (usuario.getSessoesBatePapoCriadas() != null){
			
			List<SessaoBatePapo> sessoesBatePapoAgendadas = new ArrayList<SessaoBatePapo>(usuario.getSessoesBatePapoCriadas());
			Collections.sort(sessoesBatePapoAgendadas);
			modelAndView.addObject("sessoesBatePapoAgendadas", sessoesBatePapoAgendadas);
			
			modelAndView.addObject("sessoesBatePapoArquivadas", getSessoesBatePapoArquivadas(usuario));
			modelAndView.addObject("sessoesBatePapoQueParticipou", getSessoesBatePapoQueParticipou(usuario));
			modelAndView.addObject("sessoesBatePapoQueParticipara", getSessoesBatePapoQueParticipara(usuario));
		}
		
		return modelAndView;
	}
	
	@Transactional
	public SessaoBatePapo getSessaoBatePapo(Integer id) {
		return sessaoBatePapoDao.get(id);
	}
	
	@Transactional
	public void adicionarParticipante(SessaoBatePapo sessaoBatePapo, Usuario novoParticipante) throws SessaoBatePapoException{
		
		if (sessaoBatePapo.getRealizada() != null && sessaoBatePapo.getRealizada()){
			throw new SessaoBatePapoException(SESSAO_REALIZADA);
		}
		
		for (Usuario participante : sessaoBatePapo.getParticipantes()) {
			
			if (novoParticipante.getId().equals(participante.getId())){
				throw new SessaoBatePapoException(PARTICIPACAO_CONFIRMADA_PREVIAMENTE);
			}
			
		}
		
		sessaoBatePapo.adicionarParticipante(novoParticipante);		
		sessaoBatePapoDao.editar(sessaoBatePapo);
	}

	
}

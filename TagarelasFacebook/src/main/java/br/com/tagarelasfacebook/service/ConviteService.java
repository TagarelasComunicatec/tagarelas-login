package br.com.tagarelasfacebook.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.tagarelasfacebook.dao.ConviteDao;
import br.com.tagarelasfacebook.exception.ConviteException;
import br.com.tagarelasfacebook.model.Convite;
import br.com.tagarelasfacebook.model.Usuario;

@Service
public class ConviteService {
	
	@Autowired
	private ConviteDao conviteDao;
	
	private final String CONVITE_SESSAO_REALIZADA = "Não é possível convidar amigos para uma sessão que já foi realizada.";
	
	@Transactional
	public void adicionar(Convite convite) throws ConviteException{
		
		if (convite.getSessaoBatePapo().getRealizada() != null && convite.getSessaoBatePapo().getRealizada()){
			throw new ConviteException(CONVITE_SESSAO_REALIZADA);
		}
		
		convite.setDiaHorario(new Date());
		conviteDao.adicionar(convite);
	}
	
	@Transactional
	public Convite get(Integer id) {
		return conviteDao.get(id);
	}
	
	public String getMensagemConvite(Convite convite){
		Usuario remetente = convite.getRemetente();
		return remetente.getNomeCurto().trim().toUpperCase() + " convidou você para participar desta sessão.";
		
	}

}

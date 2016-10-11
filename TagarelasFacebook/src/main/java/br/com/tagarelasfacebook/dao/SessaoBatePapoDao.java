package br.com.tagarelasfacebook.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import br.com.tagarelasfacebook.model.SessaoBatePapo;

@Repository
public class SessaoBatePapoDao extends AbstractDao<SessaoBatePapo> {

	@Override
	public SessaoBatePapo get(Integer id) {
		return (SessaoBatePapo) sessionFactory.getCurrentSession().get(SessaoBatePapo.class, id);
	}

	@Override
	public List<?> getLista() {
		return sessionFactory.getCurrentSession().createQuery("from SessaoBatePapo").list();
	}
	
	public List<?> getSessoesNaoRealizadas() {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(SessaoBatePapo.class);
		criteria.add(Restrictions.ge("diaHorario", new Date()));
		criteria.add(Restrictions.isNull("realizada"));

		return criteria.list();
	}
	
	public List<?> getSessoesRealizadas(){
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(SessaoBatePapo.class);
		criteria.add(Restrictions.eq("realizada", Boolean.TRUE));
		
		return criteria.list();
	}
	
}

package br.com.tagarelasfacebook.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import br.com.tagarelasfacebook.model.SistemaBatePapo;

@Repository
public class SistemaBatePapoDao extends AbstractDao<SistemaBatePapo> {

	@Override
	public SistemaBatePapo get(Integer id) {
		return (SistemaBatePapo) sessionFactory.getCurrentSession().get(SistemaBatePapo.class, id);
	}

	@Override
	public List<?> getLista() {
		return sessionFactory.getCurrentSession().createQuery("from SistemaBatePapo").list();
	}

}

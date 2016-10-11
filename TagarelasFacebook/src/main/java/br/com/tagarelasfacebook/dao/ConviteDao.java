package br.com.tagarelasfacebook.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import br.com.tagarelasfacebook.model.Convite;

@Repository
public class ConviteDao extends AbstractDao<Convite> {

	@Override
	public Convite get(Integer id) {
		return (Convite) sessionFactory.getCurrentSession().get(Convite.class, id);
	}

	@Override
	public List<?> getLista() {
		return sessionFactory.getCurrentSession().createQuery("from Convite").list();
	}

}
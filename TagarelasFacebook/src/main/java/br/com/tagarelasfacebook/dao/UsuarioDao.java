package br.com.tagarelasfacebook.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import br.com.tagarelasfacebook.model.Usuario;

@Repository
public class UsuarioDao extends AbstractDao<Usuario> {

	@Override
	public Usuario get(Integer id) {
		return (Usuario) sessionFactory.getCurrentSession().get(Usuario.class, id);
	}

	@Override
	public List<?> getLista() {
		return sessionFactory.getCurrentSession().createQuery("from Usuario").list();
	}

	// Função usada para login com e-mail e senha.
	public Usuario getUsuario(String email, String senha) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Usuario.class);
		criteria.add(Restrictions.eq("email", email));
		criteria.add(Restrictions.eq("senha", senha));

		if (criteria.list() != null && !criteria.list().isEmpty())
			return (Usuario) criteria.list().get(0);

		return null;
	}

	// Função usada para login com Facebook.
	public Usuario getUsuario(String facebookId) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Usuario.class);
		criteria.add(Restrictions.eq("facebookId", facebookId));

		if (criteria.list() != null && !criteria.list().isEmpty())
			return (Usuario) criteria.list().get(0);

		return null;
	}

	// Função usada no cadastro de usuário.
	public boolean emailCadastrado(String email) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Usuario.class);
		criteria.add(Restrictions.eq("email", email));

		if (criteria.list() != null && !criteria.list().isEmpty())
			return true;

		return false;
	}

}
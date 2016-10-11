package br.com.tagarelasfacebook.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public abstract class AbstractDao<T> {
	
	@Autowired
	protected SessionFactory sessionFactory;

	public void adicionar(T object) {
		sessionFactory.getCurrentSession().save(object);

	}

	public void editar(T object) {
		sessionFactory.getCurrentSession().update(object);

	}

	public void deletar(Integer id) {
		sessionFactory.getCurrentSession().delete(get(id));

	}
	
	public void atualizar(T object){
		sessionFactory.getCurrentSession().refresh(object);
	}
	
	public void evitar(T object){
		sessionFactory.getCurrentSession().evict(object);
	}

	abstract public T get(Integer id);

	abstract public List<?> getLista();

}

package ldu.user.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import hibernate.HibernateSessionFactory;
import ldu.user.vo.User;

public class UserDao {
	private Session session;
	private Transaction tran;
	private SessionFactory sf;
	private Query query;
	HibernateSessionFactory getSession;
	public UserDao(){
	}
	public List<User> findByUsername(String UserName){
		sf = new Configuration().configure().buildSessionFactory();
		session = sf.openSession();
		tran = session.beginTransaction();
		String hqlsql = "from User where username=?";
		Query query = session.createQuery(hqlsql);
		query.setParameter(0, UserName);
		List<User> users= (List<User>)query.list();
		tran.commit();
		session.close();
		sf.close();
		return users;
		
//		getSession = new HibernateSessionFactory();
//		session = getSession.getSession();
//		try{
//			String hqlsql = "from User where username=?";
//			query = session.createQuery(hqlsql);
//			query.setParameter(0, UserName);
//			List<User> users= (List<User>)query.list();
//			transaction = session.beginTransaction();
//			transaction.commit();
//			return users;
//		}catch(Exception e){
//			e.printStackTrace();
//			return null;
//		}
	}

	public List<User> findByUsernameAndLevel(String UserName,int Level){
		session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql = "from User where username=? and level=?";
		Query q = session.createQuery(sql);
		q.setParameter(0, UserName);
		q.setParameter(1, Level);
		List<User> users= (List<User>)q.list();
		session.getTransaction().commit();
		session.close();
		return users;
		
//		sf = new Configuration().configure().buildSessionFactory();
//		session = sf.openSession();
//		tran = session.beginTransaction();
//		String hqlsql = "from User where username=? and level=?";
//		Query query = session.createQuery(hqlsql);
//		query.setParameter(0, UserName);
//		query.setParameter(1, Level);
//		List<User> users= (List<User>)query.list();
//		tran.commit();
//		session.close();
//		sf.close();
//		return users;
	}
	
	public void insertUser(User user){
		session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		tran = session.beginTransaction();
		session.save(user);
		tran.commit();
		session.close();
	}

	public User findById(int Id) {
		sf = new Configuration().configure().buildSessionFactory();
		session = sf.openSession();
		tran = session.beginTransaction();
		User user = (User)session.get(User.class, Id);
		tran.commit();
		session.close();
		sf.close();
		return user;
	}
	
	public void updateInfo(User user) {
		session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		session.update(user);
		session.getTransaction().commit();
		session.close();
	}
	
	/////////////////////////////
	
	
	public int findAllUsers(){
		sf = new Configuration().configure().buildSessionFactory();
		session = sf.openSession();
		String hql = "select count(*) from User ";  
		Query query = session.createQuery(hql);  			         
		return ((Number)query.uniqueResult()).intValue();   
	}
	
	public List<User> findUser(){
		
		Session session = HibernateSessionFactory.getSession();
		String hql="from User as u";
		query=session.createQuery(hql);
		List<User> users=query.list();		
		return users;
	}
}

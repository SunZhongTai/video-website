package ldu.comments.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import hibernate.HibernateSessionFactory;
import ldu.comments.vo.Comments;

public class CommentsDao {
	private Session session;
	private Transaction tran;
	private SessionFactory sf;
	private Query query;
	HibernateSessionFactory getSession;
	public CommentsDao() {
	}
	public void insertComment(Comments comment) {
		session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		tran = session.beginTransaction();
		session.save(comment);
		tran.commit();
		session.close();
	}
	public List<Comments> findAllByVid(int Vid) {
		session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql = "from Comments where videoid=?";
		Query q = session.createQuery(sql);
		q.setInteger(0, Vid);
		List<Comments> comments= (List<Comments>)q.list();
		session.getTransaction().commit();
		session.close();
		return comments;
	}
	
	////////////////
	
	public List<Comments> findAllComments(){		
		System.out.println("½øÈëCommentsDAoº¯Êý");	
		Session session = HibernateSessionFactory.getSession();
		String hql="from Comments as c";
		query=session.createQuery(hql);
		List<Comments> comm=query.list();	
		return comm;			
	}
	
	public void commentsDelete(String commid){
		
		System.out.println("///*******"+commid);
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		query = session.createQuery("delete Comments as c  where c.id = "+commid+"");
		query.executeUpdate();
		session.getTransaction().commit();
	}
	
	public int findCommentsCount(){
		sf = new Configuration().configure().buildSessionFactory();
		session = sf.openSession();
		String hql = "select count(*) from Comments ";  
		Query query = session.createQuery(hql);  			         
		return ((Number)query.uniqueResult()).intValue();  
	}
}

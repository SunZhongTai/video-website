package ldu.collection.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import hibernate.HibernateSessionFactory;
import ldu.collection.vo.Collection;

public class CollectionDao {
	public Collection findCollectionByVideoidAndUserid(int videoId,int userId){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql = "from Collection where videoid=? and userid=?";
		Query query = session.createQuery(sql);
		query.setInteger(0, videoId);
		query.setInteger(1, userId);
		List<Collection> list = (List<Collection>)query.list();
		session.getTransaction().commit();
		session.close();
		if(list.size() != 0)
			return list.get(0);
		else 
			return null;
	}
	public void insertCollection(Collection collection) {
		Session session = HibernateSessionFactory.getSession();
		Transaction t = session.beginTransaction();
		session.save(collection);
		t.commit();//提交到数据库
		session.close();
	}
	public void deleteCollection(Collection collection) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		session.delete(collection);
		session.getTransaction().commit();
	}
	public List<Collection> findCollectionsByUserid(int userId) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql = "from Collection where userid=?";
		Query query = session.createQuery(sql);
		query.setInteger(0, userId);
		List<Collection> list = (List<Collection>)query.list();
		session.getTransaction().commit();
		session.close();
		return list;
	}
}

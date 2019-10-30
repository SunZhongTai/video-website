package ldu.video.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.SessionFactory;

import hibernate.HibernateSessionFactory;
import ldu.video.vo.Video;

public class VideoDao {
	
	private Session session;
	private Transaction tran;
	private SessionFactory sf;
	private Query query;
	HibernateSessionFactory getSession;
	public VideoDao(){
		
	}
	
	public List<Video> findAll(){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql = "from Video where status=1";
		Query query = session.createQuery(sql);
		List<Video> list = (List<Video>)query.list();
		session.getTransaction().commit();
		session.close();
		return list;
	}
	public List<Video> findAllByClassify(String Classify) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql = "from Video where classify=? and status=1";
		Query query = session.createQuery(sql);
		query.setParameter(0, Classify);
		List<Video> list = (List<Video>)query.list();
		session.getTransaction().commit();
		session.close();
		return list;
	}
	public void insertVideo(Video video){
		Session session = HibernateSessionFactory.getSession();
		Transaction t = session.beginTransaction();
		session.save(video);
		t.commit();//提交到数据库
		session.close();
	}
	public List<Video> findAllZeroByUserid(int userId) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql = "from Video where userid=? and status=0";
		Query query = session.createQuery(sql);
		query.setInteger(0, userId);
		List<Video> list = (List<Video>)query.list();
		session.getTransaction().commit();
		session.close();
		return list;
	}
	public List<Video> findAllOneByUserid(int userId) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql = "from Video where userid=? and status=1";
		Query query = session.createQuery(sql);
		query.setInteger(0, userId);
		List<Video> list = (List<Video>)query.list();
		session.getTransaction().commit();
		session.close();
		return list;
	}
	public List<Video> findAllTwoByUserid(int userId) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql = "from Video where userid=? and status=2";
		Query query = session.createQuery(sql);
		query.setInteger(0, userId);
		List<Video> list = (List<Video>)query.list();
		session.getTransaction().commit();
		session.close();
		return list;
	}
	public void deleteVideoById(int Id) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql = "delete Video where id=?";
		Query query = session.createQuery(sql);
		query.setInteger(0, Id);
		query.executeUpdate();
		session.getTransaction().commit();
		session.close();
	}
	public Video findVideoById(int Id) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql = "from Video where id=?";
		Query query = session.createQuery(sql);
		query.setInteger(0, Id);
		List<Video> list = (List<Video>)query.list();
		session.getTransaction().commit();
		session.close();
		return list.get(0);
	}
	public void updateVide(Video video) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		session.update(video);
		session.getTransaction().commit();
	}
	public List<Video> findVideoByInfo(String info) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql = "from Video where title like '%"+info+"%' or username like '%"+info+"%' or introduce like '%"+info+"%'";
		Query query = session.createQuery(sql);
		List<Video> list = (List<Video>)query.list();
		session.getTransaction().commit();
		session.close();
		return list;
	}
	public void addCollectionById(int Vid){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql = "update Video set collection=collection+1 where id=?";
		Query query = session.createQuery(sql);
		query.setInteger(0, Vid);
		query.executeUpdate();
		session.getTransaction().commit();
		session.close();
	}
	public void subCollectionById(int Vid){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql = "update Video set collection=collection-1 where id=?";
		Query query = session.createQuery(sql);
		query.setInteger(0, Vid);
		query.executeUpdate();
		session.getTransaction().commit();
		session.close();
	}
	
	///////////
	public List<Video> findAllVideo(){		
		System.out.println("进入VideoDAo函数");	
		Session session = HibernateSessionFactory.getSession();
		String hql="from Video as u";
		query=session.createQuery(hql);
		List<Video> videos=query.list();	
		//System.out.println("****************************"+videos.get(0).toString());
		return videos;			
	}
		
	public void updateStatus(int s,String infoid){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		query = session.createQuery("update Video as v set v.status="+s+" where v.id = "+infoid+"");
		query.executeUpdate();
		session.getTransaction().commit();
	}
	
	public void videoDelete(String deleteid){
		System.out.println("///*******"+deleteid);
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		query = session.createQuery("delete Video as v  where v.id = "+deleteid+"");
		query.executeUpdate();
		session.getTransaction().commit();
	}
	
	public int findVideoCount(){
		sf = new Configuration().configure().buildSessionFactory();
		session = sf.openSession();
		String hql = "select count(*) from Video ";  
		Query query = session.createQuery(hql);  			         
		return ((Number)query.uniqueResult()).intValue();  
	}
	
	
	public int playback()
	{
		 Session session =HibernateSessionFactory.getSession();	  
		 Long   totalsal = (Long) session.createQuery("select sum(collection) from Video").uniqueResult();
	     return Integer.parseInt(new java.text.DecimalFormat("0").format(totalsal));
	}
	
	
	public int weishenhei(){
		sf = new Configuration().configure().buildSessionFactory();
		session = sf.openSession();
		String hql = "select count(*) from Video where status='0'";  
		Query query = session.createQuery(hql);  			         
		return ((Number)query.uniqueResult()).intValue();  
	}
	
	public int tongguo(){
		sf = new Configuration().configure().buildSessionFactory();
		session = sf.openSession();
		String hql = "select count(*) from Video where status='1'";  
		Query query = session.createQuery(hql);  			         
		return ((Number)query.uniqueResult()).intValue();  
	}
	
	public int weitongguo(){
		sf = new Configuration().configure().buildSessionFactory();
		session = sf.openSession();
		String hql = "select count(*) from Video where status='2'";  
		Query query = session.createQuery(hql);  			         
		return ((Number)query.uniqueResult()).intValue();  
	}
	
}

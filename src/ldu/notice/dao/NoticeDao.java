package ldu.notice.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import hibernate.HibernateSessionFactory;
import ldu.notice.vo.Notice;

public class NoticeDao {
	
	private Session session;
	private Transaction tran;
	private SessionFactory sf;
	private Query query;
	HibernateSessionFactory getSession;
	public NoticeDao(){
	}
	
	public List<Notice> findAll(){
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql = "from Notice";
		Query query = session.createQuery(sql);
		List<Notice> list = (List<Notice>)query.list();
		session.getTransaction().commit();
		session.close();
		return list;
	}
	
	public Notice findNoticeById(int Id) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql = "from Notice where id=?";
		Query query = session.createQuery(sql);
		query.setInteger(0, Id);
		List<Notice> list = (List<Notice>)query.list();
		session.getTransaction().commit();
		session.close();
		return list.get(0);
	}
	
	
	//////////////////////////////
	
	public void insertNotice(String title,String content,int adminid){
		System.out.println("=-----="+content);
		Date da=new Date();
	    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
	    String  d= df.format(da);// new Date()为获取当前系统时间
	    Date today = null;
		try {
			today = df.parse(d);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	    Configuration cf=new Configuration();
        SessionFactory sf=cf.configure().buildSessionFactory();
        Session s=sf.openSession();
        Transaction t=s.beginTransaction();
        Notice n=new Notice();
        n.setContent(content);
        n.setTitle(title);
        n.setNtime(today);
        n.setAdminid(adminid);
        s.save(n);
        t.commit();
        s.close();
		
	}
}

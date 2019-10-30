package ldu.email.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import hibernate.HibernateSessionFactory;
import ldu.email.vo.Email;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class EmailDao {

	private Session session;
	private Transaction tran;
	private SessionFactory sf;
	private Query query;
	HibernateSessionFactory getSession;
	
	
	
	public void sendMail(String receiveid,String title,String content){
		
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		query = session.createQuery("update Email as e set e.num=e.num+1 where e.id = "+receiveid+"");
		query.executeUpdate();
		session.getTransaction().commit();
		
		
		
		 String smtphost = "smtp.sina.com"; // �����ʼ�������
	        String user = "sunzhongtai122"; // �ʼ���������¼�û���
	        String password = "SZT980122love"; // �ʼ���������¼����
	        
	        String from = "sunzhongtai122@sina.com"; // �������ʼ���ַ
	        
	        String to = "15563831078@sina.cn"; // �������ʼ���ַ *************//����ͬ��������������
	        String subject = title; // �ʼ�����
	        String body =content;  // �ʼ�����
	        try {
	           Properties props = new Properties();
	            props.put("mail.smtp.host", smtphost);
	            props.put("mail.smtp.auth","true");
	            //session ssn = session.getInstance(props, null);
	            javax.mail.Session ssn = javax.mail.Session.getDefaultInstance(props);

	            MimeMessage message = new MimeMessage(ssn);

	            InternetAddress fromAddress = new InternetAddress(from);
	            message.setFrom(fromAddress);
	            InternetAddress toAddress = new InternetAddress(to);
	            message.addRecipient(Message.RecipientType.TO, toAddress);
	            message.setSubject(subject);
	            message.setText(body);

	            Transport transport = ssn.getTransport("smtp");
	            transport.connect(smtphost, user, password);
	            transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
	            //transport.send(message);
	            transport.close();
	            System.out.println("�����ʼ��ɹ�");
	            } catch(Exception m) {
	                  System.out.println(m.toString());
	            m.printStackTrace();
	            }
	}
	
	
	
	public void insertEmail(Email email){
		SessionFactory sf= new Configuration().configure().buildSessionFactory(); 
		Session session = sf.openSession();
		Transaction tran = session.beginTransaction();
		session.save(email);
		tran.commit();
		session.close();
		sf.close();
	}
	
	public void cleanEmailByUid(Email email){
		session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		session.update(email);
		session.getTransaction().commit();
		session.close();
	}
	
	public int selectCountByUid(int uid){
		session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		String sql = "from Email where id=?";
		Query q = session.createQuery(sql);
		q.setInteger(0, uid);
		List<Email> emails= (List<Email>)q.list();
		session.getTransaction().commit();
		session.close();
		return emails.get(0).getNum();
	}
}

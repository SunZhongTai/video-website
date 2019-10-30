package ldu.login;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import ldu.email.dao.EmailDao;
import ldu.email.vo.Email;
import ldu.user.dao.UserDao;
import ldu.user.vo.User;

@SuppressWarnings("serial")
public class RegistAction extends ActionSupport implements ServletRequestAware{
	private User user;
	private HttpServletRequest request;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public HttpServletRequest getRequest() {
		return request;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	public void setServletRequest(HttpServletRequest hsr){
		request = hsr;
	}
	
	public String execute() throws Exception{
		String result = null;
		UserDao userDao = new UserDao();
		EmailDao emailDao = new EmailDao();
		Email email = new Email();
		email.setNum(0);
		emailDao.insertEmail(email);
		user.setResume("这个人很懒，什么都没有写。");
		user.setHeadshow("akari.jpg");
		user.setLevel(0);
		userDao.insertUser(user);
		result = "registSuccess";
		return result;
	}
}

package ldu.email.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import ldu.email.dao.EmailDao;
import ldu.email.vo.Email;

public class EmailAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;

	
	private String title;
	private String content;
	private int uid;
	
	
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String execute() throws Exception{	
		
		Email e=new Email();
		request = ServletActionContext.getRequest(); 
    	String sd[] = request.getParameterValues("check"); 
     	if(sd.length!=0){
    		EmailDao ed=new EmailDao();
		     for(int i=0;i<sd.length;i++){
		    	 ed.sendMail(sd[i],this.getTitle(),this.getContent());		    	 		    
		     }
	    	return "success";
    	}		
		
		return "success";
	}
	
	public void cleanEmail(){
		EmailDao emailDao = new EmailDao();
		Email email = new Email();
		email.setId(uid);
		email.setNum(0);
		emailDao.cleanEmailByUid(email);
		HttpSession session = request.getSession();
		session.setAttribute("emailcount", "0");
	}
	
	@Override
	public void setServletRequest(HttpServletRequest hsr){
		request = hsr;
	}
	
	
}

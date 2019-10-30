package ldu.notice.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import ldu.notice.dao.NoticeDao;
import ldu.notice.vo.Notice;
import ldu.user.vo.User;

public class NoticeAction extends ActionSupport implements ServletRequestAware{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Notice notice;
	int nid;
	private HttpServletRequest request;
	
	public Notice getNotice() {
		return notice;
	}

	public void setNotice(Notice notice) {
		this.notice = notice;
	}

	public int getNid() {
		return nid;
	}

	public void setNid(int nid) {
		this.nid = nid;
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
	
	public String article() {
		String result = null;
		NoticeDao noticedao = new NoticeDao();
		notice = noticedao.findNoticeById(nid);
		HttpSession session = request.getSession();
		session.setAttribute("notice", notice);
		result = "articleSuccess";
		return result;
	}
	
	public String more() {
		String result = null;
		NoticeDao noticedao = new NoticeDao();
		List<Notice> allnotices = new ArrayList<Notice>();
		allnotices = noticedao.findAll();
		HttpSession session = request.getSession();
		session.setAttribute("allnotices", allnotices);
		result = "moreSuccess";
		return result;
	}
	
	
	/////////////////////
	
	
	public String execute() throws Exception{	
		System.out.println("======="+notice.getContent());
		HttpSession session = request.getSession();
		List<User> ul=(List<User>) session.getAttribute("userList");
		NoticeDao nd=new NoticeDao();
		nd.insertNotice(notice.getTitle(),notice.getContent(),ul.get(0).getId());			
		return "success";
	}
}

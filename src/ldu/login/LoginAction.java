package ldu.login;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import ldu.comments.dao.CommentsDao;
import ldu.comments.vo.Comments;
import ldu.email.dao.EmailDao;
import ldu.email.vo.Email;
import ldu.user.dao.UserDao;
import ldu.user.vo.User;
import ldu.video.dao.VideoDao;
import ldu.video.vo.Video;

@SuppressWarnings("serial")
public class LoginAction extends ActionSupport implements ServletRequestAware{
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
		UserDao userdao = new UserDao();
		List<User> userlist = new ArrayList<User>();
		userlist = userdao.findByUsernameAndLevel(user.getUsername(),user.getLevel());
		result = "loginFail";
		if (userlist.size() != 0){
			if (userlist.get(0).getPassword().equals(user.getPassword())){
				if (user.getLevel() == 0){
					EmailDao emailDao = new EmailDao();
					int emailcount = emailDao.selectCountByUid(userlist.get(0).getId());
					HttpSession session = request.getSession();
					session.setAttribute("userInfo", userlist.get(0));
					session.setAttribute("emailcount", emailcount);
					result = "loginUserSuccess";
				}else {
					HttpSession session = request.getSession();
					session.setAttribute("userList", userlist);
					VideoDao vd=new VideoDao();
					List<Video> videos=vd.findAllVideo();
					session.setAttribute("videos", videos);	
					
					CommentsDao cd=new CommentsDao();
					List<Comments> comm=cd.findAllComments();
					session.setAttribute("comm", comm);
					UserDao ud=new UserDao();
					int uc=ud.findAllUsers();
					String usercount=Integer.toString(uc);
					session.setAttribute("usercount", usercount);
					int vc=vd.findVideoCount();
					String videocount=Integer.toString(vc);
					session.setAttribute("videocount", videocount);
					int cc=cd.findCommentsCount();
					String commentscount=Integer.toString(cc);
					session.setAttribute("commentscount", commentscount);
					int pb=vd.playback();
					String playback=Integer.toString(pb);	
					session.setAttribute("playback", playback);
					List<User> users= new ArrayList<User>();
					users=userdao.findUser();
					session.setAttribute("users", users);
					int wsh=vd.weishenhei();
					int st=vd.tongguo();		
					int swt=vd.weitongguo();
					String nwsh=Integer.toString(wsh);	
					String nst=Integer.toString(st);	
					String nswt=Integer.toString(swt);
					session.setAttribute("weishenhei", nwsh);
					session.setAttribute("tongguo", nst);
					session.setAttribute("weitongguo", nswt);
					session.setAttribute("comm", comm);
					result = "loginAdminSuccess";
				}
			}
		}
		return result;
	}
}

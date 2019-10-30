package ldu.comments.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import ldu.comments.dao.CommentsDao;
import ldu.comments.vo.Comments;
import ldu.user.vo.User;
import ldu.video.vo.Video;

public class CommentsAction extends ActionSupport implements ServletRequestAware{
	User user;
	Video video;
	Comments comment;
	private HttpServletRequest request;
	private String commid;

	public String getCommid() {
		return commid;
	}

	public void setCommid(String commid) {
		this.commid = commid;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Video getVideo() {
		return video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

	public Comments getComment() {
		return comment;
	}

	public void setComment(Comments comment) {
		this.comment = comment;
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
	
	public String addComment() {
		String result;
		CommentsDao commentsdao = new CommentsDao();
		user = (User)request.getSession().getAttribute("userInfo");
		video = (Video)request.getSession().getAttribute("video");
		comment.setVideoid(video.getId());
		comment.setCommenterid(user.getId());
		comment.setCommentername(user.getUsername());
		comment.setCommenterurl(user.getHeadshow());
		comment.setTime(new Date());
		commentsdao.insertComment(comment);
		result = "addCommentsSuccess";
		return result;
	}
	
	////////////////////
	
	public String commentsDelete() throws Exception{
		CommentsDao vd=new CommentsDao();
		vd.commentsDelete(commid);
		return "dsuccess";
	}
		
	public String cod() throws Exception{
		HttpSession session = request.getSession();		
		CommentsDao cd=new CommentsDao();
		List<Comments> comm=cd.findAllComments();
		session.setAttribute("comm", comm);				
		return "cod";
	}
	
	public String commentsDeleteChoose() throws Exception{
    	request = ServletActionContext.getRequest(); 
    	String sd[] = request.getParameterValues("check"); 

     	if(sd.length!=0){
    		CommentsDao cd=new CommentsDao();
		     for(int i=0;i<sd.length;i++){
		    	 cd.commentsDelete(sd[i]);    	 		    
		     }
	    	return "dcesuccess";
    	}
     	return "dcesuccess";
	}
	
	public String dce() throws Exception{
		HttpSession session = request.getSession();
		
		CommentsDao cd=new CommentsDao();
		List<Comments> comm=cd.findAllComments();
		session.setAttribute("comm", comm);	
		return "dce";
	}
}

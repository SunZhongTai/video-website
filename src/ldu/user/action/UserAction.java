package ldu.user.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.objectweb.asm.xwork.tree.IntInsnNode;

import com.opensymphony.xwork2.ActionSupport;

import ldu.comments.dao.CommentsDao;
import ldu.comments.vo.Comments;
import ldu.notice.dao.NoticeDao;
import ldu.notice.vo.Notice;
import ldu.user.dao.UserDao;
import ldu.user.vo.User;
import ldu.video.dao.VideoDao;
import ldu.video.vo.Video;

public class UserAction implements ServletRequestAware{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7522941530704743L;
	User user;
	Video video;
	private String classify;
	private String title;
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String savePath;
	private HttpServletRequest request;
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
	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
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
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	
	
	public String index() {
		String result = null;
		VideoDao videoDao = new VideoDao();
		NoticeDao noticedao = new NoticeDao();
		List<Video> videos = new ArrayList<Video>();
		List<Notice> nots = new ArrayList<Notice>();
		List<Notice> notices = new ArrayList<Notice>();
		videos = videoDao.findAll();
		nots = noticedao.findAll();
		if (nots.size() >= 4){
			for (int i = 0 ;i < 4 ;i++){
				notices.add(nots.get(i));
			}
		}else {
			notices = nots;
		}
		HttpSession session = request.getSession();
		session.setAttribute("videos", videos);
		session.setAttribute("notices", notices);
		result = "indexSuccess";
		return result;
	}
	
	public String home() {
		String result = null;
		result = "homeSuccess";
		return result;
	}
	public String setting() {
		String result = null;
		result = "settingSuccess";
		return result;
	}
	public String update() {
		String result = null;
		UserDao userdao = new UserDao();
		User upUser = new User();
		upUser = userdao.findById(user.getId());
		upUser.setName(user.getName());
		upUser.setPhone(user.getPhone());
		upUser.setPlace(user.getPlace());
		upUser.setEmail(user.getEmail());
		upUser.setResume(user.getResume());
		userdao.updateInfo(upUser);
		HttpSession session = request.getSession();
		session.setAttribute("userInfo", upUser);
		result="updateSuccess";
		return result;
	}
	
	public String headshow() {
		String result = null;
		result = "headshowSuccess";
		return result;
	}
	
	public String showUp() throws Exception {
		String result = null;
		UserDao userdao = new UserDao();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
        String facefileFileName=sdf.format(new Date())+".jpg";
		FileOutputStream fos = new FileOutputStream("H:\\MyEclipse 2016 CI\\PIMS_struts2_hibernate\\WebRoot\\face" + "\\" + facefileFileName);
		FileInputStream fis = new FileInputStream(getUpload());
		byte[] buffer = new byte[1024];
		int len = 0;
		while((len = fis.read(buffer)) > 0){
			fos.write(buffer,0,len);
		}
		fis.close();
		fos.close();
		user = (User) request.getSession().getAttribute("userInfo");
		user.setHeadshow(getUploadFileName());
		user.setHeadshow(facefileFileName);
		userdao.updateInfo(user);
		result = "fileupSuccess";
		return result;
	}
	
	public String others() {
		String result = null;
		VideoDao videoDao = new VideoDao();
		List<Video> othervideos = new ArrayList<Video>();
		othervideos = videoDao.findAllByClassify(classify);
		HttpSession session = request.getSession();
		session.setAttribute("othervideos", othervideos);
		result = "othersSuccess";
		return result;
	}
	
	public String adminIndex() {
		String result = null;
		HttpSession session = request.getSession();
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
		result = "adminIndexSuccess";
		return result;
	}
	
	
}

package ldu.video.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.jgroups.demos.wb.UserInfoDialog;

import com.opensymphony.xwork2.ActionSupport;

import ldu.comments.dao.CommentsDao;
import ldu.comments.vo.Comments;
import ldu.user.vo.User;
import ldu.video.dao.VideoDao;
import ldu.video.vo.Video;

public class VideoAction implements ServletRequestAware{
	User user;
	Video video;
	Comments comment;
	private int vid;
	private String checkTnum;
	private File videofile;
	private File coverfile;
	private String uploadContentType;
	private String videofileFileName;
	private String coverfileFileName;
	private String savePath;
	private String searchinfo;
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
	public Comments getComment() {
		return comment;
	}
	public void setComment(Comments comment) {
		this.comment = comment;
	}
	public File getVideofile() {
		return videofile;
	}
	public void setVideofile(File videofile) {
		this.videofile = videofile;
	}
	public File getCoverfile() {
		return coverfile;
	}
	public void setCoverfile(File coverfile) {
		this.coverfile = coverfile;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
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
	public String getVideofileFileName() {
		return videofileFileName;
	}
	public void setVideofileFileName(String videofileFileName) {
		this.videofileFileName = videofileFileName;
	}
	public String getCoverfileFileName() {
		return coverfileFileName;
	}
	public void setCoverfileFileName(String coverfileFileName) {
		this.coverfileFileName = coverfileFileName;
	}
	public int getVid() {
		return vid;
	}
	public void setVid(int vid) {
		this.vid = vid;
	}
	public String getCheckTnum() {
		return checkTnum;
	}
	public void setCheckTnum(String checkTnum) {
		this.checkTnum = checkTnum;
	}
	public String getSearchinfo() {
		return searchinfo;
	}
	public void setSearchinfo(String searchinfo) {
		this.searchinfo = searchinfo;
	}
	
	public String upload(){
		String result = null;
		result = "uploadSuccess";
		return result;
	}
	public String uploadvideo() throws Exception {
		String result = null;
		VideoDao videodao = new VideoDao();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
        String videofileFileName=sdf.format(new Date())+".mp4";
        String videocoverfileFileName=sdf.format(new Date())+".jpg";
		FileOutputStream fos1 = new FileOutputStream("H:\\MyEclipse 2016 CI\\PIMS_struts2_hibernate\\WebRoot\\videos" + "\\" + videofileFileName);
		FileOutputStream fos2 = new FileOutputStream("H:\\MyEclipse 2016 CI\\PIMS_struts2_hibernate\\WebRoot\\videoCover" + "\\" + videocoverfileFileName);
		FileInputStream fis1 = new FileInputStream(getVideofile());
		FileInputStream fis2 = new FileInputStream(getCoverfile());
		byte[] buffer1 = new byte[1024];
		byte[] buffer2 = new byte[1024];
		int len = 0;
		while((len = fis1.read(buffer1)) > 0){
			fos1.write(buffer1,0,len);
		}
		len = 0;
		while((len = fis2.read(buffer2)) > 0){
			fos2.write(buffer2,0,len);
		}
		fis1.close();
		fis2.close();
		fos1.close();
		fos2.close();
		user = (User)request.getSession().getAttribute("userInfo");
		video.setCover(getCoverfileFileName());
		video.setStatus(0);
        video.setUploadtime(new Date());
        video.setUrl(videofileFileName);
        video.setUserid(user.getId());
        video.setUsername(user.getUsername());
        video.setCover(videocoverfileFileName);
        video.setClick(0);
        video.setCollection(0);
        videodao.insertVideo(video);
		result = "uploadvideoSuccess";
		return result;
	}
	
	public String article(){
		String result = null;
		VideoDao videodao = new VideoDao();
		user = (User)request.getSession().getAttribute("userInfo");
		List<Video> zeroVideos = new ArrayList<Video>();
		List<Video> oneVideos = new ArrayList<Video>();
		List<Video> twoVideos = new ArrayList<Video>();
		zeroVideos = videodao.findAllZeroByUserid(user.getId());
		oneVideos = videodao.findAllOneByUserid(user.getId());
		twoVideos = videodao.findAllTwoByUserid(user.getId());
		HttpSession session = request.getSession();
		session.setAttribute("zerovideos", zeroVideos);
		session.setAttribute("onevideos", oneVideos);
		session.setAttribute("twovideos", twoVideos);
		result = "articleSuccess";
		return result;
	}
	
public String deleteVideo() {
	String result = null;
	VideoDao videodao = new VideoDao();
	videodao.deleteVideoById(vid);
	result = "deleteVideoSuccess";
	return result;
}
	
	public String deleteVideos() {
		String result = null;
		VideoDao videodao = new VideoDao();
		String checkTnums[] = checkTnum.split(",");
		int delnum;
		for (int i = 0 ;i < checkTnums.length ;i++){
			delnum = Integer.valueOf(checkTnums[i]);
			videodao.deleteVideoById(delnum);
		}
		result = "deleteVideosSuccess";
		return result;
	}
	
	public String articlezero() {
		String result = null;
		VideoDao videodao = new VideoDao();
		video =  videodao.findVideoById(vid);
		HttpSession session = request.getSession();
		session.setAttribute("videozero", video);
		result = "articlezeroSuccess";
		return result;
	}
	
	public String video() {
		String result = null;
		VideoDao videodao = new VideoDao();
		CommentsDao commentsdao = new CommentsDao();
		List<Comments> comments = new ArrayList<Comments>();
		video =  videodao.findVideoById(vid);
		video.setClick(video.getClick()+1);
		videodao.updateVide(video);
		comments = commentsdao.findAllByVid(video.getId());
		HttpSession session = request.getSession();
		session.setAttribute("video", video);
		session.setAttribute("comments", comments);
		result = "videoSuccess";
		return result;
	}
	
	public String search() {
		String result = null;
		VideoDao videodao = new VideoDao();
		user = (User)request.getSession().getAttribute("userInfo");
		List<Video> searchVideos = new ArrayList<Video>();
		searchVideos = videodao.findVideoByInfo(searchinfo);
		HttpSession session = request.getSession();
		session.setAttribute("searchVideos", searchVideos);
		result = "searchSuccess";
		return result;
	}
}

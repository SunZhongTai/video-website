package ldu.collection.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import ldu.collection.dao.CollectionDao;
import ldu.collection.vo.Collection;
import ldu.user.vo.User;
import ldu.video.dao.VideoDao;
import ldu.video.vo.Video;

public class CollectionAction implements ServletRequestAware{
	User user;
	Video video;
	Collection collection;
	private int vid;
	private HttpServletRequest request;
	public int getVid() {
		return vid;
	}
	public void setVid(int vid) {
		this.vid = vid;
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
	public HttpServletRequest getRequest() {
		return request;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	public void setServletRequest(HttpServletRequest hsr){
		request = hsr;
	}

	public String findCollection() throws IOException {
		user = (User) request.getSession().getAttribute("userInfo");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		CollectionDao collectiondao = new CollectionDao();
		collection = collectiondao.findCollectionByVideoidAndUserid(vid,user.getId());
		if (collection != null){
			response.getWriter().println("已收藏");
		}else{
			response.getWriter().println("收藏");
		}
		return null;
	}
	public String changeCollection() throws IOException {
		user = (User) request.getSession().getAttribute("userInfo");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		CollectionDao collectiondao = new CollectionDao();
		VideoDao videodao = new VideoDao();
		collection = collectiondao.findCollectionByVideoidAndUserid(vid,user.getId());
		if (collection != null){
			collectiondao.deleteCollection(collection);
			response.getWriter().println("取消收藏成功");
			videodao.subCollectionById(vid);
		}else{
			Collection coll = new Collection();
			coll.setUserid(user.getId());
			coll.setVideoid(vid);
			collectiondao.insertCollection(coll);
			response.getWriter().println("收藏成功");
			videodao.addCollectionById(vid);
		}
		return null;
	}
	public String index() {
		String result = null;
		CollectionDao collectiondao = new CollectionDao();
		VideoDao videodao = new VideoDao();
		user = (User) request.getSession().getAttribute("userInfo");
		List<Collection> collections = collectiondao.findCollectionsByUserid(user.getId());
		List<Video> videos = new ArrayList<Video>();
		for (int i = 0 ;i < collections.size() ;i++){
			videos.add(videodao.findVideoById(collections.get(i).getVideoid()));
		}
		HttpSession session = request.getSession();
		session.setAttribute("favvideos", videos);
		result = "indexSuccess";
		return result;
	}
}

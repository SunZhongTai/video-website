package ldu.video.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import ldu.video.dao.VideoDao;
import ldu.video.vo.Video;

@SuppressWarnings("serial")
public class VideoInfoAction extends ActionSupport implements ServletRequestAware{

	private static String infoid;
	private  String deleteid;
	private HttpServletRequest request;
	private int s;
	
	public String getInfoid() {
		return infoid;
	}

	public void setInfoid(String infoid) {
		this.infoid = infoid;
	}

	
	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	

	public int getS() {
		return s;
	}

	public void setS(int s) {
		this.s = s;
	}
	
	
	public String getDeleteid() {
		return deleteid;
	}

	public void setDeleteid(String deleteid) {
		this.deleteid = deleteid;
	}

	public String chuanInfo() {	
		HttpSession session = request.getSession();
		session.setAttribute("infoid", infoid);	
		return "success";
	}
	
	public String changeStatus()throws Exception{	
		VideoDao vd=new VideoDao();
		vd.updateStatus(s, infoid);	
		
		HttpSession session = request.getSession();
		
		int wsh=vd.weishenhei();
		int st=vd.tongguo();		
		int swt=vd.weitongguo();
		
		String nwsh=Integer.toString(wsh);	
		String nst=Integer.toString(st);	
		String nswt=Integer.toString(swt);	
		
		session.setAttribute("weishenhei", nwsh);
		session.setAttribute("tongguo", nst);
		session.setAttribute("weitongguo", nswt);
		
		
		return "csuccess";
	}
	
	public String re() throws Exception{
		HttpSession session = request.getSession();
		
		VideoDao vd=new VideoDao();
		List<Video> videos=vd.findAllVideo();
		session.setAttribute("videos", videos);	
		return "re";
	}
	

	
	public String videoDelete() throws Exception{
		VideoDao vd=new VideoDao();
		vd.videoDelete(deleteid);
		return "dsuccess";
	}
	
	public String de() throws Exception{
		HttpSession session = request.getSession();
		
		VideoDao vd=new VideoDao();
		List<Video> videos=vd.findAllVideo();
		session.setAttribute("videos", videos);	
		return "de";
	}
	
	
	public String videoDeleteChoose() throws Exception{
    	request = ServletActionContext.getRequest(); 
    	String sd[] = request.getParameterValues("check"); 

     	if(sd.length!=0){
    		VideoDao vd=new VideoDao();
		     for(int i=0;i<sd.length;i++){
		    	 vd.videoDelete(sd[i]);    	 		    
		     }
	    	return "dcesuccess";
    	}
     	return "dcesuccess";
	}
	
	
	public String dce() throws Exception{
		HttpSession session = request.getSession();
		
		VideoDao vd=new VideoDao();
		List<Video> videos=vd.findAllVideo();
		session.setAttribute("videos", videos);	
		return "dce";
	}
	
	public String videoinfo() {
		String result = null;
		HttpSession session = request.getSession();
		session.setAttribute("infoid", infoid);
		result = "videoInfoSuccess";
		return result;
	}
	
	
	@Override
	public void setServletRequest(HttpServletRequest hsr){
		request = hsr;
	}
	
	
	
	
	
		
}

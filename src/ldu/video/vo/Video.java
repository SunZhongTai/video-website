package ldu.video.vo;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Video entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "video", catalog = "pims_struts2_hibernate")

public class Video implements java.io.Serializable {

	// Fields

	private Integer id;
	private String title;
	private Integer userid;
	private String username;
	private Date uploadtime;
	private String url;
	private String cover;
	private String introduce;
	private String timelength;
	private Integer status;
	private Integer click;
	private Integer collection;
	private String classify;

	// Constructors

	/** default constructor */
	public Video() {
	}

	/** full constructor */
	public Video(String title, Integer userid, String username, Date uploadtime, String url, String cover,
			String introduce, String timelength, Integer status, Integer click, Integer collection, String classify) {
		this.title = title;
		this.userid = userid;
		this.username = username;
		this.uploadtime = uploadtime;
		this.url = url;
		this.cover = cover;
		this.introduce = introduce;
		this.timelength = timelength;
		this.status = status;
		this.click = click;
		this.collection = collection;
		this.classify = classify;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "title")

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "userid")

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	@Column(name = "username", length = 11)

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "uploadtime", length = 10)

	public Date getUploadtime() {
		return this.uploadtime;
	}

	public void setUploadtime(Date uploadtime) {
		this.uploadtime = uploadtime;
	}

	@Column(name = "url")

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Column(name = "cover")

	public String getCover() {
		return this.cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	@Column(name = "introduce")

	public String getIntroduce() {
		return this.introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	@Column(name = "timelength", length = 11)

	public String getTimelength() {
		return this.timelength;
	}

	public void setTimelength(String timelength) {
		this.timelength = timelength;
	}

	@Column(name = "status")

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "click")

	public Integer getClick() {
		return this.click;
	}

	public void setClick(Integer click) {
		this.click = click;
	}

	@Column(name = "collection")

	public Integer getCollection() {
		return this.collection;
	}

	public void setCollection(Integer collection) {
		this.collection = collection;
	}

	@Column(name = "classify", length = 11)

	public String getClassify() {
		return this.classify;
	}

	public void setClassify(String classify) {
		this.classify = classify;
	}

}
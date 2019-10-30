package ldu.comments.vo;

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
 * Comments entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "comments", catalog = "pims_struts2_hibernate")

public class Comments implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer videoid;
	private Integer commenterid;
	private String commentername;
	private String commenterurl;
	private String comment;
	private Date time;
	private Integer support;

	// Constructors

	/** default constructor */
	public Comments() {
	}

	/** full constructor */
	public Comments(Integer videoid, Integer commenterid, String commentername, String commenterurl, String comment,
			Date time, Integer support) {
		this.videoid = videoid;
		this.commenterid = commenterid;
		this.commentername = commentername;
		this.commenterurl = commenterurl;
		this.comment = comment;
		this.time = time;
		this.support = support;
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

	@Column(name = "videoid")

	public Integer getVideoid() {
		return this.videoid;
	}

	public void setVideoid(Integer videoid) {
		this.videoid = videoid;
	}

	@Column(name = "commenterid")

	public Integer getCommenterid() {
		return this.commenterid;
	}

	public void setCommenterid(Integer commenterid) {
		this.commenterid = commenterid;
	}

	@Column(name = "commentername")

	public String getCommentername() {
		return this.commentername;
	}

	public void setCommentername(String commentername) {
		this.commentername = commentername;
	}

	@Column(name = "commenterurl")

	public String getCommenterurl() {
		return this.commenterurl;
	}

	public void setCommenterurl(String commenterurl) {
		this.commenterurl = commenterurl;
	}

	@Column(name = "comment", length = 65535)

	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "time", length = 10)

	public Date getTime() {
		return this.time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	@Column(name = "support")

	public Integer getSupport() {
		return this.support;
	}

	public void setSupport(Integer support) {
		this.support = support;
	}

}
package ldu.notice.vo;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import ldu.user.vo.User;

/**
 * Notice entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "notice", catalog = "pims_struts2_hibernate")

public class Notice implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer adminid;
	private String title;
	private String content;
	private Date ntime;

	// Constructors

	/** default constructor */
	public Notice() {
	}

	/** full constructor */
	public Notice(Integer adminid, String title, String content, Date ntime) {
		this.adminid = adminid;
		this.title = title;
		this.content = content;
		this.ntime = ntime;
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

	@Column(name = "adminid")

	public Integer getAdminid() {
		return this.adminid;
	}

	public void setAdminid(Integer adminid) {
		this.adminid = adminid;
	}

	@Column(name = "title")

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "content", length = 65535)

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "ntime", length = 10)

	public Date getNtime() {
		return this.ntime;
	}

	public void setNtime(Date ntime) {
		this.ntime = ntime;
	}

}
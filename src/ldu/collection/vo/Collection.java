package ldu.collection.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Collection entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "collection", catalog = "pims_struts2_hibernate")

public class Collection implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userid;
	private Integer videoid;

	// Constructors

	/** default constructor */
	public Collection() {
	}

	/** full constructor */
	public Collection(Integer userid, Integer videoid) {
		this.userid = userid;
		this.videoid = videoid;
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

	@Column(name = "userid")

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	@Column(name = "videoid")

	public Integer getVideoid() {
		return this.videoid;
	}

	public void setVideoid(Integer videoid) {
		this.videoid = videoid;
	}

}
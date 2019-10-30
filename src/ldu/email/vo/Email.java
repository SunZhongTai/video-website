package ldu.email.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Email entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "email", catalog = "pims_struts2_hibernate")

public class Email implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer num;

	// Constructors

	/** default constructor */
	public Email() {
	}

	/** full constructor */
	public Email(Integer num) {
		this.num = num;
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

	@Column(name = "num")

	public Integer getNum() {
		return this.num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

}
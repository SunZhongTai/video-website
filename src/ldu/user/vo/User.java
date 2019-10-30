package ldu.user.vo;

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
 * User entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "user", catalog = "pims_struts2_hibernate")

public class User implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 6354066479776513337L;
	private Integer id;
	private String username;
	private String password;
	private String name;
	private String sex;
	private Date birthday;
	private String nation;
	private String edu;
	private String work;
	private String phone;
	private String place;
	private String email;
	private String headshow;
	private String resume;
	private Integer level;

	// Constructors

	/** default constructor */
	public User() {
	}

	/** full constructor */
	public User(String username, String password, String name, String sex, Date birthday, String nation, String edu,
			String work, String phone, String place, String email, String headshow, String resume, Integer level) {
		this.username = username;
		this.password = password;
		this.name = name;
		this.sex = sex;
		this.birthday = birthday;
		this.nation = nation;
		this.edu = edu;
		this.work = work;
		this.phone = phone;
		this.place = place;
		this.email = email;
		this.headshow = headshow;
		this.resume = resume;
		this.level = level;
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

	@Column(name = "username", length = 32)

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password", length = 32)

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "name", length = 32)

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "sex", length = 4)

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "birthday", length = 10)

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	@Column(name = "nation", length = 16)

	public String getNation() {
		return this.nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	@Column(name = "edu", length = 16)

	public String getEdu() {
		return this.edu;
	}

	public void setEdu(String edu) {
		this.edu = edu;
	}

	@Column(name = "work", length = 32)

	public String getWork() {
		return this.work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	@Column(name = "phone", length = 16)

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "place", length = 32)

	public String getPlace() {
		return this.place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	@Column(name = "email", length = 32)

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "headshow")

	public String getHeadshow() {
		return this.headshow;
	}

	public void setHeadshow(String headshow) {
		this.headshow = headshow;
	}

	@Column(name = "resume", length = 65535)

	public String getResume() {
		return this.resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	@Column(name = "level")

	public Integer getLevel() {
		return this.level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

}
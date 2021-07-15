package com.bts.member.model;

import java.sql.Timestamp;

public class UserVO {

	private String userid;
	private String userName;
	private String userPwd;
	private String email;
	private String hp;
    private String zipcode;
	private String address;
    private String addressDetail;
	private Timestamp Regdate;
	
	public UserVO() {
		super();
	}

	public UserVO(String userid, String userName, String userPwd, String email, String hp, String zipcode,
			String address, String addressDetail, Timestamp regdate) {
		super();
		this.userid = userid;
		this.userName = userName;
		this.userPwd = userPwd;
		this.email = email;
		this.hp = hp;
		this.zipcode = zipcode;
		this.address = address;
		this.addressDetail = addressDetail;
		Regdate = regdate;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public Timestamp getRegdate() {
		return Regdate;
	}

	public void setRegdate(Timestamp regdate) {
		Regdate = regdate;
	}

	@Override
	public String toString() {
		return "UserVO [userid=" + userid + ", userName=" + userName + ", userPwd=" + userPwd + ", email=" + email
				+ ", hp=" + hp + ", zipcode=" + zipcode + ", address=" + address + ", addressDetail=" + addressDetail
				+ ", Regdate=" + Regdate + "]";
	}
	
}

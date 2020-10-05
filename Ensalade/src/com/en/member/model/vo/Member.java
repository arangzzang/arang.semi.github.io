package com.en.member.model.vo;

import java.sql.Date;

public class Member {

	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberGender;
	private String memberPhone;
	private String memberAddress;
	private String mangerYn;
	private String email;
	private int point;
	private Date birthday;
	private int user_no;
	private Date enrollDate;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String memberId, String memberPw, String memberName, String memberGender,
			String memberPhone, String memberAddress, String mangerYn, String email, int point, Date birthday,
			int user_no, Date enrollDate) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberGender = memberGender;
		this.memberPhone = memberPhone;
		this.memberAddress = memberAddress;
		this.mangerYn = mangerYn;
		this.email = email;
		this.point = point;
		this.birthday = birthday;
		this.user_no = user_no;
		this.enrollDate=enrollDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberGender() {
		return memberGender;
	}

	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	
	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMangerYn() {
		return mangerYn;
	}

	public void setMangerYn(String mangerYn) {
		this.mangerYn = mangerYn;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	
	public Date getEnrollDate() {
		return enrollDate;
	}
	
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate=enrollDate;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName
				+ ", memberGender=" + memberGender +", memberPhone=" + memberPhone
				+ ", memberAddress=" + memberAddress + ", mangerYn=" + mangerYn + ", email=" + email + ", point="
				+ point + ", birthday=" + birthday + ", user_no=" + user_no +",enrollDate="+enrollDate+"]";
	}
	
	
}

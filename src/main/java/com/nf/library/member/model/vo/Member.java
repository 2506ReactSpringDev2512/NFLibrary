package com.nf.library.member.model.vo;

public class Member {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String Phone;
	private String gender;
	private int age;
	private String checkAd;
	
	
	public Member() {
		super();
	}
	
	
	public Member(String memberId, String memberPw) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
	}


	public Member(String memberId, String memberPw, String memberName, String phone, String gender, int age,
			String checkAd) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.Phone = phone;
		this.gender = gender;
		this.age = age;
		this.checkAd = checkAd;
	}


	public Member(String memberId, String memberPw, String memberName, String phone, String gender, int age) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.Phone = phone;
		this.gender = gender;
		this.age = age;
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


	public String getPhone() {
		return Phone;
	}


	public void setPhone(String phone) {
		Phone = phone;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}


	public String getCheckAd() {
		return checkAd;
	}


	public void setCheckAd(String checkAd) {
		this.checkAd = checkAd;
	}
	
	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName + ", Phone="
				+ Phone + ", gender=" + gender + ", age=" + age + ", checkAd=" + checkAd + "]";
	}
	
}

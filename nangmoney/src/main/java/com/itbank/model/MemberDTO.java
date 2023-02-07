package com.itbank.model;

//CREATE TABLE member (
//		userIdx	    Number	            DEFAULT member_seq.nextval	primary key,
//		userPw	    varchar2(20)		NOT NULL,
//		userName	varchar2(20)		NOT NULL,
//		nickName	varchar2(20)		NOT NULL,
//		age	        varchar2(20)        NOT NULL	check(age in('10 ~ 19', '20 ~ 29', '30 ~ 39', '40 ~ 49', '50 ~ 59')),
//		userEmail	varchar2(20)		NOT NULL
//	);

public class MemberDTO {
	private int userIdx;
	private String userPw;
	private String userName;
	private String nickName;
	private String age;
	private String userEmail;
	
	
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

}

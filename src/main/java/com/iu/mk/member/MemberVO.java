package com.iu.mk.member;

public class MemberVO {

	private long m_num;
	private String id;
	private String pw;
	private String name;
	private String birth;//

	private String birth_year;
	private String birth_mon;
	private String birth_day;
	
	
	public String getBirth_year() {
		return birth_year;
	}
	public void setBirth_year(String birth_year) {
		this.birth_year = birth_year;
	}
	public String getBirth_mon() {
		return birth_mon;
	}
	public void setBirth_mon(String birth_mon) {
		this.birth_mon = birth_mon;
	}
	public String getBirth_day() {
		return birth_day;
	}
	public void setBirth_day(String birth_day) {
		this.birth_day = birth_day;
	}
	
	//name값이 넘어온다.
	
	private String address;//(=roadFullAddr) controller에서 설정해줌
	
	private String roadFullAddr;
	

	public String getRoadFullAddr() {
		return roadFullAddr;
	}
	public void setRoadFullAddr(String roadFullAddr) {
		this.roadFullAddr = roadFullAddr;
	}

	private String phone;
	private String email;
	private String sex;
	private long cart_num;

	public long getM_num() {
		return m_num;
	}
	public void setM_num(long m_num) {
		this.m_num = m_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public long getCart_num() {
		return cart_num;
	}
	public void setCart_num(long cart_num) {
		this.cart_num = cart_num;
	}
	
	


	
	
	
}

package com.nf.library.member.model.vo;

import java.sql.Date;

public class LendInfo {
	private String memberId;
	private String bookNo;
	private Date lendDate;
	private Date returnDate;
	private Book book; // 포함 관계로 연결

	private boolean isOverdue; // 연체 여부
	private boolean isExtended; // 연장 여부
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getBookNo() {
		return bookNo;
	}
	public void setBookNo(String bookNo) {
		this.bookNo = bookNo;
	}
	public Date getLendDate() {
		return lendDate;
	}
	public void setLendDate(Date lendDate) {
		this.lendDate = lendDate;
	}
	public Date getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public boolean getOverdue() {
		return isOverdue;
	}
	public void setOverdue(boolean isOverdue) {
		this.isOverdue = isOverdue;
	}
	public boolean getExtended() {
		return isExtended;
	}
	public void setExtended(boolean isExtended) {
		this.isExtended = isExtended;
	}
	@Override
	public String toString() {
		return "LendInfo [memberId=" + memberId + ", bookNo=" + bookNo + ", lendDate=" + lendDate + ", returnDate="
				+ returnDate + ", book=" + book + ", isOverdue=" + isOverdue + ", isExtended=" + isExtended + "]";
	}

	
}
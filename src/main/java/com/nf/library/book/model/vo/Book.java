package com.nf.library.book.model.vo;

public class Book {
	private String bookNo;
	private String bookName;
	private String bookAuthor;
	private String bookPublisher;
	private String lendAd;
	
	
	
	public Book(String bookNo, String bookName, String bookAuthor, String bookPublisher, String lendAd) {
		super();
		this.bookNo = bookNo;
		this.bookName = bookName;
		this.bookAuthor = bookAuthor;
		this.bookPublisher = bookPublisher;
		this.lendAd = lendAd;
	}


	public String getBookNo() {
		return bookNo;
	}


	public void setBookNo(String bookNo) {
		this.bookNo = bookNo;
	}


	public String getBookName() {
		return bookName;
	}


	public void setBookName(String bookName) {
		this.bookName = bookName;
	}


	public String getBookAuthor() {
		return bookAuthor;
	}


	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}


	public String getBookPublisher() {
		return bookPublisher;
	}


	public void setBookPublisher(String bookPublisher) {
		this.bookPublisher = bookPublisher;
	}


	public String getLendAd() {
		return lendAd;
	}


	public void setLendAd(String lendAd) {
		this.lendAd = lendAd;
	}

	@Override
	public String toString() {
		return "Book [bookNo=" + bookNo + ", bookName=" + bookName + ", bookAuthor=" + bookAuthor + ", bookPublisher="
				+ bookPublisher + ", lendAd=" + lendAd + "]";
	}
}



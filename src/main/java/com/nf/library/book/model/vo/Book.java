package com.nf.library.book.model.vo;

public class Book {
	private String bookNo;
	private String bookName;
	private String bookAuthor;
	private String bookPublisher;
	private String lendYN;
	private String bookImg;
		
	public Book() {
		super();
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

	public String getLendYN() {
		return lendYN;
	}

	public void setLendYN(String lendYN) {
		this.lendYN = lendYN;
	}

	public String getBookImg() {
		return bookImg;
	}

	public void setBookImg(String bookImg) {
		this.bookImg = bookImg;
	}

	@Override
	public String toString() {
		return "Book [bookNo=" + bookNo + ", bookName=" + bookName + ", bookAuthor=" + bookAuthor + ", bookPublisher="
				+ bookPublisher + ", lendYN=" + lendYN + ", bookImg=" + bookImg + "]";
	}
	
}
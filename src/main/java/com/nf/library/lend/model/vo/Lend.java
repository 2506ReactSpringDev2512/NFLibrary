package com.nf.library.lend.model.vo;

public class Lend {
	private	String	book_no;
	private	String	book_name;
	private	String	book_author;
	private	String	book_publisher;
	private	String	lend_YN;
	
	public 	Lend() {}
	
	public	Lend(	String	book_no,
					String	book_name,
					String	book_author,
					String	book_publisher,
					String	lend_YN) {
		this.book_no		=	book_no;
		this.book_name		=	book_name;
		this.book_author	=	book_author;
		this.book_publisher	=	book_publisher;
		this.lend_YN		=	lend_YN;
	}

	public String getBook_no() {
		return book_no;
	}

	public void setBook_no(String book_no) {
		this.book_no = book_no;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getBook_author() {
		return book_author;
	}

	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}

	public String getBook_publisher() {
		return book_publisher;
	}

	public void setBook_publisher(String book_publisher) {
		this.book_publisher = book_publisher;
	}

	public String getLend_YN() {
		return lend_YN;
	}

	public void setLend_YN(String lend_YN) {
		this.lend_YN = lend_YN;
	}

	
	@Override
	public String toString() {
		return "Lend [book_no=" + book_no + ", book_name=" + book_name + ", book_author=" + book_author
				+ ", book_publisher=" + book_publisher + ", lend_YN=" + lend_YN + "]";
	}
}

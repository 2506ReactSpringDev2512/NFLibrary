package com.nf.library.lend.model.vo;

public class Wishbook {
	private	int		wishbook_no;
	private	String	wishbook_name;
	private	String	wishbook_author;
	private	String	wishbook_publisher;
	private	String	wishbook_status;
	private	String	name;
	private String 	member_id;
	
	public 	Wishbook() {}
	
	
	public	Wishbook(	String	wishbook_name,
						String	wishbook_author,
						String	wishbook_publisher,
						String	wishbook_status,
						String	member_id) {
		this.wishbook_name		=		wishbook_name;
		this.wishbook_author	=		wishbook_author;
		this.wishbook_publisher	=		wishbook_publisher;
		this.wishbook_status	=		wishbook_status;
		this.member_id			=		member_id;
}
	
	
	public	Wishbook(	int 	wishbook_no,
						String	wishbook_name,
						String	wishbook_author,
						String	wishbook_publisher,
						String	wishbook_status,
						String	name) {
		this.wishbook_no		=		wishbook_no;
		this.wishbook_name		=		wishbook_name;
		this.wishbook_author	=		wishbook_author;
		this.wishbook_publisher	=		wishbook_publisher;
		this.wishbook_status	=		wishbook_status;
		this.name				=		name;
	}

	public String getWishbook_publisher() {
		return wishbook_publisher;
	}

	public void setWishbook_publisher(String wishbook_publisher) {
		this.wishbook_publisher = wishbook_publisher;
	}

	public int getWishbook_no() {
		return wishbook_no;
	}

	public void setWishbook_no(int wishbook_no) {
		this.wishbook_no = wishbook_no;
	}

	public String getWishbook_name() {
		return wishbook_name;
	}

	public void setWishbook_name(String wishbook_name) {
		this.wishbook_name = wishbook_name;
	}

	public String getWishbook_author() {
		return wishbook_author;
	}

	public void setWishbook_author(String wishbook_author) {
		this.wishbook_author = wishbook_author;
	}

	public String getWishbook_status() {
		return wishbook_status;
	}

	public void setWishbook_status(String wishbook_status) {
		this.wishbook_status = wishbook_status;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getMember_id() {
	    return member_id;
	}
	
	public void setMember_id(String member_id) {
	    this.member_id = member_id;
	}

	@Override
	public String toString() {
		return "Wishbook [wishbook_num=" + wishbook_no + ", wishbook_name=" + wishbook_name + ", wishbook_author="
				+ wishbook_author + ", wishbook_publisher=" + wishbook_publisher + ", wishbook_status="
				+ wishbook_status + ", name=" + name + "], member_id = [ "	+ member_id + " ] ";
	}
	
}

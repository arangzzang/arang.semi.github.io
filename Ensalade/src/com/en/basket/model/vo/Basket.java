package com.en.basket.model.vo;

public class Basket {
	
	private int basketNo;
	private String memberId;
	private int productNo;
	private String productThumbnail;
	private String productName;
	private String productContent;
	private int mount;
	private int price;
	
	public Basket() {
		// TODO Auto-generated constructor stub
	}

	public Basket(int basketNo, String memberId, int productNo, String productName, String productContent, int mount,
			int price, String productThumbnail) {
		super();
		this.basketNo = basketNo;
		this.memberId = memberId;
		this.productNo = productNo;
		this.productName = productName;
		this.productContent = productContent;
		this.mount = mount;
		this.price = price;
		this.productThumbnail = productThumbnail;
	}



	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductContent() {
		return productContent;
	}

	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}

	public String getProductThumbnail() {
		return productThumbnail;
	}



	public void setProductThumbnail(String productThumbnail) {
		this.productThumbnail = productThumbnail;
	}



	public int getBasketNo() {
		return basketNo;
	}

	public void setBasketNo(int basketNo) {
		this.basketNo = basketNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getMount() {
		return mount;
	}

	public void setMount(int mount) {
		this.mount = mount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Basket [toString()=" + super.toString() + ", basketNo=" + basketNo + ", memberId=" + memberId
				+ ", productNo=" + productNo + ", mount=" + mount + ", price=" + price + "]";
	}
	
	
	

}

package com.en.order.model.vo;

import java.sql.Date;

public class Order {
	private int orderNo;
	private Date orderDate;
	private String productThumbnail;
	private String productName;
	private String productContent;
	private int orderMount;
	private int productPrice;
	private String orderStatus;
	private String memo;
	private String orderAddress;
	private int delivery;
	private int totalPrice;
	private int salePer;
	
	public Order() {
		// TODO Auto-generated constructor stub
	}

	public Order(int orderNo, Date orderDate, String productThumbnail, String productName, String productContent,
			int orderMount, int productPrice, String orderStatus, String memo, String orderAddress, int delivery,
			int totalPrice, int salePer) {
		super();
		this.orderNo = orderNo;
		this.orderDate = orderDate;
		this.productThumbnail = productThumbnail;
		this.productName = productName;
		this.productContent = productContent;
		this.orderMount = orderMount;
		this.productPrice = productPrice;
		this.orderStatus = orderStatus;
		this.memo = memo;
		this.orderAddress = orderAddress;
		this.delivery = delivery;
		this.totalPrice = totalPrice;
		this.salePer = salePer;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getProductThumbnail() {
		return productThumbnail;
	}

	public void setProductThumbnail(String productThumbnail) {
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

	public int getOrderMount() {
		return orderMount;
	}

	public void setOrderMount(int orderMount) {
		this.orderMount = orderMount;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public int getDelivery() {
		return delivery;
	}

	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getSalePer() {
		return salePer;
	}

	public void setSalePer(int salePer) {
		this.salePer = salePer;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", orderDate=" + orderDate + ", productThumbnail=" + productThumbnail
				+ ", productName=" + productName + ", productContent=" + productContent + ", orderMount=" + orderMount
				+ ", productPrice=" + productPrice + ", orderStatus=" + orderStatus + ", memo=" + memo
				+ ", orderAddress=" + orderAddress + ", delivery=" + delivery + ", totalPrice=" + totalPrice
				+ ", salePer=" + salePer + "]";
	}
	
	
	
	
	
}

package com.en.admin.model.vo;

public class Store {
	
	private String storeName;
	private String storAdr;
	private double storeAddress;
	private double storeAddress2;
	private String storeImg;
	private String storePhone;
	
	public Store() {
		// TODO Auto-generated constructor stub
	}

	public Store(String storeName, String storAdr, double storeAddress, double storeAddress2, String storeImg,
			String storePhone) {
		super();
		this.storeName = storeName;
		this.storAdr = storAdr;
		this.storeAddress = storeAddress;
		this.storeAddress2 = storeAddress2;
		this.storeImg = storeImg;
		this.storePhone = storePhone;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStorAdr() {
		return storAdr;
	}

	public void setStorAdr(String storAdr) {
		this.storAdr = storAdr;
	}

	public double getStoreAddress() {
		return storeAddress;
	}

	public void setStoreAddress(double storeAddress) {
		this.storeAddress = storeAddress;
	}

	public double getStoreAddress2() {
		return storeAddress2;
	}

	public void setStoreAddress2(double storeAddress2) {
		this.storeAddress2 = storeAddress2;
	}

	public String getStoreImg() {
		return storeImg;
	}

	public void setStoreImg(String storeImg) {
		this.storeImg = storeImg;
	}

	public String getStorePhone() {
		return storePhone;
	}

	public void setStorePhone(String storePhone) {
		this.storePhone = storePhone;
	}

	@Override
	public String toString() {
		return "Store [storeName=" + storeName + ", storAdr=" + storAdr + ", storeAddress=" + storeAddress
				+ ", storeAddress2=" + storeAddress2 + ", storeImg=" + storeImg + ", storePhone=" + storePhone + "]";
	}

	
	
}

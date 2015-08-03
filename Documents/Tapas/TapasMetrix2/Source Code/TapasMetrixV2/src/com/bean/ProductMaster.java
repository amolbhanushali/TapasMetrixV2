package com.bean;

public class ProductMaster {

	private String productId;
	private String productName;
	private String productDesc;
	private String productPlatform;
	private String releasePhase;
	private int isActive;

	public ProductMaster() {
		super();
	}

	public ProductMaster(String productId, String productName, String productDesc, String productPlatform, String releasePhase, int isActive) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productDesc = productDesc;
		this.productPlatform = productPlatform;
		this.releasePhase = releasePhase;
		this.isActive = isActive;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	public String getProductPlatform() {
		return productPlatform;
	}

	public void setProductPlatform(String productPlatform) {
		this.productPlatform = productPlatform;
	}

	public String getReleasePhase() {
		return releasePhase;
	}

	public void setReleasePhase(String releasePhase) {
		this.releasePhase = releasePhase;
	}

	public int getIsActive() {
		return isActive;
	}

	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}

	@Override
	public String toString() {
		
		return "ProductMaster [productId=" + productId + ", productName="
				+ productName + ", productDesc=" + productDesc
				+ ", productPlatform=" + productPlatform + ", releasePhase="
				+ releasePhase + ", isActive=" + isActive + "]";
	}
}
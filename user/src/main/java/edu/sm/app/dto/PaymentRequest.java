package edu.sm.app.dto;

public class PaymentRequest {
    private String productName;  // 상품 이름
    private int productPrice;    // 상품 가격

    // getter, setter
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }
}

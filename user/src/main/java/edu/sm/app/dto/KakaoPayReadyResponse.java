



package edu.sm.app.dto;

public class KakaoPayReadyResponse {
    private String tid;  // 거래 ID
    private String next_redirect_pc_url;  // PC에서 결제할 수 있는 URL
    private String next_redirect_mobile_url;  // 모바일에서 결제할 수 있는 URL

    // Getters and Setters
    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public String getNext_redirect_pc_url() {
        return next_redirect_pc_url;
    }

    public void setNext_redirect_pc_url(String next_redirect_pc_url) {
        this.next_redirect_pc_url = next_redirect_pc_url;
    }

    public String getNext_redirect_mobile_url() {
        return next_redirect_mobile_url;
    }

    public void setNext_redirect_mobile_url(String next_redirect_mobile_url) {
        this.next_redirect_mobile_url = next_redirect_mobile_url;
    }

}

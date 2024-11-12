package com.spring.mom.vo;

import java.math.BigDecimal;
import java.util.Date;

public class ProductVO {
    private int p_no;
    private String p_callno;
    private int p_count;
    private String p_class;
    private String p_name;
    private int p_price;               // 할인 전 금액
    private BigDecimal p_dr;           // 할인율 (DECIMAL)
    private int p_discount;            // 할인 후 금액
    private String p_img;
    private String p_content;
    private String p_good;
    private int p_stock;
    private int p_view;
    private String p_brand;
    private String p_delivery;
    private String p_made;
    private String d_content;              // 상세 이미지 정보
    private String d_info;
    private double review_avg; // 리뷰의 평균
    

    // Getters and Setters
    public int getP_no() { return p_no; }
    public void setP_no(int p_no) { this.p_no = p_no; }

    public String getP_callno() { return p_callno; }
    public void setP_callno(String p_callno) { this.p_callno = p_callno; }

    public int getP_count() { return p_count; }
    public void setP_count(int p_count) { this.p_count = p_count; }

    public String getP_class() { return p_class; }
    public void setP_class(String p_class) { this.p_class = p_class; }

    public String getP_name() { return p_name; }
    public void setP_name(String p_name) { this.p_name = p_name; }

    public int getP_price() { return p_price; }
    public void setP_price(int p_price) { this.p_price = p_price; }

    public BigDecimal getP_dr() { return p_dr; }
    public void setP_dr(BigDecimal p_dr) { this.p_dr = p_dr; }

    public int getP_discount() { return p_discount; }
    public void setP_discount(int p_discount) { this.p_discount = p_discount; }

    public String getP_img() { return p_img; }
    public void setP_img(String p_img) { this.p_img = p_img; }

    public String getP_content() { return p_content; }
    public void setP_content(String p_content) { this.p_content = p_content; }

    public String getP_good() { return p_good; }
    public void setP_good(String p_good) { this.p_good = p_good; }

    public int getP_stock() { return p_stock; }
    public void setP_stock(int p_stock) { this.p_stock = p_stock; }

    public int getP_view() { return p_view; }
    public void setP_view(int p_view) { this.p_view = p_view; }

    public String getP_brand() { return p_brand; }
    public void setP_brand(String p_brand) { this.p_brand = p_brand; }

    public String getP_delivery() { return p_delivery; }
    public void setP_delivery(String p_delivery) { this.p_delivery = p_delivery; }

    public String getP_made() { return p_made; }
    public void setP_made(String p_made) { this.p_made = p_made; }

    public String getD_content() { return d_content; }
    public void setD_content(String d_content) { this.d_content = d_content; }

    public String getD_info() { return d_info; }
    public void setD_info(String d_info) { this.d_info = d_info; }

   
	public double getReview_avg() {
		return review_avg;
	}
	public void setReview_avg(double review_avg) {
		this.review_avg = review_avg;
	}
	@Override
	public String toString() {
		return "ProductVO [p_no=" + p_no + ", p_callno=" + p_callno + ", p_count=" + p_count + ", p_class=" + p_class
				+ ", p_name=" + p_name + ", p_price=" + p_price + ", p_dr=" + p_dr + ", p_discount=" + p_discount
				+ ", p_img=" + p_img + ", p_content=" + p_content + ", p_good=" + p_good + ", p_stock=" + p_stock
				+ ", p_view=" + p_view + ", p_brand=" + p_brand + ", p_delivery=" + p_delivery + ", p_made=" + p_made
				+ ", d_content=" + d_content + ", d_info=" + d_info + ", review_avg=" + review_avg + "]";
	}

	
	

}

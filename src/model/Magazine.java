package model;

import java.sql.Date;

public class Magazine {
	private int ma_num;
	private String m_id;
	private String ma_title;
	private int ma_kind;
	private String ma_image;
	private String ma_content;
	private int ma_readcount;
	private Date ma_reg_date;
	private String ma_del;
	
	
	public int getMa_num() {
		return ma_num;
	}
	public void setMa_num(int ma_num) {
		this.ma_num = ma_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getMa_title() {
		return ma_title;
	}
	public void setMa_title(String ma_title) {
		this.ma_title = ma_title;
	}
	public int getMa_kind() {
		return ma_kind;
	}
	public void setMa_kind(int ma_kind) {
		this.ma_kind = ma_kind;
	}
	public String getMa_image() {
		return ma_image;
	}
	public void setMa_image(String ma_image) {
		this.ma_image = ma_image;
	}
	public String getMa_content() {
		return ma_content;
	}
	public void setMa_content(String ma_content) {
		this.ma_content = ma_content;
	}
	public int getMa_readcount() {
		return ma_readcount;
	}
	public void setMa_readcount(int ma_readcount) {
		this.ma_readcount = ma_readcount;
	}
	public Date getMa_reg_date() {
		return ma_reg_date;
	}
	public void setMa_reg_date(Date ma_reg_date) {
		this.ma_reg_date = ma_reg_date;
	}
	public String getMa_del() {
		return ma_del;
	}
	public void setMa_del(String ma_del) {
		this.ma_del = ma_del;
	}
	
	
}

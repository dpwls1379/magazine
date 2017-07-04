package model;

import java.sql.Date;

public class BoardR {
	private int br_num;
	private int r_num;
	private String id;
	private String br_content;
	private int br_ref;
	private int br_re_step;
	private int br_re_level;
	private Date br_reg_date;
	private String br_del;
	
	
	public int getBr_num() {
		return br_num;
	}
	public void setBr_num(int br_num) {
		this.br_num = br_num;
	}
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBr_content() {
		return br_content;
	}
	public void setBr_content(String br_content) {
		this.br_content = br_content;
	}
	public int getBr_ref() {
		return br_ref;
	}
	public void setBr_ref(int br_ref) {
		this.br_ref = br_ref;
	}
	public int getBr_re_step() {
		return br_re_step;
	}
	public void setBr_re_step(int br_re_step) {
		this.br_re_step = br_re_step;
	}
	public int getBr_re_level() {
		return br_re_level;
	}
	public void setBr_re_level(int br_re_level) {
		this.br_re_level = br_re_level;
	}
	public Date getBr_reg_date() {
		return br_reg_date;
	}
	public void setBr_reg_date(Date br_reg_date) {
		this.br_reg_date = br_reg_date;
	}
	public String getBr_del() {
		return br_del;
	}
	public void setBr_del(String br_del) {
		this.br_del = br_del;
	}
	
}

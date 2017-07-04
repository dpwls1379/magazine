package model;

import java.sql.Date;

public class Mypage {
	private int my_num;
	private String u_id;
	private String m_id;
	private int ma_num;
	private int r_num;
	private Date my_reg_date;
	private String my_del;

	public int getMy_num() {
		return my_num;
	}

	public void setMy_num(int my_num) {
		this.my_num = my_num;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getMa_num() {
		return ma_num;
	}

	public void setMa_num(int ma_num) {
		this.ma_num = ma_num;
	}

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public Date getMy_reg_date() {
		return my_reg_date;
	}

	public void setMy_reg_date(Date my_reg_date) {
		this.my_reg_date = my_reg_date;
	}

	public String getMy_del() {
		return my_del;
	}

	public void setMy_del(String my_del) {
		this.my_del = my_del;
	}

}

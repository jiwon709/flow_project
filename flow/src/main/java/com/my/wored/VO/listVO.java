package com.my.wored.VO;

public class listVO {
	private String fix_name;
	private String put_name;
	
	public listVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public listVO(String fix_name, String put_name) {
		super();
		this.fix_name = fix_name;
		this.put_name = put_name;
	}


	public String getFix_name() {
		return fix_name;
	}
	
	
	public void setFix_name(String fix_name) {
		this.fix_name = fix_name;
	}
	
	
	public String getPut_name() {
		return put_name;
	}
	
	
	public void setPut_name(String put_name) {
		this.put_name = put_name;
	}
	
	@Override
	public String toString() {
		return "listVO [fix_name=" + fix_name + ", put_name=" + put_name + "]";
	}
}

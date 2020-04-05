package com.hk.whome.domain;

public class CodeDomain {

	private String codeKey;
	private String codeGroupKey;
	private String codeColName;
	private String codeNum;
	private String codeName;
	private String codeComment;
	private String codeSubGroupKey;
	
	public String getCodeKey() {
		return codeKey;
	}
	public void setCodeKey(String codeKey) {
		this.codeKey = codeKey;
	}
	public String getCodeGroupKey() {
		return codeGroupKey;
	}
	public void setCodeGroupKey(String codeGroupKey) {
		this.codeGroupKey = codeGroupKey;
	}
	public String getCodeColName() {
		return codeColName;
	}
	public void setCodeColName(String codeColName) {
		this.codeColName = codeColName;
	}
	public String getCodeNum() {
		return codeNum;
	}
	public void setCodeNum(String codeNum) {
		this.codeNum = codeNum;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getCodeComment() {
		return codeComment;
	}
	public void setCodeComment(String codeComment) {
		this.codeComment = codeComment;
	}
	public String getCodeSubGroupKey() {
		return codeSubGroupKey;
	}
	public void setCodeSubGroupKey(String codeSubGroupKey) {
		this.codeSubGroupKey = codeSubGroupKey;
	}
	
	@Override
	public String toString() {
		return "CodeDomain [codeKey=" + codeKey + ", codeGroupKey=" + codeGroupKey + ", codeColName=" + codeColName
				+ ", codeNum=" + codeNum + ", codeName=" + codeName + ", codeComment=" + codeComment
				+ ", codeSubGroupKey=" + codeSubGroupKey + "]";
	}
	
	
}

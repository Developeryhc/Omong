package kr.or.partner.model.vo;

import lombok.Data;

@Data
public class PartnerNotice {
	private int noticePartnerNo;
	private String title;
	private int writer;
	private String content;
	private String noticePartnerDate;
	private String filename;	
	private String filepath;
	private int noticePartnerViews;
	private String ceo;
	
}

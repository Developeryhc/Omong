package kr.or.plan.model.vo;

import lombok.Data;

@Data
public class Plan {
	private int planNo;
	private String planPublic;
	private String planWriter;
	private String planTitle;
	private String planStart;
	private String planEnd;
	private String planContent;
	private int planShare;
	private int planView;
	private String planThumbnailNo;
	
	// 일자 반복에 필요한 변수
	private String planDay;
	
	// planList 조회 개수 변수
	private int planKind;
	
	// 조회 주체
	private int planMember;
	
	// 좋아요수 토탈개수
	private int planLike;
	
	// 종아요 클릭 여부
	private int likeCheck;
	
}

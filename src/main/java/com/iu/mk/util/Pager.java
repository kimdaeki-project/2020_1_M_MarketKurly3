package com.iu.mk.util;

public class Pager {
	//파라미터로 받아올 현재페이지 받기
	
	private Long curPage;//몇번째를 볼거?
	private Integer perPage;// 페이지당 글 갯수
	
	private long startRow; //1번
	private long lastRow; //12번
	
	private long totalPage; //전체페이지
	private long totalBlock; //전체 블록
	private long curBlock; // 현재 블록
	 
	private long startNum; //블록 시작 번호
	private long lastNum; //블록 끝 번호
	
	private String kind; // 종류 분류
	private String search; // 검색기능
	
	
	//---startrow/lastrow 계산---------
	
	public void makeRow() {
		//페이지당 12개씩 출력->perpage=12
		System.out.println("curpage : " + this.getCurPage());
		this.startRow =(this.getCurPage()-1)*this.getPerPage()+1;
		this.lastRow = this.getCurPage()*this.getPerPage();
	}
	
	//---totalcount/totalpage 계산-------
	
	//다음페이지 생성
	public void makePage(long totalCount) {
		//1. totalCount : 전체 글의 갯수
		//2. totalCount로 totalPage 계산
		this.totalPage =  totalCount/this.getPerPage();
		if(totalCount%this.getPerPage()!=0) {
			this.totalPage++;
		}
		
		
		//3. totalPage -> totalBlock 계산
		long perBlock = 5L;// 블록당 5개씩 설정
		
		this.totalBlock = totalPage/perBlock;
		if(totalPage % perBlock !=0) {
			this.totalBlock++;
		}
		
		//4. curpage ->curBlock찾기(몇번째 블록인가) curpage 1-5 curblock 1, curpage 6-10 curblock 2
		this.curBlock = this.curPage/perBlock;
		if(this.curPage % perBlock !=0) {
			this.curBlock++;
		}
		
		//5. curBlock startnum,lastnum계산
		this.startNum = (this.curBlock-1)*perBlock+1;
		this.lastNum = curBlock*perBlock;
		
		//마지막 번호면 거기서 끊어주기
		if(this.curBlock == this.totalBlock) { // 5개씩 끊지만 글 갯수에 맞게되도록
			this.lastNum = this.totalPage;
		}
	}
	
	

	//------setter/getter------
	
	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getSearch() {
		if(this.search ==null){
			this.search="";
		}
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public Long getCurPage() { //현재페이지의 기본값 정해주기
		if(this.curPage == null || this.curPage==0) {
			this.curPage=1L;
		}
		return curPage;
	}

	public void setCurPage(Long curPage) {
		this.curPage = curPage;
	}

	public Integer getPerPage() {
		if(this.perPage ==null|| this.perPage==0) {
			this.perPage=12; //페이지당 12씩
		}
		return perPage;
	}

	public void setPerPage(Integer perPage) {
		this.perPage = perPage;
	}

	public long getStartRow() {
		return startRow;
	}

	public long getLastRow() {
		return lastRow;
	}

	public long getTotalPage() {
		return totalPage;
	}

	public long getTotalBlock() {
		return totalBlock;
	}

	public long getCurBlock() {
		return curBlock;
	}
	
	public long getStartNum() {
		return startNum;
	}


	public void setStartNum(long startNum) {
		this.startNum = startNum;
	}

	public long getLastNum() {
		return lastNum;
	}

	public void setLastNum(long lastNum) {
		this.lastNum = lastNum;
	}
	
}

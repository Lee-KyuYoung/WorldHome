package com.hk.whome.domain;

	
public class PagingDomain {
	
	private int startListNo; 
	private int endListNo;
	private int listSize; //불러올 게시글 수
	private int pageSize; //페이징 그룹안에 페이지 수 
    private int firstPageNo; 
    private int prevPageNo; 
    private int startPageNo; 
    private int pageNo; 
    private int endPageNo; 
    private int nextPageNo; 
    private int finalPageNo; 
    private int totalCount; 

    public PagingDomain(int pageNo, int pageSize, int listSize, int totalCount) {
    	this.pageNo = pageNo;
    	this.pageSize = pageSize;
    	this.listSize = listSize;
    	this.totalCount = totalCount;
        this.firstPageNo = 1;
        
        this.makePaging();
    }
    
    public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public int getPageSize() {
        return pageSize;
    }
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    public int getFirstPageNo() {
        return firstPageNo;
    }
    public void setFirstPageNo(int firstPageNo) {
        this.firstPageNo = firstPageNo;
    }
    public int getPrevPageNo() {
        return prevPageNo;
    }
    public void setPrevPageNo(int prevPageNo) {
        this.prevPageNo = prevPageNo;
    }
    public int getStartPageNo() {
        return startPageNo;
    }
    public void setStartPageNo(int startPageNo) {
        this.startPageNo = startPageNo;
    }
    public int getPageNo() {
        return pageNo;
    }
    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }
    public int getEndPageNo() {
        return endPageNo;
    }
    public void setEndPageNo(int endPageNo) {
        this.endPageNo = endPageNo;
    }
    public int getNextPageNo() {
        return nextPageNo;
    }
    public void setNextPageNo(int nextPageNo) {
        this.nextPageNo = nextPageNo;
    }
    public int getFinalPageNo() {
        return finalPageNo;
    }
    public void setFinalPageNo(int finalPageNo) {
        this.finalPageNo = finalPageNo;
    }
    public int getTotalCount() {
        return totalCount;
    }
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        this.makePaging();
    }
    public int getStartListNo() {
		return startListNo;
	}
	public void setStartListNo(int startListNo) {
		this.startListNo = startListNo;
	}
	public int getEndListNo() {
		return endListNo;
	}
	public void setEndListNo(int endListNo) {
		this.endListNo = endListNo;
	}
	
	private void makePaging() {
		
        if (totalCount == 0) return; 
        if (pageNo <= 0) pageNo = 1; 
        if (listSize == 0) listSize = 10; 
        
		startListNo = ( pageNo - 1 ) * listSize + 1;
		endListNo = startListNo + listSize - 1;
        
        finalPageNo = (totalCount + listSize - 1) / listSize; 
                
        startPageNo = ((pageNo - 1) / pageSize ) * pageSize + 1; 
        endPageNo = startPageNo + pageSize - 1; 

        if (endPageNo > finalPageNo) { 
        	endPageNo = finalPageNo;
        }
        
        if (this.pageNo > finalPageNo) this.setPageNo(finalPageNo); 
        
        if(this.pageNo == 1) {
        	this.setPrevPageNo(1);
        }
        else if(this.endPageNo > 1){
        	this.setPrevPageNo(pageNo - 1);
        }
        
        if (pageNo >= finalPageNo) {
            this.setNextPageNo(finalPageNo); 
        } else {
            this.setNextPageNo(pageNo + 1); 
        }
    }
	
	@Override
	public String toString() {
		return "PagingDomain [startListNo=" + startListNo + ", endListNo=" + endListNo + ", listSize=" + listSize
				+ ", pageSize=" + pageSize + ", firstPageNo=" + firstPageNo + ", prevPageNo=" + prevPageNo
				+ ", startPageNo=" + startPageNo + ", pageNo=" + pageNo + ", endPageNo=" + endPageNo + ", nextPageNo="
				+ nextPageNo + ", finalPageNo=" + finalPageNo + ", totalCount=" + totalCount + "]";
	}


}

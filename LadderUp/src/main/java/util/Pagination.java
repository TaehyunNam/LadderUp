package util;

public class Pagination {
	public static String getPageArea(String url, int curPage, int totPage, int pageRange) {
		// 페이지 범위
		int startPage = (curPage-1)/pageRange*pageRange+1; // 시작페이지
		int endPage = startPage + pageRange - 1; // 종료페이지
		if(endPage > totPage) endPage = totPage; 
		
		String ret = "";
		ret += "<div class=\"page\" id=\"page\">\r\n";				
				if (startPage > pageRange) {				
					ret += "                        	<a href=\""+url+"?page="+(startPage-1)+"\"> < </a>\r\n";
				}
				for (int rp = startPage; rp <= endPage; rp++) {
					ret += "                            <a href='javascript:location.href=\""+url+"?page="+rp+"\";'"; 
					ret += ">"+rp+"</a>\r\n";
				}
				if (totPage > endPage)
					ret += "                        	<a href=\""+url+"?page="+(endPage+1)+"\"> > </a>\r\n";				
					ret	+= "                    </div>";
				return ret;
	}
}

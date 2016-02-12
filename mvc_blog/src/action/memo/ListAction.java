package action.memo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utility.Paging;
import utility.Utility;
import model.memo.MemoDAO;
import model.memo.MemoVO;
import action.Action;

public class ListAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		//---------------------------------------------------------------------------------- 
		//검색 관련 부분 
		//---------------------------------------------------------------------------------- 
		//검색 컬럼값 추출, null --> ""     
		String col = Utility.checkNull(request.getParameter("col")); 		 
		//검색어 추출, null --> "" 
		String word = Utility.checkNull(request.getParameter("word")); 		 
		if (col.equals("total")){
		  word = "";
		}
		//-------------------------------------------------------------------- 
		//페이징 관련 부분 
		//-------------------------------------------------------------------- 
		int nowPage= 1; //시작 페이지 번호는 1부터 

		if (request.getParameter("nowPage") != null) { 
		nowPage= Integer.parseInt(request.getParameter("nowPage"));  
		} 
		int recordPerPage = 5; // 한페이지당 출력할 레코드 갯수 

		//***** db에서 가져올 순번
		int sno = ((nowPage-1) * recordPerPage) + 1;//
		int eno = nowPage * recordPerPage;//
		//***** 가져올순번 end
		
		MemoDAO dao=new MemoDAO();
		List<MemoVO> list= dao.list(sno,eno,col,word);
		int total =dao.total(col,word);
		String paging=
				new Paging().paging3(total, nowPage, recordPerPage, col, word);
		
		//2.request
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		
		//3.view page return
		return "/view/memo/list.jsp";
	}

}

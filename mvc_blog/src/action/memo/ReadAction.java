package action.memo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.memo.MemoDAO;
import model.memo.MemoVO;
import action.Action;

public class ReadAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		MemoDAO dao=new MemoDAO();
		MemoVO dto=new MemoVO();
		int memono = Integer.parseInt(request.getParameter("memono"));
		 
		/* MemoDAO dao = new MemoDAO(); */
		// ---------------------------------------
		// 조회수 증가
		// ------------ ---------------------------
		dao.increaseViewcnt(memono);
		 
		// ---------------------------------------
		// 조회
		// ---------------------------------------
		 
		 dto= dao.read(memono);
		 
		String content = dto.getContent();
		content = content.replaceAll("\r\n", "<BR>");
		dto.setContent(content);
		
		request.setAttribute("dto", dto);
		
		return "/view/memo/read.jsp";
	}

}

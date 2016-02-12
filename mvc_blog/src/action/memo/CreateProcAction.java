package action.memo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.memo.MemoDAO;
import model.memo.MemoVO;
import action.Action;

public class CreateProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String title=(String)request.getParameter("title");
		String content=(String)request.getParameter("content");
		MemoVO vo=new MemoVO();
		MemoDAO dao=new MemoDAO();
		vo.setTitle(title);
		vo.setContent(content);
		int cnt=dao.create(vo);
		//2.request 
		request.setAttribute("cnt", cnt);
		//3.view page return
		return "/view/memo/createProc.jsp";
	}

}

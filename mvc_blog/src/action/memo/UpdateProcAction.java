package action.memo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.memo.MemoDAO;
import model.memo.MemoVO;
import action.Action;

public class UpdateProcAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int memono = Integer.parseInt(request.getParameter("memono"));
		MemoVO vo = new MemoVO(); 
		vo.setTitle(title);
		vo.setContent(content);
		vo.setMemono(memono);
		 
		MemoDAO dao = new MemoDAO();
		int cnt = dao.update(vo); 
		request.setAttribute("cnt", cnt);
		
		return "/view/memo/updateProc.jsp";
	}

}
